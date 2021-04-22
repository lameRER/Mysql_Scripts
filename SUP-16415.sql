select * from ActionType at2 where at2.name REGEXP 'УЗИ БЦА';


select * from DestinationTree dt where dt.id = 10082;


select * from DestinationTree_ActionType dtat where actionType_id = 11021;



select * from DestinationTree_ActionType where master_id = 10082;



select * from ActionType at2 where at2.group_id = 11021;




select apt.* 
from ActionPropertyType apt, ActionType at2, rbJobType rjt 
where at2.id in (11021,11028,11025,11019) and apt.actionType_id = at2.id and apt.deleted = 0 and apt.name = 'Номерок'
and rjt.code = apt.valueDomain 


select * from OrgStructure_ActionType where actionType_id in(11019,11025,11021,11028)