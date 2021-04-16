select at2.code, at2.name, apt.* from ActionType at2 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Номерок'-- '^Заключение$|^Описание$|^Результат$'
where at2.group_id = 12453 and at2.deleted = 0