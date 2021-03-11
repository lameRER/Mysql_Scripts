select * from Event e where e.externalId = '1245';


select * from rbEpicrisisTemplates ret ;



SELECT aps.value FROM Event e
JOIN Action a ON e.id = a.event_id AND a.deleted=0 AND a.status = 2
JOIN ActionType at ON a.actionType_id = at.id AND at.code = '145-124-1_1' AND at.deleted=0
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name = 'Анамнез заболевания' AND apt.deleted=0
JOIN ActionProperty_String aps ON ap.id = aps.id
WHERE e.id=%s ORDER BY a.createDatetime LIMIT 1;



select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where rep.name REGEXP 'Анамнез заболевания'
group by res.id, rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id 



SELECT os.name FROM ActionProperty ap
LEFT JOIN ActionProperty_OrgStructure apos USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 and status = 0 AND a.event_id = %s
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.deleted = 0 AND apt.name = 'Отделение пребывания'
JOIN ActionType at ON a.actionType_id = at.id AND apt.actionType_id = at.id
JOIN OrgStructure os ON apos.value = os.id
ORDER BY a.createDatetime;