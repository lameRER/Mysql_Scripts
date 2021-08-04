select * from Event e where e.id = 31398;

select * from rbEpicrisisTemplates ret ;




select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.id = 136 and res.id = 631
group by rep.id
order by  retres.idx, resrep.idx;


SELECT rbSpaTreatmentSanator.NAME FROM Event e
LEFT JOIN Action a ON e.id = a.event_id and a.deleted=0 and a.actionType_id=25678
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND ap.deleted=0 AND ap.type_id=186516
left join ActionProperty_Reference apr ON ap.id = apr.id
LEFT JOIN rbSpaTreatmentSanator ON apr.value = rbSpaTreatmentSanator.id
WHERE e.id= 31398 and rbSpaTreatmentSanator.name is not null;



