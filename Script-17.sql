select apt.* from ActionPropertyType apt where apt.actionType_id = 49954 and apt.deleted = 0 order by idx;

select * from rbPrintTemplate rpt where EXISTS (select at2.* from ActionType at2 where at2.id = 49954 and rpt.context=at2.context);


select * from rbPrintTemplate rpt where `default` REGEXP 'Документ' order by id DESC ;




set @return = 49954;
INSERT LOW_PRIORITY INTO ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
SELECT NOW(), NULL, NOW(), NULL, deleted, class, group_id, 'id=49954(copy)', 'Протокол операции', 'Протокол операции', 'oper_protocol', sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where id = @return

INSERT LOW_PRIORITY INTO ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select deleted, 49962, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias from ActionPropertyType where actionType_id = @return and deleted=0;


select * from ActionType at2 order by id desc;
select * from ActionPropertyType apt where apt.actionType_id = 49962;






select  a.* from Action a 
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.name REGEXP 'Движение|выписка'
where EXISTS (select * from Event e where e.client_id = 846712 and deleted = 0 and a.event_id = e.id) 
and a.deleted = 0
order by a.createDatetime DESC;


UPDATE s11.`Action`
	SET deleted=1
	WHERE id=99443840;
UPDATE s11.`Action`
	SET endDate=NULL,status=0
	WHERE id=98465127;
	




select * from DestinationTree_ActionType dtat where actionType_id = 49954;


--  Auto-generated SQL script #202101251213
UPDATE s11.DestinationTree_ActionType
	SET name='Протокол операции (10 отд)'
	WHERE id=4685;
