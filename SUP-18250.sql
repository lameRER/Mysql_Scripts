select *
from s12.rbPrintTemplate where rbPrintTemplate.context regexp 'clientbanner';

select *
from information_schema.PROCESSLIST where COMMAND not in ('sleep') order by TIME desc;



