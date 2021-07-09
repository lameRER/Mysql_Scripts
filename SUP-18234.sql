select *
from s11.rbPrintTemplate where name regexp 'план';


select
CONCAT_WS(' ', c.lastName, c.firstName, c.patrName) as FIO,
osh.code as `Ward`,
concat(m.DiagID, '-', m.BlockName) as Diagnosis,
a.specifiedName as Operation,
os.name as OperatingRoom,
aps.value as Anestes,
CONCAT_WS('\n',
    if(p.lastName is not null, concat('Ответственный за переливание крови: ', concat_ws(' ', p.lastName, concat(left(p.firstName, 1), '.', left(p.patrName, 1), '.'))), NULL),
    if(p1.lastName is not null, concat('Дежурный по оперблоку: ', concat_ws(' ', p1.lastName, concat(left(p1.firstName, 1), '.', left(p1.patrName, 1), '.'))), NULL),
    if(p2.lastName is not null, concat('Ассистенты: ', concat_ws(' ', p2.lastName, concat(left(p2.firstName, 1), '.', left(p2.patrName, 1), '.'))), NULL)
) as OperBrig,
rbt.name as GrBlood
from Event e
join Client c on c.id = e.client_id and c.deleted = 0
left join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0 and d2.id = (select max(d.id) from Diagnostic d where
d.event_id = e.id)
left join Diagnosis d3 on d3.id = d2.diagnosis_id and d3.deleted = 0
left join MKB m on m.DiagID = d3.MKB
left join rbDiagnosisType rdt on d2.diagnosisType_id = rdt.id
join `Action` a on a.event_id = e.id and a.deleted = 0 and a.status != 3 and a.specifiedName != ''
left join JsonData jd on jd.id REGEXP a.id
left join OrgStructure os on os.id = REGEXP_REPLACE(STRINGDECODE(urldecoder(jd.json)), '.*\"table\":.?\"(\\\\d+)\".*', '\\\\1')
left join ActionProperty ap on ap.action_id = (select a1.id from Action a1 where a1.event_id = e.id and a1.parent_id = a.id and a1.deleted= 0
and a1.actionType_id = 49944) and ap.deleted=0
and ap.type_id = (select apt.id from ActionPropertyType apt where apt.actionType_id = 49944 and apt.deleted = 0 and
apt.name = 'Анестезия')
left join ActionProperty ap1 on ap1.action_id = (select id from Action where event_id = 33843650 and status != 2 /*a.event_id = e.id*/ and deleted = 0 and actionType_id = (select id from ActionType where flatCode = 'moving' and deleted = 0))
and ap1.type_id = (select id from ActionPropertyType where actionType_id = (select id from ActionType where flatCode = 'moving' and deleted =0) and name = 'койка')
left join ActionProperty_HospitalBed aph on aph.id = ap1.id
left join OrgStructure_HospitalBed osh on osh.id = aph.value
left join ActionProperty_String aps on aps.id = ap.id
left join Person p on p.id = REGEXP_REPLACE(STRINGDECODE(urldecoder(jd.json)), '.*\"hemo_id\":.?\"(\\\\d+)\".*', '\\\\1')
left join Person p1 on p1.id = REGEXP_REPLACE(STRINGDECODE(urldecoder(jd.json)), '.*\"dejur_id\":.?\"(\\\\d+)\".*', '\\\\1')
left join Person p2 on p2.id = REGEXP_REPLACE(STRINGDECODE(urldecoder(jd.json)), '.*\"assist_id\":.?\"(\\\\d+)\".*', '\\\\1')
left join rbBloodType rbt on rbt.id = c.bloodType_id
WHERE e.eventType_id = 94 and e.deleted = 0 AND a.id in (100577830) /*and os.name is not null*/ ORDER by
os.name, a.plannedEndDate;


select * from Action where id = 100577830



select *
from Action where id in(100215485,100332986);


select *
from ActionPropertyType where ActionType = (select id
from ActionType where flatCode = 'moving')
where deleted = 0 order by idx



select hbi.value
from ActionProperty ap
join ActionProperty_HospitalBed hbi using (id)
join ActionPropertyType apt on apt.id = ap.type_id and apt.deleted = 0 and apt.actionType_id = (select id from ActionType where flatCode = 'moving') and apt.name = 'койка'
where ap.deleted = 0 and ap.action_id = 100215485


select *
from rbHospitalBedProfile where code = 1213;


select code
from OrgStructure_HospitalBed where id = 1213;

select *
from Action where event_id = 33843650;






