select *
from rbPrintTemplate where name = 'Платные медицинские услуги В ОТДЕЛЕНИИ';


select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_SvodkaPoOtdeleniyam';




SELECT
	null,
  s.OrgStuctureName,
-- COUNT(DISTINCT s.clientId) ActionItemCount,
  COUNT(s.ActionId) ActionItemCount,
  COUNT(s.clientId) ClientCount,
  SUM(InvoiceItemSum) InvoiceItemSum,
  s.ClientFio,
  s.EventID,
  s.EventExternalId,
  s.ActionBegDate,
  s.ActionTypeName
FROM (SELECT
    NULL,
    (SELECT
        name
      FROM OrgStructure os
      WHERE os.id = p.orgStructure_id) OrgStuctureName,
    a.id ActionId,
    InvoiceItemSum,
    c.id clientId,
    CONCAT_WS(' ', c.lastName, c.firstName, c.patrName) AS ClientFio,
    e.id EventID,
    e.externalId EventExternalId,
    a.begDate ActionBegDate,
    CONCAT(at.name, CASE WHEN at.id IN (4909, 5079, 5080, 5081, 5082, 5083, 5084, 5085, 5086, 7273, 7274, 7275, 7276, 7277, 7278) THEN CONCAT(' (', p.lastName, LEFT(p.firstName, 1), '.', LEFT(p.patrName, 1), '.)') ELSE '' END) ActionTypeName,
    CONCAT_WS(' ', p.lastName, LEFT(p.firstName, 1), LEFT(p.patrName, 1))
  FROM gnc.ReportFinanceTrn_v3 t
    JOIN Action a
      ON a.id = t.ActionId
    JOIN ActionType at
      ON at.id = a.actionType_id
    JOIN Event e
      ON e.id = a.event_id
    JOIN Client c
      ON c.id = e.client_id
    JOIN Person p
      ON a.person_id = p.id


  WHERE t.FinanceTransactionDateTime BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
  AND t.FinanceTransactionOperationTypeId in (1)
  AND (p.orgStructure_id = :OrgStructureId
  OR :OrgStructureId = 0)
  AND e.client_id <> 18) s
GROUP BY CASE --
           WHEN :GroupBy = 1 THEN OrgStuctureName --
           WHEN :GroupBy = 2 THEN OrgStuctureName --
           ELSE ActionId END,
         CASE --
           WHEN :GroupBy = 1 THEN NULL --
           WHEN :GroupBy = 2 THEN ActionTypeName --
           ELSE NULL END;