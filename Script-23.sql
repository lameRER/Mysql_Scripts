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



-- 20403541
select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 316535 and e.externalId = '1496') and a.deleted = 0

select * from Service s where s.event_id = 20403541;


select * from Service s where s.event_id = 20403264;
4607008
4607013
4607042
4607057
4607073
4607089
4607150
4607151
4609312






22902000
22902001
22902002
22902003
select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 317503 and e.externalId = '1381')


select * from Service s where s.action_id in(22902000,22902001,22902002,22902003);







-- 20321124
select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 51009 and e.externalId = '2020/61942') and a.deleted = 0



-- 20403459
select * from Action a where a.event_id = (select e.id from Event e where e.client_id  = 51009 and e.externalId = '356') and a.deleted = 0

select * from Service s where s.action_id in(22315349,22901011,22901012,22901013);


select * from Service s where s.event_id = 20403264;


