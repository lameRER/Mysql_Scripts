use s11vm;

select *
from eventtype
where deleted = 0;

# create table SUP_23667
# (
    select *
    from
# update
event e
# set e.`order` = 5, goal_id = 11
    where e.eventType_id in (324, 72)
      and e.setDate between '2022-01-01' and '2022-01-31'
      and e.deleted = 0
      and goal_id = 1
      and `order` = 0
# and goal_id = 11 and `order` = 5
# )
;


select *
from sup_23667;

select *
from rbEventGoal;


select e.id, `order`, goal_id
from event e where e.id = 6875159;



select *
from ;


select *
from sup_23667 where id = 6875159;


# create table SUP_23667_1
#     (
#         select *
#         from
update
event e
set e.`order` = 5, goal_id = 11
        where e.eventType_id in (324, 72)
          and e.setDate between '2022-01-01' and '2022-01-31'
          and e.deleted = 0
#   and goal_id = 1
#   and `order` = 5
          and goal_id = 1
          and `order` = 5
#     )
;



select *
from sup_23667 where id = 6875159;

select id, `order`, goal_id
from event where id = 6932423;