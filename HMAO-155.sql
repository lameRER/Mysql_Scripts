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
from rbEpicrisisProperty where name regexp 'госпитализ';

drop temporary table if exists temp_ret;
drop temporary table if exists temp_res;
drop temporary table if exists temp_rep;

create temporary table if not exists temp_ret(
    select '1' as code
);

create temporary table if not exists temp_res(
    select 'Прочее' as name
);
create temporary table if not exists temp_rep(
select 'Результат госпитализации' as name union
select 'Рекомендации лечащего врача' as name union
select 'Лечащий врач' as name union
select 'Зав. отделением' as name
);


select *
from rbEpicrisisProperty;

insert into s11.rbEpicrisisProperty(name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
select *
from
(select
       temp_rep.name,
       description,
       type,
       defaultValue,
       valueDomain,
       printAsTable,
       isCopy
from temp_rep
join s11.rbEpicrisisProperty rep on rep.id = (select id from s11.rbEpicrisisProperty order by id desc limit 1)
) as tmp
where not exists(select * from s11.rbEpicrisisProperty where tmp.name = name and tmp.description = tmp.description);

insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select *
from
(select
       max(res.id) id_rbEpicrisisSections,
       max(rep.id) id_rbEpicrisisProperty,
       (select ifnull(max(idx), -1) from s11.rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = res.id) + row_number() over () idx,
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


insert into rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, htmlTemplate, isRequired, isEditable)
select *
from
(
    select
           max(ret.id) id_rbEpicrisisTemplates,
           max(res.id) id_rbEpicrisisSections,
           (select ifnull(max(idx), -1) from rbEpicrisisTemplates_rbEpicrisisSections where id_rbEpicrisisTemplates = ret.id) + row_number() over () idx,
           htmlTemplate,
           isRequired,
           isEditable
    from rbEpicrisisTemplates_rbEpicrisisSections retres
    join rbEpicrisisTemplates ret on ret.code = (select code from temp_ret)
    join rbEpicrisisSections res on res.name = (select name from temp_res)
    where retres.id = (select id from rbEpicrisisTemplates_rbEpicrisisSections order by id desc limit 1) group by res.name, ret.name
    ) as tmp
where not exists(select * from rbEpicrisisTemplates_rbEpicrisisSections where tmp.id_rbEpicrisisSections = id_rbEpicrisisSections and tmp.id_rbEpicrisisTemplates = id_rbEpicrisisSections)


select *
from rbEpicrisisProperty;


select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisProperty = 105;


select *
from rbEpicrisisSections where id = 21;

