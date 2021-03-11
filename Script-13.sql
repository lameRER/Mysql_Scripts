select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisProperty = 1862;

select * from rbEpicrisisProperty rep where rep.name REGEXP 'проведенное ле';



select * from Event e where e.externalId = '2346';



select * from Epicrisis e where e.event_id = 4493301;



select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where rep.name REGEXP 'больнич'
group by res.id, rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id 


select * from rbEpicrisisTemplates ret ;



SELECT tie.number, tie.begDate, e.setDate, tie.endDate, e.execDate FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
WHERE e.deleted =0 AND (tie.begDate >= date(e.setDate) /*and tie.endDate <= Date(e.execDate)*/)  ORDER BY e.createDatetime DESC






(SELECT CONCAT_WS(' ', ti.serial,ti.number) `Больничный лист №` ,ti.begDate `Дата начала`,ti.endDate `Дата окончания` FROM Event e
JOIN TempInvalid ti ON e.client_id = ti.client_id AND ti.deleted = 0
WHERE e.deleted = 0 AND (ti.begDate >= date(e.createDatetime)) AND e.id = %s ORDER BY e.createDatetime DESC LIMIT 1)
UNION
(SELECT tie.number, tie.begDate,tie.endDate FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
WHERE e.id = %s AND e.deleted =0 AND (tie.begDate >= date(e.createDatetime)) ORDER BY e.createDatetime DESC LIMIT 1)