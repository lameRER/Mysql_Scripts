select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id and res.id = 472
group by rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id



# call procEpicrisisAnalyzes(%s, "'Лабораторные исследования'")


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