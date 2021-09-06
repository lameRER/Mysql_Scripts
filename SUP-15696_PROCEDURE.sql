create
    definer = dbuser@`%` procedure procEpicrisisAnalyzes(IN EventID int(10), IN AnalyzesType varchar(50))
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
                'apt.Name as `Наименование`', ', ap.norm', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),            
            	'\n FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',
            	EventID, 
            	' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on (at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',
            	AnalyzesType, ')', -- ' or (at3.id IN (SELECT at.id FROM ActionType at WHERE at.group_id = at2.group_id))', 
            	' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id', ' ',
            	'',
            	'\n', '');
--     select @stmt2;                    
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     
    DEALLOCATE PREPARE _sql;
    
END;

