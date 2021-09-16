select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id = 132
#   and res.id = 472
group by rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id


update
    rbEpicrisisProperty
set defaultValue = regexp_replace(defaultValue, 'procEpicrisisAnalyzes', 'procEpicrisisDiagnostic')
where id in
(select rep.id
from rbEpicrisisProperty rep, rbEpicrisisSections_rbEpicrisisProperty resrep
where resrep.id_rbEpicrisisProperty = rep.id and resrep.id_rbEpicrisisSections = 475);

select rep.*
 from rbEpicrisisProperty rep, rbEpicrisisSections_rbEpicrisisProperty resrep
 where resrep.id_rbEpicrisisProperty = rep.id and resrep.id_rbEpicrisisSections = 475;

call procEpicrisisDiagnostic(412, "'УЗИ'");

call procEpicrisisDiagnostic(4404977, "'Патологоанатомические исследования
с применением молекулярно-генетических методов in situ гибридизации ISH'")


select *
from Action where event_id = 412 order by id desc ;

select *
from ActionProperty where action_id = 21116456;


insert into ActionProperty_String (id, `index`, value)
select 36257130, 0, 'testd';

select *
from ActionPropertyType where actionType_id = 24408;

select *
from ActionPropertyType where id = 429028;

select at2.name, apt.name, DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas, a.endDate val from ActionProperty ap
    left join ActionProperty_String aps using(id)
    join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = 412
    join (select at3.* from ActionType at2
    join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4
    left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4
    where at2.id = 27600 and at2.deleted = 0
    union
    select at4.* from ActionType at2
    join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4
    left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4
    where at2.id = 27600 and at2.deleted = 0) at2 on at2.id = a.actionType_id
    join ActionType at3 on at3.id = at2.group_id and at3.name = 'УЗИ'
    join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id
GROUP by a.endDate

select *
from rbEpicrisisProperty;


select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = 475;


select * from ActionType where name regexp '810094';


select *
from ActionType where group_id = 27600;

select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisProperty = 27600;

drop temporary table if exists tempSections;
create temporary table tempSections
(
select 'Диагностические исследования' as name
);
drop temporary table if exists tempProperty;
create temporary table tempProperty
(
select name from ActionType where group_id = 27600 and deleted = 0
);


insert into rbEpicrisisSections(name, description)
select *
from
(select name, '' as description from tempSections) as tmp
where not exists(select * from rbEpicrisisSections where tmp.name = name and description = tmp.description);

insert into rbEpicrisisProperty(name, description, type, defaultValue)
select *
from
(select name, 'Диагностические исследования' as description, 8, concat('call procEpicrisisDiagnostic(%s, "''', name ,'''")')
from tempProperty) as tmp
where not exists(select * from rbEpicrisisProperty where tmp.name = name)
;

insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select
       res.id id_rbEpicrisisSections,
       rep.id id_rbEpicrisisProperty,
#        ifnull(resrep.idx + row_number() over (order by tp.idx), row_number() over (order by tp.idx)-1) idx,
       row_number() over() idx,
       htmlTemplate,
       orgStruct,
       isRequired,
       isEditable,
       isOld
from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep, rbEpicrisisSections res, tempProperty tp
where resrep.id = (select id from rbEpicrisisSections_rbEpicrisisProperty order by id desc limit 1)
and rep.name in (select name from tempProperty)
and res.name in (select name from tempSections)
and tp.name = rep.name
;


select *
from rbEpicrisisTemplates_rbEpicrisisSections where id_rbEpicrisisTemplates = 132;

select *
from rbEpicrisisTemplates;




select *
from rbJobType where code = 'neftu-1-1';


select *
from ActionPropertyType where valueDomain = '59' and typeName = 'JobTicket';

select *
from ActionType where id = 84450;

select *
from ActionType where id = 84812;

select *
from rbEpicrisisProperty where id in (2266,2319);


;



drop temporary table tempSections;
create temporary table tempSections
(
select 'Данные пациента' as name
);

drop temporary table tempProperty;
create temporary table tempProperty
(
select 1 as idx, 'ФИО' as name union
select 2 as idx, 'Возраст' as name union
select 3 as idx, 'Адрeс' as name union
select 4 as idx, 'Место работы' as name union
select 5 as idx, 'Дата поступления' as name
);


insert into rbEpicrisisSections(name, description)
select *
from
(select name, '' as description from tempSections) as tmp
where not exists(select * from rbEpicrisisSections where tmp.name = name and description = tmp.description);

insert into rbEpicrisisProperty(name, description, type, defaultValue)
select *
from
(select name, '' as description, 7, 'SECECT '''''
from tempProperty) as tmp
where not exists(select * from rbEpicrisisProperty where tmp.name = name)
;

insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select
       res.id id_rbEpicrisisSections,
       rep.id id_rbEpicrisisProperty,
       ifnull(resrep.idx + row_number() over (order by tp.idx), row_number() over (order by tp.idx)-1) idx,
       htmlTemplate,
       orgStruct,
       isRequired,
       isEditable,
       isOld
from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep, rbEpicrisisSections res, tempProperty tp
where resrep.id = (select id from rbEpicrisisSections_rbEpicrisisProperty order by id desc limit 1)
and rep.name in (select name from tempProperty)
and res.name in (select name from tempSections)
and tp.name = rep.name
;


select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = 467


select * from rbEpicrisisProperty where name = 'ФИО'


select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = 464;


select *
from rbEpicrisisProperty order by id desc ;


create

definer = dbuser@`%` procedure procEpicrisisDiagnostic(IN EventID int(10), IN DiagnosticType varchar(50))
BEGIN


    SET @subq = Concat('select apt.name, DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas, a.endDate val from ActionProperty ap ',
                       'left join ActionProperty_String aps using(id) ',
                       'join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
                       EventID,
                       ' join (select at3.* from ActionType at2 ',
                       'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 ',
                       'left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 ',
                       'where at2.id = 22228 and at2.deleted = 0 ',
                       'union ',
                       'select at4.* from ActionType at2 ',
                       'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 ',
                       'left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 ',
                       'where at2.id = 22228 and at2.deleted = 0) at2 on at2.id = a.actionType_id ',
                       'join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.name = ',
                       DiagnosticType,
                       ' WHERE apt.name != ''номерок''',
                       'GROUP by a.endDate');



    SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL)) AS ', &as)";
-- select @cc1;
    SET @cc2 = REPLACE(@cc1, '&p', 'a.endDate');
-- select @cc2;
    SET @cc3 = REPLACE(@cc2, '&t', 'aps.value');
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
            ' join (select at3.* from ActionType at2 join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 where at2.id = 22228 and at2.deleted = 0 union select at4.* from ActionType at2 join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 where at2.id = 22228 and at2.deleted = 0) at2 on at2.id = a.actionType_id join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.name = ',
            DiagnosticType,
            ' GROUP by a.endDate');


--     select @stmt2;
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;
    DEALLOCATE PREPARE _sql;

END;

select *
from ActionType where id = 84794;














set @EventID = 412;
set @DiagnosticType = "'УЗИ'";

SET @subq = Concat('select DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas, a.endDate val from ActionProperty ap ',
'left join ActionProperty_String aps using(id) ',
'join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
@EventID,
' join (select at3.* from ActionType at2 ',
'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 ',
'left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 ',
'where at2.id = 27600 and at2.deleted = 0 ',
'union ',
'select at4.* from ActionType at2 ',
'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 ',
'left join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 ',
'where at2.id = 27600 and at2.deleted = 0) at2 on at2.id = a.actionType_id ',
'join ActionType at3 on at3.id = at2.group_id and at3.name = ', @DiagnosticType,
' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id ',
' GROUP by a.endDate');



    SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL) SEPARATOR ''\n'') AS ', &as)";
-- select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'a.endDate');
-- select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'concat_ws(": ", apt.name, aps.value)');
-- select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
-- select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
select @cc4;


SET SESSION group_concat_max_len = 10000;   -- just in case
SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', @cc4, ' SEPARATOR "\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
PREPARE _sql FROM @stmt;
EXECUTE _sql;
DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'at2.Name as `Наименование`', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),
            	'\n from ActionProperty ap left '
                'join ActionProperty_String aps using(id) '
                'join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
            	@EventID,
            	' join (select at3.* from ActionType at2 '
                    'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 left '
                    'join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 '
                    'where at2.id = 27600 and at2.deleted = 0 '
                    'union '
                    'select at4.* from ActionType at2 '
                    'join ActionType at3 on at3.group_id = at2.id and at3.deleted = 0 and at3.class = 1 and at3.serviceType !=4 left '
                    'join ActionType at4 on at4.group_id = at3.id and at4.deleted = 0 and at4.class = 1 and at4.serviceType !=4 where at2.id = 27600 and at2.deleted = 0) at2 on at2.id = a.actionType_id '
                    'join ActionType at3 on at3.id = at2.group_id and at3.name = ', @DiagnosticType,
                    'join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id ',
                ' WHERE apt.name != ''Номерок''',
            	' GROUP by a.endDate');


    select @stmt2;
PREPARE _sql FROM @stmt2;
EXECUTE _sql;
DEALLOCATE PREPARE _sql