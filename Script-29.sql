select * from ActionType at2 order by id desc;


select * from Action a
join ActionType at2 on at2.id = a.ActionType_id
join ActionType_Service ats on ats.master_id = at2.id


select * from rbJobType rjt ;