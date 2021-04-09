select * from ActionType at2 where at2.flatCode = 'oper_protocol';


select * from ActionType at2 where at2.id = 43604;

select * from ActionPropertyType apt where apt.actionType_id = 49962 and apt.deleted = 0 order by apt.idx;


select at2.id, at2.name, apt.* from ActionPropertyType apt 
join ActionType at2 on at2.id = apt.actionType_id and at2.id = 49962-- in(49944,49957,49962)
order by at2.id, apt.idx


select * from Action a where a.actionType_id  in(49944,49957,49962);


select * from Action a where a.event_id = 33796707;

select * from JsonData jd where jd.json REGEXP '100044151'; 

select * from JsonData jd ;

select * from OrgStructure_ActionType osat where osat.actionType_id in(43604);

select * from DestinationTree_ActionType dtat where dtat.actionType_id  in(43604);

select * from DestinationTree dt where id = 1006;

select * from ActionPropertyType apt where apt.actionType_id = 49954 and apt.deleted = 0 ;

select * from Action where id = 100008605;
 33831180



select * from 15_EIS_POL;


select * from OrgStructure os where os.name REGEXP '10';


select * from OrgStructure_Job osj where osj.master_id = 18;


select * from ActionType at2 where at2.id = 100033105;



select at2.name, a.* from Action a
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
where a.event_id = 33796707 and a.deleted = 0



select * from OrgStructure os where os.parent_id = 133


select * from OrgStructure os ;

SELECT urldecoder('%7B%22id%22%3A%22100044151')

select jd.*, Convert(urldecoder(jd.json) USING utf8),  REGEXP_REPLACE(urldecoder(jd.json), '.*"id":"(\\d+)".*', '\\1') from Action a
join Action a2 on a2.id = a.parent_id 
join JsonData jd on jd.json REGEXP a2.id
where a.event_id = 33796707 and a.actionType_id = 49940 order by a.createDatetime desc limit 1

SELECT MAX(id) FROM urlcodemap

SELECT `encoded` FROM urlcodemap

SELECT `decoded` FROM urlcodemap


drop table urlcodemap

