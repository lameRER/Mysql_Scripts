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


select * from DestinationTree where deleted= 0 and visible = 1;


select * from Person where login regexp 'врач';


select *
from rbPost where netrica_Code = '10234';


select *
from rbPost where name regexp 'уролог';

select * from rbPost where netrica_Code = '10234'


select *
from Person where id = 633;



select *
from ActionPropertyType ;


select *
from ActionType where code regexp '06.09.005.003';

select *
from rbService where code regexp '06.09.005.003';

select *
from Organisation where id in (6846, 3310);


select *
from Organisation where fullName = 'Анестезиологии и реанимации ФГБУЗ "Клиническая больница №122 имени Л.Г. Соколова ФМБА России"';

insert into s11.Organisation (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, fullName, shortName, title, net_id, infisCode, obsoleteInfisCode, OKVED, INN, KPP, OGRN, OKATO, OKPF_code, OKPF_id, OKFS_code, OKFS_id, OKPO, FSS, region, address, chief, phone, accountant, isInsurer, isCompulsoryInsurer, isVoluntaryInsurer, compulsoryServiceStop, voluntaryServiceStop, area, isHospital, notes, head_id, miacCode, isMedical, isArmyOrg, canOmitPolicyNumber, netrica_Code, DATN, DATO, grkm_code, reestrNumber, mse_code, isMSEBureau, llo_code, llo_name, FOMSCode)
values  ('2021-06-29 11:36:40', 1069, now(), null, 0, 'Анестезиологии и реанимации ФГБУЗ "Клиническая больница №122 имени Л.Г. Соколова ФМБА России"', 'Анестезиологии и реанимации ФГБУЗ "Клиническая больница №122 име', 'Анестезиологии и реанимации ФГБУЗ "Клиническая больница №122 име', null, '', '', '', '', '', '', '', '', null, 0, null, '', '', '', '194291, СПб, пр-кт. Культуры, д.4 лит.а, ,', '', '', '', 0, 0, 0, 0, 0, '', 1, '', null, '', 1, 0, 0, '2dd209a2-e7be-49bb-afba-674e7527144b', '2000-01-01', '2200-01-01', null, null, null, null, null, null, null);

select *
from Organisation where shortName = 'нКом
';

select *
from ClientPolicy where insurer_id = 6846 and deleted = 0 group by client_id;


select *
from Event;



select rbService.id,
       rbService.createDatetime,
       rbService.createPerson_id,
       rbService.modifyDatetime,
       rbService.modifyPerson_id,
       rbService.group_id,
       rbService.code,
       at.name,
       eisLegacy,
       nomenclatureLegacy,
       license,
       infis,
       begDate,
       endDate,
       medicalAidProfile_id,
       medicalAidKind_id,
       medicalAidType_id,
       adultUetDoctor,
       adultUetAverageMedWorker,
       childUetDoctor,
       childUetAverageMedWorker,
       qualityLevel,
       superviseComplexityFactor,
       tarif,
       gr,
       category_id,
       caseCast_id,
       netrica_Code,
       Fed_code
from rbService, ActionType at
where rbService.id = (select id from rbService order by id desc limit 1) and at.id in (select id from ActionType);

(select '1'
union
select '2'
union
select '3'
union
select '4'
union
select '5'
union
select '6'
union
select '7'
union
select '8'
union
select '9');


select *
from ActionPropertyType where actionType_id in(
select id
from ActionType where id in(
select master_id
from ActionType_Service where service_id in (
select id
from rbService where Fed_code = 'A06.09.005.003')))
;

select *
from ActionType where id in(
    select master_id
    from ActionType_Service where service_id in (
        select id
        from rbService where Fed_code = 'A06.09.005.003'));

select *
from ActionPropertyType where actionType_id in(
    select id
    from ActionType where id in(
        select master_id
        from ActionType_Service where service_id in (
            select id
            from rbService where Fed_code = 'A06.20.002.004')))
;


select *
from ActionType where id in(
    select master_id
    from ActionType_Service where service_id in (
        select id
        from rbService where Fed_code = 'A06.20.002.004'))
;

select *
from rbService where Fed_code = 'A06.09.005.003';

select *
from rbService where Fed_code = 'A06.20.002.004';
