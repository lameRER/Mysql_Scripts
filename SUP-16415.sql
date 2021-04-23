select * from ActionType at2 where at2.name REGEXP 'УЗИ БЦА';


select * from DestinationTree dt where dt.id = 10082;


select * from DestinationTree_ActionType dtat where actionType_id = 11021;



select * from DestinationTree_ActionType where master_id = 10082;



select * from ActionType at2 where at2.group_id = 11021;




select apt.*
from ActionPropertyType apt, ActionType at2, rbJobType rjt
where at2.id in (11021,11028,11025,11019) and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name = 'Номерок'
and rjt.code = apt.valueDomain


select * from OrgStructure_ActionType where actionType_id in(11019,11025,11021,11028)




select * from OrgStructure_Job osj ;


select * from Job j ;

select jt.* from Job_Ticket jt
join Job j on j.id = jt.master_id and j.jobType_id = 90;


;

select * from rbUserProfile rup ;

select rup.name, p.* from Person p
join rbUserProfile rup on rup.id = p.userProfile_id ;

select * from Person p where p.login regexp 'Виста';


select * from Person_UserProfile pup where pup.person_id = 564;


INSERT INTO s11.rbUserProfile
(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name)
VALUES(35, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL, 'diag_doctor', 'Врач ИД');


select at2.id
from ActionType at2
limit 2
