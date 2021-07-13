select at2.* from ActionType at2, ActionPropertyType apt 
where at2.group_id in (select at3.id from ActionType at3 where at3.code in('КТ - уКРТбк','КТ- уКРТом'))
and apt.actionType_id = at2.id


select * from rbJobType rjt ;




select * from rbService rs where rs.Fed_code REGEXP '06\.03\.021\.003';


select * from rbJobType_ActionType  where master_id = 22;
42855

select * from ActionType at2 where at2.name REGEXP 'Спиральная компьютерная томография шеи';

select * from OrgStructure_ActionType where master_id = 139;

select * from OrgStructure os where os.code = 'Компьютерный Томограф(Группа)';



set @number = 11;
  
INSERT into OrgStructure_ActionType (master_id, idx, actionType_id)
select DISTINCT osat.master_id, osat.idx, at2.id actionType_id from ActionType at2, OrgStructure_ActionType osat 
where at2.group_id in (select at3.id from ActionType at3 where at3.code in('КТ - уКРТбк','КТ- уКРТом')) and osat.master_id = 139


select * from ActionType ;
select * from ActionPropertyType where deleted = 0 and actionType_id in (select id from ActionType where group_id in(42803,42804)) ;

select * from ActionType where group_id in(42803,42804)


select * from ActionType at2 where at2.group_id in (42803,42804);


select * from ActionType at2 where group_id in(42803,42804);

INSERT into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select * from (
select apt.deleted, at2.id actionType_id, apt.idx, apt.template_id, apt.name, apt.shortName, apt.descr, apt.unit_id, apt.typeName, apt.valueDomain, apt.defaultValue, apt.isVector, apt.norm, apt.sex, apt.age, apt.penalty, apt.penaltyUserProfile, apt.visibleInJobTicket, apt.visibleInTableRedactor, apt.isAssignable, apt.test_id, apt.defaultEvaluation, apt.canChangeOnlyOwner, apt.isActionNameSpecifier, apt.laboratoryCalculator, apt.inActionsSelectionTable, apt.redactorSizeFactor, apt.isFrozen, apt.typeEditable, apt.visibleInDR, apt.userProfile_id, apt.userProfileBehaviour, apt.copyModifier, apt.isVitalParam, apt.vitalParamId, apt.isODIIParam, apt.ticketsNeeded, apt.customSelect, apt.autoFieldUserProfile, apt.formulaAlias from ActionPropertyType apt, ActionType at2 
where apt.actionType_id = 43436 and apt.deleted = 0 and apt.name not REGEXP 'Номерок|ЗАКЛЮЧЕНИЕ:'
and at2.group_id in(42803,42804)) as tmp
where EXISTS (select * from ActionPropertyType apt2 where apt2.actionType_id = tmp.actionType_id )



select * from rbPrintTemplate rpt where context = 'KT-02';

select at2.* from DestinationTree_ActionType dat, ActionType at2 
where dat.master_id in(10073,10074) and at2.id = dat.actionType_id ;

select * from destinat;

select * from DestinationTree where deleted= 0 and visible = 1;


select * from Person where login regexp 'врач';


select *
from rbPost where netrica_Code = '10234';



