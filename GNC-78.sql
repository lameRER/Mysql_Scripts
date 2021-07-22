select
       COUNT(e.id) `Количество манипуляций`,
       c.id `Код пациента`,
       e.setDate `Дата посещения`,
       os.name `Отделение`,
       rf.name `Источник финансирования`,
       concat_ws(' ', p.lastName, p.firstName, p.patrName) `Врач`,
       d1.MKB `Основной диагноз`,
       SUM(s.sum) `Общая стоимость`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
# and c.id = 163803
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
left join Person p on p.id = e.execPerson_id and p.deleted = 0
left join OrgStructure os on os.id = e.orgStructure_id and os.deleted = 0
left join rbFinance rf on et.finance_id = rf.id and rf.deleted = 0
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.deleted = 0
left join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id order by e.setDate;



select *
from Event where client_id = 331512 and externalId = '2810';



select a.id,
       a.createDatetime,
       a.createPerson_id,
       a.modifyDatetime,
       a.modifyPerson_id,
       a.deleted,
       externalId,
       actionType_id,
       a.event_id,
       idx,
       directionDate,
       status,
       setPerson_id,
       isUrgent,
       begDate,
       plannedEndDate,
       a.endDate,
       note,
       a.person_id,
       office,
       amount,
       uet,
       expose,
       payStatus,
       account,
       finance_id,
       prescription_id,
       takenTissueJournal_id,
       contract_id,
       coordDate,
       coordPerson_id,
       coordAgent,
       coordInspector,
       coordText,
       hospitalUidFrom,
       pacientInQueueType,
       AppointmentType,
       a.version,
       parentAction_id,
       uuid_id,
       dcm_study_uid,
       uuid,
       d.id,
       d.createDatetime,
       d.createPerson_id,
       d.modifyDatetime,
       d.modifyPerson_id,
       d.deleted,
       d.event_id,
       diagnosis_id,
       d.diagnosisType_id,
       d.character_id,
       stage_id,
       phase_id,
       d.dispanser_id,
       sanatorium,
       hospital,
       d.traumaType_id,
       speciality_id,
       d.person_id,
       healthGroup_id,
       result_id,
       d.setDate,
       d.endDate,
       notes,
       rbAcheResult_id,
       d.version,
       action_id,
       diagnosis_description,
       d.MKB,
       d.MKBEx,
       MKB2,
       who_id,
       d1.id,
       d1.createDatetime,
       d1.createPerson_id,
       d1.modifyDatetime,
       d1.modifyPerson_id,
       d1.deleted,
       client_id,
       d1.diagnosisType_id,
       d1.character_id,
       d1.MKB,
       d1.MKBEx,
       d1.dispanser_id,
       d1.traumaType_id,
       d1.setDate,
       d1.endDate,
       mod_id,
       d1.person_id
from Action a, Diagnostic d, Diagnosis d1 where a.event_id = 20435323 and a.id = d.action_id and MKB = 'N84.0' and d1.id = d.diagnosis_id;


select *
from Diagnosis d
left join Diagnostic D2 on D2.diagnosis_id = d.id where d.client_id = '331512';




select *
from Client where lastName = 'Безверхая';

select *
from rbDiagnosisType;




select
       c.id `Код пациента`,
       at.name `Наименование манипуляции`,
       a.endDate `Дата манипуляции`,
       concat_ws(' ', p.lastName, p.firstName, p.patrName) `Врач-исполнитель`,
       os.name `Отделение`,
       rf.name `Источник финансирования`,
       s.sum `Стоимость`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id and rf.deleted = 0
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.deleted = 0 and at.class = 2
left join Person p on p.id = a.person_id and p.deleted = 0
left join OrgStructure os on os.id = p.orgStructure_id and os.deleted = 0
left join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id, a.id order by c.id, a.createDatetime


select
       c.id `Код пациента`,
       at.name `Наименование манипуляции`,
       a.endDate `Дата манипуляции`,
       concat_ws(' ', p.lastName, p.firstName, p.patrName) `Врач-исполнитель`,
       os.name `Отделение`,
       rf.name `Источник финансирования`,
       s.sum `Стоимость`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id and rf.deleted = 0
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.deleted = 0 and at.class = 1 and at.context != 'action_lab'
left join Person p on p.id = a.person_id and p.deleted = 0
left join OrgStructure os on os.id = p.orgStructure_id and os.deleted = 0
left join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id, a.id order by c.id, a.createDatetime



select *
from ActionProperty ap
left join ActionProperty_Action using(id)
union
select *
from ActionProperty ap
left join ActionProperty_String using(id)
union
select *
from ActionProperty ap
left join ActionProperty_String using(id)
union
select *
from ActionProperty ap
left join ActionProperty_String using(id)
union
select *
from ActionProperty ap
left join ActionProperty_String using(id)
union
select *
from ActionProperty ap
left join ActionProperty_String using(id)




SELECT 'Название свойства', 'Значение свойства'
UNION
(SELECT apt1.name AS `Название свойства`, IF(apt1.typeName REGEXP 'Constructor|String|Text', aps.value, IF(apt1.typeName = 'Date', apd.value, IF(apt1.typeName = 'Double', apd1.value, IF(apt1.typeName = 'Integer', api.value, IF(apt1.typeName = 'Reference', apr.value, IF(apt1.typeName = 'Time', apt.value, 'ERROR')))))) AS `Значение свойства` FROM ActionProperty ap
LEFT JOIN ActionProperty_String aps USING(id)
LEFT JOIN ActionProperty_Reference apr USING(id)
LEFT JOIN ActionProperty_Double apd1 USING(id)
LEFT JOIN ActionProperty_Date apd USING(id)
LEFT JOIN ActionProperty_Integer api USING(id)
LEFT JOIN ActionProperty_Time apt USING(id)
JOIN Action a ON ap.action_id = a.id AND a.deleted = 0 AND a.status = 2 and a.event_id = 8521373
JOIN ActionPropertyType apt1 ON ap.type_id = apt1.id AND apt1.deleted = 0
JOIN ActionType at ON a.actionType_id = at.id AND apt1.actionType_id = at.id AND at.deleted = 0 ORDER BY apt1.idx)


select *
from Event order by id desc ;




select
       c.id `Код пациента`,
       at.name `Наименование манипуляции`,
       a.endDate `Дата манипуляции`,
       concat_ws(' ', p.lastName, p.firstName, p.patrName) `Врач-исполнитель`,
       os.name `Отделение`,
       rf.name `Источник финансирования`,
       s.sum `Стоимость`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id and rf.deleted = 0
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.deleted = 0 and at.context = 'action_lab' and at.class =1
left join Person p on p.id = a.person_id and p.deleted = 0
left join OrgStructure os on os.id = p.orgStructure_id and os.deleted = 0
left join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id, a.id order by c.id, a.createDatetime



select *
from ActionType where name regexp 'РЕНТГЕНОЛОГИЧЕСКИЕ ИССЛЕДОВАНИЯ|КЛИНИКО-ДИАГНОСТИЧЕСКАЯ ЛАБОРАТОРИЯ';

select *
from ActionType where name = 'КЩС венозной крови';




select *
from Service;


select d.*
from Event e
join Client c on c.id = e.client_id
left join Diagnosis d on d.client_id = c.id and d.deleted = 0
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
where e.id =1323619
;

select *
from Service;

select *
from Action where id in(22565877,22565878)



select *
from Event where orgStructure_id is not null;





select * from ActionType where flatCode = 'moving' and deleted = 0



                           and purpose_id = 2;



select *
from rbFinance;

select *
from Event where id = 2485958;


select *
from Action where event_id = 2485958;

select *
from EventType where id = 109;

select *
from Diagnostic;


select *
from Diagnosis;