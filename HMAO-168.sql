select *
from ActionType where class = 0 and name regexp 'Кардиологическое отделение';

select *
from rbPrintTemplate order by id desc
;

set @group = 85284;


drop temporary table temp_at;
create temporary table temp_at
    (
            select 'Протокол вк' as name union
            select 'Дневник' as name union
            select 'ОБОСНОВАНИЕ' as name union
            select 'Первичный осмотр' as name
    );

insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name,
                        title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context,
                        defaultPlannedEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES,
                        nomenclativeService_id, prescribedType_id, shedule_id, counter_id, period, singleInPeriod,
                        lis_code, isActiveGroup, refferalType_id, EGISZ_code, EGISZ_typecons_code, SMS, SEMD,
                        consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14)
select *
from
(select NOW()                                                                                              createDatetime,
       null                                                                                               createPerson_id,
       NOW()                                                                                              modifyDatetime,
       NULL                                                                                               modifyPerson_id,
       0                                                                                                  deleted,
       class,
       @group group_id,
       concat('168_', (row_number() over ()) + (select count(id) from ActionType where group_id = @group)) code,
       temp_at.name as                                                                                    name,
       temp_at.name                                                                                       title,
       flatCode,
       sex,
       age,
       office,
       showInForm,
       genTimetable,
       quotaType_id,
       concat('168_', (row_number() over ()) + (select count(id) from ActionType where group_id = @group))                      context,
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
       code_f14
from ActionType,
     temp_at
where id = (select id from ActionType where group_id = 84801 limit 1)) as tmp
where not exists(select * from ActionType where tmp.name = name and tmp.group_id = group_id and tmp.deleted = deleted);


select *
from ActionType where group_id = @group;

drop temporary table temp_apt;
create temporary table temp_apt
(
   select 'Жалобы:' as name union
select 'на момент осмотра' as name union
select 'Ухудшение в течение' as name union
select 'Когда на фоне' as name union
select 'Лечение.За медицинской помощью до настоящего времени не обращался.' as name union
select 'В анамнезе' as name union
select 'На ДУ' as name union
select 'Принимает' as name union
select 'Ишемический анамнез' as name union
select 'Нарушение сердечного ритма' as name union
select 'Эпиданамнез' as name union
select 'Наследственность' as name union
select 'Аллергологический анамнез' as name union
select 'Вредные привычки' as name union
select 'Страховой анамнез:' as name union
select 'БЛ' as name union
select 'Гемотрансфузии' as name union
select 'Операции' as name union
select 'Рост' as name union
select 'вес' as name union
select 'ИМТ' as name union
select 'Окружность талии' as name union
select 'Питание' as name union
select 'Общее состояние' as name union
select 'Неврологический статус:' as name union
select 'Сознание Зрачки D=S' as name union
select 'Язык' as name union
select 'В позе Ромберга' as name union
select 'Щитовидная железа' as name union
select 'Кожные покровы' as name union
select 'Акроцианоз' as name union
select 'Пульсация' as name union
select 'Патологические высыпания' as name union
select 'Видимые слизистые' as name union
select 'Склеры' as name union
select 'Костная система' as name union
select 'Миофиксация' as name union
select 'Органы дыхания ' as name union
select 'Грудная клетка' as name union
select 'Аускультативно дыхание' as name union
select 'хрипы' as name union
select 'ЧДД' as name union
select 'Ортопноэ' as name union
select 'Сердечно – сосудистая система:' as name union
select 'Область сердца' as name union
select 'Верхушечный толчок' as name union
select 'Границы сердца' as name union
select 'Тоны сердца' as name union
select 'ритм' as name union
select 'Систолический шум' as name union
select 'ЧСС в минуту' as name union
select 'АД' as name union
select 'Желудочно-кишечный тракт' as name union
select 'Живот' as name union
select 'Симптомы раздражения брюшины' as name union
select 'Печень' as name union
select 'Пальпация' as name union
select 'Селезенка' as name union
select 'Стул' as name union
select 'Мочевыделительная система:' as name union
select 'Мочеиспускание' as name union
select 'Диурез ' as name union
select 'Периферические отеки' as name union
select 'Обоснование диагноза:' as name union
select 'Диагноз  поставлен на основании' as name union
select 'Анамнеза ' as name union
select 'Данных обследования:' as name union
select '- ЭКГ' as name union
select 'ЧСС' as name union
select 'Лабораторные показатели:' as name union
select 'Медицинской документации' as name union
select 'Обследование' as name union
select 'Информация о лечении' as name
    );

insert ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain,
                          defaultValue, norm, sex, age, penaltyUserProfile, penaltyDiagnosis, test_id,
                          laboratoryCalculator, visibleInDR, userProfile_id, ticketsNeeded, parent_id, customSelect,
                          autoFieldUserProfile, formulaAlias)
select 0 deleted,
       85257                    actionType_id,
       row_number() over () - 1 idx,
       template_id,
       temp_apt.name,
       ''                       shortName,
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
       1                        visibleInDR,
       userProfile_id,
       ticketsNeeded,
       parent_id,
       customSelect,
       autoFieldUserProfile,
       formulaAlias
from ActionPropertyType,
     temp_apt
where id = (select id from ActionPropertyType where typeName = 'String' and deleted = 0 limit 1);


select *
from ActionPropertyType where actionType_id =85281
;

select *
from rbPrintTemplate where context = (select context from ActionType where id = 85281);


select *
from rbPrintTemplate order by id desc ;