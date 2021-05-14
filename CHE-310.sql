select * from rbCounter rc ;


select * from DestinationTree_ActionType dtat where dtat.master_id  = 9748;

select * from DestinationTree dt where dt.deleted = 0 ;


select * from ActionPropertyType apt where apt.actionType_id = 21259 and deleted  = 0;



select DISTINCT apt.typeName from ActionPropertyType apt group by apt.typeName ;