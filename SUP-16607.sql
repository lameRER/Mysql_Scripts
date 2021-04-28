select at2.code, at2.name, apt.* from ActionType at2 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Номерок|^Заключение$|^Описание$|^Результат$'
where at2.group_id in(12453,12455) and at2.deleted = 0 order by apt.actionType_id, apt.idx 

select * from ActionType at2 where at2.code = 'А05.10.004';


select at2.* from ActionType at2 
where at2.group_id = 12455 and at2.deleted = 0



select ats.* from ActionType_Service ats 
join ActionType at2 on at2.id = ats.master_id and at2.deleted = 0 and at2.group_id = 12455


select rjt.* from rbJobType rjt, ActionType at2, ActionPropertyType apt where at2.id = apt.actionType_id and at2.group_id = 12455 and apt.valueDomain REGEXP rjt.code ;


insert into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select * from
(select apt.deleted, apt.actionType_id, 99 idx, apt.template_id, 'Результат' name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias 
from ActionPropertyType apt, ActionType at2 
where at2.group_id = 12455 and at2.id = apt.actionType_id and at2.deleted = 0 and apt.deleted = 0 and apt.name = 'Заключение' GROUP by apt.id) as tmp
where not EXISTS (select * from ActionPropertyType apt2 where apt2.actionType_id = tmp.actionType_id and apt2.name = tmp.name)



-- select apt.* from 
update
ActionPropertyType apt, ActionType at2 
set apt.isODIIParam = 1, apt.visibleInJobTicket = 1
where at2.id = apt.actionType_id and at2.group_id = 12455 and apt.deleted = 0 and at2.deleted = 0 and apt.name REGEXP '^Заключение$|^Описание$|^Результат$';



update
ActionPropertyType apt, ActionType at2 
set apt.test_id = 7750
where at2.id = apt.actionType_id and at2.group_id = 12455 and apt.deleted = 0 and at2.deleted = 0 and apt.name = 'Номерок';



select rs.* from ActionType at2 
left join rbService rs on rs.Fed_code = at2.code and rs.group_id = 10
where at2.deleted = 0 and at2.group_id = 12455 


select * from rbService rs where rs.id in(15728,15740);



select ats.* from ActionType_Service ats, ActionType at2 where at2.group_id = 12455 and at2.id = ats.master_id ;



select * from ActionType at2 where group_id in(12453,12455) and at2.deleted = 0;


select * from ActionPropertyType apt, ActionType at2 where at2.code = 'А05.10.008' and apt.actionType_id = at2.id;


select * from rbReferralExamType;

select * from rbService rs where rs.Fed_code REGEXP '04\.28\.001';
