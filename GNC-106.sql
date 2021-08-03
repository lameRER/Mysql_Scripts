select plis.*
from ActionType at
join ActionType_Service ats on ats.master_id = at.id
join rbService r on r.id = ats.service_id
join PriceListItem pli on pli.service_id = r.id
where at.name regexp 'Исследование фиксированных антитромбоцитарных антител методом проточной цитофлуориметрии';