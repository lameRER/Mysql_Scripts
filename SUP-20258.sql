
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