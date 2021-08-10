select *
from OrgStructure_HospitalBed ;

select *
from EventType where id = 94;

select *
from Event e where e.eventType_id in(94, 114) and e.setDate >= '2021-08-01' and deleted = 0;