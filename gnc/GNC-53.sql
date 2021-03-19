select * from rbPrintTemplate where name REGEXP 'по транс'

select * from rbSpecialVariablesPreferences where name = 'SpecialVar_report_transf';



SELECT qwe.finance
     --  , qwe.OrgStr
       , qwe.Type
     , sum(qwe.oxl_kol) AS oxl_sum
     , sum(qwe.tkm_kol) AS tkm_sum
     , sum(qwe.gem_kol) AS gem_sum
     , sum(qwe.hg_kol) AS hg_sum
     , sum(qwe.action_kol) AS sum_itog
     , if(qwe.Type = 'аутологичная ТКМ', sum(qwe.tkm_kol), NULL) AS auto_tkm
     , if(qwe.Type <> 'аутологичная ТКМ', sum(qwe.tkm_kol), NULL) AS allo_tkm
     , if(qwe.Type = 'аутологичная ТКМ', sum(qwe.gem_kol), NULL) AS auto_gem
     , if(qwe.Type <> 'аутологичная ТКМ', sum(qwe.gem_kol), NULL) AS allo_gem
     , sum(qwe.oivhpg_kol) AS oivhpg_sum
     , if(qwe.Type = 'аутологичная ТКМ', sum(qwe.oivhpg_kol), NULL) AS auto_oivhpg
     , if(qwe.Type <> 'аутологичная ТКМ', sum(qwe.oivhpg_kol), NULL) AS allo_oivhpg,     
      SUM(qwe.Allo) AS AlloTKM,
      SUM(qwe.Auto) AS AutoTkm      
     , if(qwe.Type = 'аутологичная ТКМ', sum(qwe.hg_kol), NULL) AS auto_hg
     , if(qwe.Type <> 'аутологичная ТКМ', sum(qwe.hg_kol), NULL) AS allo_hg
     , if(qwe.Type = 'аутологичная ТКМ', sum(qwe.oxl_kol), NULL) AS auto_oxl
     , if(qwe.Type <> 'аутологичная ТКМ', sum(qwe.oxl_kol), NULL) AS allo_oxl
FROM
  (
  SELECT if(f.name = 'ВМП', concat_ws(' ', 'ВМП', qt.code), f.name) AS Finance
       , CASE
         WHEN os.shortName = 'НКО ВХПГ' THEN
           'НКО ТКМ'
         ELSE
           os.shortName
         END OrgStr
       --    , date(a.plannedEndDate) 'Date'
         , if(os.shortName = 'НКО ВХПГ' OR os.shortName = 'НКО ТКМ', 'НКО ТКМ', NULL) AS tkm
       , if(os.shortName = 'Гематология', 'Гематология', NULL) AS gem
       , if(os.shortName = 'НКО ХГ' OR os.shortName = 'ХГ(ДС)', 'НКО ХГ', NULL) AS giit
       , if(os.shortName = 'НКО ОХЛ', 'НКО ОХЛ', NULL) AS oxl
       , if(os.shortName = 'НКО ОХЛ' OR (os.shortName='Изолятор' AND os1.shortName='НКО ОХЛ'), 1, NULL) AS oxl_kol
       , if(os.shortName = 'НКО ВХПГ' OR os.shortName = 'НКО ТКМ' OR (os.shortName='Изолятор' AND os1.shortName='НКО ТКМ'), 1, NULL) AS tkm_kol
       , if(os.shortName = 'НКО ХГ' OR (os.shortName='Изолятор' AND os1.shortName IN ('НКО ХГ','ХГ (ДС)')), 1, NULL) AS hg_kol
       , if(os.shortName = 'Гематология' OR (os.shortName='Изолятор' AND os1.shortName='Гематология'), 1, NULL) AS gem_kol
       , if(os.shortName = 'ОИВХПГ' OR (os.shortName='Изолятор' AND (os1.shortName='ОИВХПГ' OR p.id =3419)), 1, NULL) AS oivhpg_kol
       , (
         SELECT if(aps.value = 'аллогенная неродственная ТКМ' OR aps.value = 'аллогенная родственная ТКМ' OR aps.value = 'гаплоидентичная ТКМ', 'аллогенная ТКМ', aps.value)
         FROM
           ActionProperty ap
         INNER JOIN ActionProperty_String aps
         ON ap.id = aps.id
         WHERE
           ap.action_id = a.id
           AND ap.type_id IN (3962966)) Type
       , 1 AS action_kol
       , a.id AS action_id,
   CASE WHEN p.id =3419 then 'ОИВХПГ' else os1.shortName END,
     (
         SELECT CASE WHEN aps.value = 'аллогенная неродственная ТКМ' OR aps.value = 'аллогенная родственная ТКМ' OR aps.value = 'гаплоидентичная ТКМ' THEN 1 ELSE 0 end
         FROM
           ActionProperty ap
         INNER JOIN ActionProperty_String aps
         ON ap.id = aps.id
         WHERE
           ap.action_id = a.id
           AND ap.type_id IN (3962966)) Allo,
     (
         SELECT CASE WHEN aps.value = 'аутологичная ТКМ' THEN 1 ELSE 0 end
         FROM
           ActionProperty ap
         INNER JOIN ActionProperty_String aps
         ON ap.id = aps.id
         WHERE
           ap.action_id = a.id
           AND ap.type_id IN (3962966)) Auto,ap_org.action_id asasas
  FROM
    Action a
  INNER JOIN Event e
  ON a.event_id = e.id
  INNER JOIN EventType et
  ON e.eventType_id = et.id
  INNER JOIN rbFinance f
  ON et.finance_id = f.id
  INNER JOIN Client c
  ON e.client_id = c.id
  INNER JOIN Person p
  ON a.person_id = p.id
LEFT JOIN Action a_org
ON a_org.id = (
SELECT a.id
FROM
  Action a
INNER JOIN ActionProperty ap
ON ap.action_id = a.id AND ap.type_id = 1608
INNER JOIN ActionProperty_OrgStructure apos
ON apos.id = ap.id
INNER JOIN OrgStructure os
ON os.id = apos.value
WHERE
  a.event_id = e.id
  AND a.actionType_id = 112
  AND a.deleted = 0
ORDER BY
  a.begDate DESC
LIMIT
  1)
LEFT JOIN ActionProperty ap_org
ON ap_org.action_id = a_org.id AND ap_org.type_id = 1608
LEFT JOIN ActionProperty_OrgStructure apos_org
ON apos_org.id = ap_org.id
LEFT JOIN OrgStructure os
ON os.id = apos_org.value
LEFT JOIN OrgStructure os1
    ON p.orgStructure_id=os1.id
  INNER JOIN ActionType at
  ON at.id = a.actionType_id
  INNER JOIN ActionProperty ap
  ON ap.action_id = a.id
  LEFT JOIN ActionProperty_String aps
  ON ap.id = aps.id
  LEFT JOIN Client_Quoting cq
  ON cq.event_id = e.id
  LEFT JOIN VMPCoupon v
  ON cq.vmpCoupon_id = v.id
  LEFT JOIN QuotaType qt
  ON v.quotaType_id = qt.id
  LEFT JOIN rbResult r
  ON e.result_id = r.id
  WHERE
    at.id IN (8176)
    AND a.plannedEndDate BETWEEN :Date1 AND :Date2
    AND e.deleted = 0
    AND a.deleted = 0
    AND ap.deleted = 0
    AND c.id <> 18    
  GROUP BY
    e.id
  ) AS qwe
WHERE
  qwe.Type <> 'введение лимфоцитов донора'
-- GROUP BY
--   qwe.finance
--  , qwe.OrgStr
--   , qwe.Type
ORDER BY
  qwe.OrgStr
, qwe.Type