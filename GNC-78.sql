# Сведенья об абулаторных приемах
select
       e.id, e.externalId,
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
join EventType et on et.id = e.eventType_id and et.purpose_id = 2
left join Person p on p.id = e.execPerson_id
left join OrgStructure os on os.id = e.orgStructure_id
left join rbFinance rf on et.finance_id = rf.id
left join Event_Diagnosis ed on ed.event_id = e.id and ed.diagnosisType_id = 2 and ed.diagnosisKind_id = 4 and ed.deleted = 0
left join Diagnosis d on d.id = ed.diagnosis_id and c.id= d.client_id and d.deleted = 0
left join Diagnostic d1 on d1.diagnosis_id = d.id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at on at.id = a.ActionType_id
left join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
group by e.id -- order by e.setDate;



select *
from Event where client_id = 331512 and externalId = '2810';



select *
from Action a, Diagnostic d, Diagnosis d1 where a.event_id = 20435323 and a.id = d.action_id and d.MKB = 'N84.0' and d1.id = d.diagnosis_id;



select distinct ed.*
from Diagnosis d
join Diagnostic d1 on d1.diagnosis_id = d.id and d1.deleted = 0
join Action a on a.id = d1.action_id and a.deleted =0
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and at.id = 4544
join Event_Diagnosis ed on ed.event_id = a.event_id and ed.diagnosisKind_id = 4 and ed.diagnosisType_id = 2
where d.client_id = 331512 and d.deleted = 0;

select *
from Event_Diagnosis;


select apt.*
from ActionProperty ap
    left join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.id =23156334
join ActionType at on at.id = a.actionType_id
join ActionPropertyType apt on apt.actionType_id = at.id and apt.id = ap.type_id -- and apt.id = 3945600


select *
from rbDiseaseCharacter;


select *
from Diagnosis d
left join Diagnostic D2 on D2.diagnosis_id = d.id where d.client_id = '331512';




select *
from Client where lastName = 'Безверхая';

select *
from rbDiagnosisType;



# Сведенья о проводимых манипуляциях
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
join EventType et on et.id = e.eventType_id and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id
# left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
# left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.class = 2
left join Person p on p.id = a.person_id
left join OrgStructure os on os.id = p.orgStructure_id
left join Service s on s.action_id = a.id and s.event_id = e.id
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id, a.id order by c.id, a.createDatetime



# Сведенья о инструментальных исследований
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
join EventType et on et.id = e.eventType_id and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.class = 1 and at.context != 'action_lab'
left join Person p on p.id = a.person_id
left join OrgStructure os on os.id = p.orgStructure_id
left join Service s on s.action_id = a.id and s.event_id = e.id
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 20287049
group by e.id, a.id order by c.id, a.createDatetime desc

select *
from rbFinance;

select rf.*
from Event e, EventType et, rbFinance rf where e.id = 20287049 and et.id = e.eventType_id and et.purpose_id = 2 and et.deleted = 0 and e.deleted = 0 and rf.id = et.finance_id;

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



# Сведенья о лабораторных исследований
select
       e.id,
       e.externalId,
       c.id `Код пациента`,
       at.name `Наименование манипуляции`,
       a.endDate `Дата манипуляции`,
       concat_ws(' ', p.lastName, p.firstName, p.patrName) `Врач-исполнитель`,
       os.name `Отделение`,
       rf.name `Источник финансирования`,
       s.sum `Стоимость`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.purpose_id = 2
left join rbFinance rf on et.finance_id = rf.id
left join Diagnosis d on d.client_id = c.id and d.deleted = 0 and d.diagnosisType_id = 2
left join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id and d1.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0 and a.status = 2
join ActionType at on at.id = a.ActionType_id and at.context = 'action_lab' and at.class =1
left join Person p on p.id = a.person_id
left join OrgStructure os on os.id = p.orgStructure_id
left join Service s on s.action_id = a.id and s.event_id = e.id
left join PriceListItem pli on pli.id = s.PriceListItem_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' and e.deleted = 0
# and e.id = 3526258
group by e.id, a.id order by c.id, a.createDatetime desc



select *
from ActionType where name regexp 'РЕНТГЕНОЛОГИЧЕСКИЕ ИССЛЕДОВАНИЯ|КЛИНИКО-ДИАГНОСТИЧЕСКАЯ ЛАБОРАТОРИЯ';

select *
from ActionType where name = 'КЩС венозной крови';




select *
from Service;


select distinct d1.*
from Event e
join Client c on c.id = e.client_id
# join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
# left join Event_Diagnosis ed on ed.event_id = e.id and ed.deleted = 0 and ed.diagnosisType_id = 2 and ed.diagnosisKind_id = 4 and ed.deleted = 0
left join Diagnosis d on d.client_id = c.id and d.deleted-- and ed.diagnosis_id = d.id
left join Diagnostic d1 on d1.diagnosis_id = d.id
# where e.id =3526258
;



select d1.*
from Event e
join Client c on c.id = e.client_id and c.id = 331512 and c.deleted = 0
join Event_Diagnosis ed on ed.event_id = e.id and ed.diagnosisType_id = 2 and ed.diagnosisKind_id = 4 and ed.deleted = 0
join Diagnosis d on d.id = ed.diagnosis_id and c.id= d.client_id and d.deleted = 0
join Diagnostic d1 on d1.diagnosis_id = d.id and d1.deleted = 0
where e.id =20435323 and e.deleted= 0 group by d1.diagnosis_id;


select *
from Event_Diagnosis;


select *
from Diagnosis where id =3820;

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