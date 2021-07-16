select *
from ActionPropertyType where actionType_id = (select at.id
from ActionType at where at.context = 'osmotr_dnevnik' and at.deleted = 0) and deleted = 0 order by idx


select *
from ActionPropertyType where id = 3982130;


select *
from rbPrintTemplate where context = 'osmotr_dnevnik' and deleted = 0;