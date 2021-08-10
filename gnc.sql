select *
from Person where lastName regexp 'шатилова';

select *
from rbPrintTemplate where name regexp 'Платные медицинские услуги ПО ОТДЕЛЕНИЯМ';;


select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_SvodkaPoOtdeleniyamFast';

select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_SvodkaPoOtdeleniyamOtdeleniyaFast';


SELECT
  s.OrgStuctureId,
  s.OrgStuctureName,
  COUNT(DISTINCT s.ActionId) ActionItemCount,
  SUM(s.InvoiceItemSum) InvoiceItemSum,
  s.clientId,
  s.ClientFio,
  s.EventID,
  s.externalId,
  s.begDate,
  s.ActionTypeName,
  s.ActionPersonFio
FROM (SELECT
    NULL OrgStuctureId,
    os.name  OrgStuctureName,
    CASE WHEN InvoiceItemSum > 0 THEN a.id END ActionId,
    InvoiceItemSum,
    c.id ClientId,
    CONCAT_WS(' ', c.lastName, c.firstName, c.patrName) AS ClientFio,
    e.id EventId,
    e.externalId,
    a.begDate,
    CONCAT(at.name, CASE WHEN at.id IN (4909, 5079, 5080, 5081, 5082, 5083, 5084, 5085, 5086, 7273, 7274, 7275, 7276, 7277, 7278)
      THEN CONCAT(' (', CONCAT_WS(' ', p.lastName, LEFT(p.firstName, 1), LEFT(p.patrName, 1)), ') ') ELSE '' END) ActionTypeName,
    CONCAT_WS(' ', p.lastName, LEFT(p.firstName, 1), LEFT(p.patrName, 1)) AS ActionPersonFio

      FROM (
       SELECT
         ii.sum                     AS InvoiceItemSum,
         ft.id                      AS FinanceTransactionId,
         ft.trxDatetime             AS FinanceTransactionDateTime,
         s.action_id                AS ActionId
       FROM gnc.FinanceTransaction ft
         JOIN gnc.Invoice i ON i.id = ft.invoice_id AND i.deleted = 0
         JOIN gnc.InvoiceItem ii ON ii.invoice_id = i.id AND ii.deleted = 0
         JOIN gnc.Service s ON s.id = ii.concreteService_id and s.deleted = 0
       WHERE ft.financeOperationType_id = 1
             AND ft.payType_id != 3
             AND ft.trxDatetime BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND

       UNION ALL

SELECT -ii.sum AS InvoiceItemSum
     , ft.id AS FinanceTransactionId
     , ft.trxDatetime AS FinanceTransactionDateTime
     , COALESCE (s.action_id,s1.action_id) AS ActionId
 --    , s1.action_id AS ActionId1
FROM
  gnc.FinanceTransaction ft
JOIN gnc.Invoice i
ON i.id = ft.invoice_id AND i.deleted = 0
JOIN gnc.InvoiceItem ii
ON ii.refund_id = i.id AND ii.invoice_id <> i.id AND ii.deleted = 0 AND ii.price <> 0
JOIN gnc.Service s
ON s.id = ii.concreteService_id and s.deleted = 0
-- -------------------------------------------
LEFT JOIN gnc.InvoiceItem ii1
ON ii.parent_id = ii1.id
left JOIN gnc.Service s1
ON s1.id = ii1.concreteService_id and s1.deleted = 0
WHERE
  ft.financeOperationType_id = 2
  AND ft.payType_id != 3
  AND ft.trxDatetime BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
           ) t
    JOIN Action a
      ON a.id = t.ActionId
    LEFT JOIN ActionType at
      ON at.id = a.actionType_id
    LEFT JOIN Event e
      ON e.id = a.event_id
    LEFT JOIN Client c
      ON c.id = e.client_id
    LEFT JOIN Person p
      ON a.person_id = p.id
    JOIN OrgStructure os
      ON p.orgStructure_id = os.id

  WHERE e.client_id <> 18) s
GROUP BY OrgStuctureName;


SELECT
  NULL,
  s.OrgStuctureName,
  COUNT(s.ActionId)   ActionItemCount,
  COUNT(s.clientId)   ClientCount,
  SUM(InvoiceItemSum) InvoiceItemSum,
  s.ClientFio,
  s.EventID,
  s.EventExternalId,
  s.ActionBegDate,
  s.ActionTypeName
FROM (SELECT
        NULL,
        os.name                                                OrgStuctureName,
        a.id                                                   ActionId,
        t.InvoiceItemSum,
        c.id                                                   clientId,
        CONCAT_WS('' '', c.lastName, c.firstName, c.patrName) AS ClientFio,
        e.id                                                   EventID,
        e.externalId                                           EventExternalId,
        a.begDate                                              ActionBegDate,
        CONCAT(at.name, CASE WHEN at.id IN
                                  (4909, 5079, 5080, 5081, 5082, 5083, 5084, 5085, 5086, 7273, 7274, 7275, 7276, 7277, 7278)
          THEN CONCAT(' (', p.lastName, LEFT(p.firstName, 1), '.', LEFT(p.patrName, 1), '.)')
                        ELSE '''' END)                           ActionTypeName
      FROM (
       SELECT
         ii.sum                     AS InvoiceItemSum,
         ft.id                      AS FinanceTransactionId,
         ft.trxDatetime             AS FinanceTransactionDateTime,
         s.action_id                AS ActionId
       FROM gnc.FinanceTransaction ft
        JOIN rbPayType pt ON ft.payType_id=pt.id AND pt.id != 3
         JOIN gnc.Invoice i ON i.id = ft.invoice_id AND i.deleted = 0
         JOIN gnc.InvoiceItem ii ON ii.invoice_id = i.id AND ii.deleted = 0
         JOIN gnc.Service s ON s.id = ii.concreteService_id and s.deleted = 0
       WHERE ft.financeOperationType_id = 1
             AND ft.trxDatetime BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND


       UNION ALL

       SELECT
         -ii.sum                     AS InvoiceItemSum,
         ft.id                      AS FinanceTransactionId,
         ft.trxDatetime             AS FinanceTransactionDateTime,
         s.action_id                AS ActionId
       FROM gnc.FinanceTransaction ft
        JOIN rbPayType pt ON ft.payType_id=pt.id AND pt.id != 3
         JOIN gnc.Invoice i ON i.id = ft.invoice_id AND i.deleted = 0
         JOIN gnc.InvoiceItem ii ON ii.refund_id = i.id AND ii.invoice_id <> i.id AND ii.deleted = 0
         JOIN gnc.Service s ON s.id = ii.concreteService_id and s.deleted = 0
       WHERE ft.financeOperationType_id = 1
             AND ft.trxDatetime BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND) t
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
        JOIN OrgStructure os
          ON p.orgStructure_id = os.id


      WHERE e.client_id <> 18) s
GROUP BY OrgStuctureName, ActionTypeName;