select *
from ;







select os.name,  at2.name
from ActionType at2
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName = 'Раздел'
join OrgStructure_ActionType oat on oat.actionType_id = at2.id
join OrgStructure os on oat.master_id = os.id
join DestinationTree_ActionType dat on dat.actionType_id = at2.id and dat.master_id = 10029
where at2.deleted= 0 group by at2.id



select *
from DestinationTree where deleted = 0;