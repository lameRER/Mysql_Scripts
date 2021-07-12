select
       e.id,
       e.externalId,
       c.id `Код пациента`,
       e.setDate `Дата посещения`,
       os.name `Отделение`,
       rf.name,
       concat_ws(' ', p.lastName, p.firstName, p.patrName)
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
# left join Action a on a.event_id = e.id and a.deleted = 0
left join Person p on p.id = e.execPerson_id and p.deleted = 0
left join OrgStructure os on os.id = p.orgStructure_id
left join rbFinance rf on et.finance_id = rf.id

# join Service s on s.action_id = a.id
# join PriceListItem pli on pli.id = s.PriceListItem_id
# join Diagnosis d on d.client_id = c.id and d.deleted = 0
# join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30' group by e.id limit 10



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