SELECT * from rbPrintTemplate rpt where rpt.name REGEXP 'Согласия' and rpt.context ='token'

use s11;

INSERT into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail) 
select 
NOW() createDatetime, null createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
code, CONCAT(name, ' (Выбор)'), context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail from rbPrintTemplate where id = 1314 ;




select id, name, `default` from rbPrintTemplate where id = 1388;






select apt.customSelect, apt.* from ActionPropertyType apt where apt.customSelect != '';


select * from ActionType at2 where at2.code = 'osm_profpatolog';










call procEpicrisisAnalyzes(31398, "'Исследование материала желудка на наличие геликобактер пилори (Helicobacter pylori)'")