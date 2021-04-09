select * from ActionType at2 where at2.flatCode = 'oper_protocol';


select * from ActionType at2 where at2.id = 43604;

select * from ActionPropertyType apt where apt.actionType_id = 49962 and apt.deleted = 0 order by apt.idx;


select apt.customSelect, apt.* from ActionPropertyType apt 
join ActionType at2 on at2.id = apt.actionType_id and at2.id = 49962-- in(49944,49957,49962)
order by at2.id, apt.idx

-- INSERT into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
-- select apt.deleted, apt.actionType_id, max(apt.idx)+1, apt.template_id, 'Примичание' name, apt.shortName, apt.descr, apt.unit_id, 'Text' typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias from ActionPropertyType apt where apt.id = 59037

select * from ActionPropertyType apt where apt.customSelect != '';

select * from Action a where a.actionType_id  in(49944,49957,49962);



select * from Action a where a.event_id = 33796707;

select * from JsonData jd where jd.json REGEXP '100044151'; 

select * from JsonData jd ;

select * from OrgStructure_ActionType osat where osat.actionType_id in(43604);

select * from DestinationTree_ActionType dtat where dtat.actionType_id  in(43604);

select * from DestinationTree dt where id = 1006;

select * from ActionPropertyType apt where apt.actionType_id = 49954 and apt.deleted = 0 ;

select * from Action where id = 100008605;
 33831180



select * from 15_EIS_POL;


select * from OrgStructure os where os.name REGEXP '10';


select * from OrgStructure_Job osj where osj.master_id = 18;


select * from ActionType at2 where at2.id = 100033105;



select at2.name, a.* from Action a
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
where a.event_id = 33796707 and a.deleted = 0



select * from OrgStructure os where os.parent_id = 133


INSERT INTO s11.OrgStructure
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, organisation_id, code, name, parent_id, `type`, net_id, chief_id, headNurse_id, isArea, hasHospitalBeds, hasStocks, hasDayStationary, infisCode, infisInternalCode, infisDepTypeCode, availableForExternal, address, infisTariffCode, inheritEventTypes, inheritActionTypes, inheritGaps, bookkeeperCode, dayLimit, storageCode, salaryPercentage, attachCode, isVisibleInDR, tfomsCode, syncGUID, quota, miacCode, netrica_Code, idLPU_egisz, netrica_Code_UO, netrica_Code_IEMK, attachOperOrgStructure_id)
VALUES(NOW(), NULL, NOW(), NULL, 0, 5268, '7889-7', 'Операционная 7', 133, 0, NULL, NULL, NULL, 0, 0, 0, 0, '', '', '', 0, '', '', 0, 0, 0, '', 0, '', 0, 0, 1, NULL, '', 0, '', NULL, NULL, '', NULL, 18);



select * from OrgStructure os ;

SELECT urldecoder('%7B%22id%22%3A%22100044151')

33796707

select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName), urldecoder(jd.json) from Action a
join Action a2 on a2.id = a.parent_id and a2.deleted = 0
join JsonData jd on jd.json REGEXP a2.id
left join Person p2 on p2.id = REGEXP_REPLACE(urldecoder(jd.json), '.*"assist_name":.?"(\\d+)".*', '\\1')
where a.event_id = 33796707 and a.deleted = 0 order by a.createDatetime desc limit 1



select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) from Action a
join Action a2 on a2.id = a.parent_id and a2.deleted = 0
left join Person p2 on p2.id = a.person_id 
where a.event_id = context.id and a.deleted = 0 and a.actionType_id = 49956 order by a.createDatetime desc limit 1


select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) from Action a
join Action a2 on a2.id = a.parent_id and a2.deleted = 0 
join JsonData jd on jd.json REGEXP a2.id
left join Person p2 on p2.id = REGEXP_REPLACE(urldecoder(jd.json), '.*"assist_name":.?"(\\d+)".*', '\\1')
where a.event_id = context.id and a.deleted = 0 and a.actionType_id = 49940 order by a.createDatetime desc limit 1


SQL="""select CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) from Action a
join Action a2 on a2.id = a.parent_id and a2.deleted = 0
join JsonData jd on jd.json REGEXP a2.id
left join Person p2 on p2.id = REGEXP_REPLACE(urldecoder(jd.json), '.*"assist_name":.?"(\\d+)".*', '\\1')
where a.event_id = context.id and a.deleted = 0 and a.actionType_id = 49940 order by a.createDatetime desc limit 1 ;"""


SELECT MAX(id) FROM urlcodemap

SELECT `encoded` FROM urlcodemap

SELECT lastname FROM Client where id = 4489499

SELECT `decoded` FROM urlcodemap


select * from rbPrintTemplate rpt where rpt.context = '145-11461';

-- drop table urlcodemap


select * from ClientContact cc where cc.client_id = 730748
