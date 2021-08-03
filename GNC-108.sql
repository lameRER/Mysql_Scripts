select *
from Event where externalId = '2021/73034';


select c.*
from Event e
left join EventType et on e.eventType_id = et.id
left join Contract c on c.id = e.contract_id
left join Contract_PriceList cpl on cpl.contract_id = c.id
left join PriceList pl on cpl.priceList_id = pl.id
left join PriceListItem pli on pli.priceList_id = pl.id and pli.serviceCodeOW regexp '12.05.024.001'
left join rbService s on s.id = pli.service_id
left join ActionType_Service ats on ats.service_id = s.id
left join ActionType at on at.id = ats.master_id
left join rbFinance f on f.id = c.finance_id and f.id = pl.finance_id and et.finance_id = f.id
where e.id =20439099;


select *
from rbFinance where id =20;

select *
from PriceListItem where serviceCodeOW regexp '12.05.024.001';