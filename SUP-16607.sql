select at2.code, at2.name, apt.* from ActionType at2 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP 'Номерок|^Заключение$|^Описание$|^Результат$'
where at2.group_id = 12455 and at2.deleted = 0

select * from ActionType at2 where at2.code = 'А05.10.004';


select at2.* from ActionType at2 
where at2.group_id = 12455 and at2.deleted = 0



select ats.* from ActionType_Service ats 
join ActionType at2 on at2.id = ats.master_id and at2.deleted = 0 and at2.group_id = 12455


select rjt.* from rbJobType rjt, ActionType at2, ActionPropertyType apt where at2.id = apt.actionType_id and at2.group_id = 12455 and apt.valueDomain REGEXP rjt.code ;




select apt.id, apt.deleted, apt.actionType_id, apt.idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias 
from ActionPropertyType apt, ActionType at2 
where at2.group_id = 12455 and at2.id = apt.actionType_id and at2.deleted = 0 and apt.deleted = 0 and apt.name = 'Заключение';