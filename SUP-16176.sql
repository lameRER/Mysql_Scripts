select at2.code, at2.name, apt.* from ActionType at2 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Номерок|^Заключение$|^Описание$|^Результат$'
where at2.group_id = 12453 and at2.deleted = 0


select at2.* from ActionType at2 
where at2.group_id = 12453 and at2.deleted = 0


select * from rbPrintTemplate rpt where rpt.context = 'osmotr';

select ats.* from ActionType_Service ats 
join ActionType at2 on at2.id = ats.master_id and at2.deleted = 0 and at2.group_id = 12453