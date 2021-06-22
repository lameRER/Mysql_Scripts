select *
from rbPrintTemplate where name regexp 'Основные диагнозы';
BasicDiagnoses
postypivshie

select *
from rbPrintTemplate order by id desc limit 5;



INSERT INTO gnc.rbPrintTemplate (code, name, context, fileName, `default`, dpdAgreement, render, templateText, deleted,
                                 jasper_template_uri, formats, default_format, active)
VALUES ('1193-73', 'Основные диагнозы', 'free', '', '', 0, 2, '', 0,
        '/reports/Hippocrates/TMIS/AnaReports/BasicDiagnoses', 'xlsx', 'xlsx', 1);




select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_ClientDiagnosis';
Diagnosis
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
    -- AND e.id>20000000
    AND e.deleted = 0
    AND e.client_id != 18
    AND at.class=0
    AND m.id = :Diagnosis
GROUP BY c.id, p.id
ORDER BY a.createDatetime

$P{Date1}
select *
from Event where id < 20000000 order by id desc;

select *
from MKB where DiagID regexp 'z00';
