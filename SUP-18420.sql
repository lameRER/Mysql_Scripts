select *
from rbUserRight where name regexp 'шаблоны';


select *
from s12.rbUserProfile_Right where userRight_id = 1;

insert into s12.rbUserProfile_Right (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, userRight_id)
values  (1, '2017-06-16 15:02:59', 1069, '2021-06-11 16:08:57', 200, 1, 1);


select *
from rbUserProfile where id = 24;


select *
from Person where userProfile_id = 24;


select *
from Person where login = 'виста';


select shortName
from Organisation where id = 3196;
select *
from rbUserProfile_Right, rbUserRight where rbUserProfile_Right.master_id = 24 and rbUserRight.id = rbUserProfile_Right.userRight_id;