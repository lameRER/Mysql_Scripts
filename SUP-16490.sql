set @codeat = 0;

INSERT into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, showAPOrg, showAPNotes, isIgnoreEventExecDate, checkPersonSet, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
select NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, at2.deleted, at2.class, at2.group_id, CONCAT("16490-", @codeat:=@codeat+1) code, tmp.name name, tmp.name title, at2.flatCode, at2.sex, at2.age, at2.office, at2.showInForm, at2.genTimetable, at2.quotaType_id, at2.context, at2.amount, at2.amountEvaluation, at2.defaultStatus, at2.defaultDirectionDate, at2.defaultPlannedEndDate, at2.defaultEndDate, at2.defaultExecPerson_id, at2.defaultPersonInEvent, at2.defaultPersonInEditor, at2.defaultMKB, at2.defaultMorphology, at2.isMorphologyRequired, at2.defaultOrg_id, at2.maxOccursInEvent, at2.isMES, at2.nomenclativeService_id, at2.showTime, at2.isPreferable, at2.prescribedType_id, at2.shedule_id, at2.isRequiredCoordination, at2.isNomenclatureExpense, at2.hasAssistant, at2.propertyAssignedVisible, at2.propertyUnitVisible, at2.propertyNormVisible, at2.propertyEvaluationVisible, at2.serviceType, at2.actualAppointmentDuration, at2.visible, at2.isSubstituteEndDateToEvent, at2.isPrinted, at2.withoutAgree, at2.defaultMES, at2.frequencyCount, at2.frequencyPeriod, at2.frequencyPeriodType, at2.isStrictFrequency, at2.isFrequencyPeriodByCalendar, at2.counter_id, at2.isCustomSum, at2.recommendationExpirePeriod, at2.recommendationControl, at2.isExecRequiredForEventExec, at2.isActiveGroup, at2.lis_code, at2.locked, at2.filledLock, at2.period, at2.singleInPeriod, at2.checkPeriod, at2.defaultBeginDate, at2.refferalType_id, at2.filterPosts, at2.filterSpecialities, at2.showAPOrg, at2.showAPNotes, at2.isIgnoreEventExecDate, at2.checkPersonSet, at2.formulaAlias, at2.isAllowedAfterDeath, at2.isAllowedDateAfterDeath, at2.eventStatusMod 	 from ActionType at2,(select '???????????????????????????? ?????????? ????????????, ?? ?????????? ?????? ?????????? ??????????????????' as name
union
select '???????????????????????????? ?????????????? ???????????? ????????????????????????'
union
select '???????????????????????????? ???????????????? ???????????? ????????????????????????'
union
select '???????????????????????????? ??????????????????-?????????????????????? ???????????? ????????????????????????'
union
select '???????????????????????????? ?????????????? ?? ??????????????'
union
select '???????????????????????????? ????????????????????????, ?????????????????????? ???????????????????????? ?? ????????????????'
union
select '???????????????????????????? ??????????????'
union
select '???????????????????????????? ?????????? (??????????)'
union
select '???????????????????????????? ??????????????'
union
select '???????????????????????????? ??????????????'
union
select '???????????????????????????? ???????????????? ??????????'
union
select '???????????????????????????? ???????????????? ?????????? ?? ?????????????? ?????????? (????????????????????)'
union
select '???????????????????????????? ?????????? ???????? '
union
select '???????????????????????????? ?????????? ????????'
union
select '???????????????????????????? ???????????????? ?????????? ?? 2-?? ??????????????????'
union
select '???????????????????????????? ?????????? ?? 2-?? ??????????????????'
union
select '???????????????????????????? ?????????? ?? 2-?? ?????????????????? ?? ??????????????????'
union
select '???????????????????????????? ??????????????-?????????????????????????????? ?????????????? ?? 1 ????????????????'
union
select '???????????????????????????? ??????????????-?????????????????????????????? ?????????????? ?? 2 ??????????????????'
union
select '???????????????????????????? ?????????????????? ??????????????'
union
select '???????????????????????????? ???????????????????????????? ?????????????? '
union
select '???????????????????????????? ?????????????????? ??????????????'
union
select '???????????????????????????? ?????????????????? ??????????????'
union
select '???????????????????????????? ???????????????????? ?????????????? (??????????????????????????)'
union
select '???????????????????????????? ???????????????????????????? ??????????????'
union
select '???????????????????????????? ??????????????????????-???????????????????? ??????????????'
union
select '???????????????????????????? ????????????????-???????????????????? ????????????????????'
union
select '???????????????????????????? ?????????????? ?????????????? ?? ?????????? ????????????????'
union
select '???????????????????????????? ???????????? ?????????????? ?? ?????????????? ???????????????? ?? 1 ????????????????'
union
select '???????????????????????????? ???????????? ?????????????? ?? ?????????????? ???????????????? ?? 2 ????????????????'
union
select '???????????????????????????? ???????????? ?????????????? ?? ?????????????? ???????????????? ?? 3 ??????????????????'
union
select '???????????????????????????? ?????????????????????? ?????????? ???????? '
union
select '???????????????????????????? ?????????????????????? ?????????? ???????? ?? ???????? ??????????????????, ??????'
union
select '???????????????????????????? ?????????????????????? ?????????? ????????, ???????????? ????????, ?? ???????? ??????????????????'
union
select '???????????????????????????? ?????????????????????? ?????????? ???????? ???????????????? ????????????, ?? ???????? ??????????????????'
union
select '???????????????????????????? ????????????'
union
select '???????????????????????? ???????????? ????????????????'
union
select '???????????????????????????? ???????????? ????????????????'
union
select '???????????????????????? ?? ?????????????????????????????????? ????????????????????????????'
union
select '???????????????????????????? ???????????????? ?? ?????????????????????? ??????????????????'
union
select '???????????????????????????? ?????????????? ?? ???????????????????????????????????? ??????????'
union
select '???????????????????????????? ?????????????? ?? ???????????????????????????????????? ??????????, ?????????????? ????????????????'
union
select '???????????????????????????? ?????????????? ?????????? ?????????????? ??????????????'
union
select '???????????????????????????????? ?????????????????????? ?????????????????? ???? ??????????????, ???????????? ?? ?????????????????? ??????????'
union
select '?????????????????????? ???????????????????????????? ???????????? ??????????'
union
select '????????????????????????'
union
select '???????????????????????????????? ?????????????????????? ?????????????????? ???? ???????????????? ??????????????????'
union
select '????????????????????????????????????????????'
union
select '???????????????????????????? ???????????????? ?????????? (????????????, ??????????, ????????????????)'
union
select '???????????????????????? ?????????????????? ?? ??????????????????'
union
select '???????????????????????? ??????????????????????'
union
select '???????????????????????? ????????????????????????????????????'
union
select '???????????????????? ?? ?????????????? ?????????????????????? ?????????????????????? ?????? ????????????????????????????????????'
union
select '???????????????????????? ??????????????????????????????????'
union
select '??????????????????????'
union
select '????????????????????????????????????'
union
select '???????????????????????? ????????????????????'
union
select '?????????????????????? ????????????????????????????????????'
union
select '???????????????? ?????????????????? (???????????????????????????? ?????????????????????????????????? ??????????????)'
union
select '???????????????? ?? ?????????????????????????? ?????????????????????????????????????? ??????????????????????'
union
select '???????????????? ???????????? ?????????????? ?????????????? ?? ?????????????? ???????????? ????????'
union
select '??????????????????????????') as tmp
where at2.id = 49896


select apt.deleted, at2.id actionType_id, apt.idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias from ActionType at2 
left join ActionPropertyType apt on apt.actionType_id = at2.id
where at2.group_id = 49895

select * from ActionType at2 where at2.name = '??????????????';

select * from ActionType at2 where at2.group_id  = 49895;


insert into OrgStructure_ActionType (master_id, idx, actionType_id)
select * from 
(select osat.master_id, osat.idx, at2.id actionType_id from OrgStructure_ActionType osat, ActionType at2 
where osat.actionType_id = 49896 and at2.group_id = 49895) as tmp
where not EXISTS (select * from OrgStructure_ActionType osat2 where osat2.actionType_id = tmp.actionType_id )


INSERT into rbJobType_ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, master_id, actionType_id, selectionGroup, onDayLimit)
select * from 
(select NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, rjtat.master_id, at2.id actionType_id, rjtat.selectionGroup, rjtat.onDayLimit from rbJobType_ActionType rjtat, ActionType at2 
where rjtat.actionType_id = 49896 and at2.group_id = 49895) as tmp
where not EXISTS (select * from rbJobType_ActionType rjtat2 where rjtat2.actionType_id = tmp.actionType_id)


INSERT into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
(select * from 
(select apt.deleted, at2.id actionType_id, apt.idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias from ActionPropertyType apt, ActionType at2
where apt.actionType_id = 49896 and at2.group_id = 49895) as tmp
where not EXISTS (select * from ActionPropertyType apt2 where apt2.actionType_id = tmp.actionType_id))

insert into DestinationTree_ActionType (master_id, actionType_id, name, popular)
select * from (
select dtat.master_id, at2.id actionType_id, at2.name name, dtat.popular from ActionType at2, DestinationTree_ActionType dtat 
where at2.group_id = 49895 and dtat.id =4602) as tmp
where not EXISTS (select * from DestinationTree_ActionType dtat2 where dtat2.actionType_id = tmp.actionType_id)


select * from DestinationTree_ActionType dtat order by id desc;



select * from Person p where p.userProfile_id = 26 and p.Test_Person = 1;
