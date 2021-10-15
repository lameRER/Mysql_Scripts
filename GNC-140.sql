select f.name, count(a.id)
from Action a
join Event e on e.id = a.event_id and e.deleted = 0
join EventType et on et.id = e.eventType_id and et.deleted = 0
join rbFinance f on f.id = et.finance_id
where a.actionType_id in
(select id
from ActionType where name in ('SARS-CoV-2 IgG', 'SARS-CoV-2 IgG (ПАЦИЕНТЫ|ДОНОРЫ - 1-Й ЭТАЖ)'))
and a.deleted = 0 and endDate is not null
group by f.id
;


select *
from Contract_PriceList;

select *
from EventType;