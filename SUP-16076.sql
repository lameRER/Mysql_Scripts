select * from ActionType  where group_id = 14285 order by name


select * from rbPrintTemplate rpt where rpt.context = (select at2.context from ActionType at2 where at2.id = 43361)


select * from ActionType at2 where at2.name REGEXP 'дежурный';

select * from 15_EIS_POL;


-- set @idxs = 0;
select * from 
-- update 
ActionPropertyType 
-- set idx = @idxs:=@idxs+1
where actionType_id = 43361 order by idx;


INSERT INTO s11.ActionPropertyType
(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
VALUES(0, 43361, 0, NULL, 'Сутки в ОРИТ', '', '', NULL, 'String', '', NULL, 0, '', 0, '', 0, NULL, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, 0, 1, 1, NULL, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);




select * from DestinationTree_ActionType where actionType_id = 43362;

select * from OrgStructure_ActionType osat where actionType_id = 43362;


set @counts = 6;
INSERT into OrgStructure_ActionType (master_id, idx, actionType_id)
select tmp.master_id, @counts:=@counts+1, tmp.actionType_id from (
select os.id master_id, oat.actionType_id 
from OrgStructure_ActionType oat, OrgStructure os 
where oat.actionType_id = 43362 and os.id in(28,29,39)
GROUP by os.id) as tmp





select * from rbPrintTemplate rpt where rpt.`default` REGEXP 'сутки в';



select * from rbPrintTemplate rpt where rpt.context in (select context from ActionType  where group_id = 14285 order by name)



select * from rbPrintTemplate rpt where rpt.context in (select at2.context from ActionType at2 where at2.name REGEXP 'ОНМК');

select cbs.height, cbs.weight from ClientBodyStats cbs where cbs.client_id = 798557 order by id desc limit 1 	


select * from ClientBodyStats where client_id = 798557;
