select * from ActionType at2 where at2.flatCode = 'oper_protocol';


select * from ActionType at2 where at2.id = 43604;

select * from ActionPropertyType apt where apt.actionType_id = 49962 and apt.deleted = 0 order by apt.idx;


select at2.id, at2.name, apt.* from ActionPropertyType apt 
join ActionType at2 on at2.id = apt.actionType_id and at2.id = 49940-- in(49944,49957,49962)
order by at2.id, apt.idx


select * from Action a where a.actionType_id  in(49944,49957,49962);


select * from Action a where a.event_id = 33796707;

select * from JsonData jd where jd.json REGEXP '100033105'; 


select * from OrgStructure_ActionType osat where osat.actionType_id in(43604);

select * from DestinationTree_ActionType dtat where dtat.actionType_id  in(43604);

select * from DestinationTree dt where id = 1006;

select * from ActionPropertyType apt where apt.actionType_id = 49954 and apt.deleted = 0 ;

select * from Action where id = 100008605;
 

select * from OrgStructure os where os.name REGEXP '10';


select * from OrgStructure_Job osj where osj.master_id = 18;


select * from ActionType at2 where at2.id = 100033105;



select at2.name, a.* from Action a
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
where a.event_id = 33796707 and a.deleted = 0




