select * from rbPrintTemplate rpt where rpt.name REGEXP 'График работы врачей';

select * from rbPrintTemplate where code = '1193-45';

INSERT into rbPrintTemplate (code, name, context, fileName, `default`, dpdAgreement, render, templateText, deleted, jasper_template_uri, formats, default_format, active)
select '1193-45' code, 'Отчет по рентгенологам' name, 'free' context, '' fileName, '' `default`, 0 dpdAgreement, 1 render, '' templateText, 0 deleted, NULL jasper_template_uri, NULL formats, NULL default_format, 1 active from rbPrintTemplate limit 1;


select * from Client c where c.lastName = 'Мельникова' and c.firstName ='Ольга' and c.patrName = 'Александровна';


select * from rbSpecialVariablesPreferences rsvp where name REGEXP 'SpecialVar_StoimostLecheniya10'



select a.event_id, pli.serviceCodeOW, rs.id, rs.code, rs.name, at2.id, at2.code, at2.name, a.* from Action a 
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 -- and at2.id = 4792
join Service s2 on s2.action_id = a.id 
join PriceListItem pli on pli.id  = s2.PriceListItem_id 
join rbService rs on rs.id = s2.rbService_id 
where a.event_id in (select e2.id from Event e2 where e2.deleted = 0 and e2.client_id = (select c2.id from Client c2 where c2.id = 162372))



select * from ADF;


select * from rbService rs where rs.code REGEXP '11\.12\.003\.';


select * from ActionType at2 where at2.name REGEXP 'Внутривенное';


select * from Action a where a.id = 22679966;

select * from ActionType at2 where at2.id =4792;


select * from ActionType at2 where at2.group_id = 0 and at2.deleted = 0;


select * from ActionType where class = 2 and group_id is null and deleted = 0;

select * from ActionType where id in (111,	/* Стационар */
128, /*	Осмотры в отделении   */
7271,	/* Направления, извещения, путевки */
8218, /*	Эпикризы, выписки  */
8219, /*	Протоколы ВК  */
8220, /*	Консилиумы*/
8221);

select * from ActionType at2 where at2.group_id IN (111,	/* Стационар */
128, /*	Осмотры в отделении   */
7271,	/* Направления, извещения, путевки */
8218, /*	Эпикризы, выписки  */
8219, /*	Протоколы ВК  */
8220, /*	Консилиумы*/
8221	/*Контроль качества (карты)   */
)


SELECT
      GROUP_CONCAT(a1.id SEPARATOR ', ')
    FROM Action_TakenTissueJournal attj
      INNER JOIN Action_TakenTissueJournal attj1
        ON attj1.takenTissueJournal_id = attj.takenTissueJournal_id
        AND attj1.action_id > attj.action_id
      INNER JOIN Action a1
        ON a1.id = attj1.action_id
    WHERE attj.action_id in(22673197,22673204,22679954,22679956,22679957,22679958,22679960,22679964,22679966)
    AND a1.actionType_id in (select a.actionType_id from Action a where a.id in(22673197,22673204,22679954,22679956,22679957,22679958,22679960,22679964,22679966)) 




SELECT 
at.id,
at.group_id ,
a.id ActionId,
  CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END ActionDate,
  at.name,
  pli.serviceCodeOW,
  pli.serviceNameOW,
  s.sum ServiceSum,
  CASE WHEN f.name = 'Платные услуги' OR
      f.name = 'Предоплата' THEN 'Договор' ELSE f.name END FinanceName,
  CASE WHEN i.settleDate AND
      ii.refund_id IS NULL THEN ii.sum END InvoicePaidSum,
  i.settleDate InvoiceSettleDate,
  CASE WHEN a.status = 2 THEN 1 ELSE 0 END Finished,
  f.id FinanceId,
  co.number ContractNumber,
  co.date ContractDate 
FROM Action a
  LEFT OUTER JOIN ActionType at
    ON at.id = a.actionType_id
  INNER JOIN Event e
    ON e.id = a.event_id  and e.id = 20373786
  LEFT OUTER JOIN EventType et
    ON et.id = e.eventType_id
  LEFT OUTER JOIN rbFinance f
    ON f.id = et.finance_id
  LEFT OUTER JOIN Service s
    ON s.action_id = a.id
    AND s.deleted = 0
  LEFT OUTER JOIN PriceListItem pli
    ON pli.id = s.priceListItem_id
    AND pli.deleted = 0
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
    WHERE CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
    AND a.deleted = 0
AND e.client_id = 162372
AND e.deleted = 0
-- AND at.group_id NOT IN (111,	/* Стационар */
-- 128, /*	Осмотры в отделении   */
-- 7271,	/* Направления, извещения, путевки */
-- 8218, /*	Эпикризы, выписки  */
-- 8219, /*	Протоколы ВК  */
-- 8220, /*	Консилиумы*/
-- 8221	/*Контроль качества (карты)   */
-- )
-- AND f.id NOT IN (2)
GROUP BY ActionId,
         pli.serviceCodeOW
-- ,
--          ActionId
ORDER BY -- co.id,
pli.serviceCodeOW,
ActionDate
    
--     AND at.group_id NOT IN (111,	/* Стационар */
-- 128, /*	Осмотры в отделении   */
-- 7271,	/* Направления, извещения, путевки */
-- 8218, /*	Эпикризы, выписки  */
-- 8219, /*	Протоколы ВК  */
-- 8220, /*	Консилиумы*/
-- 8221	/*Контроль качества (карты)   */
-- )
-- GROUP BY a.id, pli.serviceCodeOW





/*
162372
 */


SELECT
  a.id ActionId,
  CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END ActionDate,
  at.name,
  pli.serviceCodeOW,
  pli.serviceNameOW,
  s.sum ServiceSum,
  CASE WHEN f.name = 'Платные услуги' OR
      f.name = 'Предоплата' THEN 'Договор' ELSE f.name END FinanceName,
  CASE WHEN i.settleDate AND
      ii.refund_id IS NULL THEN ii.sum END InvoicePaidSum,
  i.settleDate InvoiceSettleDate,
  CASE WHEN a.status = 2 THEN 1 ELSE 0 END Finished,
  f.id FinanceId,
  co.number ContractNumber,
  co.date ContractDate,
  (SELECT
      GROUP_CONCAT(a1.id SEPARATOR ', ')
    FROM Action_TakenTissueJournal attj
      INNER JOIN Action_TakenTissueJournal attj1
        ON attj1.takenTissueJournal_id = attj.takenTissueJournal_id
        AND attj1.action_id > attj.action_id
      INNER JOIN Action a1
        ON a1.id = attj1.action_id
    WHERE attj.action_id = a.id
    AND a1.actionType_id = a.actionType_id)
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
    AND pli.deleted = 0
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
WHERE CASE WHEN a.plannedEndDate THEN date (a.plannedEndDate) ELSE date (a.begDate) END BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
AND a.deleted = 0
AND e.client_id = :ClientId
AND e.deleted = 0
-- AND at.group_id NOT IN (111,128,6991)
AND at.group_id NOT IN (111,	/* Стационар */
128, /*	Осмотры в отделении   */
7271,	/* Направления, извещения, путевки */
8218, /*	Эпикризы, выписки  */
8219, /*	Протоколы ВК  */
8220, /*	Консилиумы*/
8221	/*Контроль качества (карты)   */
) 
-- AND f.id NOT IN (2)
GROUP BY ActionId,
         pli.serviceCodeOW
-- ,
--          ActionId
ORDER BY -- co.id,
pli.serviceCodeOW,
ActionDate 