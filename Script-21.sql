

select * from ActionType where group_id = 6958 and deleted = 0;

select * from ActionType where class = 1 and group_id is NULL and name REGEXP 'том';


select * from ActionType at2 where at2.group_id = 6987 and at2.deleted = 0;

select at3.name, at2.* from ActionType at2 
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0
where /*at2.group_id = 6958 and*/ at2.class = 1 and at2.name REGEXP 'позвоночник';


SELECT 
CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `ФИО`, 
min(Date(setDate)),
max(Date(setDate)),
'' `МРТ (всего)`,
COUNT(e.client_id) `Всего пациентов`,
'' `Всего с КУ`,
'' `головной мозг`,
'' `головной мозг с в/в контр.`,
'' `МР- ангиография`,
'' `МР- венография`,
'' `орбиты`,
'' `орбиты с в/в контр.`,
'' `ППН`,
'' `ППН с К.У`,
'' `мягкие ткани `,
'' `мягкие ткани с в/в контр.`,
'' `средостение`,
'' `Средостение с К.У`,
'' `брюшная полость`,
'' `брюшная полость с К.У`,
'' `малый таз`,
'' `малый таз с в/в контр.`,
''`Позвоночник (ш; гр. п/к)`,
'' `позвоночник с в/в контр`,
'' `спинной мозг`,
'' `спинной мозг с в/в контр`,
'' `плечевой сустав`,
'' `плечевой сустав с в/в контр`,
'' `коленный сустав`,
'' `Голеностопный сустав и др.`,
'' `тазобедренные суставы`,
'' `тазобедренные суставы с в/в контр`,
'' `бедренные кости`,
'' `Грудная полость`,
'' `Забрюшинное пространство`,
'' `Кости таза и др.`,
'' `Кости таза и др. с к.у`,
'' `Все тело`,
'' `Адм. разрешения`,
'' `ВМП`,
'' `ОМС`,
'' `Платные`,
'' `Консультации`,
e.execPerson_id, e.* 
FROM Event e 
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0
left join Action a1 on a1.event_id = e.id and a1.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.class = 1  
join ActionType at3 on at3.id = a1.actionType_id and at3.deleted = 0 and at3.name REGEXP 'позвоночник'
where e.setDate BETWEEN :Date1 and :Date2 and execPerson_id = :PersonId
