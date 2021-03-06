
insert into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, hideParam, isEditableInWeb, chkProfiles, chkPersons)
select *
from
(select
       now() as createDatetime,
       NULL as createPerson_id,
       now() as modifyDatetime,
       NULL modifyPerson_id,
       'SUP-20258' as code,
       'Протокол установления факта смерти человека' as name,
       'SUP-20258' as context,
       '' as fileName,
       '' as `default`,
       dpdAgreement,
       type,
       banUnkeptDate,
       counter_id,
       deleted,
       isPatientAgreed,
       groupName,
       documentType_id,
       hideParam,
       isEditableInWeb,
       chkProfiles,
       chkPersons
from rbPrintTemplate order by id desc limit 1 ) as tmp
where not exists(select * from rbPrintTemplate where name = tmp.name and code = tmp.code);


select *
from rbPrintTemplate where id = 654;

set @name = 'Протокол сердечно-лёгочной реанимации';
set @code = 'SUP-20258';

insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, isIgnoreEventExecDate, showAPOrg, showAPNotes, defaultIsUrgent, advancePaymentRequired, checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
select *
from
(select
       NOW() createDatetime,
       NULL createPerson_id,
       now() modifyDatetime,
       NULL modifyPerson_id,
       deleted,
       class,
       group_id,
       @code as code,
       @name as name,
       'Протокол сердечно-лёгочной реанимации' as title,
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
       defaultSetPerson_id,
       defaultPersonInEvent,
       defaultPersonInEditor,
       defaultMKB,
       defaultMorphology,
       isMorphologyRequired,
       defaultOrg_id,
       showTime,
       maxOccursInEvent,
       isMES,
       nomenclativeService_id,
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
       isSubstituteEndDateToEvent,
       isPrinted,
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
       defaultBeginDate,
       refferalType_id,
       filterPosts,
       filterSpecialities,
       isIgnoreEventExecDate,
       showAPOrg,
       showAPNotes,
       defaultIsUrgent,
       advancePaymentRequired,
       checkEnterNote,
       formulaAlias,
       isAllowedAfterDeath,
       isAllowedDateAfterDeath,
       eventStatusMod
from ActionType where group_id is null order by id desc limit 1) as tmp
where not exists(select * from ActionType where name = tmp.name and code = tmp.code);

drop temporary table if exists temp_apt;
create temporary table if not exists temp_apt(
select * from
    (select 'Манипуляции' as name union
    select 'Описание') as tmp
);


INSERT INTO ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave)
select *
from
     (select
             0 deleted,
             at1.id actionType_id,
             row_number() over ()-1 as idx,
             template_id,
             ta.name name,
             shortName,
             descr,
             unit_id,
             if(ta.name = 'Манипуляции', 'Action', 'String') as typeName,
             valueDomain,
             defaultValue,
             isVector,
             norm,
             apt.sex,
             apt.age,
             penalty,
             penaltyUserProfile,
             penaltyDiagnosis,
             visibleInJobTicket,
             visibleInTableRedactor,
             isAssignable,
             test_id,
             defaultEvaluation,
             canChangeOnlyOwner,
             isActionNameSpecifier,
             laboratoryCalculator,
             inActionsSelectionTable,
             redactorSizeFactor,
             isFrozen,
             typeEditable,
             visibleInDR,
             userProfile_id,
             userProfileBehaviour,
             copyModifier,
             isVitalParam,
             vitalParamId,
             isODIIParam,
             customSelect,
             autoFieldUserProfile,
             apt.formulaAlias,
             incrementOnSave
      from ActionPropertyType apt, ActionType at1, temp_apt ta
      where apt.id = (select id from ActionPropertyType where typeName = 'string' limit 1) and at1.name = @name and at1.code = @code
    ) as tmp
where not exists(select * from ActionPropertyType where tmp.actionType_id = actionType_id and tmp.name = name and deleted = tmp.deleted);

select apt.*
from ActionPropertyType apt
join ActionType at1 on at1.id = apt.actionType_id and at1.name = @name and at1.code = @code;


set @code1 = 'IMP-343';
set @name1 = 'Манипуляции';

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, isIgnoreEventExecDate, showAPOrg, showAPNotes, defaultIsUrgent, advancePaymentRequired, checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
select *
from (
         select
                now() as createDatetime,
                NULL as createPerson_id,
                now() as modifyDatetime,
                NULL modifyPerson_id,
                deleted,
                class,
                group_id,
                @code1 as code,
                @name1 as name,
                @name1 as title,
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
                defaultSetPerson_id,
                defaultPersonInEvent,
                defaultPersonInEditor,
                defaultMKB,
                defaultMorphology,
                isMorphologyRequired,
                defaultOrg_id,
                showTime,
                maxOccursInEvent,
                isMES,
                nomenclativeService_id,
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
                isSubstituteEndDateToEvent,
                isPrinted,
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
                defaultBeginDate,
                refferalType_id,
                filterPosts,
                filterSpecialities,
                isIgnoreEventExecDate,
                showAPOrg,
                showAPNotes,
                defaultIsUrgent,
                advancePaymentRequired,
                checkEnterNote,
                formulaAlias,
                isAllowedAfterDeath,
                isAllowedDateAfterDeath,
                eventStatusMod
         from ActionType where name = @name and code = @code
         ) as tmp
where not exists(select 8 from ActionType where name = tmp.name and code = tmp.code and tmp.deleted = deleted);

drop temporary table if exists temp_apt;
create temporary table if not exists temp_apt(
    select * from
        (select 'Дата' as name union
         select 'Манипуляция') as tmp
);

insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave, ticketsNeeded, parent_id)
select *
from
(select
       0 deleted,
       at1.id actionType_id,
       row_number() over ()-1 idx,
       template_id,
       tp.name name,
       shortName,
       descr,
       unit_id,
       typeName,
       valueDomain,
       defaultValue,
       isVector,
       norm,
       apt.sex,
       apt.age,
       penalty,
       penaltyUserProfile,
       penaltyDiagnosis,
       visibleInJobTicket,
       visibleInTableRedactor,
       isAssignable,
       test_id,
       defaultEvaluation,
       canChangeOnlyOwner,
       isActionNameSpecifier,
       laboratoryCalculator,
       inActionsSelectionTable,
       redactorSizeFactor,
       isFrozen,
       typeEditable,
       visibleInDR,
       userProfile_id,
       userProfileBehaviour,
       copyModifier,
       isVitalParam,
       vitalParamId,
       isODIIParam,
       customSelect,
       autoFieldUserProfile,
       apt.formulaAlias,
       incrementOnSave,
       ticketsNeeded,
       parent_id
from ActionPropertyType apt, ActionType at1, temp_apt tp
where at1.name = @name1 and at1.code = @code1 and apt.id = (select id from ActionPropertyType where typeName = 'String' limit 1)) as tmp
where not exists(select * from ActionPropertyType where name = tmp.name and actionType_id = tmp.actionType_id and deleted = tmp.deleted);