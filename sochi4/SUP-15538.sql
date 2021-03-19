select * from logger.login l order by id desc ;


select * from ActionPropertyType a 
where a.typeName = 'Person' and valueDomain != ''-- and a.name regexp 'хирург';


select o.name, p.login, p.password from person p 
left join orgstructure o on o.id = p.orgStructure_id 
where p.userProfile_id = 1;


select * from person p where p.deleted = 0 and p.retireDate is null and p.speciality_id is not null;


select p.login, p.password from person p where p.password = md5('654321');