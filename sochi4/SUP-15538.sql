select * from logger.login where revision is not null order by id desc ;


select * from ActionPropertyType a
where a.typeName = 'Person' and valueDomain != ''-- and a.name regexp 'пїЅпїЅпїЅпїЅпїЅпїЅ';


select o.name, p.login, p.password from person p 
left join orgstructure o on o.id = p.orgStructure_id
where p.userProfile_id = 1;


select * from person p where p.deleted = 0 and p.retireDate is null and p.speciality_id is not null;


select p.id, p.login, p.userProfile_id, p.password from person p where p.password = md5('654321');


update person p, person_userprofile pup
set p.userProfile_id = 7, pup.userProfile_id = 7
where p.id = 303 and p.id = pup.person_id 