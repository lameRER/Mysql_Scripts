select *
from rbPrintTemplate where name regexp 'Карта стационарного больного .* страница 1' and context = 'f066';

select EventType.requestType_id, EventType.*
from EventType where id = 115;


select *
from rbRequestType;


select *
from EventType;