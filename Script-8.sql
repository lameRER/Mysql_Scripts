select * from V018 v;
select * from V019 v;
select * from V022 v;



CREATE table temp_rbpat
(select v.IDMPAC, v.MPACNAME, v.DATEBEG, v.DATEEND, v2.IDHM, v2.HMNAME, v2.DIAG, v2.HVID, v2.HGR, v2.HMODP, v2.IDMODP, v2.DATEBEG DATEBEG2, v2.DATEEND DATEEND2, v3.IDHVID, v3.HVIDNAME, v3.DATEBEG DATEBEG3, v3.DATEEND DATEEND3 from V022 v 
join V019 v2 on v.IDMPAC = v2.IDHM 
join V018 v3 on v3.IDHVID = v2.HVID)




UPDATE rbPatientModel 
set isObsolete = 1
where isObsolete = 0


select * from rbPatientModel where isObsolete = 0;
select * from rbPatientModel_Item ;
select * from QuotaType where isObsolete = 0;
select * from rbCureMethod where isObsolete = 0;
select * from rbCureType where isObsolete = 0;

UPDATE rbCureType 
set isObsolete = 1
where isObsolete = 0



select * from rb;


set @return=0;
-- INSERT into rbCureType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, regionalCode, isObsolete)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
CONCAT('0', @return:=@return+1) code, v2.HVIDNAME name, '' regionalCode, if((STR_TO_DATE(v2.DATEEND, '%d.%m.%Y') > CURDATE() or v2.DATEEND is null), '0', '1') isObsolete from V018 v2


select * from rbCureType rct where isObsolete = 0;


select 
-- NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
'' code, v.MPACNAME name, v2.DIAG MKB, NULL quotaType_id, rct.id cureType_id, 0 isObsolete from V022 v, rbCureType rct, V019 v2, V018 v3 
where (STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null) and (STR_TO_DATE(v2.DATEEND, '%d.%m.%Y') > CURDATE() or v2.DATEEND is null) and (STR_TO_DATE(v3.DATEEND, '%d.%m.%Y') > CURDATE() or v3.DATEEND is null) 
and v3.IDHVID = v2.HVID and rct.name = v3.HVIDNAME and rct.isObsolete = 0





select 
-- rpm.createDatetime, rpm.createPerson_id, rpm.modifyDatetime, rpm.modifyPerson_id, 
'' code, v.MPACNAME name, v2.DIAG MKB, null quotaType_id, rct.id cureType_id, 0 isObsolete from rbPatientModel rpm, V019 v2, V018 v3, V022 v, rbCureType rct 
where v.IDMPAC = v2.IDHM and v3.IDHVID = v2.HVID and v3.HVIDNAME = rct.name and rct.isObsolete = 0
group by name, MKB 



select * from rbPatientModel rpm, V022 v;



select 
-- rpm.createDatetime, rpm.createPerson_id, rpm.modifyDatetime, rpm.modifyPerson_id, 
'' code, v.MPACNAME name, v2.DIAG MKB, null quotaType_id, rct.id cureType_id,  isObsolete from V022 v 
join V019 v2 on v.IDMPAC = v2.IDHM 
join V018 v3 on v3.IDHVID = v2.HVID 
join rbCureType rct on rct.name = v3.HVIDNAME and rct.isObsolete = 0
-- join rbPatientModel rpm
group by v.MPACNAME, v2.DIAG , v3.IDHVID  




select * from V018, rbCureType rct where rct.name = HVIDNAME and rct.isObsolete = 0





select 
-- rcm.createDatetime, rcm.createPerson_id, rcm.modifyDatetime, rcm.modifyPerson_id, 
'' code, v3.HMNAME name, '' regionalCode, if((STR_TO_DATE(v2.DATEEND, '%d.%m.%Y') > CURDATE() or v2.DATEEND is null), '0', '1') isObsolete 
-- v3.DIAG, v.MPACNAME, v2.HVIDNAME, v3.HMNAME 
from V022 v 
join V018 v2 on v.IDMPAC = v2.IDHVID 
join V019 v3 on v3.HVID = v2.IDHVID 
join rbCureMethod rcm 
group by v.MPACNAME, v2.HVIDNAME, v3.HMNAME, v3.DIAG 
-- WHERE (STR_TO_DATE(v.DATEEND, '%d.%m.%Y') > CURDATE() or v.DATEEND is null) and (STR_TO_DATE(v2.DATEEND, '%d.%m.%Y') > CURDATE() or v2.DATEEND is null) and (STR_TO_DATE(v3.DATEEND, '%d.%m.%Y') > CURDATE() or v3.DATEEND is null)



select 
-- v3.DIAG, v.MPACNAME, v2.HVIDNAME, v3.HMNAM

from V022 v 
join V018 v2 on v.IDMPAC = v2.IDHVID 
join V019 v3 on v3.HVID = v2.IDHVID 
join rbCureMethod rcm 
GROUP by v.MPACNAME, v3.DIAG


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


-- EXPLAIN 
select 
-- rpmi.createDatetime, rpmi.createPerson_id, rpmi.modifyDatetime, rpmi.modifyPerson_id, 
rct.id cureType_id, rcm.id cureMethod_id, rpm.id master_id from (select v.MPACNAME MPACNAME, v2.DIAG DIAG, v3.HVIDNAME HVIDNAME, v2.HMNAME HMNAME from V022 v
join V019 v2 on v2.IDHM = v.IDMPAC 
join V018 v3 on v3.IDHVID = v2.HVID) as tmp
join rbPatientModel rpm on rpm.name = tmp.MPACNAME and rpm.isObsolete = 0
JOIN rbCureType rct on rct.name = tmp.HVIDNAME and rct.isObsolete = 0
join rbCureMethod rcm on rcm.name = tmp.HMNAME and rcm.isObsolete = 0



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

select * from rbCureMethod rcm where isObsolete = 0;

select * from V019 v2 




select * from rbPatientModel rpm ;







