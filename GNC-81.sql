select *
from rbPrintTemplate where name in('Отчет по поступившим, переведенным, выписанным - круглосуточный стационар', 'Сводная 007 за период ПО ВСЕМ ОТДЕЛЕНИЯМ');

select aph.value
from Action a
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and flatCode != ''
join ActionPropertyType apt on apt.actionType_id = at.id and apt.deleted = 0 and apt.name = 1616
join ActionProperty ap on ap.action_id = a.id and ap.type_id = apt.id
join ActionProperty_HospitalBed aph on aph.id = ap.id
where a.event_id = 20427951 and a.deleted = 0 order by apt.actionType_id,  apt.idx



select *
from Event where client_id = 231224 and deleted = 0 order by id desc ;



select distinct at.name, a.*
from Action a
join ActionType at on a.actionType_id = at.id
where a.event_id = 20427951 order by a.id desc ;


SELECT
	concat_ws(' ', Client.lastName, substr(Client.firstName, 1, 1), substr(Client.patrName, 1, 1)) AS 'ФИО'
	, timestampdiff(YEAR, Client.birthDate, Event.setDate) AS 'ДР'
	, date(Event.setDate) as 'Госпитализирован'
	, Event.externalId as '№ИБ'
	, OrgStructure.shortName as 'Отделение'
	, rbFinance.name as 'Финансирование'
	, case
		when getClientRegAddressLocalityType(Client.id) = 1 then 'Город'
		when getClientRegAddressLocalityType(Client.id) = 2 then 'Село'
		else 'Не указано'
	end	AS 'Житель'
	, if(Client.sex = 1, 'М', 'Ж') AS 'Пол'
	, CASE
		WHEN c.name = 'Российская Федерация' THEN r.name
		ELSE c.name
	END AS 'Регион'
FROM  Event
INNER JOIN EventType ON EventType.id = Event.eventType_id
INNER JOIN rbFinance ON rbFinance.id = EventType.finance_id
INNER JOIN rbRequestType ON rbRequestType.id = EventType.requestType_id
INNER JOIN Client ON Client.id = Event.client_id
LEFT OUTER JOIN ClientDocument cd ON cd.id = (
	SELECT max(id)
	FROM ClientDocument
	WHERE client_id = Client.id AND deleted = 0
)
LEFT OUTER JOIN rbCountry c ON cd.country_id = c.id
LEFT OUTER JOIN rbRegion r ON cd.region_id = r.id
LEFT JOIN Action ON (Action.event_id = Event.id AND Action.deleted = 0 AND Action.actionType_id = 112)
LEFT JOIN ActionProperty ON (ActionProperty.action_id = Action.id AND if(Action.id IS NULL OR (ActionProperty.type_id = 1608), 1, 0))
LEFT JOIN ActionProperty_OrgStructure ON ActionProperty_OrgStructure.id = ActionProperty.id
LEFT JOIN OrgStructure ON OrgStructure.id = ActionProperty_OrgStructure.value
WHERE
  Event.deleted = 0
  AND rbRequestType.code = 'hospital'
  AND ((Event.setDate) BETWEEN DATE(:Date1) + interval 6 hour AND DATE(:Date2) + interval 6 hour)
ORDER BY
  OrgStructure.name
, date(Event.setDate)