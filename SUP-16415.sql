select * from ActionType at2 where at2.name REGEXP 'УЗИ БЦА';


select * from DestinationTree dt where dt.id = 10082;


select * from DestinationTree_ActionType dtat where actionType_id = 11021;



select * from DestinationTree_ActionType where master_id = 10082;



select * from ActionType at2 where at2.group_id = 11021;




select at2.* 
from ActionPropertyType apt, ActionType at2, rbJobType rjt 
where at2.id in (11021,11028,11025,11019) and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name = 'Номерок'
and rjt.code = apt.valueDomain 