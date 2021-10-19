select code, name, context
from ActionType where name regexp 'ПРОТОКОЛ ПРОЦЕДУРЫ' and deleted = 0;


select *
from ActionPropertyType where actionType_id = 84793 and deleted = 0 order by idx
;


select *
from rbPrintTemplate where context = 'nevr_7';