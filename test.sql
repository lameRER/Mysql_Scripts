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

select md5('1');


select p.login, p.userProfile_id, pu.name from Person p, rbUserProfile pu where p.password = 'c4ca4238a0b923820dcc509a6f75849b' and p.deleted = 0 and p.userProfile_id = pu.id  group by pu.id


select login, password, userProfile_id
from Person where lastName regexp  'клищ';
select *
from rbUserProfile where id = 10;