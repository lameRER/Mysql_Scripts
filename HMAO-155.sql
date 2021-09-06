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