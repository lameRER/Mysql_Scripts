select *
from rbPrintTemplate where id = 2611;

insert into rbPrintTemplate(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail, useToView, leftMargin)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       code,
       'Наравление-2' name,
       'comptam' context,
       fileName,
       `default`,
       dpdAgreement,
       type,
       hideParam,
       banUnkeptDate,
       counter_id,
       deleted,
       isPatientAgreed,
       groupName,
       documentType_id,
       isEditableInWeb,
       chkProfiles,
       chkPersons,
       pageOrientation,
       sendMail,
       useToView,
       leftMargin
from rbPrintTemplate where id = 1138;


select id, `default`, context
from rbPrintTemplate where id = 2127;


(select id, name
from ActionType where context = 'comptam');
select *
from rbPrintTemplate where context = 'comptam';

insert into rbPrintTemplate(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail, useToView, leftMargin)
select
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       code,
       'Заключение' name,
       'comptam' context,
       fileName,
       `default`,
       dpdAgreement,
       type,
       hideParam,
       banUnkeptDate,
       counter_id,
       deleted,
       isPatientAgreed,
       groupName,
       documentType_id,
       isEditableInWeb,
       chkProfiles,
       chkPersons,
       pageOrientation,
       sendMail,
       useToView,
       leftMargin
from rbPrintTemplate where id = 3312;

update rbPrintTemplate
set context = ''
where id = 2127



insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias)
select
       deleted,
       24121 actionType_id,
       idx,
       template_id,
       name,
       shortName,
       descr,
       unit_id,
       typeName,
       valueDomain,
       defaultValue,
       isVector,
       norm,
       sex,
       age,
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
       ticketsNeeded,
       parent_id,
       customSelect,
       autoFieldUserProfile,
       formulaAlias
from ActionPropertyType where actionType_id = (select id from ActionType where context = '145-2-41') and deleted = 0
