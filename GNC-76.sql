select *
from ActionPropertyType where actionType_id = (select at.id
from ActionType at where at.context = 'osmotr_dnevnik' and at.deleted = 0) and deleted = 0 order by idx


select *
from ActionType where id = 4218;

select *
from ActionPropertyType where id = 3982130;


select *
from rbPrintTemplate where context = 'osmotr_dnevnik' and deleted = 0;


select *
from Action where actionType_id =4218 order by id desc ;


select client_id
from Event where id =20430165;


select sex
from Client where id = 253201;

select *
from ;