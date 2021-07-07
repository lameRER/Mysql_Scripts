select * from N3LabOrderLog


select *
from N3LabOrderSyncLog order by id desc ;


select *
from logger.;



select *
from logger.N3LabOrderLog l
left join logger.N3LabOrderSyncLog ls on ls.order_id = l.id
where l.takenTissueJournal_id = 104455



select *
from s11.TakenTissueJournal where externalId regexp '210021395';


select *
from s11.TakenTissueJournal where id = 104455;


select *
from TakenTissueJournal_log order by id desc


select *
from TakenTissueJournal order by id desc ;