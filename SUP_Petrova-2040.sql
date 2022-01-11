use s11;

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


set @quotaType = 'ВМП I-22';

select *
from rbPatientModel order by id desc ;

set @return = '3000';

select *
from s12.QuotaType where isObsolete = 0;

select *
from s11.temp_vmp1;

update s11.temp_vmp1
set `N группы ВМП` = regexp_replace(`N группы ВМП`, '\\.$', '')
where `N группы ВМП` regexp '\\.$';

insert into QuotaType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_code, code, name, isObsolete)
select *
from
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       0 deleted,
       5 class,
       substring_index(tv.`N группы ВМП`, '.', 2) group_code,
       concat_ws(' ', tv.`N группы ВМП`, @quotaType) code,
       tv.`Наименование вида ВМП` name,
       isObsolete
from s11.temp_vmp1 tv, s11.QuotaType q where q.id = (select id from s11.QuotaType where isObsolete = 0 order by id desc limit 1) group by tv.`N группы ВМП`) as tmp
where not exists(select * from QuotaType where tmp.code = code);

INSERT LOW_PRIORITY rbPatientModel (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, MKB, quotaType_id, cureType_id, isObsolete)
SELECT NOW(),NULL,NOW(),NULL, @return:=@return+1, tc.`Модель пациента`, tc.`Коды по МКБ-10`, (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`), ct1.id, 0 FROM s11.temp_vmp1 tc
LEFT JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента`  AND pm.isObsolete = 0 AND pm.quotaType_id = (SELECT qt.id FROM QuotaType qt WHERE qt.code REGEXP @quotaType AND qt.code REGEXP tc.`N группы ВМП`)
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
LEFT JOIN rbCureType ct ON pm.cureType_id = ct.id AND pmi.cureType_id = ct.id AND ct.isObsolete = 0
LEFT JOIN rbCureMethod cm ON pmi.cureMethod_id = cm.id AND cm.isObsolete = 0
LEFT JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0
LEFT JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pm.id IS NULL
GROUP BY tc.`N группы ВМП`, tc.`Модель пациента`, tc.`Коды по МКБ-10`;

INSERT rbPatientModel_Item (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, cureType_id, cureMethod_id, master_id)
SELECT NOW(),NULL,NOW(),NULL, ct1.id, cm1.id, pm.id FROM s11.temp_vmp1 tc
JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента` AND pm.MKB = tc.`Коды по МКБ-10` AND pm.isObsolete = 0 AND pm.quotaType_id IS NOT NULL
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
left JOIN rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0 AND ct1.id = pm.cureType_id
left JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pmi.id IS NULL
GROUP BY tc.`Метод лечения`, tc.`Модель пациента`;


update rbPatientModel
set cureType_id = 87
where id = 3583;

select *
from rbPatientModel where id = 3583;

select *
from s12.rbCureType where isObsolete = 0;

select *
from s11.rbCureType where isObsolete = 0;


select *
from s12.rbCureMethod where isObsolete = 0;


select s12.*
from s12.rbCureMethod s12
right join s11.rbCureMethod s11 on s11.id = s12.id
where s12.isObsolete = 0 and s12.id is null;



select *
from s12.rbCureMethod s11
left join s11.rbCureMethod s12 on s12.id = s11.id
where s12.isObsolete = 0 and s11.id is null;

select *
from rbCureMethod order by id desc ;

set @return = 2903;
set @return1 = @return;

insert into rbCureMethod(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, regionalCode, isObsolete, EGISZ_code)
SELECT NOW(),NULL,NOW(),NULL, @return:=@return+1 as code, `Метод лечения` as name, @return1:=@return1+1, 0, null FROM s11.temp_vmp1 tc
JOIN rbPatientModel pm ON pm.name = tc.`Модель пациента` AND pm.MKB = tc.`Коды по МКБ-10` AND pm.isObsolete = 0 AND pm.quotaType_id IS NOT NULL
LEFT JOIN rbPatientModel_Item pmi ON pm.id = pmi.master_id
left JOIN s11.rbCureType ct1 ON ct1.name = tc.`Вид лечения` AND ct1.isObsolete = 0 AND ct1.id = pm.cureType_id
left JOIN rbCureMethod cm1 ON cm1.name = tc.`Метод лечения` AND cm1.isObsolete = 0
WHERE pmi.id IS NULL
GROUP BY tc.`Метод лечения`, tc.`Модель пациента`;


select *
from s11.rbCureMethod where isObsolete = 0;




select *
from QuotaType;


select *
from rbPatientModel where quotaType_id = 741;


select *
from rbPatientModel_Item where master_id = 3846;

select *
from rbCureType where id = 90;


select *
from s11.temp_vmp2 where `N группы ВМП` regexp '09.00.33.001';

select *
from rbPatientModel where name regexp 'Иммунотерапия острых лейкозов';


select *
from QuotaType where code regexp '09.00.33.001';


select *
from rbPatientModel where quotaType_id = 741;

select *
from rbPatientModel_Item where master_id = 3846;

select *
from rbCureMethod;


select *
from QuotaType where code regexp '08.00.12.002';

select *
from rbPatientModel where quotaType_id = 812 ;


select *
from rbPatientModel_Item where master_id = 4186;


select *
from s11.temp_vmp1 where `N группы ВМП` regexp '08.00.12.002';