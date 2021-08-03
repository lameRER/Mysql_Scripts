select *
from Event where externalId = '2021/73034';

select *
from Event where externalId = '2021/73100'


select pl.*
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



select e.id eventID, et.name EventName, c.number Contract, cpl.id ContractPriceList, pl.name PriceList, pli.serviceCodeOW PiceServiceCodeOW , pli.serviceNameOW PriceServiceNameOW, pli.begDate PriceBegDate, pli.endDate PriceEndDate, s.code ServiceCode, s.name ServiceName, s.begDate ServiceBegDate, s.endDate ServiceEndDate, ats.id ActionTypeService, at.code ActionTypeCode, at.name ActionTypeName, f.id finance
from Event e
 left join EventType et on e.eventType_id = et.id and et.deleted = 0
 left join Contract c on c.id = e.contract_id and c.deleted=  0
 left join Contract_PriceList cpl on cpl.contract_id = c.id
 left join PriceList pl on cpl.priceList_id = pl.id and pl.deleted = 0
 left join PriceListItem pli on pli.priceList_id = pl.id and pli.deleted = 0 and pli.endDate >= curdate() and pli.serviceCodeOW regexp :code -- '12.05.024.001'
 left join rbService s on s.id = pli.service_id  and s.endDate >= curdate()
 left join ActionType_Service ats on ats.service_id = s.id  and ats.endDate >= curdate()
 left join ActionType at on at.id = ats.master_id and at.deleted =0
 left join rbFinance f on f.id = c.finance_id and f.id = pl.finance_id and et.finance_id = f.id and f.deleted = 0
where e.id = :eventId -- 20439099;


select *
from rbFinance where id =20;

select *
from PriceListItem where serviceCodeOW regexp '12.05.024.001';