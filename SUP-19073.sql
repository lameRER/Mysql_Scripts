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
       'Осмотр кардиолога' name,
       'Осмотр кардиолога' title,
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


select *
from ActionType where group_id = 56182 and code regexp @code;

select *
from ActionType where id = 56243;




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
join ActionType at on at.group_id = @group
join (
select 'Статус диспансерного учета' as name
union
select 'Функциональный класс по NYHA' as name
union
select 'Инвалидность (группа)' as name
union
select 'Курение' as name
union
select 'Употребление алкоголя' as name
union
select 'Санация очагов инфекции, полости рта' as name
union
select 'Вакцинация от гриппа в течение года' as name
union
select 'Вакцинация от пневмококка в течение 5 лет' as name
union
select 'Дневник веса' as name
union
select 'Рост' as name
union
select 'Вес' as name
union
select 'САД' as name
union
select 'ДАД' as name
union
select 'САД' as name
union
select 'ДАД' as name
union
select 'ЧСС' as name
union
select 'Отеки' as name
union
select 'Сатурация кислорода  (%)' as name
union
select 'Была ли отмена препарата' as name
union
select 'Была ли титрация препарата' as name
union
select 'Если была отмена/ остановка титрации, указать причину' as name
union
select 'Результаты инструментальных обследований:' as name
union
select 'Ритм на ЭКГ' as name
union
select 'ЧСС на ЭКГ(количество в минуту)' as name
union
select 'Ширина QRS (секунд)' as name
union
select 'Дата  Эхо-КГ' as name
union
select 'Фракция выброса по Simpson (%)' as name
union
select 'Фракция выброса по Teichholz (%)' as name
union
select 'Наличие патологического числа желудочковых нарушений ритма при последнем Холтеровском мониторировании ЭКГ' as name
union
select 'Дата Рентгена органов грудной клетки' as name
union
select 'План ведения пациента' as name
union
select 'Назначенные медикаменты, включая препараты следующих групп' as name
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


select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where actionType_id = (select id from ActionType where name = 'Осмотр кардиолога' and code = '19073-1') and deleted = 0 and vitalParamId = 0 and isVitalParam = 0;

select *
from ActionPropertyType where isVitalParam = 1;