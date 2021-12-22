select context from rbPrintTemplate where id = 2505;



select at1.context
from ActionType_TissueType att, ActionType at1 where  att.master_id = at1.id and at1.deleted = 0 group by master_id;


select *
from ActionType_TissueType att, ActionType at1 where at1.id = att.master_id and at1.deleted = 0;

select id, name, context
from ActionType where id = 9751;

select *
from ActionType at1,
     ActionType_TissueType att
where at1.name = 'Анализ мочи по Зимницкому'
and att.master_id = at1.id;


select *
from ActionType where name = 'Анализ мочи по Зимницкому';



-- Шаблон печати, где такой мелкий корешок
SELECT *
FROM rbPrintTemplate WHERE  `default` REGEXP '<!--Контекст печати: 145-HMAO-70 -->';
-- Типы действия, привязанные к этому шаблону печати
SELECT *
FROM ActionType WHERE  context REGEXP '145-HMAO-70';

-- Шаблон печати Направление со штрих кодом
SELECT *
FROM rbPrintTemplate WHERE  `default` REGEXP '<!--Задача: HMAO-69 -->';

-- Event, откуда можно печатать
SELECT id, form, context, name FROM EventType WHERE  context in (SELECT context
FROM rbPrintTemplate WHERE  `default` REGEXP '<!--Задача: HMAO-69 -->' ;


select * from Action where id = 22640311;


select *
from ActionType where id = 26766;

select *
from ActionType_TissueType where master_id = 26766;

select *
from TakenTissueJournal where externalId = (select Event.externalId from Event where id = 4612852);

select *
from TakenTissueJournal where client_id = 2475859;


select client_id
from Event where id= 4612852;

select *
from rbPrintTemplate where context='1193-napr';


select ttj.number, dt.name, at1.name, ttj.*
from Event e, Action a, ActionType at1, TakenTissueJournal ttj, ActionType_TissueType attt, DestinationTree_ActionType dat, DestinationTree dt
where e.id = a.event_id and e.id =4612852
and a.actionType_id = at1.id
and a.deleted = 0
and at1.deleted = 0 and at1.id = 26766
and ttj.id = a.takenTissueJournal_id
and at1.id = attt.master_id
and dat.actionType_id = at1.id
and dt.id = dat.master_id;


select *
from DestinationTree where id =10241;


select ttj.number as number, dt.name as groupName, at1.name as name1, dat.master_id
    from Event e, Action a, ActionType at1, TakenTissueJournal ttj, ActionType_TissueType attt, DestinationTree_ActionType dat, DestinationTree dt
    where e.id = a.event_id and e.id = 4612852
    and a.actionType_id = at1.id
    and a.deleted = 0
    and at1.deleted = 0
    and ttj.id = a.takenTissueJournal_id
    and at1.id = attt.master_id
    and dat.actionType_id = at1.id
    and dt.id = dat.master_id;

update ActionType
set context = '1193-napr'
where id in
(select id
from ActionType where id in
(select actionType_id
from DestinationTree_ActionType where master_id = 10241) and deleted = 0);



select *
from DestinationTree where name = '810094: Диагностика лабораторная';
select *
from DestinationTree where id in(10172, 9997);


update ActionType
set context = '1193-napr'
where id in
(select id
from ActionType where id in
(select actionType_id
from DestinationTree_ActionType where master_id in
(select id
from DestinationTree where parent_id = 10187)) and deleted = 0);


select *
from rbPrintTemplate where context = '';


select * from ActionType where name regexp 'Экстренное извещение об инфекционном заболевании';

select *
from rbPrintTemplate where context = 'f058';

select *
from DestinationTree_ActionType where actionType_id = 40673;


select *
from ActionPropertyType where actionType_id = 40673 and deleted = 0 order by  idx;


select typeName
from ActionPropertyType group by typeName;

select *
from ActionPropertyType where typeName = 'DateTime';


select *
from ActionType where name regexp 'эпикриз ';

select id, name, customSelect, formulaAlias
from ActionPropertyType where actionType_id = 88162 and deleted = 0 order by idx;

select id, formulaAlias, context
from ActionType where id = 88162;

select *
from rbPrintTemplate where context = 'pol_03';

FORMULA=round((10000*osm_vr_kr.weight)/(osm_vr_kr.height*osm_vr_kr.height),2)

insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias)
select
       deleted,
       actionType_id,
       idx+1,
       template_id,
       'ИМТ' name,
       shortName,
       descr,
       unit_id,
       'String'typeName,
       valueDomain,
       defaultValue,
       isVector,
       norm,
       sex,
       age,
       penalty,
       penaltyUserProfile,
       penaltyDiagnosis,
       visibleInJobTicket,
       visibleInTableRedactor,
       isAssignable,
       test_id,
       defaultEvaluation,
       canChangeOnlyOwner,
       isActionNameSpecifier,
       laboratoryCalculator,
       inActionsSelectionTable,
       redactorSizeFactor,
       isFrozen,
       typeEditable,
       visibleInDR,
       userProfile_id,
       userProfileBehaviour,
       copyModifier,
       ticketsNeeded,
       parent_id,
       customSelect,
       autoFieldUserProfile,
       formulaAlias
from ActionPropertyType where id = 472316;


select *
from rbPrintTemplate where context in
(select context
from Action a, ActionType at1 where a.event_id = 4612852 and a.deleted = 0 and at1.id = a.actionType_id and at1.class = 1);


select *
from rbPrintTemplate where name regexp 'Экстренное извещение об инфекционном заболевании, пищевом';