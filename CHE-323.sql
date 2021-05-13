SELECT * from rbPrintTemplate rpt where rpt.name REGEXP 'Согласия' and rpt.context ='token'



INSERT into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail) 
select 
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
code, CONCAT(name, ' (Выбор)'), context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail from rbPrintTemplate where id = 1314 ;




select id, name, `default` from rbPrintTemplate where id = 1388;






