drop procedure if exists procEpicrisisDiagnostic;

create
definer = dbuser@`%` procedure procEpicrisisDiagnostic(IN EventID int(10), IN GroupName varchar(100), IN DiagnosticType varchar(50))
BEGIN


SET @subq = Concat('select apt.name, DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas, a.endDate val from ActionProperty ap ',
'left join ActionProperty_String aps using(id) ',
'join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
EventID,
' join (select * from ActionType where group_id = (select id from ActionType where name = ', GroupName,' and class=1) and deleted = 0) at2 on at2.id = a.actionType_id ',
'join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and shortName = ',
DiagnosticType,
' GROUP by a.endDate');



SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL) SEPARATOR ''\n'') AS ', &as)";
-- select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'a.endDate');
-- select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'concat_ws(" ", apt.name, aps.value)');
-- select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
-- select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
-- select @cc4;


SET SESSION group_concat_max_len = 10000;   -- just in case
SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', @cc4, ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
--      select @stmt;
PREPARE _sql FROM @stmt;
EXECUTE _sql;
DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'at2.Name as `Наименование`', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),
            	'\n from ActionProperty ap left join ActionProperty_String aps using(id) join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
            	EventID,
            	' join (select * from ActionType where group_id = (select id from ActionType where name = ', GroupName,' and class=1) and deleted = 0) at2 on at2.id = a.actionType_id join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.shortName = ',
            	DiagnosticType,
            	' GROUP by a.endDate');


--     select @stmt2;
PREPARE _sql FROM @stmt2;
EXECUTE _sql;
DEALLOCATE PREPARE _sql;

END;

