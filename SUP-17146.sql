select * from ActionType at2 where at2.name REGEXP '^консультация врача-тра';

56181

select * from DestinationTree_ActionType where actionType_id =56181


select * from ActionPropertyType apt where apt.actionType_id = 56181 and apt.deleted = 0 order by apt.idx ;

select * from DestinationTree where deleted= 0;


select * from DestinationTree_ActionType where master_id = 10031;



insert into DestinationTree_ActionType (master_id, actionType_id, name)
select 10031, 56181, (select at2.name from ActionType at2 where at2.name REGEXP '^консультация врача-тра');


select * from Person where lastName REGEXP "^Пришляк$|^Ионова$|^Заводов$" and retireDate is null and orgStructure_id = 68

insert into Person_ConsultDepartment (person_id, orgStructure_id)
select tmp.id, 68 from (
select p.id from Person p where p.id in(347,348,1277)) as tmp
WHERE not EXISTS (select * from Person_ConsultDepartment pcd where pcd.person_id = tmp.id and pcd.orgStructure_id=68)


