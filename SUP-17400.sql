select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where res.name REGEXP 'Консультации специалистов'
group by res.id, rep.id
order by  retres.idx, resrep.idx;




call procEpicrisisConsult(33838860,"'Рекомендовано.?'")


set @EventID =33838860;
set @ConsultType = "'Рекомендовано.?'";


SET @subq = CONCAT('select at2.name, a.endDate val, DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas from ActionProperty ap ',
'join Action a on a.id = ap.action_id and a.deleted = 0 and a.status = 2 and a.endDate is not null and a.event_id = ',
@EventID,
' join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id = 40713 ', 
'join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP ',
@ConsultType,
' GROUP by a.endDate ');
    

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
     select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      
    DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name as `Наименование`', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),            
            	'\n from ActionProperty ap ',
            	'join Action a on a.id = ap.action_id and a.deleted = 0 and a.status = 2 and a.endDate is not null and a.event_id = ',
            	@EventID, 
            	' join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id = 40713 ', 
            	'join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP ',
            	@ConsultType, 
            	' GROUP by at2.id, apt.id', ' ',
            	'',
            	'\n', '');
    select @stmt2;                    	
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     
    DEALLOCATE PREPARE _sql;
   
   
   SELECT 
   apt.Name as `Наименование`,
GROUP_CONCAT(IF(a.endDate = "2021-05-14 10:41:30", case when apt.typeName regexp 'String|Text|Constructor' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "14.05.21
10:41"
 from ActionProperty ap 
 left join ActionProperty_String aps using(id)
 left join ActionProperty_Reference apr using(id)
 left join ActionProperty_Date apd using(id)
 join Action a on a.id = ap.action_id and a.deleted = 0 and a.status = 2 and a.endDate is not null and a.event_id = 33838860 
 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id = 40713 
 join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Рекомендовано.?' 
 GROUP by at2.id, apt.id 

   
   
   SELECT  GROUP_CONCAT(CONCAT('GROUP_CONCAT(IF(ttj.datetimeTaken = ', '"', val, '"', ', case when apt.typeName regexp ''String|Text|Constructor'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end, NULL)) AS ', '"', valas, '"') SEPARATOR ",
")  INTO @sums FROM ( select at2.name, a.endDate val, DATE_FORMAT(a.endDate, "%d.%m.%y
%H:%i") valas from ActionProperty ap join Action a on a.id = ap.action_id and a.deleted = 0 and a.status = 2 and a.endDate is not null and a.event_id = 33838860 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id = 40713 join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Рекомендовано.?' GROUP by a.endDate  ) AS top
    