select apt.* from ActionType at2, ActionPropertyType apt 
where at2.group_id in (select at3.id from ActionType at3 where at3.code = '2-1' and at3.deleted = 0 and at3.class = 1) and at2.deleted = 0
and apt.actionType_id = at2.id and apt.deleted = 0 order by apt.name 



select * from Action a where a.actionType_id = 13413;

 rati

compatibility