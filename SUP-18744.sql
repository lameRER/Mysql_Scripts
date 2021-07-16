select regexp_replace(rbPrintTemplate.`default`, '(setLeftMargin\\().+?(\\))', '\\120\\2'),
       rbPrintTemplate.`default`,
       rbPrintTemplate.*
from rbPrintTemplate where `default` regexp 'setLeftMargin' and deleted = 0
;


update rbPrintTemplate
set `default` = regexp_replace(rbPrintTemplate.`default`, '(setLeftMargin\\().+?(\\))', '\\120\\2')
where `default` regexp 'setLeftMargin' and deleted = 0


select
       case
           when `default` regexp 'setLeftMargin'
           then regexp_replace(rbPrintTemplate.`default`, '(setLeftMargin\\().+?(\\))', '\\120\\2')
           else regexp_replace(rbPrintTemplate.`default`, '(<head>)','\\1\n{: setLeftMargin(20) }')
       end as new,
       rbPrintTemplate.`default`,
    rbPrintTemplate.*
from rbPrintTemplate where deleted = 0;


select regexp_replace(rbPrintTemplate.`default`, '(<head>)','\\1\n{: setLeftMargin(20) }'), rbPrintTemplate.`default`, rbPrintTemplate.*
from rbPrintTemplate where `default` not regexp 'setLeftMargin'  and `default` regexp '<head>' and deleted = 0;


select *
from Organisation where id = 6821


select *
from Person where org_id is not null group by org_id;