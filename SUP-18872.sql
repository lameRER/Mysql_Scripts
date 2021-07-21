insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, period, singleInPeriod, checkPeriod, isCustomSum, recommendationExpirePeriod, recommendationControl, lis_code, isExecRequiredForEventExec, isActiveGroup, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, EGISZ_code, EGISZ_typecons_code, EGISZ_code_required, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId, labTestTypeId, code_f30)
values  (now(), NULL, now(), NULL, 0, 3, null, '4', 'Выписной Эпикриз', 'Выписной Эпикриз', 'epicris', 0, '', '', 1, 0, null, '', 0, 0, 0, 2, 0, 0, null, null, 2, 0, 0, 0, 0, null, 0, 0, null, 0, 0, null, null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 1, 0, 0, 0, null, 2, 1, 0, 0, 0, 0, 0, 0, 0, '', null, 1, null, null, null, null, null, null, '');




select *
from Epicrisis where event_id = 4828948 order by id desc ;


select *
from Action where event_id = 4828948;



select *
from ActionType where id = 18332;



select ActionType.name, Action.*
from Action, ActionType where  event_id =4828948 and actionType_id = ActionType.id;


select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where id = 18332);


select Action.*
from Action where deleted = 0 and createDatetime is null and modifyDatetime is null group by actionType_id;