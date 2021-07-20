select *
from rbPrintTemplate
where context =
(select context
from ActionType where name = 'Первичный осмотр дежурного врача' and deleted =0 and code = '145-17746F')



select *
from rbPrintTemplate where context =
(select context
from ActionType where name = 'Назначение НСПВ');


select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where name = 'Назначение НСПВ')



select *
from rbPrintTemplate where context in
(select context
from ActionType where id in
(select actionType_id
from ActionPropertyType where typeName = 'Action' and deleted=0 ) and deleted =0)
;