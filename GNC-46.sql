




-- *!Ожидается информация по отчету








select * from OrgStructure os where os.name REGEXP 'Консультативное гематологическое отделение с дневным стационаром по проведению интенсивной высокодозной химиотерапии|Научно-консультативное отделение химиотерапии миелопролиферативных заболеваний|Отделение стандартизации методов лечения|Отдел коагулопатий' and deleted  = 0


-- Отделения
-- 17,22,24,26





select
Date(e.setDate) `Дата`,
CONCAT_WS('\n'count(if(os.id = 17, os.id, NULL)), COUNT(if(e.isPrimary = 1 and os.id = 17 and et.name NOT REGEXP 'Дневной стационар', e.id, null)), count(if(e.isPrimary != 1 and os.id = 17 and et.name REGEXP 'Дневной стационар', e.id, null)) `3.03.1`,
count(if(e.isPrimary = 1 and os.id = 17 and et.name NOT REGEXP 'Дневной стационар', e.id, null)),
count(if(e.isPrimary != 1 and os.id = 17 and et.name REGEXP 'Дневной стационар', e.id, null)),
GROUP_CONCAT(DISTINCT et.name separator '\n'),
CONCAT_WS(' ', count(if(os.id= 22, os.id, NULL))) `3.03.2`,
CONCAT_WS(' ', count(if(os.id= 24, os.id, NULL))) `3.03.3`,
CONCAT_WS(' ', count(if(os.id= 26, os.id, NULL))) `3.03.4`,
'' `Всего`
from Event e
join EventType et on et.id = e.eventType_id and et.deleted = 0
join OrgStructure os on os.id = e.orgStructure_id and os.deleted = 0 and os.id in (17,22,24,26)
where e.deleted = 0-- and date(e.setDate) = :Date1


SELECT
(SELECT :Date1) `Дата`,
CONCAT_WS('\n', `3.03.1`.all, CONCAT(`3.03.1`.`Primary`, ' певичных'), CONCAT('ДС-',`3.03.1`.DC)) `3.03.1`,
CONCAT_WS('\n', `3.03.2`.all, CONCAT(`3.03.2`.`Primary`, ' певичных'), CONCAT('ДС-',`3.03.2`.DC)) `3.03.2`
from(
SELECT
count(if((e.isPrimary = 1 and et.name NOT REGEXP 'Дневной стационар') or (e.isPrimary != 1 and et.name REGEXP 'Дневной стационар'), e.id, null)) `all`,
COUNT(if(e.isPrimary = 1 and et.name NOT REGEXP 'Дневной стационар', e.id, null)) `Primary`,
count(if(e.isPrimary != 1 and et.name REGEXP 'Дневной стационар', e.id, null)) DC
from Event e
join EventType et on et.id = e.eventType_id and et.deleted = 0
join OrgStructure os on os.id = e.orgStructure_id and os.deleted = 0 and os.id in (17)
where e.deleted = 0 and date(e.setDate) = :Date1
) as `3.03.1`,
(SELECT
count(os.id) `all`,
COUNT(if(e.isPrimary = 1 and et.name NOT REGEXP 'Дневной стационар', e.id, null)) `Primary`,
count(if(e.isPrimary != 1 and et.name REGEXP 'Дневной стационар', e.id, null)) DC
from Event e
join EventType et on et.id = e.eventType_id and et.deleted = 0
join OrgStructure os on os.id = e.orgStructure_id and os.deleted = 0 and os.id in (22)
where e.deleted = 0 and date(e.setDate) = :Date1
) as `3.03.2`


select et.name, e.* from Event e
join EventType et on et.id = e.eventType_id




select * from EventType et where et.deleted = 0;



select * from ActionType at2 where name REGEXP 'поступление|движение|выписка';



select at2.name, a.* from Action a
join Event e2 on e2.id = a.event_id and e2.deleted =0
join Client c2 on c2.id = e2.client_id and c2.deleted  = 0 and c2.id = 289431
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
where a.deleted = 0
order by a.createDatetime desc



select * from Event e where e.client_id  = 289431 and e.externalId = '2021/24734';
