

-- *Вывод диагноза из ЭИБ

-- @variable @c1 Client_id
-- @variable @ev event_id
-- @Param @act Action_id

/**
* TODO: Проверить правильной вывода запрса
* ? Корректный ли вывод?
*/
SET @cl = 281923;
SET @ev = 20362870;
SET @act = 22607311;

SELECT  * FROM
  (SELECT * FROM (SELECT
  ed.id AS ed_id,
  ed.event_id AS event_id,
  d.id AS diag_id,
  di.MKB AS MKB,
  m.DiagName AS diag_name,
  dk.name AS kind,
  dtn.name AS type,
  d.setDate,
  d.deleted AS d_del,
  ed.deleted AS ed_del
FROM gnc.Event_Diagnosis ed
  LEFT JOIN rbDiagnosisKind dk
    ON ed.diagnosisKind_id = dk.id
  LEFT JOIN rbDiagnosisTypeN dtn
    ON ed.diagnosisType_id = dtn.id
  LEFT JOIN Diagnosis d
    ON ed.diagnosis_id = d.id
  LEFT JOIN Diagnostic di
    ON d.id = di.diagnosis_id
  LEFT JOIN MKB m
    ON m.DiagID = di.MKB
  LEFT JOIN Action a
    ON a.id = @act
  LEFT JOIN ActionType at
    ON at.id = a.actionType_id
WHERE ed.event_id = @ev
AND d.deleted = 0
AND ed.deleted = 0
AND (CASE WHEN at.class = 0 THEN (CASE WHEN a.endDate IS NOT NULL THEN (d.endDate IS NULL
      OR d.endDate > a.endDate) AND a.endDate >= d.setDate WHEN a.endDate IS NULL THEN d.endDate IS NULL END) WHEN at.class != 0 THEN (CASE WHEN a.plannedEndDate IS NOT NULL THEN (d.endDate IS NULL
      OR d.endDate > a.plannedEndDate) AND a.plannedEndDate >= d.setDate WHEN a.plannedEndDate IS NULL THEN d.endDate IS NULL END) END)
ORDER BY ed.diagnosisType_id) AS b
UNION
SELECT
  ed.id AS ed_id,
  ed.event_id AS event_id,
  d.id AS diag_id,
  di.MKB AS MKB,
  m.DiagName AS diag_name,
  dk.name AS kind,
  dtn.name AS type,
  d.setDate,
  d.deleted AS d_del,
  ed.deleted AS ed_del
FROM Event_Diagnosis ed
  LEFT JOIN rbDiagnosisKind dk
    ON ed.diagnosisKind_id = dk.id
  LEFT JOIN rbDiagnosisTypeN dtn
    ON ed.diagnosisType_id = dtn.id
  LEFT JOIN Diagnosis d
    ON ed.diagnosis_id = d.id
  LEFT JOIN Event e
    ON e.id = @ev
  LEFT JOIN Diagnostic di
    ON d.id = di.diagnosis_id
  LEFT JOIN MKB m
    ON m.DiagID = di.MKB
  LEFT JOIN Action a
    ON a.id = @act
  LEFT JOIN ActionType at
    ON at.id = a.actionType_id
WHERE (CASE WHEN e.execDate IS NOT NULL THEN d.setDate <= e.execDate AND (d.endDate >= e.setDate
OR d.endDate IS NULL) WHEN e.execDate IS NULL THEN (d.endDate >= e.setDate
OR d.endDate IS NULL) END)
AND d.setDate >= e.setDate
AND d.deleted = 0
AND ed.deleted = 0
AND e.deleted = 0
AND d.client_id = @cl
AND ed.event_id != @ev
AND (CASE WHEN at.class = 0 THEN (CASE WHEN a.endDate IS NOT NULL THEN (d.endDate IS NULL
      OR d.endDate > a.endDate) AND a.endDate >= d.setDate WHEN a.endDate IS NULL THEN d.endDate IS NULL END) WHEN at.class != 0 THEN (CASE WHEN a.plannedEndDate IS NOT NULL THEN (d.endDate IS NULL
      OR d.endDate > a.plannedEndDate) AND a.plannedEndDate >= d.setDate WHEN a.plannedEndDate IS NULL THEN d.endDate IS NULL END) END)
GROUP BY d.id) AS Diag
GROUP BY Diag.diag_id

*/