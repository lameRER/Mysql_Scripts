select * from rbUserProfile rup 


select rur.* from rbUserProfile_Right rup, rbUserRight rur where rup.master_id  = 7 and rur.id = rup.userRight_id 

select * from Person p where p.userProfile_id = 7;


select * from rbUserRight where name REGEXP 'Имеет право';