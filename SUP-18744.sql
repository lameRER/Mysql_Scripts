select regexp_replace(rbPrintTemplate.`default`, '(\(\\d+\))', 'test'),
       rbPrintTemplate.`default`,
       rbPrintTemplate.*
from rbPrintTemplate where `default` regexp 'setLeftMargin' and deleted = 0


select regexp_replace(rbPrintTemplate.`default`, '\\d+', '123456789'),
       rbPrintTemplate.`default`,
       rbPrintTemplate.*
from rbPrintTemplate where `default` regexp 'setLeftMargin' and deleted = 0


select *
from rbPrintTemplate where `default` not regexp 'setLeftMargin' and deleted = 0;