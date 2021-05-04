select * from ActionType at2 where at2.class = 0 and at2.deleted = 0 and at2.group_id is null
order by at2.code 




insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, locked, isActiveGroup, lis_code, filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath)
select * from (
select NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
at2.deleted, at2.class, at2.group_id, at3.code, at3.name, at3.name title, at2.flatCode, at2.sex, at2.age, at2.office, at2.showInForm, at2.genTimetable, at2.quotaType_id, at3.code context, at2.amount, at2.amountEvaluation, at2.defaultStatus, at2.defaultDirectionDate, at2.defaultPlannedEndDate, at2.defaultEndDate, at2.defaultExecPerson_id, at2.defaultSetPerson_id, at2.defaultPersonInEvent, at2.defaultPersonInEditor, at2.defaultMKB, at2.defaultMorphology, at2.isMorphologyRequired, at2.defaultOrg_id, at2.showTime, at2.maxOccursInEvent, at2.isMES, at2.nomenclativeService_id, at2.isPreferable, at2.prescribedType_id, at2.shedule_id, at2.isRequiredCoordination, at2.isNomenclatureExpense, at2.hasAssistant, at2.propertyAssignedVisible, at2.propertyUnitVisible, at2.propertyNormVisible, at2.propertyEvaluationVisible, at2.serviceType, at2.actualAppointmentDuration, at2.isSubstituteEndDateToEvent, at2.isPrinted, at2.defaultMES, at2.frequencyCount, at2.frequencyPeriod, at2.frequencyPeriodType, at2.isStrictFrequency, at2.isFrequencyPeriodByCalendar, at2.counter_id, at2.isCustomSum, at2.recommendationExpirePeriod, at2.recommendationControl, at2.isExecRequiredForEventExec, at2.locked, at2.isActiveGroup, at2.lis_code, at2.filledLock, at2.defaultBeginDate, at2.refferalType_id, at2.filterPosts, at2.filterSpecialities, at2.isIgnoreEventExecDate, at2.advancePaymentRequired, at2.checkPersonSet, at2.defaultIsUrgent, at2.checkEnterNote, at2.formulaAlias, at2.isAllowedAfterDeath, at2.isAllowedDateAfterDeath from ActionType at2, 
(select * from (select "16941_1" as `code`, "ПЕРВИЧНЫЙ ОСМОТР ВРАЧА-ЭНДОКРИНОЛОГА" as `name` union select "16941_2" as `code`, "ПОВТОРНЫЙ ОСМОТР ВРАЧА-ЭНДОКРИНОЛОГА")as tmp) as at3
where at2.group_id = 20 group by at3.name) as ins
where not EXISTS (select * from ActionType at3 where at3.name = ins.name and at3.code= ins.code);

select * from ActionType at2 order by id DESC ;


select * from ActionType at2 where at2.id in (43226,43225);


select * from ActionPropertyType apt where apt.actionType_id = 43225;

select * from ActionPropertyType apt order by id desc;

SELECT at.id FROM ActionType at WHERE at.name REGEXP '' AND at.code = '16941_1' AND at.deleted = 0



INSERT ActionPropertyType (actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam)
VALUES (43226, 0, 0, 'line', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', 0, 0, 0, NULL, 0, 0, 0, '', 0, 0, 0, 1, 1, NULL, 0, 0, 0, NULL, 0);




-- INSERT ActionPropertyType (actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam) 
VALUES ((SELECT at.id FROM ActionType at WHERE at.name REGEXP '' AND at.code = '16941_1' AND at.deleted = 0) as temp, 0, 0, 'line', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', 0, 0, 0, NULL, 0, 0, 0, '', 0, 0, 0, 1, 1, NULL, 0, 0, 0, NULL, 0);
