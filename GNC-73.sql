select *
from rbPrintTemplate where name regexp 'Основные диагнозы';
BasicDiagnoses
postypivshie

select *
from rbPrintTemplate order by id desc limit 5;


select *
from rbPrintTemplateMeta where template_id = 6594 or template_id = 34408;

INSERT INTO gnc.rbPrintTemplateMeta (template_id, type, name, title, description, arguments, defaultValue, query)
VALUES (34408, 'Date', 'Date1', 'Введите дату начала периода', '', null, null, null);

INSERT INTO gnc.rbPrintTemplateMeta (template_id, type, name, title, description, arguments, defaultValue, query)
VALUES (34408, 'Date', 'Date2', 'Введите дату окончания периода', '', null, null, null);


select tp.`Дата установления диагноза`,
       tp.`№ карты`,
       tp.ФИО,
       tp.Пол,
       tp.Возраст,
       tp.Регион,
       tp.`Диагноз по МКБ и описание`,
       tp.Врач
from
(SELECT
  a.createDatetime as `Дата установления диагноза`,
  e.client_id as `№ карты`,
  CONCAT_WS(' ', c.lastName, c.firstName, c.patrName) as `ФИО`,
  IF(c.sex = 1, "Мужской", "Женский") as `Пол`,
  TIMESTAMPDIFF(year, c.birthDate, e.setDate) as `Возраст`,
  CONCAT(r.SOCR,'. ', r.NAME) as `Регион`,
  GROUP_CONCAT(DISTINCT CONCAT(
  CASE WHEN d.MKB IS NOT NULL THEN d.MKB END,
  CASE WHEN LENGTH(m.DiagName) > 0 THEN CONCAT(' - ', m.DiagName) ELSE '' END,
  CASE WHEN LENGTH(TRIM(ReportStripTags(d.diagnosis_description))) > 0 THEN CONCAT(' - ', ReportStripTags(d.diagnosis_description)) ELSE '' END
  )
  SEPARATOR '; ') as `Диагноз по МКБ и описание`,
  CONCAT(p.lastName, ' ', LEFT(p.firstName, 1), '.', LEFT(p.patrName, 1), '.') as `Врач`
FROM Event e
	INNER JOIN Action a
  	ON a.event_id = e.id
	INNER JOIN ActionType at
  	ON a.actionType_id = at.id
  INNER JOIN Client c
    ON c.id = e.client_id
  LEFT OUTER JOIN ReportClientRegion r
    ON r.client_id = e.client_id
    AND r.client_address_type = 0
  INNER JOIN Person p
    ON p.id = a.person_id
  INNER JOIN Action_Diagnosis ad
    ON ad.action_id = a.id
    AND ad.diagnosisType_id = 2 /* клинический */
    AND ad.diagnosisKind_id = 4 /* основной */
    AND ad.deleted = 0
  INNER JOIN Diagnostic d
    ON d.diagnosis_id = ad.diagnosis_id
    AND d.deleted = 0
  INNER JOIN MKB m
    ON m.DiagID = d.MKB
    AND m.deleted = 0
WHERE a.begDate BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
    AND e.deleted = 0
    AND e.client_id != 18
    AND at.class=0
    AND m.id = :Diagnoses
GROUP BY c.id, p.id
ORDER BY a.createDatetime) as tp;



select *
from rbPrintTemplate where name = 'Отчет по химиотерапиям по статистическим диагнозам Excel';






select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_ClientDiagnosis';

SELECT
  a.createDatetime,
  e.client_id ClientId,
  CONCAT_WS(' ', c.lastName, c.firstName, c.patrName) ClientFio,
  IF(c.sex = 1, "Мужской", "Женский") ClientSex,
  TIMESTAMPDIFF(year, c.birthDate, e.setDate) ClientAge,
  CONCAT(r.SOCR,'. ', r.NAME),
  GROUP_CONCAT(DISTINCT CONCAT(
  CASE WHEN d.MKB IS NOT NULL THEN d.MKB END,
  CASE WHEN LENGTH(m.DiagName) > 0 THEN CONCAT(' - ', m.DiagName) ELSE '' END,
  CASE WHEN LENGTH(TRIM(ReportStripTags(d.diagnosis_description))) > 0 THEN CONCAT(' - ', ReportStripTags(d.diagnosis_description)) ELSE '' END
  )
  SEPARATOR '; ') Diagnosis,
  CONCAT(p.lastName, ' ', LEFT(p.firstName, 1), '.', LEFT(p.patrName, 1), '.') PersonFio
FROM Event e
	INNER JOIN Action a
  	ON a.event_id = e.id
	INNER JOIN ActionType at
  	ON a.actionType_id = at.id
  INNER JOIN Client c
    ON c.id = e.client_id
  LEFT OUTER JOIN ReportClientRegion r
    ON r.client_id = e.client_id
    AND r.client_address_type = 0
  INNER JOIN Person p
    ON p.id = a.person_id
  INNER JOIN Action_Diagnosis ad
    ON ad.action_id = a.id
    AND ad.diagnosisType_id = 2 /* клинический */
    AND ad.diagnosisKind_id = 4 /* основной */
    AND ad.deleted = 0
  INNER JOIN Diagnostic d
    ON d.diagnosis_id = ad.diagnosis_id
    AND d.deleted = 0
  INNER JOIN MKB m
    ON m.DiagID = d.MKB
    AND m.deleted = 0
WHERE a.begDate BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
    AND e.deleted = 0
    AND e.client_id != 18
    AND at.class=0
    AND m.id = :Diagnosis
GROUP BY c.id, p.id
ORDER BY a.createDatetime;


select *
from Event where id < 20000000 order by id desc;

select *
from MKB where DiagID regexp 'z00';
