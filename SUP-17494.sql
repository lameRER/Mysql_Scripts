select *
from rbPrintTemplate
where name regexp '';



select *
from ActionPropertyType apt
where apt.isVitalParam = 1;

select *
from DestinationTree_ActionType
where actionType_id in (
    select id
    from ActionType
    where name regexp 'cov')
;


select *
from DestinationTree
where id = 10070;


select *
from ActionType
where id in (49882, 49883, 49886, 49887, 49885);


select *
from rbPrintTemplate
where context = 'SARS';



select context
from ActionType
WHERE ID = 49901;


select *
from ActionType where context = 'SARS2';



select *
from ActionPropertyType where actionType_id=49885 and deleted= 0


select *
from rbPrintTemplate where context = 'SARS2';


select *
from ActionPropertyType
where actionType_id = 49901
  and deleted = 0;

select *
from rbPrintTemplate
where context = '145-9957';


