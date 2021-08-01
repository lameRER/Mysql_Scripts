Регис-ХСН-093
Региз-ОНМК-007
Региз-онко-095
Региз-МБ-093
Региз-ВП-091
Региз-covid19-014



set @name = 'Регис-ХСН-093';
set @code = '19073';
set @group = (select id from ActionType where code regexp concat('^', @code) and name = @name);



insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
                       quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id,
                       isActiveGroup, lis_code, period, singleInPeriod, refferalType_id, formulaAlias)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       class,
       @group group_id,
       concat(@code, '-', (select count(code) from ActionType where group_id = @group)+1) code,
       'План ведения пациента' name,
       'План ведения пациента' title,
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
from ActionType at where at.id = @group;




set @num = -1;

insert into ActionPropertyType(actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, norm, sex, age, penaltyUserProfile,
                               penaltyDiagnosis, test_id, laboratoryCalculator, userProfile_id, vitalParamId, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select
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
       norm,
       apt.sex,
       apt.age,
       penaltyUserProfile,
       penaltyDiagnosis,
       test_id,
       laboratoryCalculator,
       userProfile_id,
       isVitalParam,
       ticketsNeeded,
       customSelect,
       autoFieldUserProfile,
       apt.formulaAlias
from ActionPropertyType apt
join ActionType at on at.group_id = @group and at.id = (select id from ActionType where group_id = @group order by id desc limit 1)
join (
select 'Организация ведения пациента' as name union
select 'Наблюдение специалиста по СН в ФГБУ НМИЦ им В.А. Алмазова' as name union
select 'Рекомендации по вакцинации против пневмококковой инфекции и гриппа' as name union
select 'Рекомендации по объему физических нагрузок на амбулаторном этапе' as name union
select 'Рекомендации по санации полости рта и очагов инфекции' as name union
select 'Рекомендации по водно-солевому режиму' as name union
select 'Рекомендованный объем выпиваемой жидкости' as name union
select 'Рекомендации по ежедневному взвешиванию с ведением дневника веса' as name union
select 'Рекомендован контроль натрия, калия, креатинина в соответствии с шагами титрации' as name union
select 'Рекомендован СМЭКГ (Холтер)' as name union
select 'Рекомендована консультация Кардиохирург' as name union
select 'Рекомендована консультация Аритмолог' as name union
select 'Рекомендована консультация Кардиолог - специалист по СН' as name union
select 'Рекомендованы высокотехнологичные (ВТ) методы лечения' as name union
select 'Рекомендована паллиативная терапия' as name
    ) as apt1
where apt.id = (select id from ActionPropertyType where typeName = 'string' order by id desc limit 1);


select *
from ActionPropertyType where actionType_id in (select id from ActionType where group_id = 56182);



select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where actionType_id = (select id from ActionType where name = 'Осмотр кардиолога' and code = '19073-1') and deleted = 0;


select *
from rbVitalParams;

create table netricaDisability(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);


insert into netricaDisability(id, deleted, code, name)
(select 1, 0, 1, '1 группа'
union
select 2, 0, 2, '2 группа'
union
select 3, 0, 3, '3 группа'
union
select 4, 0, 4, 'Ребенок-инвалид')

create table netricaYesNoThrew(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into s11.netricaYesNoThrew (id, deleted, code, name)
values  (1, 0, '1', 'Да'),
        (2, 0, '2', 'Нет'),
        (3, 0, '3', 'Бросил');



create table netricaOralCavitySanitation(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaOralCavitySanitation (id, deleted, code, name)
values  (1, 0, '1', 'Выполнена'),
        (2, 0, '2', 'Не выполнена');


create table netricaWeightDiary(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaWeightDiary (id, deleted, code, name)
values  (1, 0, '1', 'Ведет'),
        (2, 0, '2', 'Не ведет');




create table netricaEdema(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaEdema (id, deleted, code, name)
values  (1, 0, '1', 'Периферические отеки'),
        (2, 0, '2', 'Асцит'),
        (3, 0, '3', 'Анасарка'),
        (4, 0, '4', 'Гидроторакс'),
        (5, 0, '5', 'Гидроперикард'),
        (6, 0, '6', 'Сердечная астма');




create table netricaTitration(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);



insert into netricaTitration (id, deleted, code, name)
values  (1, 0, '1', 'Систолическая гипотензия'),
        (2, 0, '2', 'Брадикардия'),
        (3, 0, '3', 'Нарушения АВ/СА проведения'),
        (4, 0, '4', 'Повышение калия'),
        (5, 0, '5', 'Повышение креатинина'),
        (6, 0, '6', 'Непереносимость'),
        (7, 0, '7', 'Достижение целевой дозы');


create table netricaECGRhythm(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaECGRhythm (id, deleted, code, name)
values  (1, 0, '1', 'Синусовый'),
        (2, 0, '2', 'Фибрилляция'),
        (3, 0, '3', 'Электрокардиостимулятор'),
        (4, 0, '4', 'Другое');


create table netricaDecompensationReason(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaDecompensationReason (id, deleted, code, name)
values
       (1, 0, '1', 'Несоблюдение рекомендаций по медикаментозной терапии'),
(2, 0, '2', 'Несоблюдение водно-солевого режима'),
(3, 0, '3', 'Несоблюдение режима физической нагрузки'),
(4, 0, '4', 'Применение НПВС'),
(5, 0, '5', 'Инфекционные заболевания'),
(6, 0, '6', 'ТЭЛА'),
(7, 0, '7', 'Тахиаритмия'),
(8, 0, '8', 'Инфаркт'),
(9, 0, '9', 'Нестабильная стенокардия миокарда'),
(10, 0, '10', 'ОКС'),
(11, 0, '11', 'Другие');



create table netricaReasonPerformingElectroImpulseTherapy(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaReasonPerformingElectroImpulseTherapy (id, deleted, code, name)
values
(1, 0, '1', 'Желудочковые нарушения ритма'),
(2, 0, '2', 'Фибрилляция - трепетание предсердий');


create table netricaShownNotshown(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaShownNotshown (id, deleted, code, name)
values
(1, 0, '1', 'Показано'),
(2, 0, '2', 'Не Показано');


create table netricaLiquidVolume(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaLiquidVolume (id, deleted, code, name)
values
(1, 0, '1', 'До 1700 мл/сут'),
(2, 0, '2', 'Без ограничений');

create table netricaControlOfSodiumPotassiumCreatinine(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaControlOfSodiumPotassiumCreatinine (id, deleted, code, name)
values
(1, 0, '1', 'Через 1 неделю'),
(2, 0, '2', 'Через 2 недели'),
(3, 0, '3', '1 раз в месяц'),
(4, 0, '4', '1 раз в квартал'),
(5, 0, '5', 'не показан');


create table netricaVT(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaVT (id, deleted, code, name)
values
(1, 0, '1', 'СРТ'),
(2, 0, '2', 'СРТД'),
(3, 0, '3', 'ИКД'),
(4, 0, '4', 'ТС');

select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where actionType_id = (select id from ActionType where group_id = @group order by id desc limit 1) and deleted = 0;

select *
from ActionPropertyType where isVitalParam = 1;


select typeName
from ActionPropertyType where typeName regexp '^R|^I' group by typeName;


select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where group_id = @`group`) and deleted = 0;

select *
from ActionType where id= 56237;


select *
from ActionType where group_id = 56182;