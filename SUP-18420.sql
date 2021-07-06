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


select *
from
(select ur.name, group_concat(up.name separator '\n') as user
from rbUserRight ur
join rbUserProfile_Right upr on ur.id = upr.userRight_id
join rbUserProfile up on upr.master_id = up.id and up.id in (1,24)
group by ur.id)
where user = 'Администратор';


d68a18275455ae3eaa2c291eebb46e6d
select *from Person where login = 'виста';


select shortName
from Organisation where id = 3196;
select *
from rbUserProfile_Right, rbUserRight where rbUserProfile_Right.master_id = 24 and rbUserRight.id = rbUserProfile_Right.userRight_id;