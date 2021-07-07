select *
from Client where id = 446561;


select *
from Event where client_id = 446561 order by id desc ;


select *
from Action where event_id = 33867017 order by id desc ;


select *
from ActionType where id = 15079;

select *
from Event where externalId = 26507;