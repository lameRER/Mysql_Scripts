select * from ActionType  where group_id = 14285 order by name


select * from rbPrintTemplate rpt where rpt.context = (select at2.context from ActionType at2 where at2.id = 43361)


select * from ActionType at2 where at2.name REGEXP 'ОНМК';

select * from ActionPropertyType apt where apt.actionType_id = 43361;



select * from DestinationTree_ActionType where actionType_id = 43361;


select * from OrgStructure_ActionType where actionType_id = 43361;





select * from rbPrintTemplate rpt where rpt.context in (select context from ActionType  where group_id = 14285 order by name)



select * from rbPrintTemplate rpt where rpt.context in (select at2.context from ActionType at2 where at2.name REGEXP 'ОНМК');