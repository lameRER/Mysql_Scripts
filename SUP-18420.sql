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

insert into Person_UserProfile(person_id, userProfile_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id)
select 8, 24, now(), null, now(), null

select *
from
(select ur.id ur_id, ur.code, ur.name, up.id up_id, group_concat(up.name separator '\n') as user
from rbUserRight ur
left join rbUserProfile_Right upr on ur.id = upr.userRight_id
left join rbUserProfile up on upr.master_id = up.id and up.id in (24)
where ur.id in(31,32,95, 1)
group by ur.id) as tmp
# where tmp.user = 'Администратор'
;


insert into rbUserProfile_Right(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, userRight_id)
select now(), null, now(), null, 24, 146


d68a18275455ae3eaa2c291eebb46e6d
select *from Person where login = 'виста';


select shortName
from Organisation where id = 3196;
select *
from rbUserProfile_Right, rbUserRight where rbUserProfile_Right.master_id = 24 and rbUserRight.id = rbUserProfile_Right.userRight_id;


select *
from ActionTemplate where group_id = 464;

select *
from Person where id =2139;