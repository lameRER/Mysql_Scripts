select *
from rbPrintTemplate
where name regexp '';



select *
from ActionPropertyType apt
where apt.isVitalParam = 1;

select *
from DestinationTree_ActionType
where actionType_id in (
    select id
    from ActionType
    where name regexp 'cov')
;


select *
from DestinationTree
where id = 10070;


select *
from ActionType
where id in (49882, 49883, 49886, 49887, 49885);


select *
from rbPrintTemplate
where context = 'SARS';



select context
from ActionType
WHERE ID = 49901;


select id,
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       deleted,
       class,
       group_id,
       code,
       name,
       title,
       flatCode,
       sex,
       age,
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
       isCustomSum,
       recommendationExpirePeriod,
       recommendationControl,
       isExecRequiredForEventExec,
       isActiveGroup,
       lis_code,
       locked,
       filledLock,
       period,
       singleInPeriod,
       checkPeriod,
       defaultBeginDate,
       refferalType_id,
       filterPosts,
       filterSpecialities,
       showAPOrg,
       showAPNotes,
       isIgnoreEventExecDate,
       checkPersonSet,
       formulaAlias,
       isAllowedAfterDeath,
       isAllowedDateAfterDeath,
       eventStatusMod
from ActionType where context = 'SARS';

select * from ActionPropertyType where actionType_id=49885 and deleted= 0

select *
from ActionPropertyType
where actionType_id = 49901
  and deleted = 0;

select *
from rbPrintTemplate
where context = '145-9957';


