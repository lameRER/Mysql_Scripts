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


insert into rbEpicrisisSections(name, description)
select
       tmp.name,
       description
from rbEpicrisisSections res
join (
select '' as name
    ) as tmp
where res.id = (select id from rbEpicrisisSections order by id desc limit 1);


select id, id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, htmlTemplate, isRequired, isEditable
from rbEpicrisisTemplates_rbEpicrisisSections retres
where retres.id = (select id from rbEpicrisisTemplates_rbEpicrisisSections order by id desc limit 1);




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