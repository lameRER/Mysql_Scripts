select regexp_replace(rbPrintTemplate.`default`, '({.?)(setLeftMargin)(\(.+?\))(.?})', '\\1\\2(10)\\3'),
       rbPrintTemplate.`default`,
       rbPrintTemplate.*
from rbPrintTemplate where `default` regexp 'setLeftMargin' and deleted = 0


select *
from rbPrintTemplate where `default` not regexp 'setLeftMargin' and deleted = 0;