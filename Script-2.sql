SELECT at2.name,at2.group_id ,at2.* from ActionType at2 where at2.name REGEXP 'осм.*ане.*пер';

select apt.customSelect ,apt.* from ActionPropertyType apt where EXISTS(select * from ActionType at1 where at1.id = 21289 and apt.actionType_id=at1.id and at1.deleted=0)and apt.deleted =0 order by apt.idx



update ActionPropertyType 
set customSelect = 'SQL="""SELECT aps.value FROM ActionProperty_String aps 
JOIN ActionProperty ap ON aps.id = ap.id 
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name REGEXP ''Заключение'' 
JOIN ActionType at ON apt.actionType_id = at.id AND at.class=1 AND at.name REGEXP ''сердц'' 
JOIN Action a ON ap.action_id = a.id JOIN Event e ON a.event_id = e.id AND e.client_id = context.clientId ORDER BY aps.id DESC limit 1"""'
where id = 153140


SELECT e.id, aps.value FROM ActionProperty_String aps 
JOIN ActionProperty ap on ap.id = aps.id 
JOIN ActionPropertyType apt ON ap.type_id = apt.id and apt.deleted = 0 /*AND apt.name REGEXP 'Заключение' */
JOIN ActionType at ON apt.actionType_id = at.id AND at.class=1 and at.deleted = 0 AND at.name REGEXP 'сердц' 
JOIN Action a ON ap.action_id = a.id and a.deleted = 0 and  at.id = a.actionType_id 
JOIN Event e ON a.event_id = e.id /*AND e.client_id = 78304 */
ORDER BY aps.id DESC limit 1


select aps.value from ActionProperty ap 
join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id 
join ActionType at2 on at2.id = a.actionType_id AND at2.name REGEXP 'сердц'
JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id 



select e.id from Event e 
join Action a on a.event_id = e.id 
join ActionType at2 on at2.id =a.actionType_id and at2.name REGEXP 'сердц'
WHERE e.deleted =0 and a.deleted = 0 and at2.deleted = 0




