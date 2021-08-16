select *
from rbPrintTemplate where id = 442;
select *
from rbPrintTemplate where id = 390;



select *
from ActionPropertyType where actionType_id = (select id from ActionType where context = 'QR');


 select CONCAT_WS('/', IFNULL(c.lastName,''), ifnull(c.firstName,''), ifnull(c.patrName,''),
    ifnull(DATE_FORMAT(c.birthDate, '%d.%m.%Y'),''), CASE when c.sex = 1 then 'Мужской' when c.sex = 2 then 'Женский' else
    '' end,
    ifnull(c.SNILS,''), ifnull(cd.serial,''),ifnull(cd.`number`,''), ifnull(cp.`number`,''),
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = 'String' then REPLACE(aps.value, '/', '.')
    when apt.typeName = 'Date' then apd.value
    when apt.typeName = 'Integer' then api.value
    when apt.typeName = 'Temperature' then apt2.value
	when apt.typeName = 'Reference' then if(apt.valueDomain !='SpravYesNo', apr.value, (SELECT syn.code FROM SpravYesNo syn where syn.id = apr.value)) end, '') separator '/'), ''),
    ifnull(rdt.code,''),ifnull(DATE_FORMAT(cd.`date`, '%d.%m.%Y'),''),ifnull(rpk.code,''),ifnull(ns.SMOCOD,''),
    ifnull(p2.lastName ,''),ifnull(p2.firstName ,''),ifnull(p2.patrName ,''),ifnull(p2.SNILS ,'')) as `client`
    from Client c
    left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select cd2.id from ClientDocument
    cd2 where cd.client_id = cd2.client_id and cd2.deleted = 0 order by cd2.createDatetime desc LIMIT 1)
    left join ClientPolicy cp on cp.client_id = c.id and cp.deleted = 0 and cp.id = (select cp2.id from ClientPolicy cp2
    where cp2. client_id= cp.client_id and cp2.deleted = 0 ORDER by cp2.createDatetime desc limit 1)
    join Event e on e.client_id = c.id and e.deleted = 0
    join Action a on a.event_id = e.id and a.deleted = 0
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.context = 'QR'
    JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name not in ('Этап вакцинации', 'Вакцина')
    left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id
    left join ActionProperty_String aps on aps.id = ap.id
    left join ActionProperty_Integer api on api.id = ap.id
    left join ActionProperty_Date apd on apd.id = ap.id
    left join ActionProperty_Temperature apt2 on apt2.id = ap.id
    left join ActionProperty_Reference apr on apr.id = ap.id
    left join rbDocumentType rdt on rdt.id = cd.documentType_id
    left join rbPolicyKind rpk on rpk.id = cp.policyKind_id
    left join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
    left join netricaSMO ns on ns.OGRN = o2.OGRN AND o2.KPP = ns.KPP
    join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
    where c.deleted = 0 and e.id = 224460




SELECT
      CONCAT_WS
      ('/', IFNULL(c.lastName, '-'), IFNULL(c.firstName, '-'), IFNULL(c.patrName, '-'),
      IFNULL(DATE_FORMAT(c.birthDate, '%d.%m.%Y'), '-'),
      CASE WHEN c.sex = 1 THEN 'Мужской' WHEN c.sex = 2 THEN 'Женский' ELSE '-'
      END,
      IFNULL(c.SNILS, '-'),
      IFNULL(cd.serial, '-'),
      IFNULL(cd.`number`, '-'),
      IFNULL(cp.`number`, '-'),
      IFNULL(GROUP_CONCAT(
        IFNULL(case when apt.typeName = 'String' THEN IF(aps.value ,REPLACE(aps.value, '/', '.'), '-')
        WHEN apt.typeName = 'Date' THEN IFNULL(apd.value, '-')
        WHEN apt.typeName = 'Integer' then IFNULL(api.value, '-')
        WHEN apt.typeName = 'Temperature' then IFNULL(apt2.value, '-')
        WHEN apt.typeName = 'Reference' THEN
          IF (apt.valueDomain !='SpravYesNo', apr.value, (SELECT IF(syn.code, syn.code, '-') FROM SpravYesNo syn where syn.id = apr.value)) end, '-') separator '/'), '-'),
      IFNULL(rdt.code, '-'),
      IFNULL(DATE_FORMAT(cd.`date`, '%d.%m.%Y'), '-'),
      IFNULL(rpk.code, '-'),
      IFNULL(ns.SMOCOD, '-'),
      IFNULL(p2.lastName, '-'),
      IFNULL(p2.firstName, '-'),
      IFNULL(p2.patrName, '-'),
      IFNULL(p2.SNILS, '-')) as `client`
    FROM Client c
      LEFT JOIN ClientDocument cd
        ON cd.client_id = c.id
        AND cd.deleted = 0
        AND cd.id = (SELECT
            cd2.id
          FROM ClientDocument
          cd2
          WHERE cd.client_id = cd2.client_id
          AND cd2.deleted = 0
          ORDER BY cd2.createDatetime DESC LIMIT 1)
      LEFT JOIN ClientPolicy cp
        ON cp.client_id = c.id
        AND cp.deleted = 0
        AND cp.id = (SELECT
            cp2.id
          FROM ClientPolicy cp2
          WHERE cp2.client_id = cp.client_id
          AND cp2.deleted = 0
          ORDER BY cp2.createDatetime DESC LIMIT 1)
      JOIN Event e
        ON e.client_id = c.id
        AND e.deleted = 0
      JOIN Action a
        ON a.event_id = e.id
        AND a.deleted = 0
      JOIN ActionType at2
        ON at2.id = a.actionType_id
        AND at2.deleted = 0
        AND at2.context = 'QR'
      JOIN ActionPropertyType apt
        ON apt.actionType_id = at2.id
        AND apt.deleted = 0
      LEFT JOIN ActionProperty ap
        ON ap.action_id = a.id
        AND ap.deleted = 0
        AND apt.id = ap.type_id
      LEFT JOIN ActionProperty_String aps
        ON aps.id = ap.id
      LEFT JOIN ActionProperty_Integer api
        ON api.id = ap.id
      LEFT JOIN ActionProperty_Date apd
        ON apd.id = ap.id
      LEFT JOIN ActionProperty_Temperature apt2
        ON apt2.id = ap.id
      LEFT JOIN ActionProperty_Reference apr
        ON apr.id = ap.id
      LEFT JOIN rbDocumentType rdt
        ON rdt.id = cd.documentType_id
      LEFT JOIN rbPolicyKind rpk
        ON rpk.id = cp.policyKind_id
      LEFT JOIN Organisation o2
        ON o2.id = cp.insurer_id
        AND o2.deleted = 0
      LEFT JOIN netricaSMO ns
        ON ns.OGRN = o2.OGRN
        AND o2.KPP = ns.KPP
      JOIN Person p2
        ON p2.id = e.execPerson_id
        AND p2.deleted = 0
    WHERE c.deleted = 0
    AND e.id = 224460;


select CONCAT_WS('/', IFNULL(c.lastName,''), ifnull(c.firstName,''), ifnull(c.patrName,''),
    ifnull(DATE_FORMAT(c.birthDate, '%d.%m.%Y'),''), CASE when c.sex = 1 then 'Мужской' when c.sex = 2 then 'Женский' else
    '' end,
    ifnull(c.SNILS,''), ifnull(cd.serial,''),ifnull(cd.`number`,''), ifnull(cp.`number`,''),
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = 'String' then REPLACE(aps.value, '/', '.')
    when apt.typeName = 'Date' then apd.value
    when apt.typeName = 'Integer' then api.value
    when apt.typeName = 'Temperature' then apt2.value
	when apt.typeName = 'Reference' then if(apt.valueDomain !='SpravYesNo', apr.value, (SELECT syn.code FROM SpravYesNo syn where syn.id = apr.value)) end, '') separator '/'), ''),
    ifnull(rdt.code,''),ifnull(DATE_FORMAT(cd.`date`, '%d.%m.%Y'),''),ifnull(rpk.code,''),ifnull(ns.SMOCOD,''),
    ifnull(p2.lastName ,''),ifnull(p2.firstName ,''),ifnull(p2.patrName ,''),ifnull(p2.SNILS ,'')) as `client`
    from Client c
    left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select cd2.id from ClientDocument
    cd2 where cd.client_id = cd2.client_id and cd2.deleted = 0 order by cd2.createDatetime desc LIMIT 1)
    left join ClientPolicy cp on cp.client_id = c.id and cp.deleted = 0 and cp.id = (select cp2.id from ClientPolicy cp2
    where cp2. client_id= cp.client_id and cp2.deleted = 0 ORDER by cp2.createDatetime desc limit 1)
    join Event e on e.client_id = c.id and e.deleted = 0
    join Action a on a.event_id = e.id and a.deleted = 0
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.context = 'QR'
    JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
    left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id
    left join ActionProperty_String aps on aps.id = ap.id
    left join ActionProperty_Integer api on api.id = ap.id
    left join ActionProperty_Date apd on apd.id = ap.id
    left join ActionProperty_Temperature apt2 on apt2.id = ap.id
    left join ActionProperty_Reference apr on apr.id = ap.id
    left join rbDocumentType rdt on rdt.id = cd.documentType_id
    left join rbPolicyKind rpk on rpk.id = cp.policyKind_id
    left join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
    left join netricaSMO ns on ns.OGRN = o2.OGRN AND o2.KPP = ns.KPP
    join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
    where c.deleted = 0 and e.id = 224460;

select *
from Event where client_id = 613821;