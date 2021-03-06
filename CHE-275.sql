select * from rbPrintTemplate where name REGEXP 'план' ;


select * from ;






SELECT
	aps1.value as `note`,	
	GROUP_CONCAT(DISTINCT CONCAT(rdt.name,': ', d3.MKB) SEPARATOR '\n') as `diag`, 
    CONCAT_WS(' ',api.value, 'смена') AS smena, 
    CONCAT_WS(' ', p.lastName, CONCAT(LEFT(p.firstName, 1),'.'), CONCAT(LEFT(p.patrName,1), '.')) AS `surgeon`, 
    CONCAT_WS(' ', p1.lastName, CONCAT(LEFT(p1.firstName, 1),'.'), CONCAT(LEFT(p1.patrName,1), '.')) AS `ass`,
    CONCAT_WS(' ', p2.lastName, CONCAT(LEFT(p2.firstName, 1),'.'), CONCAT(LEFT(p2.patrName,1), '.')) AS `anest`,
    CONCAT_WS(' ', p3.lastName, CONCAT(LEFT(p3.firstName, 1),'.'), CONCAT(LEFT(p3.patrName,1), '.')) AS `anessist`,
    CONCAT_WS(' ', p4.lastName, CONCAT(LEFT(p4.firstName, 1),'.'), CONCAT(LEFT(p4.patrName,1), '.')) AS `surgsist`,
    CONCAT_WS(' ', plv.lastName, CONCAT(LEFT(plv.firstName, 1),'.'), CONCAT(LEFT(plv.patrName,1), '.')) AS `dr`,
    os1.name AS otdelenie, 
    oshb.name AS nomerkojki, 
    tie.number AS nomerbol,
    os.name AS nomeroperacionn, 
    aps.value AS naimenovanieoperacii, 
    c.firstName AS name, 
    c.lastName AS lastname, 
    c.patrName AS patrname, 
    bt.name AS groupblood, 
    age(c.birthDate, CURTIME()) AS age, 
    ca.weight AS weight, ca.height AS growth,
    c1.grouping AS kontract
    FROM Event e
    JOIN Client c ON e.client_id = c.id AND c.deleted = 0
    left join ClientAnthropometric ca on ca.client_id = c.id and ca.id = (select max(ca1.id) from ClientAnthropometric ca1 where ca1.client_id = c.id order by ca.id desc limit 1)
    left join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
    left join Diagnosis d3 on d3.id = d2.diagnosis_id and d3.deleted = 0
    left join rbDiagnosisType rdt on d2.diagnosisType_id = rdt.id 
    JOIN Action a ON e.id = a.event_id AND a.deleted=0 
    JOIN Action a1 ON e.id = a1.event_id AND a1.deleted=0 AND a1.status !=2
    JOIN ActionType at ON a.actionType_id = at.id AND at.deleted= 0 AND at.serviceType = 4
    left JOIN ActionType at1 ON a1.actionType_id = at1.id AND at1.deleted= 0 AND at1.flatCode = 'moving'
    JOIN Person plv ON e.setPerson_id = plv.id
    LEFT JOIN Contract c1 ON c1.id = e.contract_id
    LEFT JOIN rbBloodType bt ON c.bloodType_id = bt.id
    LEFT JOIN TempInvalidELN tie ON c.id = tie.client_id AND tie.begDate >= date(e.createDatetime)
    LEFT JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted=0 AND apt.name = 'Операционная'
    LEFT JOIN ActionPropertyType apt1 ON at.id = apt1.actionType_id AND apt1.deleted=0 AND apt1.name = 'Хирург'
    LEFT JOIN ActionPropertyType apt2 ON at.id = apt2.actionType_id AND apt2.deleted=0 AND apt2.name = 'Ассистент'
    LEFT JOIN ActionPropertyType apt3 ON at.id = apt3.actionType_id AND apt3.deleted=0 AND apt3.name = 'смена'
    LEFT JOIN ActionPropertyType apt4 ON at.id = apt4.actionType_id AND apt4.deleted=0 AND apt4.name = 'Анестезиолог'
    LEFT JOIN ActionPropertyType apt5 ON at.id = apt5.actionType_id AND apt5.deleted=0 AND apt5.name = 'Анестезиологическая сестра'
    LEFT JOIN ActionPropertyType apt6 ON at.id = apt6.actionType_id AND apt6.deleted=0 AND apt6.name = 'Операционная сестра'
    LEFT JOIN ActionPropertyType apt7 ON at1.id = apt7.actionType_id AND apt7.deleted=0 AND apt7.name = 'койка'
    LEFT JOIN ActionPropertyType apt8 ON at1.id = apt8.actionType_id AND apt8.deleted=0 AND apt8.name = 'Отделение пребывания'
    LEFT JOIN ActionPropertyType apt9 ON at.id = apt9.actionType_id AND apt9.deleted=0 AND apt9.name = 'Наименование операции'
    LEFT JOIN ActionPropertyType apt10 ON at.id = apt10.actionType_id AND apt10.deleted=0 AND apt10.name = 'Примечание'
    LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id AND ap.deleted = 0
    LEFT JOIN ActionProperty ap1 ON a.id = ap1.action_id AND apt1.id = ap1.type_id AND ap1.deleted = 0
    LEFT JOIN ActionProperty ap2 ON a.id = ap2.action_id AND apt2.id = ap2.type_id AND ap2.deleted = 0
    LEFT JOIN ActionProperty ap3 ON a.id = ap3.action_id AND apt3.id = ap3.type_id AND ap3.deleted = 0
    LEFT JOIN ActionProperty ap4 ON a.id = ap4.action_id AND apt4.id = ap4.type_id AND ap4.deleted = 0
    LEFT JOIN ActionProperty ap5 ON a.id = ap5.action_id AND apt5.id = ap5.type_id AND ap5.deleted = 0
    LEFT JOIN ActionProperty ap6 ON a.id = ap6.action_id AND apt6.id = ap6.type_id AND ap6.deleted = 0
    LEFT JOIN ActionProperty ap7 ON a1.id = ap7.action_id AND apt7.id = ap7.type_id AND ap7.deleted = 0
    LEFT JOIN ActionProperty ap8 ON a1.id = ap8.action_id AND apt8.id = ap8.type_id AND ap8.deleted = 0
    LEFT JOIN ActionProperty ap9 ON a.id = ap9.action_id AND apt9.id = ap9.type_id AND ap9.deleted = 0
    LEFT JOIN ActionProperty ap10 ON a.id = ap10.action_id AND apt10.id = ap10.type_id AND ap10.deleted = 0
    LEFT JOIN ActionProperty_Reference apr ON ap.id = apr.id
    LEFT JOIN ActionProperty_Integer api ON ap3.id = api.id
    LEFT JOIN ActionProperty_Reference apr1 ON apr1.id = ap1.id
    LEFT JOIN ActionProperty_Reference apr2 ON apr2.id = ap2.id
    LEFT JOIN ActionProperty_Reference apr3 ON apr3.id = ap4.id
    LEFT JOIN ActionProperty_Reference apr4 ON apr4.id = ap5.id
    LEFT JOIN ActionProperty_Reference apr5 ON apr5.id = ap6.id
    LEFT JOIN ActionProperty_HospitalBed aphb ON ap7.id = aphb.id
    LEFT JOIN ActionProperty_OrgStructure apos ON ap8.id = apos.id
    LEFT JOIN ActionProperty_String aps ON aps.id = ap9.id
    LEFT JOIN ActionProperty_String aps1 ON aps1.id = ap10.id
    LEFT JOIN OrgStructure os ON apr.value = os.id AND os.deleted = 0
    LEFT JOIN Person p ON apr1.value = p.id AND p.deleted = 0
    LEFT JOIN Person p1 ON apr2.value = p1.id AND p1.deleted = 0
    LEFT JOIN Person p2 ON apr3.value = p2.id AND p2.deleted = 0
    LEFT JOIN Person p3 ON apr4.value = p3.id AND p3.deleted = 0
    LEFT JOIN Person p4 ON apr5.value = p4.id AND p4.deleted = 0
    LEFT JOIN OrgStructure_HospitalBed oshb ON aphb.value = oshb.id
    LEFT JOIN OrgStructure os1 ON apos.value = os1.id
    WHERE e.eventType_id = 84 and a.id in (63475,63688) GROUP by a.id ORDER BY nomeroperacionn, smena;
    
   
   select * from Action where id = 63475;
   
  
  select * from ActionType at2 where flatCode = 'moving';