use s11;
select id, orgStructure_id
from
     Person where lastName = 'Байда';


select *
from rbUserProfile where id = 44

select id, login
from Person where orgStructure_id = 18 and userProfile_id = 44;