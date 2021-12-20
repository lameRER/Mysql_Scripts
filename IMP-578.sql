select apt.*
from ActionType at1,
     ActionPropertyType apt,
     rbPrintTemplate r
where at1.name regexp 'Направление на приж' and
      apt.actionType_id = at1.id
  and at1.deleted = 0
  and apt.deleted = 0
and r.context = at1.context -- group by r.id;



select apt.*
from ActionPropertyType apt, ActionType at1 where apt.actionType_id = at1.id and at1.name = 'выписка' ;



select *
from rbPrintTemplate where context = 'kon_dn_prot';

select *
from rbPrintTemplate where id = 1356;

select * from ActionType where name = 'протокол вк';

select *
from DestinationTree_ActionType where actionType_id = 11757;


"""SQL=select d1.MKB
from Event e,
     Diagnostic d,
     Diagnosis d1,
     rbDiagnosisType dt
where d.event_id = e.id
  and e.deleted = 0
  and d1.id = d.diagnosis_id
  and d.deleted = 0
  and d1.deleted = 0
  and d1.diagnosisType_id = dt.id
  and e.id = %s
  and dt.id = 35; """


select *
from rbDiagnosisType where name regexp 'клинический';


select *
from Diagnosis where client_id = 6 and deleted = 0;


Insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave, ticketsNeeded, parent_id)
select
       deleted,
       actionType_id,
       27 idx,
       template_id,
       'Телефон отделения'name,
       shortName,
       descr,
       unit_id,
       'string' typeName,
       '"8 (861) 233-69-69", "8 (861) 235-45-31"' valueDomain,
       defaultValue,
       isVector,
       norm,
       sex,
       age,
       penalty,
       penaltyUserProfile,
       penaltyDiagnosis,
       visibleInJobTicket,
       visibleInTableRedactor,
       isAssignable,
       test_id,
       defaultEvaluation,
       canChangeOnlyOwner,
       isActionNameSpecifier,
       laboratoryCalculator,
       inActionsSelectionTable,
       redactorSizeFactor,
       isFrozen,
       typeEditable,
       visibleInDR,
       userProfile_id,
       userProfileBehaviour,
       copyModifier,
       isVitalParam,
       vitalParamId,
       isODIIParam,
       customSelect,
       autoFieldUserProfile,
       formulaAlias,
       incrementOnSave,
       ticketsNeeded,
       parent_id
from ActionPropertyType apt where apt.id =24125;