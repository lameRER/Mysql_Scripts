select * from ActionType at2 where at2.group_id is NULL and at2.deleted = 0 order by at2.class, code ;


insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
select
NOW()  createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, group_id, '17026' code, 'РЕГИЗ' name, 'РЕГИЗ' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1;


select * from ActionType at2 order by at2.id desc;


insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-1' code, 'Осмотр пациентов с ОНМК (врача приемного отделения)' name, 'Осмотр пациентов с ОНМК (врача приемного отделения)' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-1' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-2' code, 'Результаты КТ' name, 'Результаты КТ' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-2' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-3' code, 'Результаты УЗИ' name, 'Результаты УЗИ' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-3' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-4' code, 'Осмотр врача реанимации перед переводом на отделение' name, 'Осмотр врача реанимации перед переводом на отделение' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-4' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-5' code, 'Протокол операции РХМДиЛ' name, 'Протокол операции РХМДиЛ' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-5' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-6' code, 'Осмотр пациента с ОНМК (лечащего врача стационара) ' name, 'Осмотр пациента с ОНМК (лечащего врача стационара) ' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-6' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)
union
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-7' code, 'Результат контрольной КТ (при наличии)' name, 'Результат контрольной КТ (при наличии)' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-7' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)



insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
(select
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
deleted, class, 56182 group_id, '17026-8' code, 'Выписной эпикриз' name, 'Выписной эпикриз' title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, '17026-8' context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod from ActionType where class = 0 and deleted = 0 order by id desc limit 1)


select * from ActionType at2 where at2.group_id = 56182;



SELECT apt.name FROM ActionPropertyType apt JOIN ActionType at ON apt.actionType_id = at.id WHERE at.name REGEXP '' AND at.code = '17026-1' AND apt.deleted = 0 ORDER BY apt.idx

select * from ActionPropertyType apt where apt.actionType_id =56190;

;

UPDATE 
rbPrintTemplate rpt 
set `default` = REGEXP_REPLACE(rpt.`default`, '(.*)(<b.*client.*)', '\\1{if: client}\\2{end:}')
where rpt.context in (select at2.context from ActionType at2 where at2.group_id =56182);

select REGEXP_REPLACE(rpt.`default`, '(.*)(<b.*client.*)', '\\1{if: client}\\2{end:}'), rpt.* from rbPrintTemplate rpt where rpt.context in (select at2.context from ActionType at2 where at2.group_id =56182);

select REGEXP_REPLACE(rpt.`default`, '(\{client.fullName\}|\{client.birthDate\}|\{client.age\})', '{if: client}\\1{end:}'), rpt.`default` from rbPrintTemplate rpt where rpt.`default` REGEXP 'client.fullName' and REGEXP_SUBSTR(rpt.`default`, '.*client.fullName.*client.birthDate.*client.age.*') != '';



insert into rbVitalParams (code, name, possible_values, dict_OID)
select * from (
select code, name, `type`, IF(sprav !='', sprav,  NULL) from TempVital
) as tmp
where not EXISTS (select * from rbVitalParams rvp where rvp.code = tmp.code)

use s11;

select apt.id, apt.penalty, apt.name, apt.typeName, apt.valueDomain, apt.unit_id, rvp.code, rvp.name, rvp.possible_values, rvp.dict_OID from ActionPropertyType apt 
join rbVitalParams rvp on rvp.id = apt.vitalParamId -- and rvp.possible_values != 'Справочник'
where apt.actionType_id in 
(select at2.id from ActionType at2 where at2.group_id =56182) and apt.isVitalParam = 1 ORDER by apt.actionType_id, apt.idx ;


select * from ActionPropertyType apt where apt.vitalParamId = 766;


select * from rbVitalParams where code ='601';



select * from OrgStructure os ;


select * from ActionType at2 where at2.group_id = 56182 and at2.id not in(56183,56186,56187,56188,56190,56185);

set @act = ;

-- INSERT into OrgStructure_ActionType (master_id, idx, actionType_id)
select osat.master_id, osat.idx+1, @act actionType_id from OrgStructure_ActionType osat where master_id in (72) and id = (select max(osat2.id) from OrgStructure_ActionType osat2 where osat2.master_id= osat.master_id);

-- INSERT into rbJobType_ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, actionType_id, selectionGroup, onDayLimit)
select NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, rjtat.master_id, @act actionType_id, rjtat.selectionGroup, rjtat.onDayLimit from rbJobType_ActionType rjtat where rjtat.master_id = 107 and id = (select max(rjtat2.id) from rbJobType_ActionType rjtat2 where rjtat2.master_id = rjtat.master_id);

-- insert into DestinationTree_ActionType (master_id, actionType_id, name, popular)
select master_id, @act actionType_id, (select at2.name from ActionType at2 where at2.id = @act) name, popular from DestinationTree_ActionType where master_id = 10029 LIMIT 1;

select * from rbJobType rjt ;

select * from DestinationTree dt where deleted = 0 and id = 10029;

select * from OrgStructure os where os.id = 72


select * from DestinationTree_ActionType dtat where master_id = 10029 ORDER by id DESC ;


select * from ActionType at2 where at2.name = 'Ультразвуковое исследование почек v2';

insert into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select apt.deleted, 56185 actionType_id, (select max(apt2.idx)+1 from ActionPropertyType apt2 where apt2.actionType_id  = @act) idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias from ActionPropertyType apt where apt.actionType_id =45743 and apt.deleted = 0 and apt.id  =52515;
			





select * from netricaYesNo nyn ;

select * from rbUnit ru WHERE ru.code REGEXP 'мм/';

select * from ;

select * from netricaLocalProcess nlp ;

select * from ActionPropertyType apt where apt.vitalParamId is not null and apt.name ='Гражданство';\

select * from Event e where e.id = 33845840;

select * from Action a where a.event_id in(select e.event_id from Epicrisis e where e.name ='Выписной эпикриз') and a.actiontype_id =15079 ORDER by a.id desc;


select * from Epicrisis e order by e.id DESC ;

select * from ActionType at2 where at2.name ='выписка';


select * from  OrgStructure os ;


select * from OrgStructure where name REGEXP 'РХМДиЛ';





