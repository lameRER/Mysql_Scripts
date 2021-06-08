select *
from rbService where name = 'Осмотр (консультация) врачом-анестезиологом-реаниматологом первичный';



select *
from EventType


select *
from Contract_Tariff where service_id = 14016;


select *
from EventType where deleted = 0 order by name;


select price_gnc_temp.code, A.code
from price_gnc_temp
left join ActionType A on right(price_gnc_temp.code, length(price_gnc_temp.code)-1) = right(A.code, length(A.code)-1);


select *
from rbService where code = '01.005.001';