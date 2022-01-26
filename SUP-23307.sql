update
 ptd7.ClientPolicy cp, ptd7.Client c, ptd7.temp_clientPolice_lu l
set cp.number = l.number
where c.id = cp.client_id and c.deleted = 0 and c.id = l.client_id order by cp.number  ;


update ptd7.ClientPolicy cp
    join ptd7.temp_clientPolice_lu l on l.client_id = cp.client_id
set cp.number = convert(l.number, unsigned)
where cp.deleted = 0;


select cp.number, l.number
from ptd7.ClientPolicy cp
join ptd7.temp_clientPolice_lu l on l.client_id = cp.client_id;

select cp.number, cp.*
from ptd7.ClientPolicy cp;


select l.number, l.*
from ptd7.temp_clientPolice_lu l;


select *
from ptd7.ClientPolicy cp, ptd7.temp_clientPolice_lu l where cp.id = l.id;



select *
from s11.ActionType where name = 'кт';

select * from s11.ActionType where group_id = 13702