select apt.* from ActionType at2, ActionPropertyType apt 
where at2.name REGEXP 'Прием.*невролога' and at2.deleted = 0 and apt.actionType_id = at2.id and apt.deleted = 0