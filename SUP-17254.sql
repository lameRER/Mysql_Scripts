select * from Client c where c.lastName = 'куга';


select e.eventType_id, e.externalId, e.id, e.deleted from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at2 on at2.id = a.actiontype_id and at2.context = 'QR'
where e.client_id = 704126 and e.deleted = 0





   select CONCAT_WS('/', IFNULL(c.lastName,''), ifnull(c.firstName,''), ifnull(c.patrName,''),
    ifnull(DATE_FORMAT(c.birthDate, '%d.%m.%Y'),''), CASE when c.sex = 1 then 'Мужской' when c.sex = 2 then 'Женский' else
    '' end,
    ifnull(c.SNILS,''), ifnull(cd.serial,''),ifnull(cd.`number`,''), ifnull(cp.`number`,''),
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = 'String' then REGEXP_REPLACE(aps.value, '(\\d+\\d+\\d+)/(\\d+\\d+)', '\\1.\\2')
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
    where c.deleted = 0 and e.id = 4634648