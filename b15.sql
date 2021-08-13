select p.login, p.password, up.name, os.name
from Person p, OrgStructure os, rbUserProfile up
where -- p.userProfile_id in (18, 19, 26, 65) and
#       orgStructure_id = 12
#   and
      p.Test_Person = 1
and os.id = p.orgStructure_id
and up.id = p.userProfile_id and up.code != ''
group by p.orgStructure_id, p.userProfile_id order by p.orgStructure_id, p.userProfile_id;


select *
from rbUserProfile where code != '';


select * from OrgStructure


select *
from Person;

select *
from rbUserProfile;
select *
from Person where login = 'test';

select *
from DestinationTree where name = 'Осмотры' and deleted=0;


select *
from DestinationTree_ActionType where master_id = 10029;