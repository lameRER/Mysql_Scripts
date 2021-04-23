select * from Event e where e.client_id  = 51009 and e.externalId = '2021/39751';

-- 22900983
select * from Action a where a.event_id = 20403447 and a.deleted = 0
-- 20403447

select * from ;

select * from Event e where e.externalId = '356' and e.client_id = 51009;
-- 20403459

select * from Action a where a.event_id = 20403459;


select * from Service s where s.event_id = 20403447;






select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 316535 and e.externalId = '2021/39573') and a.deleted = 0



20403541
select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 316535 and e.externalId = '1496') and a.deleted = 0


select * from Service s where s.event_id = 20403264;