select *
from ActionType where group_id = 84814 and class = 0 and deleted = 0 order by id desc ;

set @group = 87416;

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, defaultPlannedEndDate,
                       defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id, period, singleInPeriod, lis_code, isActiveGroup, refferalType_id,
                       EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId, old_group_id, old_id, code_f30, code_f14, tarifForEgorichev)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       0 deleted,
       0 class,
       group_id,
       '254' code,
       'Педиатрическое отделение' name,
       'Педиатрическое отделение' title,
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
from ActionType where group_id  = 84814 limit 1;


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
         @`group` group_id,
         concat_ws('-', '215', row_number() over ()) code,
         ta.name,
         ta.name title,
         flatCode,
         sex,
         age,
         office,
         showInForm,
         genTimetable,
         quotaType_id,
         concat_ws('-', '215', row_number() over ()) context,
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
       and at1.id = (select min(id) from ActionType where group_id = 84814)) as tmp
where not exists(select * from ActionType where tmp.name = name and tmp.group_id = group_id) group by tmp.name;

drop temporary table if exists temp_at1;
create temporary table if not exists temp_at1(
select 'Обоснование клинического диагноза' as name union
select 'Осмотр лечащего врача' as name union
select 'Первичный осмотр с зав. отделением' as name union
select 'Первичный осмотр в приемном отделении' as name union
select 'Осмотр совместно с зав. отделением' as name
);


insert into ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, norm, sex, age, penaltyUserProfile, penaltyDiagnosis, test_id,
                               laboratoryCalculator, userProfile_id, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias, visibleInDR)
select
       deleted,
       87429 actionType_id,
       ta.idx idx,
       template_id,
       ta.name,
       '' shortName,
       descr,
       unit_id,
       if(ta.name regexp ':', 'Раздел', 'String')typeName,
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
       formulaAlias,
       1 visibleInDR
from ActionPropertyType apt, temp_apt ta
where apt.id=439648;

drop temporary table if exists temp_apt;
create temporary table if not exists temp_apt(
select 'ЧСС' as name, 0 as idx union
select 'ЧДД' as name, 1 as idx union
select 'Температура' as name, 2 as idx union
select 'Пульс' as name, 3 as idx union
select 'Ад' as name, 4 as idx union
select 'Вес' as name, 5 as idx union
select 'Рост' as name, 6 as idx union
select 'Имт' as name, 7 as idx union
select 'ЖАЛОБЫ ПРИ ПОСТУПЛЕНИИ' as name, 8 as idx union
select 'АНАМНЕЗ ЗАБОЛЕВАНИЯ:' as name, 9 as idx union
select 'Течение заболевания' as name, 10 as idx union
select 'Амбулаторное лечение' as name, 11 as idx union
select 'Осмотрен участковым врачом' as name, 12 as idx union
select 'Насморк в течение' as name, 13 as idx union
select 'Кашель в течении' as name, 14 as idx union
select 'Одышка в течении' as name, 15 as idx union
select 'Повышение температуры тела' as name, 16 as idx union
select 'Доставлен скорой помощью' as name, 17 as idx union
select 'Помощь, оказанная скорой помощью' as name, 18 as idx union
select 'Причина обращения' as name, 19 as idx union
select 'Анамнез жизни:' as name, 20 as idx union
select 'Ребенок от' as name, 21 as idx union
select 'Течение беременности на фоне' as name, 22 as idx union
select 'Роды в сроке' as name, 23 as idx union
select 'Вес при рождении' as name, 24 as idx union
select 'Рост при рождении' as name, 25 as idx union
select 'Родился в состоянии' as name, 26 as idx union
select 'Перевод в патологию новорожденных' as name, 27 as idx union
select 'До одного года развитие' as name, 28 as idx union
select 'Грудное вскармливание' as name, 29 as idx union
select 'Перенесенные заболевания' as name, 30 as idx union
select 'Переливание крови и ее компонентов' as name, 31 as idx union
select 'Профилактические привычки' as name, 32 as idx union
select 'Наследственность' as name, 33 as idx union
select 'По материнской линии' as name, 34 as idx union
select 'По отцовской линии' as name, 35 as idx union
select 'Аллергологический анамнез' as name, 36 as idx union
select 'Диспансерный учет' as name, 37 as idx union
select 'Эпидемиологический анамнез:' as name, 38 as idx union
select 'Контакт с инфекционными' as name, 39 as idx union
select 'Контакт с больными ТВС, вен.заболеваниями, гепатитами, ВИЧ-инфекцией' as name, 40 as idx union
select 'Характер питания в течение последних 3-х дней до госпитализации' as name, 41 as idx union
select 'Посещение мест общественного питания за 7 дней до госпитализации' as name, 42 as idx union
select 'Использование воды в качестве питья' as name, 43 as idx union
select 'Последнее посещение детского организованного коллектива' as name, 44 as idx union
select 'Предыдущие случаи кишечных инфекций в течение года' as name, 45 as idx union
select 'Заболеваемость ОРВИ и кишечными инфекциями среди членов семьи за последние 21 день' as name, 46 as idx union
select 'Выезд в течение последних трех лет в очаги инфекционных заболеваний' as name, 47 as idx union
select 'Дополнительные сведения' as name, 48 as idx union
select 'Сведения собраны со слов' as name, 49 as idx union
select 'Объективный статус:' as name, 50 as idx union
select 'Общее состояние' as name, 51 as idx union
select 'Обусловленное' as name, 52 as idx union
select 'Сознание' as name, 53 as idx union
select 'Реакция на осмотр' as name, 54 as idx union
select 'Самочувствие' as name, 55 as idx union
select 'Аппетит' as name, 56 as idx union
select 'Телосложение' as name, 57 as idx union
select 'Питание' as name, 58 as idx union
select 'Физическое развитие' as name, 59 as idx union
select 'Кожные покровы' as name, 60 as idx union
select 'Сыпь' as name, 61 as idx union
select 'Отделяемое из глаз' as name, 62 as idx union
select 'Болезненность при пальпации козелков' as name, 63 as idx union
select 'Отделяемое от уха' as name, 64 as idx union
select 'Цианоз' as name, 65 as idx union
select 'Подкожно-жировой слой' as name, 66 as idx union
select 'Тургор тканей' as name, 67 as idx union
select 'Лимфатические узлы' as name, 68 as idx union
select 'Зев' as name, 69 as idx union
select 'Миндалины' as name, 70 as idx union
select 'Видимые слизистые' as name, 71 as idx union
select 'Отеки' as name, 72 as idx union
select 'Костно-суставная система' as name, 73 as idx union
select 'Суставы' as name, 74 as idx union
select 'Грудная клетка' as name, 75 as idx union
select 'Дыхание через нос' as name, 76 as idx union
select 'Кашель' as name, 77 as idx union
select 'Одышка' as name, 78 as idx union
select 'Участие вспомогательной мускулатуры' as name, 79 as idx union
select 'Перкуторно' as name, 80 as idx union
select 'Аускультативно' as name, 81 as idx union
select 'Хрипы' as name, 82 as idx union
select 'Границы сердца' as name, 83 as idx union
select 'Сердечные тоны' as name, 84 as idx union
select 'Ритм' as name, 85 as idx union
select 'Шум' as name, 86 as idx union
select 'Язык' as name, 87 as idx union
select 'Живот' as name, 88 as idx union
select 'Печень' as name, 89 as idx union
select 'Селезенка' as name, 90 as idx union
select 'Стул' as name, 91 as idx union
select 'Мочеиспускание' as name, 92 as idx union
select 'Диурез' as name, 93 as idx union
select 'Симптом поколачивания' as name, 94 as idx union
select 'Неврологический статус:' as name, 95 as idx union
select 'Нарушения витальных функций' as name, 96 as idx union
select 'Психомоторное развитие' as name, 97 as idx union
select 'Патологическая глазная симптоматика' as name, 98 as idx union
select 'Глазные щели:' as name, 99 as idx union
select 'D=S, взгляд' as name, 100 as idx union
select 'Реакция зрачков на свет' as name, 101 as idx union
select 'Лицо' as name, 102 as idx union
select 'Язык' as name, 103 as idx union
select 'Небные, глоточные рефлексы' as name, 104 as idx union
select 'Объем движений в конечностях' as name, 105 as idx union
select 'Тонус мышц' as name, 106 as idx union
select 'Болевая чувствительность' as name, 107 as idx union
select 'Координационные пробы' as name, 108 as idx union
select 'Пальпация остистых отростков позвоночника' as name, 109 as idx union
select 'Менингефльные знаки' as name, 110 as idx union
select 'Симптом Кернига' as name, 111 as idx union
select 'Симптом Брудзинского' as name, 112 as idx union
select 'Гиперестезия' as name, 113 as idx union
select 'Судороги' as name, 114 as idx union
select 'ПРЕДВАРИТЕЛЬНЫЙ ДИАГНОЗ' as name, 115 as idx union
select 'ОБСЛЕДОВАНИЕ' as name, 116 as idx union
select 'План лечения' as name, 117 as idx
);

select *
from ActionType where group_id = @`group`


select *
from rbPrintTemplate order by id desc ;