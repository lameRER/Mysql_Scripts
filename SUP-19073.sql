Регис-ХСН-093
Региз-ОНМК-007
Региз-онко-095
Региз-МБ-093
Региз-ВП-091
Региз-covid19-014


set @name = 'Региз-covid19-014';
set @code = '19073';

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
                       quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id,
                       isActiveGroup, lis_code, period, singleInPeriod, refferalType_id, formulaAlias)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       class,
       group_id,
       concat(@code, '-', (select count(code) from ActionType where group_id = 56182 and code regexp @code)+1) code,
       @name name,
       @name title,
       flatCode,
       sex,
       age,
       office,
       showInForm,
       genTimetable,
       quotaType_id,
       context,
       defaultPlannedEndDate,
       defaultExecPerson_id,
       defaultOrg_id,
       isMES,
       nomenclativeService_id,
       prescribedType_id,
       shedule_id,
       counter_id,
       isActiveGroup,
       lis_code,
       period,
       singleInPeriod,
       refferalType_id,
       formulaAlias
from ActionType at where at.group_id = 56182 and at.id = (select id from ActionType where group_id = at.group_id order by id desc limit 1)


select *
from ActionType where group_id = 56182 and code regexp @code;

set @num = -1;

select
       apt.deleted,
       at.id actionType_id,
       @num:=@num+1 idx,
       template_id,
       apt1.name name,
       shortName,
       descr,
       unit_id,
       typeName,
       valueDomain,
       defaultValue,
       isVector,
       norm,
       apt.sex,
       apt.age,
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
       isVitalParam,
       vitalParamId,
       isODIIParam,
       ticketsNeeded,
       customSelect,
       autoFieldUserProfile,
       apt.formulaAlias,
       incrementOnSave
from ActionPropertyType apt
join ActionType at on at.id = 56237
join (
    select 'Дата, время поступления вызова' as name
union
select 'Дата и время передачи вызова бригаде' as name
union
select 'Дата и время выезда на вызов' as name
union
select 'Дата, время прибытия на место вызова' as name
union
select 'Время появления первых симптомов ОНМК, или время, когда пациента видели здоровым (VIMISSSZ2)' as name
union
select 'Уровень сознания, в соответствии со шкалой комы Глазго (VIMISSSZ1)' as name
union
select 'Нарушение речи или понимания окружающей обстановки' as name
union
select 'АД' as name
union
select 'ЧСС' as name
union
select 'Сатурация (%)' as name
union
select 'Гемипарез (слабость в руке и ноге с одной стороны)' as name
union
select 'Форсированный поворот глаз в сторону' as name
union
select 'Лечение на догоспитальном этапе (множественный выбор)' as name
union
select 'Тип стационара, в который направлен пациент' as name
union
select 'Дата и время начала транспортировки пациента' as name
union
select 'Дата и время прибытия в МО с пациентом' as name
    ) as apt1
where apt.id = (select id from ActionPropertyType where typeName = 'string' order by id desc limit 1);