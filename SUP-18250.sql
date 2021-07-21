select *
from s12.rbPrintTemplate where rbPrintTemplate.context regexp 'clientbanner';

select *
from information_schema.PROCESSLIST where COMMAND not in ('sleep') and DB= 's12' order by TIME desc;




SELECT id FROM Action WHERE Action.`event_id` = 3921176  ORDER BY id



