select * from logger.login l order by id desc ;


select * from ActionPropertyType a where a.typeName = 'Person' and a.name regexp 'хирург';


select * from person p where p.userProfile_id = 7;


select * from person p where p.deleted = 0 and p.retireDate is null and p.speciality_id is not null;