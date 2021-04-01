INSERT INTO ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod) 
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
at2.deleted, at2.class, at2.group_id, '15742' code, 'Осмотр дежурного терапевта диагностического отделения' name, 'Осмотр дежурного терапевта диагностического отделения' title, at2.flatCode, at2.sex, at2.age, at2.office, at2.showInForm, at2.genTimetable, at2.quotaType_id, '15742' context, at2.amount, at2.amountEvaluation, at2.defaultStatus, at2.defaultDirectionDate, at2.defaultPlannedEndDate, at2.defaultEndDate, at2.defaultExecPerson_id, at2.defaultPersonInEvent, at2.defaultPersonInEditor, at2.defaultMKB, at2.defaultMorphology, at2.isMorphologyRequired, at2.defaultOrg_id, at2.maxOccursInEvent, at2.isMES, at2.nomenclativeService_id, at2.showTime, at2.isPreferable, at2.prescribedType_id, at2.shedule_id, at2.isRequiredCoordination, at2.isNomenclatureExpense, at2.hasAssistant, at2.propertyAssignedVisible, at2.propertyUnitVisible, at2.propertyNormVisible, at2.propertyEvaluationVisible, at2.serviceType, at2.actualAppointmentDuration, at2.visible, at2.isSubstituteEndDateToEvent, at2.isPrinted, at2.withoutAgree, at2.defaultMES, at2.frequencyCount, at2.frequencyPeriod, at2.frequencyPeriodType, at2.isStrictFrequency, at2.isFrequencyPeriodByCalendar, at2.counter_id, at2.isCustomSum, at2.recommendationExpirePeriod, at2.recommendationControl, at2.isExecRequiredForEventExec, at2.isActiveGroup, at2.lis_code, at2.locked, at2.filledLock, at2.period, at2.singleInPeriod, at2.checkPeriod, at2.defaultBeginDate, at2.refferalType_id, at2.filterPosts, at2.filterSpecialities, at2.showAPOrg, at2.showAPNotes, at2.isIgnoreEventExecDate, at2.checkPersonSet, at2.formulaAlias, at2.isAllowedAfterDeath, at2.isAllowedDateAfterDeath, at2.eventStatusMod 
-- CONCAT_WS('_', at2.code, at2.name)
-- CONCAT_WS('_', at3.code, at3.name) 
from ActionType at2
-- left join ActionType at3 on at3.group_id = at2.id 
where at2.deleted = 0 and at2.group_id = 22231
ORDER by at2.class, at2.code limit 1

select * from ActionType at2 order by id desc;

INSERT into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select 
apt.deleted, 56115 actionType_id, tmp.idx idx, apt.template_id, tmp.name name, '' shortName, apt.descr, apt.unit_id, 'String' typeName, '' valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias
from ActionType at2
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
join (
SELECT 1 as idx, 'Дата' as name
union
SELECT 2, 'Время'
union
SELECT 3, 'Жалобы на момент осмотра'
union
SELECT 4, 'С анамнезом и данными истории болезни ознакомлен(а)'
union
SELECT 5, 'Состояние'
union
SELECT 6, 'Сознание'
union
SELECT 7, 'Положение в постели'
union
SELECT 8, 'цвет'
union
SELECT 9, 'чистота'
union
SELECT 10, 'Периферические лимфоузлы'
union
SELECT 11, 'Питание'
union
SELECT 12, 'ЧДД в 1 мин.'
union
SELECT 13, 'SaO2 (%):'
union
SELECT 14, 'Над легкими дыхание'
union
SELECT 15, 'Хрипы'
union
SELECT 16, 'Пульс в 1 мин'
union
SELECT 17, 'Характеристики пульса'
union
SELECT 18, 'АД (мм.рт. ст.)'
union
SELECT 19, 'Язык'
union
SELECT 20, 'Живот'
union
SELECT 21, 'Печень'
union
SELECT 22, 'Периферические отеки'
union
SELECT 23, 'Физиологические отправления'
union
SELECT 24, 'Диагноз'
union
SELECT 25, 'Динамика'
union
SELECT 26, 'Дополнительные назначения') tmp
where at2.deleted = 0 and at2.group_id = 22231 
GROUP by tmp.name




SELECT * from 

