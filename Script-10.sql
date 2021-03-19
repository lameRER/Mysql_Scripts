select * from V018 v ;
select * from V019 v ;
select * from V022 v ;





INSERT into `Action` (parent_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, actionType_id, specifiedName, event_id, idx, directionDate, status, setPerson_id, isUrgent, begDate, plannedEndDate, endDate, note, person_id, office, amount, uet, payStatus, account, MKB, morphologyMKB, finance_id, contract_id, prescription_id, takenTissueJournal_id, org_id, coordDate, coordAgent, coordInspector, coordText, assistant_id, preliminaryResult, duration, periodicity, aliquoticity, signature, assistant2_id, assistant3_id, MES_id, hmpKind_id, hmpMethod_id, counterValue, customSum, isVerified, notificationStatus, operScope, EGISZ_ids, UUID)
select parent_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, actionType_id, specifiedName, event_id, idx, directionDate, status, setPerson_id, isUrgent, begDate, plannedEndDate, endDate, note, person_id, office, amount, uet, payStatus, account, MKB, morphologyMKB, finance_id, contract_id, prescription_id, takenTissueJournal_id, org_id, coordDate, coordAgent, coordInspector, coordText, assistant_id, preliminaryResult, duration, periodicity, aliquoticity, signature, assistant2_id, assistant3_id, MES_id, hmpKind_id, hmpMethod_id, counterValue, customSum, isVerified, notificationStatus, operScope, EGISZ_ids, UUID from `Action` limit 1;



select * from Action order by id desc 




INSERT INTO rbCureMethod (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, regionalCode, isObsolete)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, '' code, v.HMNAME name, '' regionalCode, if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1') isObsolete 
from V019 v
where if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1') = 0
group by v.HMNAME

INSERT into rbCureType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, regionalCode, isObsolete)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
' ' code, v.HVIDNAME name, '' regionalCode,  if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1') isObsolete from V018 v 
where if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1') = 0
group by v.HVIDNAME 

INSERT into rbPatientModel (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, quotaType_id, cureType_id, isObsolete)
select 
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
'' code, v.MPACNAME name, v2.DIAG MKB, null quotaType_id, rct.id cureType_id, if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1') isObsolete from V022 v 
join V019 v2 on v.IDMPAC = v2.IDMODP and if((STR_TO_DATE(v2.DATEEND, '%d.%m.%Y') > CURDATE() or v2.DATEEND is null), '0', '1') = 0
join V018 v3 on v3.IDHVID = v2.HVID and if((STR_TO_DATE(v3.DATEEND, '%d.%m.%Y') > CURDATE() or v3.DATEEND is null), '0', '1') = 0
join rbCureType rct on rct.name = v3.HVIDNAME and rct.isObsolete = 0
where if((STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null), '0', '1')  = 0
group by v.MPACNAME, v2.DIAG, rct.id 

insert INTO rbPatientModel_Item (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
select 
NOW() createDatetime, NULL createPerson_id, now() modifyDatetime, null modifyPerson_id, 
rct.id cureType_id, rcm.id cureMethod_id, rpm.id master_id from V022 v
join V019 v2 on v2.IDHM = v.IDMPAC 
join V018 v3 on v3.IDHVID = v2.HVID
join rbPatientModel rpm on rpm.name = v.MPACNAME and rpm.isObsolete = 0
JOIN rbCureType rct on rct.name = v3.HVIDNAME and rct.isObsolete = 0
join rbCureMethod rcm on rcm.name = v2.HMNAME and rcm.isObsolete = 0
GROUP by rct.id, rcm.id, rpm.id






select  * from V022 v
join V019 v2 on v2.IDHM = v.IDMPAC 
join V018 v3 on v3.IDHVID = v2.HVID


select * from rbHighTechCureKind rhtck ;
select * from rbHighTechCureMethod rhtcm ;



