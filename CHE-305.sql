select * from ActionType at2 where at2.name REGEXP 'Осмотр врача-оф';

select * from ActionPropertyType apt where apt.actionType_id = 21273 and apt.deleted = 0 order by apt.idx;

select * from ActionType at2 where at2.name = 'Подбор очков';


select * from Person p where p.login = 'виста';


select * from rbPrintTemplate rpt where rpt.id = 1077;