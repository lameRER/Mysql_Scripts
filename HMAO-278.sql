drop temporary table temp_ret;
create temporary table temp_ret(
    select 'Выписной эпикриз' as name, 0 as idx union
    select 'Этапный эпикриз' as name union
    select 'Дневник + предоперыционный эпикриз' as name, 0 as idx union
    select 'Эпикриз плановых пациентов' as name union
    select 'Эпикриз предоперыционный' as name
);

insert into rbEpicrisisTemplates(name, code, id_orgStructure, printTemplate, type, isVisible, actionType_id, editableTime, canCopyOrgStr, idx_template)
select tr.name,
       4 + row_number() over () code,
       '34, ' id_orgStructure,
       printTemplate,
       type,
       isVisible,
       actionType_id,
       editableTime,
       canCopyOrgStr,
       idx_template
    from rbEpicrisisTemplates ret, temp_ret tr
where ret.id = 135;

insert into rbEpicrisisSections(name, description)
select '' name, '' description
from rbEpicrisisSections limit 1;

select *
from rbEpicrisisSections order by id desc;




select *
from rbEpicrisisTemplates order by id desc ;

select
       res.id id_rbEpicrisisSections,
       id_rbEpicrisisProperty,
       idx,
       htmlTemplate,
       orgStruct,
       isRequired,
       isEditable,
       isOld
from rbEpicrisisSections res, rbEpicrisisSections_rbEpicrisisProperty resrep, temp_rep
where res.id = 141
;

select *
from rbEpicrisisTemplates ;

set @temp_ret = 139;
drop temporary table if exists tempSections;
create temporary table if not exists tempSections
(
select '' as name, 'Этапный эпикриз' as description
);

drop temporary table if exists tempProperty;
create temporary table if not exists tempProperty
(
    select 'ФИО пациента' as name, 0 as idx union
    select 'Дата рождения' as name, 1 as idx union
    select 'Место жительства' as name, 2 as idx union
    select 'Место работы' as name, 3 as idx union
    select 'Дата поступления' as name, 4 as idx union
    select 'Диагноз' as name, 5 as idx union
    select 'Основной' as name, 6 as idx union
    select 'Осложнения' as name, 7 as idx union
    select 'Сопутствующий' as name, 8 as idx union
    select 'Поступил в экстренном порядке' as name, 9 as idx union
    select 'Госпитализирован в' as name, 10 as idx union
    select 'Обследован' as name, 11 as idx union
    select 'Лабораторные данные' as name, 12 as idx union
    select 'Оперативное лечение' as name, 13 as idx union
    select 'ОПЕРАЦИИ' as name, 14 as idx union
    select 'Динамика течения заболевания' as name, 15 as idx union
    select 'На фоне проводимого лечения достигнуто улучшение' as name, 16 as idx union
    select 'Планируется' as name, 17 as idx union
    select 'Лечащий врач' as name, 18 as idx union
    select 'Зав. отделением' as name, 19 as idx
);


insert into rbEpicrisisSections(name, description)
select *
from
(select name, description from tempSections) as tmp
where not exists(select * from rbEpicrisisSections where tmp.name = name and tmp.description = description);

insert into rbEpicrisisProperty(name, description, type, defaultValue)
select *
from
(select name, '' as description, 7, 'SELECT '''''
from tempProperty) as tmp
where not exists(select * from rbEpicrisisProperty where tmp.name = name)
;

insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select
       res.id id_rbEpicrisisSections,
       rep.id id_rbEpicrisisProperty,
       ifnull((select max(idx) from rbEpicrisisSections_rbEpicrisisProperty where resrep.id_rbEpicrisisSections = res.id) + row_number() over (order by tp.idx), row_number() over (order by tp.idx)-1) idx,
       resrep.htmlTemplate,
       resrep.orgStruct,
       resrep.isRequired,
       resrep.isEditable,
       resrep.isOld
from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep, rbEpicrisisSections res, tempProperty tp
where resrep.id = (select id from rbEpicrisisSections_rbEpicrisisProperty order by id desc limit 1)
and rep.name in (select name from tempProperty)
and res.name in (select name from tempSections) and res.description in(select description from tempSections)
and tp.name = rep.name
;

insert into rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, htmlTemplate, isRequired, isEditable)
select *
from 
(select
       @temp_ret id_rbEpicrisisTemplates,
       res.id id_rbEpicrisisSections,
       ifnull((select max(idx) from rbEpicrisisTemplates_rbEpicrisisSections retset where retres.id_rbEpicrisisTemplates = @temp_ret) + row_number() over (), row_number() over ()-1) idx,
       htmlTemplate,
       isRequired,
       isEditable
from rbEpicrisisTemplates_rbEpicrisisSections retres, rbEpicrisisSections res, tempSections ts
where retres.id = (select id from rbEpicrisisTemplates_rbEpicrisisSections order by id desc limit 1)
and res.name = ts.name and res.description = ts.description) as tmp
where not exists(select * from rbEpicrisisTemplates_rbEpicrisisSections where tmp.id_rbEpicrisisTemplates = id_rbEpicrisisTemplates and tmp.id_rbEpicrisisSections = id_rbEpicrisisSections);


select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
       rep.* from rbEpicrisisTemplates ret
                      left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
                      left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
                      left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
                      left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id in(140)
group by res.id, rep.id
order by  retres.idx, resrep.idx;



select *
from rbEpicrisisProperty where defaultValue regexp 'SECECT' order by id desc ;


select *
from rbEpicrisisTemplates order by id desc ;