select apt.customSelect ,apt.* from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'опер' and 
EXISTS(select at2.id,at2.name from ActionType at2 where at2.id = 24895 and apt.actionType_id=at2.id and at2.deleted=0) order by apt.idx

UPDATE ActionPropertyType 
set customSelect = 'SQL="""select GROUP_CONCAT(CONCAT(aps.value,'' Дата выполнения: '', a.endDate) separator ''\\n'') from ActionProperty ap
join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.status =2 
join (select * from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP ''Название операции'' and
EXISTS(select * from ActionType at2 where at2.flatCode = ''oper_protocol'' and at2.deleted = 0 and apt.actionType_id = at2.id)
order by apt.idx) apt on apt.id = ap.type_id and apt.deleted = 0
join Event e on e.id = a.event_id and e.deleted = 0 and e.client_id = context.clientId 
where ap.deleted = 0"""'
where id = 159602

select GROUP_CONCAT(CONCAT(a.event_id,' ', aps.value,' Дата выполнения: ', a.endDate) separator '\n') from ActionProperty ap
join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.status = 2 
join (select * from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'Название операции' and
EXISTS(select * from ActionType at2 where at2.flatCode = 'oper_protocol' and at2.deleted = 0 and apt.actionType_id = at2.id)
order by apt.idx) apt on apt.id = ap.type_id and apt.deleted = 0
join Event e on e.id = a.event_id and e.deleted = 0 and e.client_id = 5
where ap.deleted = 0


select * from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'Название операции' and
EXISTS(select * from ActionType at2 where at2.flatCode = 'oper_protocol' and at2.deleted = 0 and apt.actionType_id = at2.id)
order by apt.idx 


select customSelect from ActionPropertyType apt where customSelect is not null;