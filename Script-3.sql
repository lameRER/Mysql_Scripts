select * from Person p ;
select * from temp_person1 p ;
select * from temp_person2 tp ;
select * from temp_person5 tp where tp.фамилия REGEXP 'Чу';



select c.lastName , c.firstName , c.patrName 
from Client c 
join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName -- and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
-- where c.lastName REGEXP '^чу'


select * from Client c where c.id in(482241,482850,482347);


-- join temp_person1 tp on tp.фамилия = c.lastName and tp.имя = c.firstName and tp.отчество = c.patrName 


-- insert INTO ClientDocument(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, documentType_id, serial, `number`, `date`, origin)
select NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, c.id client_id, 1 documentType, IFNULL(REGEXP_REPLACE(tp2.серия, '([0-9][0-9])([0-9][0-9])', '\\1 \\2'),'') serial, IFNULL(tp2.`номер пас`, '') `number`, 
IFNULL(STR_TO_DATE(REGEXP_REPLACE(tp2.`дата выд`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'),'0000-00-00 00:00:00') `date`, '' origin from Client c 
left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select max(cd2.id) from ClientDocument cd2 where cd2.client_id = c.id ORDER by cd2.id desc)
join temp_person2 tp2 on tp2.фамилия = c.lastName and tp2.имя= c.firstName and tp2.отчество = c.patrName-- and c.birthDate = REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+)-([0-9]+)-([0-9]+).*', '\\1-\\2-\\3')
where c.deleted = 0


-- INSERT into ClientPolicy(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, insurer_id, policyType_id, policyKind_id, serial, `number`, begDate, endDate, dischargeDate, name, note, insuranceArea, isSearchPolicy, franchisePercent)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, c.id client_id, NULL insurer_id, 1 policyType_id, case when tp2.`серия полиса` is null then 3 else 2 end policyKind_id, ifnull(tp2.`серия полиса`, '') serial, tp2.`номер полиса` `number`, '0000-00-00' begDate, '0000-00-00' endDate, null dischargeDate, '' name, '' note, '' insuranceArea, 0 isSearchPolicy, 0 franchisePercent 
from Client c 
left join ClientPolicy cp on cp.client_id = c.id and cp.id = (select MAX(cp2.id) from ClientPolicy cp2 where cp2.client_id = c.id GROUP by cp2.client_id)
join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя= c.firstName and tp2.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
where c.deleted = 0


INSERT into Event (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, externalId, eventType_id, org_id, client_id, contract_id, prevEventDate, setDate, setPerson_id, execDate, execPerson_id, isPrimary, `order`, result_id, nextEventDate, payStatus, typeAsset_id, note, curator_id, assistant_id, pregnancyWeek, MES_id, HTG_id, KSG_id, mesSpecification_id, relegateOrg_id, totalCost, patientModel_id, cureType_id, cureMethod_id, prevEvent_id, littleStranger_id, referral_id, armyReferral_id, goal_id, outgoingOrg_id, outgoingRefNumber, hmpKind_id, hmpMethod_id, eventCostPrinted, exposeConfirmed, ZNOFirst, ZNOMorph, hospParent, clientPolicy_id, isClosed, dispByMobileTeam, duration, isPrivacyGuaranteeSigned, orgStructure_id, MSE)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, tp2.`№ карты` externalId, 101 eventType_id, 386271 org_id, c.id client_id, 1 contract_id, e2.prevEventDate, CURDATE() setDate, NULL setPerson_id, NULL execDate, NULL execPerson_id, 1 isPrimary, 1 `order`, NULL result_id, NULL nextEventDate, 0 payStatus, e2.typeAsset_id, '' note, e2.curator_id, e2.assistant_id, 0 pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, 0 totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, 0 eventCostPrinted, 0 exposeConfirmed, 0 ZNOFirst, 0 ZNOMorph, 0 hospParent, e2.clientPolicy_id, 0 isClosed, 0 dispByMobileTeam, e2.duration, 0 isPrivacyGuaranteeSigned, e2.orgStructure_id, 0 MSE 
from Client c 
left join Event e2 on e2.client_id = c.id and e2.eventType_id = 101
join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
WHERE e2.id is null 

INSERT into Diagnosis(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, diagnosisType_id, character_id, MKB, MKBEx, morphologyMKB, TNMS, dispanser_id, traumaType_id, setDate, endDate, mod_id, person_id)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, e.client_id client_id, 18 diagnosisType_id, d2.character_id, 'Z00.0' MKB, '' MKBEx, '' morphologyMKB, '' TNMS, d2.dispanser_id, d2.traumaType_id, CURDATE() setDate, CURDATE() endDate, d2.mod_id, d2.person_id 
from Client c 
join Event e on e.client_id = c.id and e.deleted = 0 and e.eventType_id = 101
left join Diagnostic d on d.event_id = e.id and d.diagnosisType_id = 18
left join Diagnosis d2 on d.diagnosis_id = d2.id
where d2.id is null

INSERT into Diagnostic (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, event_id, diagnosis_id, TNMS, diagnosisType_id, character_id, stage_id, phase_id, dispanser_id, sanatorium, hospital, traumaType_id, speciality_id, person_id, healthGroup_id, result_id, setDate, endDate, notes, assistant_id, medicalGroup_id, status, org_id)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, e.id event_id, d2.id diagnosis_id, '' TNMS, 18 diagnosisType_id, d.character_id, d.stage_id, d.phase_id, d.dispanser_id, 0 sanatorium, 0 hospital, d.traumaType_id, d.speciality_id, d.person_id, d.healthGroup_id, d.result_id, CURDATE() setDate, CURDATE() endDate, '' notes, d.assistant_id, d.medicalGroup_id, d.status, d.org_id 
from Client c 
join Event e on e.client_id = c.id and e.deleted = 0 and e.eventType_id = 101
left join Diagnostic d on d.event_id = e.id and d.diagnosisType_id = 18
left join Diagnosis d2 on d2.client_id = c.id and d2.MKB = 'Z00.0' and d2.diagnosisType_id = 18
where d.id is null



select
*
from Client c 
join Event e on e.client_id = c.id and e.deleted = 0 and e.eventType_id = 101
join Diagnostic d on d.event_id = e.id and d.diagnosisType_id = 18
 join Diagnosis d2 on d.diagnosis_id = d2.id






select * from Event e where e.eventType_id = 101;


select * from Event e where e.externalId = '9134132';




select * from  MKB m ;
select * from Diagnosis d where d.createDatetime = '2021-02-24 10:14:54' order by id desc;
select * from Diagnostic d where d.createDatetime = '2021-02-24 10:27:56' order by id desc;


select * from Event e 
left join Diagnostic d2 on d2.event_id = e.id
where e.id = 519142


select * from cl;



select * from ClientPolicy cp order by id desc;


select MAX(cp2.id) from ClientPolicy cp2 where cp2.client_id = 15856 GROUP by cp2.client_id


select * from temp_person2 tp ;


select * from Organisation o where o.shortName REGEXP 'медстрах'
-- join temp_person1 tp on tp.`страхов.компания` REGEXP o.fullName 

select * from ClientDocument cd order by id desc;
-- 2021-02-20 11:07:39

select * from rbPolicyType rpt ;

select * from ClientDocument cd where cd.client_id =15856 ;

SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");
select * from temp_person1 tp 
join temp_person2 tp2 on tp.фамилия = tp2.фамилия and tp.имя = tp2.имя 

select * from kladr.KLADR k where NAME = 'москва';



select * from Event e 
join Client c on c.id = e.client_id 



UPDATE Event e 
join Client c ON c.id = e.client_id and c.deleted = 0
join temp_person1 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName
set e.externalId = tp2.`внешний идентификатор` 
where e.deleted = 0 and e.eventType_id = 101 and (e.externalId = '' or e.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL

UPDATE Event e 
join Client c ON c.id = e.client_id and c.deleted = 0
join temp_person3 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName
set e.externalId = tp2.`внешний идентификатор` 
where e.deleted = 0 and e.eventType_id = 101 and (e.externalId = '' or e.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL

UPDATE Event e 
join Client c ON c.id = e.client_id and c.deleted = 0
join temp_person4 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName
set e.externalId = tp2.`внешний идентификатор` 
where e.deleted = 0 and e.eventType_id = 101 and (e.externalId = '' or e.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL

UPDATE Event e 
join Client c ON c.id = e.client_id and c.deleted = 0
join temp_person4 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName
set e.externalId = tp2.`внешний идентификатор` 
where e.deleted = 0 and e.eventType_id = 101 and (e.externalId = '' or e.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL



select e2.id,e2.client_id, e2.createDatetime, e2.createPerson_id, e2.modifyDatetime, e2.modifyPerson_id, e2.deleted, tp2.`внешний идентификатор`, e2.externalId, e2.eventType_id, e2.org_id, e2.client_id, e2.contract_id, e2.prevEventDate, e2.setDate, e2.setPerson_id, e2.execDate, e2.execPerson_id, e2.isPrimary, e2.`order`, e2.result_id, e2.nextEventDate, e2.payStatus, e2.typeAsset_id, e2.note, e2.curator_id, e2.assistant_id, e2.pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, e2.totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, e2.eventCostPrinted, e2.exposeConfirmed, e2.ZNOFirst, e2.ZNOMorph, e2.hospParent, e2.clientPolicy_id, e2.isClosed, e2.dispByMobileTeam, e2.duration, e2.isPrivacyGuaranteeSigned, e2.orgStructure_id, e2.MSE from Client c 
join temp_person1 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName 
join Event e2 on e2.client_id = c.id and e2.id in (select max(e3.id) from Event e3 where e3.eventType_id = 101 GROUP by e3.client_id)
where e2.eventType_id = 101  and (e2.externalId = '' or e2.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL


select e2.id,e2.client_id, e2.createDatetime, e2.createPerson_id, e2.modifyDatetime, e2.modifyPerson_id, e2.deleted, tp2.`внешний идентификатор`, e2.externalId, e2.eventType_id, e2.org_id, e2.client_id, e2.contract_id, e2.prevEventDate, e2.setDate, e2.setPerson_id, e2.execDate, e2.execPerson_id, e2.isPrimary, e2.`order`, e2.result_id, e2.nextEventDate, e2.payStatus, e2.typeAsset_id, e2.note, e2.curator_id, e2.assistant_id, e2.pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, e2.totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, e2.eventCostPrinted, e2.exposeConfirmed, e2.ZNOFirst, e2.ZNOMorph, e2.hospParent, e2.clientPolicy_id, e2.isClosed, e2.dispByMobileTeam, e2.duration, e2.isPrivacyGuaranteeSigned, e2.orgStructure_id, e2.MSE from Client c 
left join temp_person3 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName 
join Event e2 on e2.client_id = c.id and e2.id in (select max(e3.id) from Event e3 where e3.eventType_id = 101 GROUP by e3.client_id)
where e2.eventType_id = 101 and (e2.externalId = '' or e2.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL

select e2.id,e2.client_id, e2.createDatetime, e2.createPerson_id, e2.modifyDatetime, e2.modifyPerson_id, e2.deleted, tp2.`внешний идентификатор`, e2.externalId, e2.eventType_id, e2.org_id, e2.client_id, e2.contract_id, e2.prevEventDate, e2.setDate, e2.setPerson_id, e2.execDate, e2.execPerson_id, e2.isPrimary, e2.`order`, e2.result_id, e2.nextEventDate, e2.payStatus, e2.typeAsset_id, e2.note, e2.curator_id, e2.assistant_id, e2.pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, e2.totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, e2.eventCostPrinted, e2.exposeConfirmed, e2.ZNOFirst, e2.ZNOMorph, e2.hospParent, e2.clientPolicy_id, e2.isClosed, e2.dispByMobileTeam, e2.duration, e2.isPrivacyGuaranteeSigned, e2.orgStructure_id, e2.MSE from Client c 
left join temp_person4 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName 
join Event e2 on e2.client_id = c.id and e2.id in (select max(e3.id) from Event e3 where e3.eventType_id = 101 GROUP by e3.client_id)
where e2.eventType_id = 101 and (e2.externalId = '' or e2.externalId = tp2.`внешний идентификатор`) and tp2.`внешний идентификатор` is not NULL

select e2.id,e2.client_id, e2.createDatetime, e2.createPerson_id, e2.modifyDatetime, e2.modifyPerson_id, e2.deleted, tp2.`№ карты`, e2.externalId, e2.eventType_id, e2.org_id, e2.client_id, e2.contract_id, e2.prevEventDate, e2.setDate, e2.setPerson_id, e2.execDate, e2.execPerson_id, e2.isPrimary, e2.`order`, e2.result_id, e2.nextEventDate, e2.payStatus, e2.typeAsset_id, e2.note, e2.curator_id, e2.assistant_id, e2.pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, e2.totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, e2.eventCostPrinted, e2.exposeConfirmed, e2.ZNOFirst, e2.ZNOMorph, e2.hospParent, e2.clientPolicy_id, e2.isClosed, e2.dispByMobileTeam, e2.duration, e2.isPrivacyGuaranteeSigned, e2.orgStructure_id, e2.MSE from Client c 
left join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName 
join Event e2 on e2.client_id = c.id and e2.id in (select max(e3.id) from Event e3 where e3.eventType_id = 101 GROUP by e3.client_id)
where e2.eventType_id = 101 and e2.externalId != tp2.`№ карты` -- (e2.externalId = '' or e2.externalId = tp2.`№ карты`) and tp2.`№ карты` is not NULL


-- STR_TO_DATE(REGEXP_REPLACE(tp1.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')




INSERT INTO Client (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, attendingPerson_id, deleted, lastName, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodType_id, bloodDate, bloodNotes, growth, weight, embryonalPeriodWeek, birthPlace, diagNames, chartBeginDate, rbInfoSource_id, notes, IIN, isUnconscious, hasImplants, hasProsthesis)
(select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
NULL attendingPerson_id, 0 deleted, tp.lastName, tp.firstName, tp.patrName, tp.birthDate, '00:00:00' birthTime, 0 sex, '' SNILS, NULL bloodType_id, NULL bloodDate, '' bloodNotes, 0 growth, 0 weight, 0 embryonalPeriodWeek, '' birthPlace, '' diagNames, CURDATE() chartBeginDate, NULL rbInfoSource_id, '' notes, NULL IIN, 0 isUnconscious, 0 hasImplants, 0 hasProsthesis 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
left join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
left join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate
WHERE e2.id is NULL and tp.externalId is not null and
tp.birthDate is not null and c2.id is NULL)






INSERT INTO Event (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, externalId, eventType_id, org_id, client_id, contract_id, prevEventDate, setDate, setPerson_id, execDate, execPerson_id, isPrimary, `order`, result_id, nextEventDate, payStatus, typeAsset_id, note, curator_id, assistant_id, pregnancyWeek, MES_id, HTG_id, KSG_id, mesSpecification_id, relegateOrg_id, totalCost, patientModel_id, cureType_id, cureMethod_id, prevEvent_id, littleStranger_id, referral_id, armyReferral_id, goal_id, outgoingOrg_id, outgoingRefNumber, hmpKind_id, hmpMethod_id, eventCostPrinted, exposeConfirmed, ZNOFirst, ZNOMorph, hospParent, clientPolicy_id, isClosed, dispByMobileTeam, duration, isPrivacyGuaranteeSigned, orgStructure_id, MSE)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, tp.externalId, 101 eventType_id, 386271 org_id, c2.id client_id, 1 contract_id, null prevEventDate, CURDATE() setDate, Null setPerson_id, null execDate, null execPerson_id, 1 isPrimary, 1 `order`, null result_id, null nextEventDate, 0 payStatus, null typeAsset_id, '' note, null curator_id, null assistant_id, 0 pregnancyWeek, null MES_id, null HTG_id, null KSG_id, null mesSpecification_id, null relegateOrg_id, 0 totalCost, null patientModel_id, null cureType_id, null cureMethod_id, null prevEvent_id, null littleStranger_id, null referral_id, null armyReferral_id, null goal_id, null outgoingOrg_id, null outgoingRefNumber, null hmpKind_id, null hmpMethod_id, 0 eventCostPrinted, 0 exposeConfirmed, 0 ZNOFirst, 0 ZNOMorph, 0 hospParent, null clientPolicy_id, 0 isClosed, 0 dispByMobileTeam, null duration, 0 isPrivacyGuaranteeSigned, null orgStructure_id, 0 MSE 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
left join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
left join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate
WHERE e2.id is NULL and tp.externalId is not null and
tp.birthDate is not null and c2.id is not NULL 




INSERT into ClientPolicy (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, insurer_id, policyType_id, policyKind_id, serial, `number`, begDate, endDate, dischargeDate, name, note, insuranceArea, isSearchPolicy, franchisePercent)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, NULL insurer_id, 1 policyType_id, case when tp.police_serial is null then 3 else 2 end policyKind_id, ifnull(tp.police_serial, '') serial, tp.`police_number`, '0000-00-00' begDate, '0000-00-00' endDate, null dischargeDate, '' name, '' note, '' insuranceArea, 0 isSearchPolicy, 0 franchisePercent
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientPolicy cp on cp.client_id = c2.id and cp.id = (select MAX(cp2.id) from ClientPolicy cp2 where cp2.client_id = c2.id GROUP by cp2.client_id)
WHERE tp.birthDate is not null  and cp.id is null and tp.`police_number` is not null
GROUP by e2.id, c2.id



-- INSERT INTO ClientDocument (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, documentType_id, serial, `number`, `date`, origin, endDate)
-- select 
-- NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
-- 0 deleted, c2.id client_id, 1 documentType, IFNULL(REGEXP_REPLACE(tp.doc_serial, '([0-9][0-9])([0-9][0-9])', '\\1 \\2'),'') serial, IFNULL(tp.doc_number, '') `number`, 
-- IFNULL(STR_TO_DATE(REGEXP_REPLACE(tp.doc_date, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'),'0000-00-00 00:00:00') `date`, '' origin
-- from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
-- tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
-- union
-- select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
-- union
-- select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
-- union
-- select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
-- union
-- select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
-- join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
-- join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate
-- left join ClientDocument cd on cd.client_id = c2.id and cd.id = (select MAX(cd2.id) from ClientDocument cd2 where cd2.client_id = c2.id GROUP by cd2.client_id)
-- WHERE tp.birthDate is not null  and cd.id is null -- and (tp.doc_serial != '' and tp.doc_number != '')
-- GROUP by e2.id, c2.id




select * from ClientAddress ca 
join Address a on ca.address_id = a.id 



INSERT INTO ClientAddress (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, `type`, address_id, freeInput, freeInput_p, district_id, isVillager)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 0 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0
WHERE tp.birthDate is not null and ca.id is NULL 
union
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 1 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0
WHERE tp.birthDate is not null and ca.id is NULL 
GROUP by e2.id, c2.id




CREATE temporary TABLE temp_addres
(select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 1 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0
WHERE tp.birthDate is not null and ca.id is NULL 
GROUP by e2.id, c2.id)

INSERT INTO ClientAddress (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, `type`, address_id, freeInput, freeInput_p, district_id, isVillager)
(select * from temp_addres)







select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 1 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp2.`дата рож`)>9, tp2.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp3.`дата рож`)>9, tp3.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp4.`дата рож`)>9, tp4.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp5.`дата рож`)>9, tp5.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0 and ca.`type` = 0 and ca.createDatetime REGEXP '2021-03-04'
WHERE tp.birthDate is not null  
GROUP by e2.id, c2.id




select tp.*
from (select tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(tp1.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, tp1.`внешний идентификатор` externalId, NULL doc_serial, NULL doc_number, NULL doc_date from temp_person1 tp1 
union
select tp2.фамилия, tp2.имя, tp2.отчество, STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp2.город, tp2.улица, tp2.дом, tp2.корп, tp2.кварт, tp2.`серия полиса`, tp2.`номер полиса`, tp2.`страхов.компания`, '' `внешний идентификатор`, tp2.серия, tp2.`номер пас`, tp2.`дата выд` from temp_person2 tp2 
union
select tp3.фамилия, tp3.имя, tp3.отчество, STR_TO_DATE(REGEXP_REPLACE(tp3.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp3.город, tp3.улица, tp3.дом, tp3.корп, tp3.кварт, tp3.`серия полиса`, tp3.`номер полиса`, tp3.`страхов.компания`, tp3.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person3 tp3 
union
select tp4.фамилия, tp4.имя, tp4.отчество, STR_TO_DATE(REGEXP_REPLACE(tp4.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp4.город, tp4.улица, tp4.дом, tp4.корп, tp4.кварт, tp4.`серия полиса`, tp4.`номер полиса`, tp4.`страхов.компания`, tp4.`внешний идентификатор`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person4 tp4 
union
select tp5.фамилия, tp5.имя, tp5.отчество, STR_TO_DATE(REGEXP_REPLACE(tp5.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y'), tp5.город, tp5.улица, tp5.дом, tp5.корп, tp5.кварт, tp5.`серия полиса`, tp5.`номер полиса`, tp5.`страхов.компания`, tp5.`№ карты`, NULL `серия`, NULL `номер пас`, NULL `дата выд` from temp_person5 tp5) as tp
join Client c on c.lastName = tp.lastName and c.firstName = tp.firstName and c.patrName = tp.patrName and c.birthDate = tp.birthDate
GROUP by tp.lastName, tp.firstName, tp.patrName



select * from Client c 
right join (
select c.* from Client c 
join temp_person1 tp1 on tp1.фамилия = c.lastName and tp1.имя= c.firstName and tp1.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp1.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
UNION 
select c.* from Client c
join temp_person2 tp2 on tp2.фамилия = c.lastName and tp2.имя= c.firstName and tp2.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
UNION 
select c.* from Client c
join temp_person3 tp3 on tp3.фамилия = c.lastName and tp3.имя= c.firstName and tp3.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp3.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
UNION 
select c.* from Client c
join temp_person4 tp4 on tp4.фамилия = c.lastName and tp4.имя= c.firstName and tp4.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp4.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
UNION 
select c.* from Client c
join temp_person5 tp5 on tp5.фамилия = c.lastName and tp5.имя= c.firstName and tp5.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp5.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')) tmp on c.id = tmp.id
 left join Event e on e.client_id  = c.id and e.deleted = 0 and e.eventType_id = 101
 WHERE c.deleted = 0 and e.id is not  NULL 



select createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, attendingPerson_id, deleted, lastName, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodType_id, bloodDate, bloodNotes, growth, weight, embryonalPeriodWeek, birthPlace, diagNames, chartBeginDate, rbInfoSource_id, notes, IIN, isUnconscious, hasImplants, hasProsthesis from Client c ;


INSERT into ClientPolicy(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, insurer_id, policyType_id, policyKind_id, serial, `number`, begDate, endDate, dischargeDate, name, note, insuranceArea, isSearchPolicy, franchisePercent)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, c.id client_id, NULL insurer_id, 1 policyType_id, case when tp2.`серия полиса` is null then 3 else 2 end policyKind_id, ifnull(tp2.`серия полиса`, '') serial, tp2.`номер полиса` `number`, '0000-00-00' begDate, '0000-00-00' endDate, null dischargeDate, '' name, '' note, '' insuranceArea, 0 isSearchPolicy, 0 franchisePercent 
from Client c 
left join ClientPolicy cp on cp.client_id = c.id and cp.id = (select MAX(cp2.id) from ClientPolicy cp2 where cp2.client_id = c.id GROUP by cp2.client_id)
join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя= c.firstName and tp2.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
where c.deleted = 0

INSERT into Event (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, externalId, eventType_id, org_id, client_id, contract_id, prevEventDate, setDate, setPerson_id, execDate, execPerson_id, isPrimary, `order`, result_id, nextEventDate, payStatus, typeAsset_id, note, curator_id, assistant_id, pregnancyWeek, MES_id, HTG_id, KSG_id, mesSpecification_id, relegateOrg_id, totalCost, patientModel_id, cureType_id, cureMethod_id, prevEvent_id, littleStranger_id, referral_id, armyReferral_id, goal_id, outgoingOrg_id, outgoingRefNumber, hmpKind_id, hmpMethod_id, eventCostPrinted, exposeConfirmed, ZNOFirst, ZNOMorph, hospParent, clientPolicy_id, isClosed, dispByMobileTeam, duration, isPrivacyGuaranteeSigned, orgStructure_id, MSE)
select /*c.id, e2.**/ 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, IFNULL(tp2.`№ карты`, '') externalId, 101 eventType_id, 386271 org_id, c.id client_id, 1 contract_id, e2.prevEventDate, CURDATE() setDate, NULL setPerson_id, NULL execDate, NULL execPerson_id, 1 isPrimary, 1 `order`, NULL result_id, NULL nextEventDate, 0 payStatus, e2.typeAsset_id, '' note, e2.curator_id, e2.assistant_id, 0 pregnancyWeek, e2.MES_id, e2.HTG_id, e2.KSG_id, e2.mesSpecification_id, e2.relegateOrg_id, 0 totalCost, e2.patientModel_id, e2.cureType_id, e2.cureMethod_id, e2.prevEvent_id, e2.littleStranger_id, e2.referral_id, e2.armyReferral_id, e2.goal_id, e2.outgoingOrg_id, e2.outgoingRefNumber, e2.hmpKind_id, e2.hmpMethod_id, 0 eventCostPrinted, 0 exposeConfirmed, 0 ZNOFirst, 0 ZNOMorph, 0 hospParent, e2.clientPolicy_id, 0 isClosed, 0 dispByMobileTeam, e2.duration, 0 isPrivacyGuaranteeSigned, e2.orgStructure_id, 0 MSE 
from Client c 
left join Event e2 on e2.client_id = c.id and e2.eventType_id = 101
join temp_person5 tp2 on tp2.фамилия = c.lastName and tp2.имя = c.firstName and tp2.отчество = c.patrName and c.birthDate = STR_TO_DATE(REGEXP_REPLACE(tp2.`дата рож`, '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y')
WHERE e2.id is null


INSERT into Diagnosis(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, diagnosisType_id, character_id, MKB, MKBEx, morphologyMKB, TNMS, dispanser_id, traumaType_id, setDate, endDate, mod_id, person_id)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, e.client_id client_id, 18 diagnosisType_id, d2.character_id, 'Z00.0' MKB, '' MKBEx, '' morphologyMKB, '' TNMS, d2.dispanser_id, d2.traumaType_id, CURDATE() setDate, CURDATE() endDate, d2.mod_id, d2.person_id 
from Client c 
join Event e on e.client_id = c.id and e.deleted = 0 and e.eventType_id = 101
left join Diagnostic d on d.event_id = e.id and d.diagnosisType_id = 18
left join Diagnosis d2 on d.diagnosis_id = d2.id
where d2.id is null

INSERT into Diagnostic (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, event_id, diagnosis_id, TNMS, diagnosisType_id, character_id, stage_id, phase_id, dispanser_id, sanatorium, hospital, traumaType_id, speciality_id, person_id, healthGroup_id, result_id, setDate, endDate, notes, assistant_id, medicalGroup_id, status, org_id)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 0 deleted, e.id event_id, d2.id diagnosis_id, '' TNMS, 18 diagnosisType_id, d.character_id, d.stage_id, d.phase_id, d.dispanser_id, 0 sanatorium, 0 hospital, d.traumaType_id, d.speciality_id, d.person_id, d.healthGroup_id, d.result_id, CURDATE() setDate, CURDATE() endDate, '' notes, d.assistant_id, d.medicalGroup_id, d.status, d.org_id 
from Client c 
join Event e on e.client_id = c.id and e.deleted = 0 and e.eventType_id = 101
left join Diagnostic d on d.event_id = e.id and d.diagnosisType_id = 18
left join Diagnosis d2 on d2.client_id = c.id and d2.MKB = 'Z00.0' and d2.diagnosisType_id = 18
where d.id is null

