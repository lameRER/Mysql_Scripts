select *
from rbUserRight where name regexp 'шаблоны';


select * from rbUserProfile_Right, rbUserProfile where rbUserProfile_Right.userRight_id = 1 and rbUserProfile.id = rbUserProfile_Right.master_id


select *
from Person where login = 'виста';



select *
from rbUserProfile_Right, rbUserRight where rbUserProfile_Right.master_id = 24 and rbUserRight.id = rbUserProfile_Right.userRight_id;