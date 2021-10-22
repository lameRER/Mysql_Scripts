select *
from
# start transaction; update
ActionType at1
    join ActionTypeEGISZ2 ate on at1.code = ate.code
# set at1.EGISZ_code = ate.id
where at1.id in
      (select COALESCE(at4.id, at3.id, at2.id, at1.id)
       from ActionType at1
                left join ActionType at2 on at1.id = at2.group_id and at2.deleted = 0
                left join ActionType at3 on at2.id = at3.group_id and at3.deleted = 0
                left join ActionType at4 on at3.id = at4.group_id and at4.deleted = 0
       where at1.deleted = 0
         and at1.group_id in (27601))
;
rollback ;
commit ;



select *
from ActionType at1
         left join ActionTypeEGISZ2 ate on at1.code = ate.code
where at1.id in
      (select COALESCE(at5.id, at4.id, at3.id, at2.id, at1.id)
       from ActionType at1
                left join ActionType at2 on at1.id = at2.group_id and at2.deleted = 0
                left join ActionType at3 on at2.id = at3.group_id and at3.deleted = 0
                left join ActionType at4 on at3.id = at4.group_id and at4.deleted = 0
                left join ActionType at5 on at4.id = at5.group_id and at5.deleted = 0
       where at1.deleted = 0
         and at1.group_id in (27601))
  and ate.id is null;



select *
from ActionType where id in
(select COALESCE(at4.id, at3.id, at2.id, at1.id)
from ActionType at1
left join ActionType at2 on at1.id = at2.group_id and at2.deleted = 0
left join ActionType at3 on at2.id = at3.group_id and at3.deleted = 0
left join ActionType at4 on at3.id = at4.group_id and at4.deleted = 0
where at1.group_id = 27601);

select *
from ActionTypeEGISZ2;


select *
from ActionType where code ='TDU1.1.2';


select *
from ActionType where id = 85264;


select *
from ActionType where EGISZ_code != '';

select *
from ActionTypeEGISZ2 where id = 7357;