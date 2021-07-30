Регис-ХСН-093


select *
from ActionType where group_id = 56182


select *
from ActionType at where at.group_id = 56182 and at.id = (select id from ActionType where group_id = at.group_id order by id desc limit 1)