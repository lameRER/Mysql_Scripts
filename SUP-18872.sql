select *
from Epicrisis where event_id = 4828948 order by id desc ;


select *
from Action where event_id = 4828948;



select *
from ActionType where id = 18332;



select ActionType.name, Action.*
from Action, ActionType where  event_id =4828948 and actionType_id = ActionType.id;


select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where id = 18332);


select Action.*
from Action where deleted = 0 and createDatetime is null and modifyDatetime is null group by actionType_id;