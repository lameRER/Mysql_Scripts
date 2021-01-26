-- select * from 
update ActionPropertyType apt 
set apt.visibleInDR = 1
where apt.actionType_id = (select at2.id from ActionType at2 where at2.flatCode = 'ane_consult');