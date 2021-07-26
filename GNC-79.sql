set @context = 'action_lab_trfu_immuno';

select *
from gnc.rbPrintTemplate where context = @context;


select *
from gnc.ActionType where context = @context and deleted = 0;


select *
from ActionType where code = 'A12.06.034.001';


select *
from Action where actionType_id = 11981 order by id desc ;

select *
from Event where id =20431207;

select *
from Client where id =312757;



select *
from Action
where actionType_id in (select id from ActionType where context = @context)
order by id desc ;



select *
from rbSpecialVariablesPreferences where name in ('SpecialVar_CheckCoagulogramOMS','SpecialVar_LastLeukocytes','SpecialVar_Biomaterial','SpecialVar_GetMove','SpecialVar_VmpQuotaDetails','SpecialVar_Vivod_Diag_Event');




SELECT
  SUM(CASE WHEN apt.id IN (3922356,
      3922367,
      3922376,
      3922346,
      3922364) THEN 1 ELSE 0 END) AS 'Агрегации тромбоцитов',
  SUM(CASE WHEN apt.id IN (3922372,
      3922362,
      3922357,
      3922417,
      3922351,
      3922373,
      3922369,
      3922374,
      3922363) THEN 1 ELSE 0 END) AS 'Факторы'
FROM Action a
  INNER JOIN ActionProperty ap
    ON ap.action_id = a.id
  INNER JOIN ActionPropertyType apt
    ON ap.type_id = apt.id
WHERE apt.id IN (3922356,
      3922367,
      3922376,
      3922346,
      3922364,
      3922372,
      3922362,
      3922357,
      3922417,
      3922351,
      3922373,
      3922369,
      3922374,
      3922363)
AND ap.isAssigned = 1
AND ap.deleted = 0
AND a.id = :ActionID



SELECT
  tt.id,
  tt.code,
  tt.name,
  tt.group_id,
  tt.sex,
  ttt.name `Пробирка`
FROM Action_TakenTissueJournal attj
  INNER JOIN TakenTissueJournal ttj
    ON ttj.id = attj.takenTissueJournal_id
  INNER JOIN rbTissueType tt
    ON tt.id = ttj.tissueType_id
  LEFT OUTER JOIN rbTestTubeType ttt
    ON ttj.testTubeType_id = ttt.id
WHERE attj.action_id = :ActionId


SELECT Action.plannedEndDate
     , ActionProperty_String.value
     , rbUnit.name

FROM
  Event

INNER JOIN Action
ON Action.event_id = Event.id

INNER JOIN ActionProperty
ON ActionProperty.action_id = Action.id

INNER JOIN ActionPropertyType
ON ActionPropertyType.id = ActionProperty.type_id

INNER JOIN rbUnit
ON rbUnit.id = ActionPropertyType.unit_id

INNER JOIN ActionProperty_String
ON ActionProperty_String.id = ActionProperty.id

WHERE

   Event.client_id = :ClientId
  AND Event.deleted = 0
  AND Action.deleted = 0
  AND ActionProperty.deleted = 0
  AND ActionPropertyType.test_id IN(10,376)

ORDER BY
  plannedEndDate DESC
LIMIT
  1


SELECT *
  FROM(
    SELECT CASE
  WHEN os.shortName = 'ОАИР'
  THEN CONCAT_WS(' ', 'ОАИР', '(', os2.shortName, ')')
  ELSE os.shortName
  END
FROM
OrgStructure os2
inner join OrgStructure os on os.id=getMoveByDate(::EventId, ::Date)
WHERE os2.id=getPreMoveByDate(::EventId, ::Date)
  UNION ALL
  SELECT 'Поликлиника') a
  LIMIT 1


SELECT
  e.id EventId,
  v.number VmpQuotaNumber,
  v.date VmpQuotaDate
FROM Event e
  LEFT OUTER JOIN Client_Quoting cq
    ON cq.event_id = e.id
    AND cq.deleted = 0
  LEFT OUTER JOIN VMPQuotaDetails vd
    ON vd.id = cq.quotaDetails_id
  LEFT OUTER JOIN QuotaType qt
    ON qt.id = vd.quotaType_id
  LEFT OUTER JOIN VMPCoupon v
    ON v.clientQuoting_id = cq.id
    AND v.deleted = 0
WHERE e.id = :EventId;


SELECT
  *
FROM (SELECT
    *
  FROM (SELECT
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
        ON a.id = :action_id
      LEFT JOIN ActionType at
        ON at.id = a.actionType_id
    WHERE ed.event_id = :event_id
    AND d.deleted = 0
    AND ed.deleted = 0
    AND (CASE WHEN at.class = 0 THEN (CASE WHEN a.endDate IS NOT NULL THEN (d.endDate IS NULL
                OR d.endDate > a.endDate)
                AND a.endDate >= d.setDate WHEN a.endDate IS NULL THEN d.endDate IS NULL END) WHEN at.class != 0 THEN (CASE WHEN a.plannedEndDate IS NOT NULL THEN (d.endDate IS NULL
                OR d.endDate > a.plannedEndDate)
                AND a.plannedEndDate >= d.setDate WHEN a.plannedEndDate IS NULL THEN d.endDate IS NULL END) END)
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
      ON e.id = :event_id
    LEFT JOIN Diagnostic di
      ON d.id = di.diagnosis_id
    LEFT JOIN MKB m
      ON m.DiagID = di.MKB
    LEFT JOIN Action a
      ON a.id = :action_id
    LEFT JOIN ActionType at
      ON at.id = a.actionType_id
  WHERE (CASE WHEN e.execDate IS NOT NULL THEN d.setDate <= e.execDate
        AND (d.endDate >= e.setDate
        OR d.endDate IS NULL) WHEN e.execDate IS NULL THEN (d.endDate >= e.setDate
        OR d.endDate IS NULL) END)
  AND d.setDate >= e.setDate
  AND d.deleted = 0
  AND ed.deleted = 0
  AND e.deleted = 0
  AND d.client_id = :client_id
  AND ed.event_id != :event_id
  AND (CASE WHEN at.class = 0 THEN (CASE WHEN a.endDate IS NOT NULL THEN (d.endDate IS NULL
              OR d.endDate > a.endDate)
              AND a.endDate >= d.setDate WHEN a.endDate IS NULL THEN d.endDate IS NULL END) WHEN at.class != 0 THEN (CASE WHEN a.plannedEndDate IS NOT NULL THEN (d.endDate IS NULL
              OR d.endDate > a.plannedEndDate)
              AND a.plannedEndDate >= d.setDate WHEN a.plannedEndDate IS NULL THEN d.endDate IS NULL END) END)
  GROUP BY d.id) AS Diag
GROUP BY Diag.diag_id
