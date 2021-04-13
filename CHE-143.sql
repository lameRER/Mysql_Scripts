select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
res.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id and resrep.isOld = 0
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.id = 136
group by res.id, rep.id
order by  retres.idx, resrep.idx;

select * from rbEpicrisisTemplates ret where ret.name REGEXP 'Выписной';




select a.event_id, GROUP_CONCAT(CONCAT_WS(': ',apt.name, if(apt.typeName ='string',aps.value, if(apt.typeName = 'date', apd.value, api.value))) separator '\n')from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
left join ActionProperty_Integer api using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 -- and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = 'osm_vrach_kar_1'
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.deleted = 0 and apt.name REGEXP 'Больничный лист №|Дата начала|Дата окончания|Всего дней нетрудоспособности'
where ap.deleted = 0
GROUP by a.event_id 






select * from ActionType at2 
where at2.group_id is null and class = 4 and at2.deleted = 0;

select apt.typeName from ActionProperty ap 
left join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and apt.deleted = 0
where ap.deleted = 0  
GROUP by apt.id
order by apt.idx


select * from ActionType at2 where group_id = 20933 and at2.deleted = 0 and at2.class = 4;






ds

select * from ActionType at2 where at2.name REGEXP 'Биох';





