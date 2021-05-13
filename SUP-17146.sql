select at2.* from ActionType at2 where at2.name REGEXP '^консультация врача-тра';

56181

select * from DestinationTree_ActionType where actionType_id =56181

select * from ActionType at2 where at2.name  ='Консультация ЛОР';


select * from ActionPropertyType apt where apt.actionType_id in(40709,56181);


select * from OrgStructure os order by os.id DESC ;

select * from OrgStructure_ActionType osat where osat.master_id =209;

select * from rbJobType_ActionType where master_id = 190;

select * from OrgStructure_Job osj where osj.master_id = 68;

select * from OrgStructure_ActionType osat where master_id = 68;


select * from rbJobType rjt where code REGEXP '6-2|2-17';

select * from OrgStructure_Job where master_id = 68;

INSERT into OrgStructure_Job (master_id, idx, jobType_id, begTime, endTime, quantity, lastAccessibleDate, isVisibleInDR, person_id)
select osj.master_id, 1 idx, 190 jobType_id, osj.begTime, osj.endTime, osj.quantity, osj.lastAccessibleDate, osj.isVisibleInDR, osj.person_id from OrgStructure_Job osj where osj.master_id = 68;

INSERT into rbJobType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code, regionalCode, name, listContext, actionStatusChanger, actionPersonChanger, actionDateChanger, ticketDuration, showOnlyPayed, durationVisibility, ticketAssignWay, quotingMode, instrumental, jobStatusModifier)
select 
NOW() createDatetime, null  createPerson_id,NOW() modifyDatetime, null modifyPerson_id, 
group_id, '2-16' code, regionalCode, (select at2.name from ActionType at2 where at2.name REGEXP '^консультация врача-тра') name, listContext, actionStatusChanger, actionPersonChanger, actionDateChanger, ticketDuration, showOnlyPayed, durationVisibility, ticketAssignWay, quotingMode, instrumental, jobStatusModifier from rbJobType where id =92


select * from rbJobType rjt ;

-- insert into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
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


