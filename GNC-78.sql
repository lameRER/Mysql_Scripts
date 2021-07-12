select
       c.id `Код пациента`,
       e.setDate `Дата посещения`
from Event e
join Client c on e.client_id = c.id and c.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0 and et.purpose_id = 2
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and at.flatCode = 'moving'
# join rbFinance rf on et.finance_id = rf.id

# join Service s on s.action_id = a.id
# join PriceListItem pli on pli.id = s.PriceListItem_id
# join Diagnosis d on d.client_id = c.id and d.deleted = 0
# join Diagnostic d1 on d1.event_id = e.id and d.id = d1.diagnosis_id
where e.setDate >= '2018-01-01' and e.setDate <= '2021-06-30'



select * from ActionType where flatCode = 'moving' and deleted = 0


select *
from EventType where deleted = 0 and purpose_id = 2;


select *
from Diagnostic;


select *
from Diagnosis;