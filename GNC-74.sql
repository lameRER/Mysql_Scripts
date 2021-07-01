select *
from rbPrintTemplate where name = 'Выполненные лабораторией/отделением исследования';


select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_VipolneniyeIssledovaniya';




SELECT
  s.ActionId,
  s.ActionTypeName,
  s.FinanceId,
  s.FinanceName,
  SUM(s.ActionServiceSum) TotalSum,
  COUNT(s.ActionId) TotalCount,
  SUM(CASE WHEN s.ActionHasResult = 1 THEN s.ActionServiceSum END) TotalExecSum,
  COUNT(CASE WHEN s.ActionHasResult = 1 THEN s.ActionId END) TotalExecCount,
  os.name OrgStructureName
FROM ( --
  SELECT
    a.id ActionId,
    a.status ActionStatus,
    at.id ActionTypeId,
    at.title ActionTypeName,
    s.sum ActionServiceSum,
    CASE WHEN a.status = 2 OR
        EXISTS (SELECT
            1
          FROM ActionProperty ap
            INNER JOIN ActionProperty_String ap_s
              ON ap_s.id = ap.id
          WHERE ap_s.value IS NULL) THEN 1 ELSE 0 END ActionHasResult,
    f.id FinanceId,
    f.name FinanceName,
    CASE --
      WHEN i.settleDate IS NOT NULL AND
        ii.refund_id IS NULL THEN 1 --
      ELSE 0 END Paid,
    p.orgStructure_id OrgStructureId

  FROM Action a
    INNER JOIN Person p
      ON p.id = a.person_id
    INNER JOIN ActionType at
      ON at.id = a.actionType_id
    INNER JOIN Event e
      ON e.id = a.event_id
   INNER JOIN EventType et
  ON et.id = e.eventType_id
  INNER JOIN rbFinance f
  ON f.id = et.finance_id
  INNER JOIN rbRequestType
  ON rbRequestType.id = et.requestType_id

    LEFT OUTER JOIN Service s
      ON s.action_id = a.id
      AND s.deleted = 0


    LEFT OUTER JOIN InvoiceItem ii
      ON ii.concreteService_id = s.id
      AND ii.deleted = 0

    LEFT OUTER JOIN Invoice i
      ON i.id = ii.invoice_id
      AND i.deleted = 0


  WHERE CASE WHEN at.class=0 THEN a.begDate BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND ELSE a.plannedEndDate BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND end
  AND (
  :Lab = 'Все отделения'
  OR (

  :Lab = 'ЦКДЛ + ИФ + Коагулогия'
  AND p.orgStructure_id IN (
  31,/*	Централизованная клинико-диагностическая лаборатория*/
  167,/* Централизованная клинико-диагностическая лаборатория (Биохимия)*/
  39,/*	Лаборатория гуморального иммунитета*/
  143,/*	Лаб.клинической коагулологии*/
  128/*	Научно-клиническая лаборатория иммунофенотипирования клеток крови и костного мозга */
  ))
  OR (
  :Lab = 'ЦКДЛ - Все'
  AND p.orgStructure_id IN (
  31,/*	Централизованная клинико-диагностическая лаборатория*/
  34,/* Группа проточной цитометрии */
  167,/* Централизованная клинико-диагностическая лаборатория (Биохимия)*/
  39,/*	Лаборатория гуморального иммунитета*/
  143/*	Лаб.клинической коагулологии*/
  ))
  OR (:Lab = 'ЦКДЛ'
  AND p.orgStructure_id = 31 /* Централизованная клинико-диагностическая лаборатория */
  )
  OR (
  :Lab = 'ЦКДЛ - Биохимия'
  AND p.orgStructure_id = 167 /* Централизованная клинико-диагностическая лаборатория (Биохимия) */
  )
  OR (
  :Lab = 'ЦКДЛ - Гуморальный иммунитет'
  AND p.orgStructure_id = 39 /*	Лаборатория гуморального иммунитета */
  )
  OR (
  :Lab = 'ЦКДЛ - Коагулология'
  AND p.orgStructure_id = 143/*	Коагулология */
  )
   OR (
  :Lab = 'ЦКДЛ - Группа проточной цитометрии'
  AND p.orgStructure_id = 34 /* Централизованная клинико-диагностическая лаборатория (Биохимия) */
  )
  OR (
  :Lab = 'НКЛ иммунофенотипирования клеток крови и костного мозга'
  AND p.orgStructure_id = 128/*	Научно-клиническая лаборатория иммунофенотипирования клеток крови и костного мозга */
  )
 OR (
  :Lab = 'Кариологическая лаборатория'
  AND p.orgStructure_id = 48
  AND at.group_id = 7249 /*	Кариологическая лаборатория */
  )
 OR (
  :Lab = 'Лаборатория генной инженерии'
  AND p.orgStructure_id = 148
  AND at.group_id = 7247 /*	Лаборатория генной инженерии */
  )
 OR (
  :Lab = 'Лаборатория иммуногематологии'
  AND p.orgStructure_id = 30
  AND at.group_id = 7244 /*	Лаборатория иммуногематологии */
  )
 OR (
  :Lab = 'Лаборатория бактериологии'
  AND p.orgStructure_id = 41
  AND at.group_id = 7234 /*	Лаборатория бактериологии */
  )
 OR (
  :Lab = 'Лаборатория молекулярной гематологии'
  AND p.orgStructure_id = 46
  AND at.group_id = 7246 /*	Лаборатория молекулярной гематологии */
  )
 OR (
  :Lab = 'Вирусология'
  AND p.orgStructure_id IN (168,173,174)
  AND at.group_id in (7236,7238,7926,8273) /*	Вирусология */
  )
 OR (
  :Lab = 'Вирусология (ПЦР)'
  AND p.orgStructure_id IN (174)
  AND at.group_id = 7236 /*	Вирусология (ПЦР) */
  )
 OR (
  :Lab = 'Вирусология (серология)'
  AND p.orgStructure_id IN (173)
  AND at.group_id = 7238 /*	Вирусология (серология) */
  )
 OR (
  :Lab = 'ККиБТ'
  AND p.orgStructure_id IN (151)
  AND at.group_id = 7717 /*	ККиБТ */
  )
 OR (
  :Lab = 'Лаборатория тканевого типирования'
  AND p.orgStructure_id = 169
  AND at.group_id IN (7244, 7246) /*	Лаборатория тканевого типирования */
  )
 OR (
  :Lab = 'ОПККиК'
  AND p.orgStructure_id = 32
  AND at.group_id in (6974,7011) /*	ОПККиК */
  )
 OR (
  :Lab = 'Патанатомия'
  AND p.orgStructure_id = 142
  AND at.group_id in (7240) /*	Патанатомия */
  )
 OR (
  :Lab = 'Гемодиализ'
  AND p.orgStructure_id in (83,130)
  AND at.group_id in (7019) /*	Гемодиализ */
  )
 OR (
  :Lab = 'Лучевая терапия'
  AND p.orgStructure_id in (33)
  AND at.group_id in (7013) /*	Лучевая терапия */
  )
  OR (
  :Lab = 'Рентгенодиагностика'
  AND p.orgStructure_id = 129
  AND at.group_id = 6958 /*	Рентген */
  )
  OR (
  :Lab = 'КТ'
  AND p.orgStructure_id = 129
  AND at.group_id = 6959 /*	КТ */
  )
  OR (
  :Lab = 'МРТ'
  AND p.orgStructure_id = 145
  AND at.group_id = 6987 /*	МРТ */
  )
  OR (
  :Lab = 'ОРИТ (лаборатория)'
  AND p.orgStructure_id = 27
  AND at.group_id IN (8237,
  8238,
  8239,
  8240,
  8241,
  8242) /*	ОРИТ */
  )
  OR (
  :Lab = 'УЗИ'
  AND p.orgStructure_id = 145
  AND at.group_id = 6970 /*	УЗИ */
  )
  OR (
  :Lab = 'Функциональная диагностика'
  AND p.orgStructure_id = 171
  AND at.group_id = 6976 /*	Функциональная диагностика */
  )
  OR (
  :Lab = 'Эндоскопия'
  AND p.orgStructure_id = 49/*	Эндоскопия */
  )
  )

 AND (
    :requestType = 'Все'
   OR (:requestType = 'Амбулаторное обращение'
        AND rbRequestType.code = 'policlinic')

   OR (:requestType = 'Дневной стационар'
        AND rbRequestType.code = 'clinic')

   OR (:requestType = 'Круглосуточный стационар'
        AND rbRequestType.code = 'hospital'))

  AND a.deleted = 0
  AND e.deleted = 0
  -- AND at.class = 1
  -- AND at.isRequiredTissue = 1
  -- AND at.name = 'Биохимическое исследование крови'
  AND e.client_id != 18
and at.group_id not in (111,128,8218,8219,8220,7271,8221,8191)
  GROUP BY a.id) s
  LEFT OUTER JOIN OrgStructure os
    ON os.id = s.OrgStructureId
WHERE s.ActionId > 20000000
GROUP BY s.ActionTypeName,
         s.FinanceName,
         os.name;
