CREATE DEFINER=`dbuser`@`%` PROCEDURE `pes`.`procEpicrisisAnalyzes`(
In EventID int(10),
in AnalyzesType varchar(50)
)
BEGIN
    
    
SET @subq = CONCAT('select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y\n%H:%i") valas, ttj.datetimeTaken val, case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',EventID, ' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',AnalyzesType, ' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken');
    

    SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL)) AS ', &as)";
-- select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'ttj.datetimeTaken');
-- select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'case when apt.typeName regexp ''String|Text|Constructor'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end');
-- select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
-- select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
-- select @cc4;
    

SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', REGEXP_REPLACE(@cc4, '(\'String.Text.Constructor\')(.*)(\'Reference\')(.*)(\'Date\')', '\'\\1\'\\2\'\\3\'\\4\'\\5\''), ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
--      select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      
    DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name as `Наименование`', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),            
            	'\n FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',
            	EventID, 
            	' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',
            	AnalyzesType, 
            	' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id', ' ',
            	'',
            	'\n', '');
--     select @stmt2;                    
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     
    DEALLOCATE PREPARE _sql;
    
END



select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where rep.name REGEXP 'медика'
group by res.id, rep.id
order by  retres.idx, resrep.idx;



select * from rbEpicrisisProperty rep where rep.id = 2196;







select min(dds.takeDatetime) `Начало`, max(dds.takeDatetime) `Окончание`, dds.takeDose `Доза`, rsn.mnn `МНН`
from DrugDestinationSchedule dds
join Action a on a.id = dds.action_id and a.deleted = 0 and a.event_id = %s
join rbStockNomenclature rsn on rsn.id = dds.nomenclature_id and rsn.deleted = 0
join ActionProperty ap on ap.action_id = a.id and ap.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'Статус' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP 'drug_theraphy|drug_theraphy_complex' and at2.deleted = 0))
join ActionProperty ap2 on ap2.action_id = a.id and ap2.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'код' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP 'drug_theraphy|drug_theraphy_complex' and at2.deleted = 0))
join ActionProperty_Integer api on ap.id = api.id  and (api.value = 2 or api.value = 1)
join ActionProperty_Integer api2 on ap2.id = api2.id and api2.value = dds.nomenclature_id
WHERE dds.deleted = 0 
GROUP by a.id, dds.takeDatetime 
order by dds.takeDatetime 


