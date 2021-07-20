select *
from s12.rbPrintTemplate where name regexp 'Шил';

select *
from information_schema.PROCESSLIST where COMMAND not in ('sleep') order by TIME desc;



