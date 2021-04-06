insert into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, hideParam, isEditableInWeb)
select NOW() createDatetime, createPerson_id, NOW() modifyDatetime, modifyPerson_id, '16158' code, 'Осмотр' name, context, fileName, `default`, dpdAgreement, `type`, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, hideParam, isEditableInWeb from rbPrintTemplate where context = 'qr';




select * from rbPrintTemplate rpt where rpt.id = LAST_INSERT_ID() ;


select * from ActionType at2 where at2.context = 'QR';


select * from rbPrintTemplate where context = 'QR';


select * from Client c ;