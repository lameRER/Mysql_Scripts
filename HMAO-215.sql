insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name,
                       title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context,
                       defaultPlannedEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES,
                       nomenclativeService_id, prescribedType_id, shedule_id, counter_id, period, singleInPeriod,
                       lis_code, isActiveGroup, refferalType_id, EGISZ_code, EGISZ_typecons_code, SMS, SEMD,
                       consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14,
                       tarifForEgorichev)

select
    NOW() createDatetime,
    NULL createPerson_id,
    now() modifyDatetime,
    NULL modifyPerson_id,
    0 class,
    group_id,
    '215' code,
    name,
    title,
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
    defaultSetPerson_id,
    defaultOrg_id,
    isMES,
    nomenclativeService_id,
    prescribedType_id,
    shedule_id,
    counter_id,
    period,
    singleInPeriod,
    lis_code,
    isActiveGroup,
    refferalType_id,
    EGISZ_code,
    EGISZ_typecons_code,
    SMS,
    SEMD,
    consultationTypeId,
    formulaAlias,
    instrumentalId,
    old_group_id,
    old_id,
    code_f30,
    code_f14,
    tarifForEgorichev
from (
select
*
from ActionType
where group_id in
      (select id
       from ActionType
       where class = 0
         and group_id is null
         and name regexp '^Неф'))

;

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id, period, singleInPeriod, lis_code, isActiveGroup, refferalType_id, EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14, tarifForEgorichev)
select
    NOW() createDatetime,
    NULL createPerson_id,
    now() modifyDatetime,
    NULL modifyPerson_id,
    0 class,
    87345 group_id,
    concat_ws('_', '215', row_number() over ()-1) code,
    ta.name name,
    at2.title,
    at2.flatCode,
    at2.sex,
    at2.age,
    at2.office,
    at2.showInForm,
    at2.genTimetable,
    at2.quotaType_id,
    at2.context,
    at2.defaultPlannedEndDate,
    at2.defaultExecPerson_id,
    at2.defaultSetPerson_id,
    at2.defaultOrg_id,
    at2.isMES,
    at2.nomenclativeService_id,
    at2.prescribedType_id,
    at2.shedule_id,
    at2.counter_id,
    at2.period,
    at2.singleInPeriod,
    at2.lis_code,
    at2.isActiveGroup,
    at2.refferalType_id,
    at2.EGISZ_code,
    at2.EGISZ_typecons_code,
    at2.SMS,
    at2.SEMD,
    at2.consultationTypeId,
    at2.formulaAlias,
    at2.instrumentalId,
    at2.old_group_id,
    at2.old_id,
    at2.code_f30,
    at2.code_f14,
    at2.tarifForEgorichev
from ActionType at1
join ActionType at2 on at2.id = (select id from ActionType order by id desc limit 1)
join temp_at ta on 1
group by ta.name
;

select *
from temp_at;

create temporary table temp_at
(
    select * from (
        select 'Дневник осмотра дежурного врача' as name union
        select 'Дневник осмотра лечащего врача' as name union
        select 'Обоснование диагноза' as name union
        select 'Первичный осмотр плановых пациентов' as name union
        select 'Первичный осмотр экстренных пациентов' as name union
        select 'ВК' as name union
        select 'Дневние осмотра завю отделением' as name
        ) as tmp
)


select *
from ActionType where group_id = 87345 and deleted = 0;

drop temporary table temp_apt;
create temporary table temp_apt(
select 'Жалобы' as name union
select 'An.morbi' as name union
select 'An.vitae' as name union
select 'Операции' as name union
select 'Аллергологический анамнез' as name union
select 'St.praesens:' as name union
select 'Состояние' as name union
select 'Сознание' as name union
select 'Кожные покровы' as name union
select 'Температура тела' as name union
select 'Дыхание' as name union
select 'Тоны сердца' as name union
select 'АД' as name union
select 'Живот' as name union
select 'Стул' as name union
select 'St.localis' as name union
select 'Диагноз' as name union
select 'Госпитализация' as name union
select 'План лечения' as name   
);

insert into ActionPropertyType(actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain,
                               defaultValue, norm, sex, age, penaltyUserProfile, penaltyDiagnosis, test_id,
                               laboratoryCalculator, userProfile_id, ticketsNeeded, parent_id, customSelect,
                               autoFieldUserProfile, formulaAlias)
select 87358                    actionType_id,
       row_number() over () - 1 idx,
       template_id,
       ta.name                  name,
       shortName,
       descr,
       unit_id,
       typeName,
       valueDomain,
       defaultValue,
       norm,
       sex,
       age,
       penaltyUserProfile,
       penaltyDiagnosis,
       test_id,
       laboratoryCalculator,
       userProfile_id,
       ticketsNeeded,
       parent_id,
       customSelect,
       autoFieldUserProfile,
       formulaAlias
from ActionPropertyType apt,
     temp_apt ta
where apt.id =
      (select id from ActionPropertyType where typeName = 'string' and apt.deleted = 0 order by id desc limit 1);


select *
from ActionPropertyType where actionType_id =87357 ;

select *
from ActionType where group_id =87345 and deleted = 0;

select *
from rbPrintTemplate order by id desc;
