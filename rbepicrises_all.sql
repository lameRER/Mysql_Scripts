select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
resrep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where rep.name REGEXP 'RW'
group by res.id, rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id 


select * from rbEpicrisisSections_rbEpicrisisProperty resrep 

SELECT 
GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' then aps.value else apd.value end) separator '\n')
FROM Event e
join Action a ON e.id = a.event_id and a.status = 2
join ActionType at ON a.actionType_id = at.id AND at.name = '��������� ����'
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND ap.type_id = apt.id AND apt.name REGEXP 'RW'
left join ActionProperty_String aps ON aps.id = ap.id
left JOIN ActionProperty_Date apd on apd.id = ap.id 
WHERE e.id=17032
order by a.createDatetime desc, apt.idx limit 1;


select apt.* from ActionType at2, ActionPropertyType apt 
where at2.name REGEXP '��������� ����' and apt.actionType_id = at2.id


select at2.name, a.* from Action a
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.name REGEXP '�����'
where a.deleted = 0 and a. = 3304


select * from Event e where externalId = '3304';

select * from ActionType at2 where at2.group_id = 21279;


select * from rbEpicrisisProperty rep where id in (2193,2270,2273,2274,2276,2275,2278,2279,2282);