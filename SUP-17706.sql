select *
from ActionType where name regexp '^Определение РНК';


select *
from EventType_Action where actionType_id in(49885,49955,56191);
select *
from Action where event_id =33855946 ;
# 49885
select * from ActionType where id in(49885,49955,56191)

select *
from ActionPropertyType where actionType_id = 56191;
select *
from TakenTissueJournal;