select * from rbJobType rjt where id = 59;


select * from ActionType at2 where at2.name REGEXP 'липидограмма' and at2.deleted = 0;


select * from OrgStructure_Job where jobType_id = 59

select * from OrgStructure_ActionType where master_id in(2,158);