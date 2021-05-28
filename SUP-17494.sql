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

select *
from netricaObsled;


SELECT * FROM netricaObsled WHERE name = 'Пневмония'


SELECT * FROM netricaObsled WHERE name = 'Больные, с установленным диагнозом COVID-19'

select *
from ActionPropertyType where actionType_id=56191 ;
;

select *
from ActionType where id =56191;

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
from ActionPropertyType where actionType_id=56191 and deleted= 0


select *
from rbPrintTemplate where context = 'SARS2';


select *
from ActionPropertyType
where actionType_id = 49901
  and deleted = 0;

select *
from rbPrintTemplate
where context = '145-9957';


