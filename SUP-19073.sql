Регис-ХСН-093
Региз-ОНМК-007
Региз-онко-095
Региз-МБ-093
Региз-ВП-091
Региз-covid19-014




set @name = 'Региз-covid19-014';
set @code = '19073';
set @group = (select id from ActionType where code regexp concat('^', @code) and name = @name);



insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
                       quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id,
                       isActiveGroup, lis_code, period, singleInPeriod, refferalType_id, formulaAlias)
select *
from
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       class,
       @group group_id,
       concat((select code from ActionType where id = @group), '-', (select count(code) from ActionType where group_id = @group)+1) code,
       'Выписка' name,
       'Выписка' title,
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
from ActionType at where at.id = @group) as tmp
where not exists(select * from ActionType where name = tmp.name and group_id = tmp.group_id);


drop temporary table if exists temp_apt;
create temporary table if not exists temp_apt
(
select 'Поликлиника наблюдения пациента' as name union
select 'Адрес пребывания пациента' as name union
select 'Телефон для связи с пациентом' as name union
select 'Эпидномер' as name union
select 'Поликлиника наблюдения пациента' as name union
select 'Адрес пребывания пациента' as name union
select 'Телефон для связи с пациентом' as name union
select 'Эпидномер' as name
)


insert into ActionPropertyType(actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, norm, sex, age, penaltyUserProfile,
                               penaltyDiagnosis, test_id, laboratoryCalculator, userProfile_id, vitalParamId, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias)
select *
from
(select
       at.id actionType_id,
       row_number() over ()-1 idx,
       template_id,
       apt1.name name,
       shortName,
       descr,
       null unit_id,
       typeName,
       '' valueDomain,
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
join temp_apt apt1
where apt.id = (select id from ActionPropertyType where typeName = 'string' order by id desc limit 1)) as tmp
where not exists(select * from ActionPropertyType where tmp.actionType_id = actionType_id and tmp.name = name);


select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where actionType_id = (select id from ActionType where group_id = @group order by id desc limit 1) and deleted = 0;


select *
from rbVitalParams where code = '503';
select *
from ActionType where id = 56264;

select *
from ActionPropertyType where actionType_id = 56264;

select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where vitalParamId in (
    select ActionPropertyType.vitalParamId
    from ActionPropertyType
    where actionType_id = (select id from ActionType where group_id = @group order by id desc limit 1)
      and ActionPropertyType.deleted = 0
);



select *
from ActionPropertyType where actionType_id = 56258;




select typeName
from ActionPropertyType where typeName regexp '^R|^I|^t' group by typeName;


select rbVitalParams.dict_OID, rbVitalParams.*
from rbVitalParams;

select *
from netricaDestructionSide;


select *
from ActionPropertyType where actionType_id in (select id from ActionType where group_id = 56182);



select ActionPropertyType.vitalParamId, ActionPropertyType.isVitalParam, typeName, valueDomain, name, ActionPropertyType.*
from ActionPropertyType where actionType_id = (select id from ActionType where name = 'Осмотр кардиолога' and code = '19073-1') and deleted = 0;

create table netricaReasonsDiagnosis(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaReasonsDiagnosis (id, deleted, code, name)
values
(1, 0, '1', 'Неизвестно'),
(2, 0, '2', 'Скрытое течение болезни'),
(3, 0, '3', 'Несвоевременное обращение'),
(4, 0, '4', 'Отказ от обследования'),
(5, 0, '5', 'Неполное обследование'),
(6, 0, '6', 'Несовершенство диспансеризации'),
(7, 0, '7', 'Ошибка клиническая'),
(8, 0, '8', 'Ошибка рентгенологическая'),
(9, 0, '9', 'Ошибка морфологическая'),
(10, 0, '10', 'Ошибка др. специалистов'),
(11, 0, '11', 'Другое');



create table netricaExpressionHER2(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaExpressionHER2 (id, deleted, code, name)
values
(1, 0, '0', 'Негативный'),
(2, 0, '1', 'Негативный'),
(3, 0, '2', 'Спорный'),
(4, 0, '3', 'Позитивный');


create table netricaCircumstancesOfTumorDetection(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaCircumstancesOfTumorDetection (id, deleted, code, name)
values
(9, 0, '9', 'Дополнительная диспансеризация'),
(8, 0, '8', 'Осмотр специалиста'),
(11, 0, '11', 'Профилактическая флюорография'),
(10, 0, '10', 'Диспансерное наблюдение больных с предраком'),
(14, 0, '14', 'Иммуноферментный скрининг рака предстательной железы'),
(13, 0, '13', 'Профилактическая маммография'),
(12, 0, '12', 'Цитологический скрининг шейки матки'),
(7, 0, '7', 'При других обстоятельствах'),
(1, 0, '1', 'Обратился сам'),
(6, 0, '6', 'Неизвестно'),
(5, 0, '5', 'Посмертно без аутопсии'),
(4, 0, '4', 'Посмертно при аутопсии'),
(3, 0, '3', 'Активно в смотровом кабинете'),
(2, 0, '2', 'Активно при профосмотре');

create table netricaDiagnosisConfirmationMethod(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaDiagnosisConfirmationMethod (id, deleted, code, name)
values
(1, 0, '1', 'морфологический'),
(2, 0, '2', 'цитологический'),
(3, 0, '3', 'эксплоративная операция'),
(4, 0, '4', 'лабораторно-инструментальный'),
(5, 0, '5', 'только клинический'),
(6, 0, '6', 'неизвестно');


create table netricaTumorType(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaTumorType (id, deleted, code, name)
values
(1, 0 , '1', 'Онкогематология'),
(2, 0 , '2', 'Солидная опухоль');


create table netricaDestructionSide(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaDestructionSide (id, deleted, code, name)
values
(1, 0, '1', 'Правая'),
(2, 0, '2', 'Левая');




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

insert into netricaYesNoThrew (id, deleted, code, name)
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









create table netricaHospitalType(
  id int(10),
  deleted tinyint(1),
  code varchar(8),
  name varchar(128)
);

insert into netricaHospitalType (id, deleted, code, name)
values
(1, 0, '1', 'госпитализация не требуется'),
(2, 0, '2', 'ПСО'),
(3, 0, '3', 'РСЦ'),
(4, 0, '4', 'иной стационар'),
(5, 0, '5', 'отказ от госпитализации');



select *
from ActionPropertyType where isVitalParam = 1;




select *
from ActionPropertyType where actionType_id in
(select id
from ActionType where group_id = @`group`) and deleted = 0;

select *
from ActionType where id= 56237;


select *
from ActionType where group_id = 56182;


select at.name, at.group_id, apt.*
from ActionPropertyType apt, ActionType at where apt.actionType_id = at.id and apt.name regexp 'VIMISSSZ2' and at.group_id = 56182;


select *
from ActionPropertyType where actionType_id = 56183 and deleted = 0 order by idx;

select *
from ActionType where id in(56182,56210);

select *
from ActionType where group_id = 56239;

select *
from ActionPropertyType where actionType_id = 56257 and deleted = 0;

select apt.*
from ActionType at, ActionPropertyType apt where at.group_id = 56238 and apt.actionType_id = at.id and apt.deleted =0;


select *
from VIMISSSZ14;


select *
from rbVitalParams where code = '6';



select *
from s11.Person where userProfile_id = 1;



select *
from rborgs

select *
from ActionType where id = 1;


select *
from ActionPropertyType where valueDomain regexp '<|>';

select vp.*, ActionPropertyType.isVitalParam, ActionPropertyType.vitalParamId, ActionPropertyType.valueDomain, ActionPropertyType.typeName, ActionPropertyType.*
from ActionPropertyType
join rbVitalParams vp on vp.id = ActionPropertyType.vitalParamId
where actionType_id in
(select id from ActionType at where group_id in
(select id
from ActionType where group_id =
(select id
from ActionType where name = 'региз')
and code regexp '^19073'))
and vitalParamId not in (0,1) and deleted = 0 and isVitalParam = 0
;


set @dict_OID = '1.2.643.5.1.13.13.99.2.234';
set @valueDomain = 'netricaBloodRhfactorDonors';
set @vitId = 318;

update
    ActionPropertyType apt
join rbVitalParams vp on vp.id = apt.vitalParamId
set apt.isVitalParam = 1,
    apt.valueDomain = @valueDomain,
    vp.dict_OID = @dict_OID
where vp.id = @vitId;

SET @t1 =CONCAT('create table  ',@valueDomain,
'
(  id int(10) NOT NULL AUTO_INCREMENT,
deleted tinyint(1),
code varchar(8),
name varchar(128),
primary key (id));');
 PREPARE stmt3 FROM @t1;
 EXECUTE stmt3;

SET @t1 =CONCAT('insert into ', @valueDomain, ' (deleted, code, name) values
(0, ''1'', ''Активное''),
(0, ''2'', ''Чрезмерное''),
(0, ''3'', ''Отсутствует'');
');
 PREPARE stmt3 FROM @t1;
 EXECUTE stmt3;




select apt.*
from rbVitalParams vp
join ActionPropertyType apt on apt.vitalParamId = vp.id
where vp.dict_OID = @dict_OID;


select *
from netricaPrehospitalTreatment;
