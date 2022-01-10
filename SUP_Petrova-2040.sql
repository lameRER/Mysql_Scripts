use s12;

select *
from rbPatientModel;

select *
from rbPatientModel_Item;

drop table temp_vmp2

select *
from temp_vmp2;
SELECT * FROM QuotaType qt;


select *
from rbCureType where isObsolete = 0;


set @quotaType = 'ВМП II-22';

select *
from rbPatientModel;

set @return = '2166';

INSERT LOW_PRIORITY rbPatientModel (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, quotaType_id, cureType_id, isObsolete)
SELECT NOW(),NULL,NOW(),NULL, @return:=@return+1, tc.`Модель пациента`, tc.`Коды по МКБ-10`, (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`), ct1.id, 0 FROM s11.temp_vmp2 tc
LEFT JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента`  AND pm.isObsolete = 0 AND pm.quotaType_id = (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`)
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
LEFT JOIN rbCureType ct ON pm.cureType_id = ct.id AND pmi.cureType_id = ct.id AND ct.isObsolete = 0
LEFT JOIN rbCureMethod cm ON pmi.cureMethod_id = cm.id AND cm.isObsolete = 0
LEFT JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0
LEFT JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pm.id IS NULL
GROUP BY tc.`N группы ВМП`, tc.`Модель пациента`, tc.`Коды по МКБ-10`;

INSERT rbPatientModel_Item (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
SELECT NOW(),NULL,NOW(),NULL, ct1.id, cm1.id, pm.id FROM s11.temp_vmp2 tc
JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента` AND pm.MKB = tc.`Коды по МКБ-10` AND pm.isObsolete = 0 AND pm.quotaType_id IS NOT NULL
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0 AND ct1.id = pm.cureType_id
JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pmi.id IS NULL
GROUP BY tc.`Метод лечения`, tc.`Модель пациента`;

INSERT LOW_PRIORITY rbPatientModel (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, quotaType_id, cureType_id, isObsolete)
SELECT NOW(),NULL,NOW(),NULL, @return:=@return+1, tc.`Модель пациента`, tc.`Коды по МКБ-10`, (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`), ct1.id, 0 FROM s11.temp_vmp2 tc
LEFT JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента` AND pm.isObsolete = 0 AND pm.quotaType_id = (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`)
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
LEFT JOIN rbCureType ct ON pm.cureType_id = ct.id AND pmi.cureType_id = ct.id AND ct.isObsolete = 0
LEFT JOIN rbCureMethod cm ON pmi.cureMethod_id = cm.id AND cm.isObsolete = 0
LEFT JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0
LEFT JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pm.id IS NULL
GROUP BY tc.`N группы ВМП`, tc.`Модель пациента`, tc.`Коды по МКБ-10`;

INSERT rbPatientModel_Item (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
SELECT NOW(),NULL,NOW(),NULL, ct1.id, cm1.id, pm.id FROM s11.temp_vmp2 tc
JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента` AND pm.MKB = tc.`Коды по МКБ-10` AND pm.isObsolete = 0 AND pm.quotaType_id IS NOT NULL
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0 AND ct1.id = pm.cureType_id
JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pmi.id IS NULL
GROUP BY tc.`Метод лечения`, tc.`Модель пациента`;