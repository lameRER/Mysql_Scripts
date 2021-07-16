select *
from ActionTemplate order by id desc ;


select *
from ActionType where id = (select actionType_id from Action where id = 100910406)