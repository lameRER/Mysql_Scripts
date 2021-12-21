select *
from ActionType where id in (84755, 88050, 88056);


set @group_apt_id = 465980;
set @code = '1193-13';

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, needReferral, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, period, singleInPeriod, checkPeriod, isCustomSum, recommendationExpirePeriod, recommendationControl, lis_code, isExecRequiredForEventExec, isActiveGroup, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14, tarifForEgorichev, isAllowedAfterDeath, isAllowedDateAfterDeath)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       at1.deleted,
       class,
       group_id,
       @code code,
       apt.name name,
       apt.name title,
       needReferral,
       flatCode,
       at1.sex,
       at1.age,
       office,
       showInForm,
       genTimetable,
       quotaType_id,
       context,
       amount,
       amountEvaluation,
       defaultStatus,
       defaultDirectionDate,
       defaultPlannedEndDate,
       defaultEndDate,
       defaultExecPerson_id,
       defaultSetPerson_id,
       defaultPersonInEvent,
       defaultPersonInEditor,
       defaultMKB,
       defaultMorphology,
       isMorphologyRequired,
       defaultOrg_id,
       maxOccursInEvent,
       isMES,
       nomenclativeService_id,
       showTime,
       isPreferable,
       prescribedType_id,
       shedule_id,
       isRequiredCoordination,
       isNomenclatureExpense,
       hasAssistant,
       propertyAssignedVisible,
       propertyUnitVisible,
       propertyNormVisible,
       propertyEvaluationVisible,
       serviceType,
       actualAppointmentDuration,
       visible,
       isSubstituteEndDateToEvent,
       isPrinted,
       withoutAgree,
       defaultMES,
       frequencyCount,
       frequencyPeriod,
       frequencyPeriodType,
       isStrictFrequency,
       isFrequencyPeriodByCalendar,
       counter_id,
       period,
       singleInPeriod,
       checkPeriod,
       isCustomSum,
       recommendationExpirePeriod,
       recommendationControl,
       lis_code,
       isExecRequiredForEventExec,
       isActiveGroup,
       locked,
       filledLock,
       refferalType_id,
       defaultBeginDate,
       showAPOrg,
       filterPosts,
       filterSpecialities,
       isIgnoreEventExecDate,
       advancePaymentRequired,
       checkPersonSet,
       defaultIsUrgent,
       checkEnterNote,
       EGISZ_code,
       EGISZ_typecons_code,
       SMS,
       SEMD,
       consultationTypeId,
       at1.formulaAlias,
       instrumentalId,
       old_group_id,
       old_id,
       code_f30,
       code_f14,
       tarifForEgorichev,
       isAllowedAfterDeath,
       isAllowedDateAfterDeath
from ActionType at1,
     ActionPropertyType apt
where at1.id = (select id from ActionType where id = (select actionType_id from ActionPropertyType where id = @group_apt_id))
and apt.id = @group_apt_id;

update
ActionPropertyType
set actionType_id = (select id
from ActionType where name = (select name from ActionPropertyType where id = @group_apt_id)), parent_id = null, visibleInDR = 1
where parent_id = @group_apt_id;

update ActionPropertyType
set typeName = 'Action', valueDomain = @code
where id = @group_apt_id;


select *
from ActionPropertyType where actionType_id = 88056 and typeName regexp 'group|action';

select *
from ActionType where code = @code;

select *
from ActionPropertyType where  actionType_id = (select id from ActionType where code = @code);

select *
from rbPrintTemplate where context in
(select context
from ActionType where id in (84755, 88050, 88056));


select *
from DestinationTree_ActionType where id in (84755, 88050, 88056);

select * from DestinationTree where id = 10199