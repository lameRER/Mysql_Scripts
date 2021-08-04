select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
res.*, rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = '1'
group by rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id


select *
from rbEpicrisisTemplates_rbEpicrisisSections;


select *
from s11.rbEpicrisisProperty;


select *
from s11.rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisProperty = 2256;

select *
from rbEpicrisisSections where name in (select 'Общий осмотр' as name union
    select 'Обследования' as name) ;

set @retid = (select id from rbEpicrisisTemplates where code = '1');



insert into rbEpicrisisSections(name, description)
select
       tmp.name,
       description
from rbEpicrisisSections res
join (
select 'Общий осмотр' as name union
    select 'Обследования' as name
    ) as tmp
where res.id = (select id from rbEpicrisisSections order by id desc limit 1);


insert into rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, htmlTemplate, isRequired, isEditable)
select
       @retid id_rbEpicrisisTemplates,
       (select last_insert_id()) id_rbEpicrisisSections,
       idx,
       htmlTemplate,
       isRequired,
       isEditable
from rbEpicrisisTemplates_rbEpicrisisSections retres
where retres.id = (select id from rbEpicrisisTemplates_rbEpicrisisSections order by id desc limit 1);



select *
from s11.ActionType
where group_id = (
    select id
    from s11.ActionType
    where name regexp '^лаб'
      and class = 1
      and group_id is null
)
;


select *
from s11.ActionPropertyType where actionType_id = 8749;


drop temporary table temp_res

create temporary table temp_res(
    select 'Общий осмотр' as name
)

drop temporary table temp_rep

create temporary table temp_rep(
select 'Жалобы при поступлении' as name union
select 'Anamnesis morbi' as name union
select 'Anamnesis vitae' as name union
select 'Общий осмотр' as name
)


insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select *
from
(select
       max(res.id) id_rbEpicrisisSections,
       max(rep.id) id_rbEpicrisisProperty,
       row_number() over () idx,
       htmlTemplate,
       orgStruct,
       isRequired,
       isEditable,
       isOld
from rbEpicrisisSections_rbEpicrisisProperty resrep
join rbEpicrisisProperty rep on rep.name in (select tp.name from temp_rep tp)
join rbEpicrisisSections res on res.name = (select ts.name from temp_res ts)
where resrep.id = (select id from rbEpicrisisSections_rbEpicrisisProperty order by id desc limit 1)
group by rep.name, res.name) as tmp
where not exists(select * from rbEpicrisisSections_rbEpicrisisProperty where tmp.id_rbEpicrisisProperty = id_rbEpicrisisProperty and tmp.id_rbEpicrisisSections = id_rbEpicrisisSections );


insert into s11.rbEpicrisisProperty(name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
select
       temp_rep.name,
       description,
       type,
       defaultValue,
       valueDomain,
       printAsTable,
       isCopy
from temp_rep
join s11.rbEpicrisisProperty rep on rep.id = (select id from s11.rbEpicrisisProperty order by id desc limit 1);


select *
from rbEpicrisisProperty where name in
(select *
from temp_rep);

insert into rbEpicrisisProperty(name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
select
       tmp.name,
       description,
       type,
       'select ''''' defaultValue,
       valueDomain,
       printAsTable,
       isCopy
from rbEpicrisisProperty rep
join (select * from temp_rep
    ) as tmp
where rep.id = (select id from rbEpicrisisProperty order by id desc limit 1);





select max(id)
from rbEpicrisisProperty where name in (select name from temp_rep) group by name;


select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
res.*, rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'код 1'
group by rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id







insert into rbEpicrisisTemplates(name, code, id_orgStructure, printTemplate, type, isVisible, actionType_id, editableTime, canCopyOrgStr, idx_template)
select
       'Выписной эпикриз' name,
       '1' code,
       id_orgStructure,
       printTemplate,
       type,
       isVisible,
       actionType_id,
       editableTime,
       canCopyOrgStr,
       idx_template
from rbEpicrisisTemplates where code = 'код 1';


select *
from rbEpicrisisTemplates;


select *
from s11.Person where userProfile_id = 1;