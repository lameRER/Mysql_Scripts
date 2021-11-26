select *
from Event where client_id = 3760;


select at1.id, at1.name, context, a.*
from Action a, ActionType at1 where a.event_id in(6579,
                                                  8957
    ) and at1.id =a.actionType_id;


select apj.*
from ActionProperty ap, ActionProperty_Job_Ticket apj where  ap.action_id in (86798,
                                                                              161990
    ) and apj.id = ap.id;



-- 'job_rentgen'
select *
from rbJobType where id in
                     (select jobType_id
                      from Job where id in
                                     (select master_id
                                      from Job_Ticket where id in(2054275,
                                                                  4291483
                                         )));


select *
from rbPrintTemplate where context regexp 'rentgen8037';


select *
from ActionType where context = 'job_rentgen';


select *
from rbPrintTemplate where context = 'n3lab_results';


select *
from rbPrintTemplate where context = 'n3lab_results';


select *
from rbIEMKDocument where code = 'LaboratoryReport';