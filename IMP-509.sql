use s11;

update rbPrintTemplate
set documentType_id = 6
where date(createDatetime) >= '2021-09-01';

select *
from rbPrintTemplate
where date(createDatetime) >= '2021-09-01';

select *
from rbIEMKDocument;