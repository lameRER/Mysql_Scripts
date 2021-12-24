select *
from rbPrintTemplate where id = 731 ;



SELECT dt.name as docName, rm.*, p.lastName AS last, p.firstName AS first, p.patrName AS patr FROM referral_mse rm
    left JOIN Person p ON rm.person_id = p.id
    left join rbMSEDocumentType dt on dt.code = rm.documentType_code
WHERE rm.id = 36 ORDER BY id DESC;


select *
from rbDocumentType where id = 1
;

select *
from rbMSEDocumentType;

select *
from rbMSEClientBodyType;