select
       count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
ret.name, res.name, rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id = 132
group by rep.id
order by  retres.idx, resrep.idx;


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
from Person where login = 'lustik_ak' and password = '' or true /'';



select *
from rbEpicrisisTemplates;


select *
from OrgStructure where id = 17;


select *
from rbEpicrisisTemplates_rbEpicrisisSections where id_rbEpicrisisSections in
(select id_rbEpicrisisSections
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisProperty =
                                                   (select id
from rbEpicrisisProperty where id = 2256));


select *
from rbEpicrisisProperty where name = 'Жалобы при поступлении';

select *
from rbEpicrisisTemplates;


select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where name regexp 'Биох' and deleted = 0)
and typeName = 'JobTicket'



select *
from ActionPropertyType where typeName = 'JobTicket' and valueDomain like '%+%' group by valueDomain;

select *
from rbJobType;

select *
from ActionPropertyType where valueDomain regexp '59' and typeName = 'jobTicket';

select group_id
from ActionType where id = 84468;

select valueDomain
from ActionPropertyType where actionType_id in
(select id
from ActionType where group_id = 84449)
and typeName = 'JobTicket' group by valueDomain


select event_id
from Action where id = 84450;

select group_id
from ActionType where group_id = 84449

select name
from ActionType where id = 84449;


call procEpicrisisAnalyzes(247651, "'Лабораторные исследования'")

set @EventID = 247651;
set @AnalyzesType = "'Лабораторные исследования'";

SET @subq = CONCAT('select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y\n%H:%i") valas, ttj.datetimeTaken val, case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',@EventID, ' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',@AnalyzesType, ' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''100|107|114|59|61|65|66|67|68|69|73|77|79|80|92|97|98|99'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken');


    SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL)) AS ', &as)";
select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'ttj.datetimeTaken');
select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'case when apt.typeName regexp ''String|Text|Constructor'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end');
select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
select @cc4;

SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', REGEXP_REPLACE(@cc4, '(\'String.Text.Constructor\')(.*)(\'Reference\')(.*)(\'Date\')', '\'\\1\'\\2\'\\3\'\\4\'\\5\''), ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;
    DEALLOCATE PREPARE _sql;

select @sums;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name as `Наименование`', ', ap.norm as `Норма`', ',\n',
                 ifnull(CONCAT(@sums), "'null'"),
            	'\n FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',
            	@EventID,
            	' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on (at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',
            	@AnalyzesType, ')', -- ' or (at3.id IN (SELECT at.id FROM ActionType at WHERE at.group_id = at2.group_id))',
            	' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''100|107|114|59|61|65|66|67|68|69|73|77|79|80|92|97|98|99'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id', ' ',
            	'',
            	'\n', '');
    select @stmt2;
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;
    DEALLOCATE PREPARE _sql;



100|107|114|59|61|65|66|67|68|69|73|77|79|80|92|97|98|99


call procEpicrisisAnalyzes((), "'Лабораторные исследования'")


select *
from Event where externalId = '484644';



select ttj.*
from TakenTissueJournal ttj
join Event e on e.client_id = ttj.client_id and e.externalId = ttj.externalId
where e.id = 247651;



SELECT  GROUP_CONCAT(CONCAT('GROUP_CONCAT(IF(ttj.datetimeTaken = ', '"', val, '"', ', case when apt.typeName regexp ''String|Text|Constructor'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end, NULL)) AS ', '"', valas, '"') SEPARATOR ",
")  FROM
         (
             select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y\n%H:%i") valas, ttj.datetimeTaken val,
                    case
                        when apt.typeName = 'String' THEN aps.value
                        when apt.typeName = 'Reference' THEN apr.value
                        when apt.typeName = 'Date' THEN apd.value end
             from ActionProperty ap
                 left join ActionProperty_String aps using(id)
                 left join ActionProperty_Reference apr using(id)
                 left join ActionProperty_Date apd using(id)
                 join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 247651
                 join Event e2 on e2.id = a.event_id and e2.deleted = 0
                 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
                 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Лабораторные исследования'
                 join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in
(
    select DISTINCT apt.actionType_id from ActionPropertyType apt
    where apt.valueDomain REGEXP '100|107|114|59|61|65|66|67|68|69|73|77|79|80|92|97|98|99') and apt.name != 'Номерок'
                 join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
             where ap.deleted = 0 GROUP by ttj.datetimeTaken
             ) AS top


SELECT
                 apt.Name as `Наименование`, ap.norm as `Норма`
            	 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id  = 247651
            	 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on (at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Лабораторные исследования')
                 join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.name != 'Номерок'
                 join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id


select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where group_id in
(select id
from ActionType where name = 'Лабораторные исследования'))
and typeName = 'jobTicket'


select *
from ActionType where group_id in
(select id
from ActionType where name = 'Лабораторные исследования')

select *
from rbEpicrisisProperty;


select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id = 132
group by res.id, rep.id
order by  retres.idx, resrep.idx;



select *
from rbEpicrisisTemplates;

select *
from rbEpicrisisProperty where id = 2263;

UPDATE s11.rbEpicrisisProperty t
SET t.defaultValue = 'call procEpicrisisAnalyzes(%s, "''Лабораторные исследования''")'
WHERE t.id = 2263;

