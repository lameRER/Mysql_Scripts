select *
from ActionType where name regexp  '^прием.*повторный' and class = 0 and deleted = 0
;


select *
from s12.ActionPropertyType where actionType_id = 85084;

select *
from rbPrintTemplate where context = (select ActionType.context from ActionType where id = 85084);

select *
from ActionPropertyType where typeName = '';


select *
from rbPrintTemplate where name regexp 'повторный осмотр';



select *
from ActionPropertyType where  actionType_id = 85084;

select * from ActionType where context = 'pov_osm'


select *
from rbPrintTemplate where context = 'pov_osm';

select *
from rbPrintTemplate where context = 'osmotrderm';

select *
from Action where event_id = 4612852 and deleted = 0;

