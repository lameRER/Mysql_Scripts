Регис-ХСН-093
Региз-ОНМК-007
Региз-онко-095
Региз-МБ-093
Региз-ВП-091
Региз-covid19-014
Региз
Региз


set @name = 'Регис-ХСН-093';
set @code = '19073';


select *
from ActionType where group_id = 56182



insert into
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       deleted,
       class,
       group_id,
       concat(@code, '-', (select count(code) from ActionType where group_id = 56182 and code regexp @code)+1) code,
       @name name,
       @name title,
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
from ActionType at where at.group_id = 56182 and at.id = (select id from ActionType where group_id = at.group_id order by id desc limit 1)