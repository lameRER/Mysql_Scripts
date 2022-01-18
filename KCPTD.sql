select *
from DestinationTree
where deleted = 0;

select *
from DestinationTree_ActionType where master_id = 10042;

select *
from ActionPropertyType where actionType_id = 11765;


select * from ActionPropertyType where typeName = 'MKBtree'

select *
from ActionType where id =14398;


select *
from DestinationTree_ActionType
where actionType_id = 14398;


select * from DestinationTree where id = 10076;

select *
from DestinationTree where id in
(select master_id
from DestinationTree_ActionType where actionType_id in
(select actionType_id
from ActionPropertyType where deleted = 0 and typeName = 'MKBTree') group by master_id) and deleted = 0;

insert into ptd23.ActionType(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class,
                             group_id, code, name, title, needReferral, flatCode, sex, age, office, showInForm,
                             genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus,
                             defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                             defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
                             defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                             nomenclativeService_id, isPreferable, prescribedType_id, shedule_id,
                             isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible,
                             propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType,
                             actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES,
                             frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency,
                             isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod,
                             recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked,
                             filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities,
                             isIgnoreEventExecDate, showAPOrg, showAPNotes, defaultIsUrgent, advancePaymentRequired,
                             checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod,
                             withoutAgree, EGISZ_code, consultationTypeId, instrumentalId)
select *
from (select *
      from ActionType
      where id in
            (select tmp.group_id
             from (select distinct at1.*
                   from s11.DestinationTree d,
                        s11.DestinationTree_ActionType da,
                        s11.ActionType at1,
                        s11.ActionPropertyType apt,
                        rbPrintTemplate r
                   where d.id in (10042, 10076)
                     and d.id = da.master_id
                     and da.actionType_id = at1.id
                     and at1.deleted = 0
                     and at1.id = apt.actionType_id
                     and apt.deleted = 0
                     and r.context = at1.context) as tmp
                      left join ptd23.ActionType at2 on at2.id = tmp.id
             where at2.id is null)) as tmp
where not exists(select * from ptd23.ActionType where tmp.id = id and tmp.name = name);


insert into ptd23.ActionType(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class,
                             group_id, code, name, title, needReferral, flatCode, sex, age, office, showInForm,
                             genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus,
                             defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                             defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
                             defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                             nomenclativeService_id, isPreferable, prescribedType_id, shedule_id,
                             isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible,
                             propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType,
                             actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES,
                             frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency,
                             isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod,
                             recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked,
                             filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities,
                             isIgnoreEventExecDate, showAPOrg, showAPNotes, defaultIsUrgent, advancePaymentRequired,
                             checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod,
                             withoutAgree, EGISZ_code, consultationTypeId, instrumentalId)
select tmp.*
from (select distinct at1.*
      from s11.DestinationTree d,
           s11.DestinationTree_ActionType da,
           s11.ActionType at1,
           s11.ActionPropertyType apt,
           rbPrintTemplate r
      where d.id in (10042, 10076)
        and d.id = da.master_id
        and da.actionType_id = at1.id
        and at1.deleted = 0
        and at1.id = apt.actionType_id
        and apt.deleted = 0
        and r.context = at1.context) as tmp
         left join ptd23.ActionType at2 on at2.id = tmp.id
where at2.id is null;



insert into ptd23.ActionPropertyType(id, deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id,
                                     typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty,
                                     penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor,
                                     isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner,
                                     isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable,
                                     redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id,
                                     userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam,
                                     customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave, ticketsNeeded,
                                     parent_id)
select tmp.*
from (select distinct apt.*
      from s11.DestinationTree d,
           s11.DestinationTree_ActionType da,
           s11.ActionType at1,
           s11.ActionPropertyType apt,
           rbPrintTemplate r
      where d.id in (10042, 10076)
        and d.id = da.master_id
        and da.actionType_id = at1.id
        and at1.deleted = 0
        and at1.id = apt.actionType_id
        and apt.deleted = 0
        and r.context = at1.context) as tmp
#          left join ptd23.ActionType at2 on at2.id = tmp.id
         left join ptd23.ActionPropertyType apt on apt.id = tmp.id
where apt.id is null;


insert into ptd23.DestinationTree_ActionType(id, master_id, actionType_id, name, popular, idx, hidden)
select tmp.*
from (select distinct da.*
      from s11.DestinationTree d,
           s11.DestinationTree_ActionType da,
           s11.ActionType at1,
           s11.ActionPropertyType apt,
           rbPrintTemplate r
      where d.id in (10042, 10076)
        and d.id = da.master_id
        and da.actionType_id = at1.id
        and at1.deleted = 0
        and at1.id = apt.actionType_id
        and apt.deleted = 0
        and r.context = at1.context) as tmp
left join ptd23.DestinationTree_ActionType da1 on da1.id = tmp.id
where da1.id is null;


select * from ptd23.DestinationTree_ActionType where id =3182

select *
from ptd23.ActionType where id in (20,
14403
);

select *
from ptd23.ActionType where id in(13903,
13924,
13923,
13922,
13920,
13921,
13918,
14376,
14389,
14388,
14397,
14398,
14401,
14402,
14406,
14405,
14404
);


select *
from ptd23.ActionType where id = 13922;

select *
from ActionPropertyType where id = 11046;