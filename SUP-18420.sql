select *
from rbUserRight where name regexp 'шаблоны';


select *
from rbUserProfile_Right where userRight_id = 1;

insert into rbUserProfile_Right (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, userRight_id)
values  (1, '2017-06-16 15:02:59', 1069, '2021-06-11 16:08:57', 200, 1, 1);


# select *
delete
from rbUserProfile_Right
where id =3393;

insert into rbUserProfile_Right (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, userRight_id)
values  (3393, '2018-04-13 17:32:18', 356, '2021-06-11 16:04:09', 200, 24, 1);


select *
from rbUserProfile where id = 24;


select * from
#      update
         Person
#      set password = 'd68a18275455ae3eaa2c291eebb46e6d'
     where userProfile_id = 24 and retireDate is null
;



select rbUserProfile.name, 
from rbUserProfile
join rbUserProfile_Right on rbUserProfile.id = rbUserProfile_Right.master_id
join rbUserRight on rbUserProfile_Right.userRight_id = rbUserRight.id
;


d68a18275455ae3eaa2c291eebb46e6d
select *from Person where login = 'виста';


select shortName
from Organisation where id = 3196;
select *
from rbUserProfile_Right, rbUserRight where rbUserProfile_Right.master_id = 24 and rbUserRight.id = rbUserProfile_Right.userRight_id;