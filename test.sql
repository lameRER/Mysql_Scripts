select *
from ActionType
where name regexp 'qr
';


select *

from Action where  actionType_id = 1468 and createPerson_id =614
select *
from Person where login = 'виста';


select *
from Organisation where id = 3188
;



select *
from rbPrintTemplate where createDatetime is null or modifyDatetime is null;

test
test
test vista


# select apt.valueDomain, regexp_replace(apt.valueDomain, '\'', '\"') from
update ActionPropertyType
set valueDomain = regexp_replace(valueDomain, '\'', '\"')
where valueDomain REGEXP '\'';
