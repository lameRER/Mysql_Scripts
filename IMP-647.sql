insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave, ticketsNeeded, parent_id)
select *
from
(select
       apt1.deleted,
       apt.actionType_id,
       max(apt.idx)+1,
       apt1.template_id,
       'Диагноз' name,
       apt1.shortName,
       apt1.descr,
       apt1.unit_id,
       apt1.typeName,
       apt1.valueDomain,
       apt1.defaultValue,
       apt1.isVector,
       apt1.norm,
       apt1.sex,
       apt1.age,
       apt1.penalty,
       apt1.penaltyUserProfile,
       apt1.penaltyDiagnosis,
       apt1.visibleInJobTicket,
       apt1.visibleInTableRedactor,
       apt1.isAssignable,
       apt1.test_id,
       apt1.defaultEvaluation,
       apt1.canChangeOnlyOwner,
       apt1.isActionNameSpecifier,
       apt1.laboratoryCalculator,
       apt1.inActionsSelectionTable,
       apt1.redactorSizeFactor,
       apt1.isFrozen,
       apt1.typeEditable,
       apt1.visibleInDR,
       apt1.userProfile_id,
       apt1.userProfileBehaviour,
       apt1.copyModifier,
       apt1.isVitalParam,
       apt1.vitalParamId,
       apt1.isODIIParam,
       apt1.customSelect,
       apt1.autoFieldUserProfile,
       apt1.formulaAlias,
       apt1.incrementOnSave,
       apt1.ticketsNeeded,
       apt1.parent_id
from ActionPropertyType apt, ActionPropertyType apt1
where apt.deleted = 0 and apt1.id = 23897
  and apt.actionType_id in
      (select id
       from ActionType
       where code in ('14',
                      '16_1',
                      '1_01',
                      '1_06',
                      '1_01_1',
                      '1-01-12',
                      '1-01-12_1',
                      '1_29_1',
                      '1-31',
                      '1_01_1',
                      '14_1',
                      '1-01-12_1',
                      '1_29',
                      '1_06',
                      '16_2',
                      '1-12_1',
                      '1-71_1',
                      '1_01_1_1',
                      '1-01-12_1_1',
                      '1-31_1',
                      '14_2',
                      '16_3',
                      '1_011',
                      '1_06_1',
                      '1_01_8',
                      '1_29_1_1',
                      '1-01-12_1',
                      '1_03_01',
                      '1-12_1_1',
                      '1-71_1_1',
                      '1-01-12_1_1_1',
                      '1-45-1',
                      '1_03',
                      '1-45-1_1',
                      '1_03_2'))
group by actionType_id) as tmp
where not exists(select * from ActionPropertyType where tmp.typeName = typeName and tmp.actionType_id = actionType_id and tmp.deleted = deleted);


select *
from ActionPropertyType where actionType_id = 14376;

select typeName
from ActionPropertyType group by typeName;

select *
from ActionPropertyType where typeName = 'MKBTree';