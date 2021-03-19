



select * from Event e where e.eventType_id  = 101 and e.externalId = '9133451';




select * from Client c where c.id in (328098,473518,483511);



INSERT INTO Client (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, attendingPerson_id, deleted, lastName, firstName, patrName, birthDate, birthTime, sex, SNILS, bloodType_id, bloodDate, bloodNotes, growth, weight, embryonalPeriodWeek, birthPlace, diagNames, chartBeginDate, rbInfoSource_id, notes, IIN, isUnconscious, hasImplants, hasProsthesis)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
NULL attendingPerson_id, 0 deleted, tp.lastName, tp.firstName, tp.patrName, tp.birthDate, '00:00:00' birthTime, 0 sex, '' SNILS, NULL bloodType_id, NULL bloodDate, '' bloodNotes, 0 growth, 0 weight, 0 embryonalPeriodWeek, '' birthPlace, '' diagNames, CURDATE() chartBeginDate, NULL rbInfoSource_id, '' notes, NULL IIN, 0 isUnconscious, 0 hasImplants, 0 hasProsthesis 
from (select 
tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, 
tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, 
tp1.`номер карты` externalId, NULL doc_serial, NULL doc_number, NULL doc_date 
from temp_person6 tp1 ) tp
left join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101 
left join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and e2.client_id = c2.id
WHERE e2.id is NULL and tp.externalId is not null and
tp.birthDate is not null and c2.id is NULL



select * from temp_person6 tp ;






INSERT INTO Event (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, externalId, eventType_id, org_id, client_id, contract_id, prevEventDate, setDate, setPerson_id, execDate, execPerson_id, isPrimary, `order`, result_id, nextEventDate, payStatus, typeAsset_id, note, curator_id, assistant_id, pregnancyWeek, MES_id, HTG_id, KSG_id, mesSpecification_id, relegateOrg_id, totalCost, patientModel_id, cureType_id, cureMethod_id, prevEvent_id, littleStranger_id, referral_id, armyReferral_id, goal_id, outgoingOrg_id, outgoingRefNumber, hmpKind_id, hmpMethod_id, eventCostPrinted, exposeConfirmed, ZNOFirst, ZNOMorph, hospParent, clientPolicy_id, isClosed, dispByMobileTeam, duration, isPrivacyGuaranteeSigned, orgStructure_id, MSE)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, tp.externalId, 101 eventType_id, 386271 org_id, c2.id client_id, 1 contract_id, null prevEventDate, CURDATE() setDate, Null setPerson_id, null execDate, null execPerson_id, 1 isPrimary, 1 `order`, null result_id, null nextEventDate, 0 payStatus, null typeAsset_id, '' note, null curator_id, null assistant_id, 0 pregnancyWeek, null MES_id, null HTG_id, null KSG_id, null mesSpecification_id, null relegateOrg_id, 0 totalCost, null patientModel_id, null cureType_id, null cureMethod_id, null prevEvent_id, null littleStranger_id, null referral_id, null armyReferral_id, null goal_id, null outgoingOrg_id, null outgoingRefNumber, null hmpKind_id, null hmpMethod_id, 0 eventCostPrinted, 0 exposeConfirmed, 0 ZNOFirst, 0 ZNOMorph, 0 hospParent, null clientPolicy_id, 0 isClosed, 0 dispByMobileTeam, null duration, 0 isPrivacyGuaranteeSigned, null orgStructure_id, 0 MSE 
from (select 
tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, 
tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, 
tp1.`номер карты` externalId, NULL doc_serial, NULL doc_number, NULL doc_date 
from temp_person6 tp1 ) tp
left join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
left join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate -- and e2.client_id = c2.id
WHERE e2.id is NULL and tp.externalId is not null and
tp.birthDate is not null and c2.id is not NULL 




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




INSERT into ClientPolicy (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, insurer_id, policyType_id, policyKind_id, serial, `number`, begDate, endDate, dischargeDate, name, note, insuranceArea, isSearchPolicy, franchisePercent)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, NULL insurer_id, 1 policyType_id, case when tp.police_serial is null then 3 else 2 end policyKind_id, ifnull(tp.police_serial, '') serial, tp.`police_number`, '0000-00-00' begDate, '0000-00-00' endDate, null dischargeDate, '' name, '' note, '' insuranceArea, 0 isSearchPolicy, 0 franchisePercent
from (select 
tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, 
tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, 
tp1.`номер карты` externalId, NULL doc_serial, NULL doc_number, NULL doc_date 
from temp_person6 tp1 ) tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientPolicy cp on cp.client_id = c2.id and cp.id = (select MAX(cp2.id) from ClientPolicy cp2 where cp2.client_id = c2.id GROUP by cp2.client_id)
WHERE tp.birthDate is not null  and cp.id is null and tp.`police_number` is not null
GROUP by e2.id, c2.id







select * from ClientAddress ca 
join Address a on ca.address_id = a.id 



INSERT INTO ClientAddress (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, `type`, address_id, freeInput, freeInput_p, district_id, isVillager)
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 0 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select 
tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, 
tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, 
tp1.`номер карты` externalId, NULL doc_serial, NULL doc_number, NULL doc_date 
from temp_person6 tp1 ) tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0
WHERE tp.birthDate is not null and ca.id is NULL 
union
select
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id,
0 deleted, c2.id client_id, 1 `type`, NULL address_id, CONCAT_WS(', ', tp.city, tp.street, IFNULL(CONCAT('д. ', tp.house),''), IFNULL(CONCAT('кор. ', tp.corps),''), IFNULL(CONCAT('кв. ', tp.apartment),'')) freeInput, '' freeInput_p, NULL district_id, 0 isVillager 
from (select 
tp1.фамилия lastName, tp1.имя firstName, tp1.отчество patrName, STR_TO_DATE(REGEXP_REPLACE(if(LENGTH(tp1.`дата рож`)>9, tp1.`дата рож`, NULL), '([0-9]+).([0-9]+).([0-9]+).*', '\\1-\\2-\\3'), '%d-%m-%Y') birthDate, 
tp1.город city, tp1.улица street, tp1.дом house, tp1.корп corps, tp1.кварт apartment, 
tp1.`серия полиса` police_serial, tp1.`номер полиса` `police_number`, tp1.`страхов.компания` police_org, 
tp1.`номер карты` externalId, NULL doc_serial, NULL doc_number, NULL doc_date 
from temp_person6 tp1 ) tp
join Event e2 on e2.externalId = REPLACE(tp.externalId, ' ', '') and e2.deleted = 0 and e2.eventType_id = 101
join Client c2 on c2.lastName = tp.lastName and c2.firstName =  tp.firstName and c2.patrName =  tp.patrName and c2.birthDate = tp.birthDate and c2.id = e2.client_id 
left join ClientAddress ca on ca.client_id = c2.id and ca.deleted = 0
WHERE tp.birthDate is not null and ca.id is NULL 
GROUP by e2.id, c2.id
