select *
from actiontype where name regexp 'Первичный осмотр кардиолога';

select *
from rbprinttemplate where context = '1osm_infekc';


select *
from s11.actionpropertytype where actionType_id = 96751;


select apt1.id,
       concat_ws(' ', apt.deleted, apt1.deleted) as deleted,
       apt1.name,
       apt.typeName as OldTypeName,
       apt1.typeName as NewTypeName
from actionpropertytype apt
         join s11.actionpropertytype apt1 on apt.id = apt1.id and (apt.typeName != apt1.typeName or apt.deleted != apt1.deleted)
where apt1.actionType_id = 96751;


select apt.isVitalParam, apt.vitalParamId, apt.*
from s11.actionpropertytype apt where id = 49881;


select *
from s11.rbSeverityCondition;