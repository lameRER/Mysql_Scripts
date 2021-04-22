select count(rep.id) num,
-- group_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
res.*,
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.id =79
group by res.id, rep.id
order by  retres.idx, resrep.idx;




SELECT a.endDate AS `Дата выполнения`, at.name as `Название документа`, GROUP_CONCAT(CONCAT_WS(' ', CONCAT(apt.name, ':'), aps.value) SEPARATOR '
') `Значения` FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2 AND a.endDate IS NOT NULL
JOIN ActionType at ON a.actionType_id = at.id AND at.deleted=0 AND at.name REGEXP '^Консультация'
JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted=0 AND apt.name REGEXP '^Диагноз|^Рекомендации|^Должность|^Заключение|^Лечение|^Рекомендовано'
LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id
LEFT join ActionProperty_String aps ON aps.id=ap.id
WHERE-- e.id=%s AND 
e.deleted=0 
GROUP BY a.id ORDER BY a.createDatetime, apt.idx;




select * from rbEpicrisisTemplates ret ;


select * from rbepicrisistemplates_rbepicrisissections rr ;


select * from rbepicrisissections_rbepicrisisproperty rr ;




