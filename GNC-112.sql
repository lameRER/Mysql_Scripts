select *
from rbPrintTemplate where name ='Ведомость начислений за услугу по контрагенту';

select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_V`edomostNachisleniyByClient';

20433957

select at.name, s.*, a.*
from Action a, Event e, ActionType at, Service s
where e.id = a.event_id and e.id in(20433935) and at.id = a.actionType_id and s.event_id = e.id and s.action_id = a.id;


select *
from Service where event_id = 20433935;


SELECT
  t.Payer,
  t.PaymentType,
  SUM(CASE WHEN t.FinanceTransactionOperationTypeId = 1 THEN InvoiceItemSum END) Income,
  SUM(CASE WHEN t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) Refund,
  SUM(CASE WHEN t.PaymentTypeID = 1 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) NalIncome,
  SUM(CASE WHEN t.PaymentTypeID = 1 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) NalsRefund,
  SUM(CASE WHEN t.PaymentTypeID = 2 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) bezNalIncome,
  SUM(CASE WHEN t.PaymentTypeID = 2 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) bezNalsRefund,
  SUM(CASE WHEN t.PaymentTypeID = 3 AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) bezNalRSIncome,
  SUM(CASE WHEN t.PaymentTypeID = 3 AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) bezNalRSsRefund,
  SUM(CASE WHEN t.PaymentTypeID in (1,2) AND
      t.FinanceTransactionOperationTypeId = 1 THEN t.InvoiceItemSum END) KassaIn,
  SUM(CASE WHEN t.PaymentTypeID in (1,2) AND
      t.FinanceTransactionOperationTypeId = 2 THEN -1 END * InvoiceItemSum) KassaOut
FROM (SELECT
    ii.id AS InvoiceItemId,
    CASE WHEN ft.financeOperationType_id = 1 THEN ii.sum WHEN ft.financeOperationType_id = 2 THEN -ii.sum END AS InvoiceItemSum,
    ft.id AS FinanceTransactionId,
    ft.trxDatetime AS FinanceTransactionDateTime,
    ft.financeOperationType_id AS FinanceTransactionOperationTypeId,
    pt.name AS PaymentType,
    CASE WHEN cc.client_id IS NOT NULL THEN CONCAT_WS(' ', c_p.lastName, c_p.firstName, c_p.patrName) ELSE o_p.fullName END AS Payer,
    CASE WHEN s.actionProperty_id IS NOT NULL AND
        ps_pli.isAccumulativePrice = 1 THEN ap.action_id WHEN s.action_id IS NOT NULL AND
        ISNULL(ps.id) AND
        pli.isAccumulativePrice = 1 THEN NULL ELSE s.action_id END AS ActionId,
    pt.id AS PaymentTypeID
  FROM gnc.FinanceTransaction ft
    LEFT JOIN gnc.rbPayType pt
      ON pt.id = ft.payType_id
    JOIN gnc.Invoice i
      ON i.id = ft.invoice_id
      AND i.deleted = 0
    JOIN gnc.InvoiceItem ii
      ON (ii.invoice_id = i.id)
      OR (ii.refund_id = i.id
      AND ii.deleted = 0)
    JOIN gnc.Service s
      ON s.id = ii.concreteService_id and s.deleted = 0
    JOIN gnc.PriceListItem pli
      ON s.priceListItem_id = pli.id
    LEFT JOIN gnc.Service ps
      ON s.parent_id = ps.id
    LEFT JOIN gnc.PriceListItem ps_pli
      ON ps.priceListItem_id = ps_pli.id
    LEFT JOIN gnc.ActionProperty ap
      ON s.actionProperty_id = ap.id
    LEFT JOIN gnc.Contract co
      ON co.id = i.contract_id
    LEFT JOIN gnc.Contract_Contragent cc
      ON cc.id = co.payer_id
    LEFT JOIN gnc.Client c_p
      ON c_p.id = cc.client_id
    LEFT JOIN gnc.Organisation o_p
      ON o_p.id = cc.organisation_id
  WHERE (ft.financeOperationType_id = 1
  OR ft.financeOperationType_id = 2)
  AND ft.trxDatetime BETWEEN :Date1 AND :Date1 + INTERVAL 1 DAY - INTERVAL 1 SECOND) t
  INNER JOIN Action a
    ON a.id = t.ActionId
  INNER JOIN Event e
    ON e.id = a.event_id
WHERE e.client_id != 18
GROUP BY t.Payer;