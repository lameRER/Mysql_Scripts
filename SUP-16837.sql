select at2.* from ActionType at2, ActionPropertyType apt 
where at2.group_id in (select at3.id from ActionType at3 where at3.code in('КТ - уКРТбк','КТ- уКРТом'))
and apt.actionType_id = at2.id


select * from rbJobType rjt ;




select * from rbService rs where rs.Fed_code REGEXP '06\.03\.021\.003';


select * from rbJobType_ActionType  where master_id = 22;
42855

select * from ActionType at2 where at2.name REGEXP 'Спиральная компьютерная томография шеи';

select * from OrgStructure_ActionType where master_id = 139;

select * from OrgStructure os where os.code = 'Компьютерный Томограф(Группа)';



set @number = 11;
  
INSERT into OrgStructure_ActionType (master_id, idx, actionType_id)
select DISTINCT osat.master_id, osat.idx, at2.id actionType_id from ActionType at2, OrgStructure_ActionType osat 
where at2.group_id in (select at3.id from ActionType at3 where at3.code in('КТ - уКРТбк','КТ- уКРТом')) and osat.master_id = 139


select * from ActionType ;
select * from ActionPropertyType where deleted = 0 and actionType_id in (select id from ActionType where group_id =26227 ) group by name;


select * from ActionType at2 where group_id = 42802;
