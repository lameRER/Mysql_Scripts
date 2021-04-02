INSERT into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, hideParam, isEditableInWeb, chkProfiles, chkPersons)
select NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, '15783' code, 'QR' name	, t.context, '' fileName, '' `default`, t.dpdAgreement, t.`type`, t.banUnkeptDate, t.counter_id, t.deleted, t.isPatientAgreed, t.groupName, t.documentType_id, t.hideParam, t.isEditableInWeb, t.chkProfiles, t.chkPersons from rbPrintTemplate t where t.name REGEXP 'qr';


UPDATE Person 
set password =	 md5('')
where id = 1;

UPDATE s11.Person
SET password='4d8556695c262ab91ff51a943fdd6058'
WHERE id=1;



select p.id, p.login, p.password  from Person p where userProfile_id = 1;

select md5('');

select * from rbPrintTemplate rpt order by id desc;


select CONCAT_WS('/', IFNULL(c.lastName,''), ifnull(c.firstName,''), ifnull(c.patrName,''),
    ifnull(DATE_FORMAT(c.birthDate, '%d.%m.%Y'),''), CASE when c.sex = 1 then 'Мужской' when c.sex = 2 then 'Женский' else '' end, 
    ifnull(c.SNILS,''), ifnull(cd.serial,''),ifnull(cd.`number`,''), ifnull(cp.`number`,''), 
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = 'String' then aps.value
    when apt.typeName = 'Date' then apd.value
    when apt.typeName = 'Integer' then api.value
    when apt.typeName = 'Temperature' then apt2.value
	when apt.typeName = 'Reference' then if(apt.valueDomain !='SpravYesNo', apr.value, (SELECT syn.code FROM SpravYesNo syn where syn.id = apr.value)) end, '') separator '/'), ''),
    ifnull(rdt.code,''),ifnull(DATE_FORMAT(cd.`date`, '%d.%m.%Y'),''),ifnull(rpk.code,''),ifnull(ns.SMOCOD,''),
    ifnull(p2.lastName ,''),ifnull(p2.firstName ,''),ifnull(p2.patrName ,''),ifnull(p2.SNILS ,'')) as `client`
from Client c
left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select cd2.id from ClientDocument
cd2 where cd.client_id = cd2.client_id and cd2.deleted = 0 order by cd2.createDatetime desc LIMIT 1)
left join ClientPolicy cp on cp.client_id = c.id and cp.deleted = 0 and cp.id = (select cp2.id from ClientPolicy cp2	
where cp2. client_id= cp.client_id and cp2.deleted = 0 ORDER by cp2.createDatetime desc limit 1)
join Event e on e.client_id = c.id and e.deleted = 0
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 11468
JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id 
left join ActionProperty_String aps on aps.id = ap.id
left join ActionProperty_Integer api on api.id = ap.id
left join ActionProperty_Date apd on apd.id = ap.id
left join ActionProperty_Temperature apt2 on apt2.id = ap.id
left join ActionProperty_Reference apr on apr.id = ap.id
join rbDocumentType rdt on rdt.id = cd.documentType_id 
join rbPolicyKind rpk on rpk.id = cp.policyKind_id 
join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
left join netricaSMO ns on ns.OGRN = o2.OGRN 
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
where c.deleted = 0 and c.id = 1570868
ORDER by apt.idx   

select * from netricaSMO;
select * from Organisation o where o.id = 3741;
select * from rbPolicyKind rpk ;
select * from ClientPolicy cp ;
select * from rbDocumentType rdt ;
    
select ns.SMOCOD  from Organisation o 
join netricaSMO ns on ns.OGRN = o.OGRN 

-- UPDATE 
    select 
--     at2.*
    apt.*
--     apt.id, apt.idx, apt.deleted, apt.name, apt.typeName, apt.valueDomain, apt.penalty
    from 
    ActionType at2
    join ActionPropertyType apt on apt.actionType_id = at2.id
--     set apt.valueDomain = 'SpravYesNo', apt.typeName = 'Reference'
    where at2.code = 'QR' and apt.deleted = 0
    
    
    select * from rbPrintTemplate where id = 390;
    
    select DISTINCT apt.typeName from ActionPropertyType apt order by name ;
   
   
   select * from ActionPropertyType where valueDomain != '';
  
  select DISTINCT apt.typeName from ActionPropertyType apt ;
  
 
 select * from netricaVaccinationType nvt ;
  
  select * from SpravYesNo;
  
--  CREATE table SpravYesNo
  (select * FROM netricaYesN
  o nyn )
select * from ActionPropertyType apt where typeName  = 'Reference';
    
    
--     INSERT into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, isIgnoreEventExecDate, showAPOrg, showAPNotes, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
--     select at2.createDatetime, at2.createPerson_id, at2.modifyDatetime, at2.modifyPerson_id, at2.deleted, at2.class, at2.group_id, at2.code, at2.name, at2.title, at2.flatCode, at2.sex, at2.age, at2.office, at2.showInForm, at2.genTimetable, at2.quotaType_id, at2.context, at2.amount, at2.amountEvaluation, at2.defaultStatus, at2.defaultDirectionDate, at2.defaultPlannedEndDate, at2.defaultEndDate, at2.defaultExecPerson_id, at2.defaultSetPerson_id, at2.defaultPersonInEvent, at2.defaultPersonInEditor, at2.defaultMKB, at2.defaultMorphology, at2.isMorphologyRequired, at2.defaultOrg_id, at2.showTime, at2.maxOccursInEvent, at2.isMES, at2.nomenclativeService_id, at2.isPreferable, at2.prescribedType_id, at2.shedule_id, at2.isRequiredCoordination, at2.isNomenclatureExpense, at2.hasAssistant, at2.propertyAssignedVisible, at2.propertyUnitVisible, at2.propertyNormVisible, at2.propertyEvaluationVisible, at2.serviceType, at2.actualAppointmentDuration, at2.isSubstituteEndDateToEvent, at2.isPrinted, at2.defaultMES, at2.frequencyCount, at2.frequencyPeriod, at2.frequencyPeriodType, at2.isStrictFrequency, at2.isFrequencyPeriodByCalendar, at2.counter_id, at2.isCustomSum, at2.recommendationExpirePeriod, at2.recommendationControl, at2.isExecRequiredForEventExec, at2.isActiveGroup, at2.lis_code, at2.locked, at2.filledLock, at2.defaultBeginDate, at2.refferalType_id, at2.filterPosts, at2.filterSpecialities, at2.isIgnoreEventExecDate, at2.showAPOrg, at2.showAPNotes, at2.advancePaymentRequired, at2.checkPersonSet, at2.defaultIsUrgent, at2.checkEnterNote, at2.formulaAlias, at2.isAllowedAfterDeath, at2.isAllowedDateAfterDeath, at2.eventStatusMod from ActionType at2
--     join ActionPropertyType apt on apt.actionType_id = at2.id
--     where at2.code = 'QR'
--     
--     INSERT into s11.ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, parent_id)
--     select apt.deleted, (select id from ActionType where id = LAST_INSERT_ID()) actionType_id, apt.idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.penaltyDiagnosis, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias, apt.parent_id from ActionType at2
--     join ActionPropertyType apt on apt.actionType_id = at2.id
--     where at2.code = 'QR'



select id from ActionType where id = LAST_INSERT_ID() ;

select * from ActionType at2 where name REGEXP 'qr';

select apt.* from ActionPropertyType apt where apt.actionType_id = 11468 and apt.typeName = 'Reference' group by apt.valueDomain ;


select * from rbPrintTemplate rpt where rpt.name REGEXP 'qr';




select * from ActionType at2 where id = 11468;

SELECT * FROM netricaAccessVaccination;
SELECT * FROM netricaContraindication;
SELECT * FROM netricarbCitizenship;
SELECT * FROM netricaRiskGroup;
SELECT * FROM netricaVaccinationType;
SELECT * FROM SpravYesNo;