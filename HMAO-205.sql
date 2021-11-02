insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name,
                       title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context,
                       defaultPlannedEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES,
                       nomenclativeService_id, prescribedType_id, shedule_id, counter_id, period, singleInPeriod,
                       lis_code, isActiveGroup, refferalType_id, EGISZ_code, EGISZ_typecons_code, SMS, SEMD,
                       consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14,
                       tarifForEgorichev)
select * from
(select
       NOW() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       0 deleted,
       class,
       group_id,
       concat_ws('-', '205', idx + 1)code,
       ta.name,
       ta.name title,
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
from ActionType at1, temp_at1 ta
where at1.class = 0
  and at1.deleted = 0
  and at1.id = (select min(id) from ActionType where group_id = 84668)) as tmp
where not exists(select * from ActionType where tmp.name = name and tmp.group_id = group_id) group by tmp.name;

drop temporary table if exists temp_at1;
create temporary table if not exists temp_at1(
    select 'Назначение наркотических средств' as name, 0 as idx union
    select 'Направление на телеконсультацию' as name, 1 as idx union
    select 'Закрытая репозиция перелома лучевой кости' as name, 2 as idx union
    select 'Вправление вывиха левого плеча' as name, 3 as idx union
    select 'Скелетное вытяжение' as name, 4 as idx union
    select 'Протокол трансфузии (переливания) донорской крови и (или) ее компонентов №' as name, 5 as idx union
    select 'Осмотр травматолога' as name, 6 as idx union
    select 'Осмотр дежурного травматолога' as name, 7 as idx union
    select 'Обход с зав. отделением' as name, 8 as idx union
    select 'Обход лечащего врача' as name, 9 as idx union
    select 'Обоснование клинического диагноза' as name, 10 as idx union
    select 'Лист оценки риска развития венозных тромбоэмболических осложнений (ВТЭО) в травматологии и ортопедии' as name, 11 as idx
);

select at1.id, at1.code, at1.name
from ActionType at1
left join ActionPropertyType apt on apt.actionType_id = at1.id
where at1.group_id = 84668 and apt.id is null ;
insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, norm, sex, age, penaltyUserProfile, penaltyDiagnosis, test_id,
                               laboratoryCalculator, userProfile_id, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias)
select
       deleted,
       87380 actionType_id,
       row_number() over ()-1 idx,
       template_id,
       ta.name,
       '' shortName,
       descr,
       unit_id,
       typeName,
       '' valueDomain,
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
from ActionPropertyType apt, temp_apt ta
where apt.id=439648;

drop temporary table if exists temp_apt;
create temporary table if not exists temp_apt(
    select 'Назначено с целью обезболивания в послеоперационном периоде' as name, 0 as idx union
    select 'В присутствии врача вскрыто и введено внутримышечно' as name, 1 as idx union
    select 'Мед. сестра ' as name, 2 as idx union
    select 'Эффект от введения препарата' as name, 3 as idx
);

select *
from ActionPropertyType where actionType_id = 87380;

select *
from rbPrintTemplate where context in 
(select context
from ActionType where group_id =84668);

select id,
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       code,
       name,
       context,
       fileName,
       `default`,
       dpdAgreement,
       type,
       hideParam,
       banUnkeptDate,
       counter_id,
       deleted,
       isPatientAgreed,
       groupName,
       documentType_id,
       isEditableInWeb,
       chkProfiles,
       chkPersons,
       pageOrientation,
       sendMail,
       useToView
from rbPrintTemplate order by id desc limit 1;

INSERT INTO s11.rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail, useToView)
VALUES (now(), 1, now(), 1, '205', 'Согласие на обрабтку персональных данных', 'tokn', '', '', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0, 0);

select id, name, fileName from 
-- update
rbPrintTemplate 
-- set fileName = '2867_Лист_оценки_риска_развития_венозных_тромбоэмболических_осложнений_\(ВТЭО\)_в_травматологии_и_ортопедии.html'
where id = 2867;



