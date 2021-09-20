insert into rbPrintTemplate(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, pageOrientation, pageFormat)
select
       now() as createDatetime,
       NULL as createPerson_id,
       now() as modifyDatetime,
       NULL as modifyPerson_id,
       'SUP-8664_3' as code,
       'TestTemplate' as name,
       'TestTemplate' as context,
       fileName,
       '' as `default`,
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
       pageOrientation,
       pageFormat
from rbPrintTemplate order by id desc limit 1;

select * from rbPrintTemplate order by id desc;

select *
from rbPrintTemplate where id in(3389,3391);