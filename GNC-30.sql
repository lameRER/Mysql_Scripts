select * from rbPrintTemplate rpt where rpt.jasper_template_uri REGEXP 'WSD'


select * from Client c where c.lastName = 'Мельникова' and c.firstName = 'Ольга' and c.patrName = 'Александровна';


select * from ActionType at2 where at2.code=  'A26.09.020';


select * from rbService rs where rs.code = 'A26.09.020';

select a.* from Action a, Event e where a.event_id = e.id and e.client_id = 162372;


select * from ActionType_Service ats where ats.master_id = 4792 and ats.service_id = 12569;


select * from ActionType at2 where at2.id in (7236,7321, 7235,6990);


select * from ActionType at2 where at2.group_id = 7235;


SELECT
  a.id ActionId,
  at.group_id ,
  pli.serviceCodeOW PLCode,
  IF(NOT ISNULL(pli.serviceNameOW), pli.serviceNameOW, at.name) Name,
  CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END ActionDate,
  IFNULL(s.sum,'') ServiceSum,
--   CASE WHEN f.name = 'Платные услуги' OR
--       f.name = 'Предоплата' THEN 'Договор' ELSE f.name END FinanceName,
  CASE WHEN i.settleDate AND
      ii.refund_id IS NULL THEN ii.sum END InvoicePaidSum,
  i.settleDate InvoiceSettleDate,
  CASE WHEN a.status = 2 THEN '*' ELSE '' END Finished,
  f.id FinanceId,
  co.number ContractNumber,
  co.date ContractDate
--  ,
--   (SELECT
--       GROUP_CONCAT(a1.id SEPARATOR ', ')
--     FROM Action_TakenTissueJournal attj
--       INNER JOIN Action_TakenTissueJournal attj1
--         ON attj1.takenTissueJournal_id = attj.takenTissueJournal_id
--         AND attj1.action_id > attj.action_id
--       INNER JOIN Action a1
--         ON a1.id = attj1.action_id
--     WHERE attj.action_id = a.id
--     AND a1.actionType_id = a.actionType_id)
FROM Action a
  LEFT OUTER JOIN ActionType at
    ON at.id = a.actionType_id
  INNER JOIN Event e
    ON e.id = a.event_id
  LEFT OUTER JOIN EventType et
    ON et.id = e.eventType_id
  LEFT OUTER JOIN rbFinance f
    ON f.id = et.finance_id
  LEFT OUTER JOIN Service s
    ON s.action_id = a.id
    AND s.deleted = 0
  LEFT OUTER JOIN PriceListItem pli
    ON pli.id = s.priceListItem_id
   --  AND pli.deleted = 0
  LEFT OUTER JOIN InvoiceItem ii
    ON ii.concreteService_id = s.id
    AND ii.deleted = 0
  LEFT OUTER JOIN Invoice i
    ON i.id = ii.invoice_id
    AND i.deleted = 0
  LEFT OUTER JOIN rbService st
    ON st.id = pli.service_id
  LEFT OUTER JOIN Contract co
    ON co.id = e.contract_id
WHERE CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END BETWEEN $P{Date1} AND $P{Date2} + INTERVAL 1 DAY - INTERVAL 1 SECOND
AND a.deleted = 0
AND e.client_id = $P{client_id}
AND e.deleted = 0
-- AND at.group_id NOT IN (111,128,6991)
AND (at.group_id NOT IN (111, /* Стационар */
128, /* Осмотры в отделении   */
7271, /* Направления, извещения, путевки */
8218, /* Эпикризы, выписки  */
8219, /* Протоколы ВК  */
8220, /* Консилиумы*/
8221 /*Контроль качества (карты)   */
) or at.group_id is null)
-- AND f.id NOT IN (2)
GROUP BY ActionId,
         pli.serviceCodeOW
-- ,
--          ActionId
ORDER BY -- co.id,
pli.serviceCodeOW,
ActionDate