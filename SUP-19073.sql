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


set @dict_OID = '1.2.643.5.1.13.13.11.1487';
set @valueDomain = 'netricaInternationalClassificationDiseasesOncology';
set @vitId = 218;

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
323
МОЧЕВОЙ ПУЗЫРЬ
318
Почка, БДУ
36
Небо, БДУ
211
Селезенка
210
Костный мозг
117
Сигмовидная кишка
24
Нижняя десна
356
Лобная доля
11
Губа, БДУ
96
Преддверие желудка
95
Тело желудка
94
Дно желудка
32
Твердое небо
382
Паращитовидная железа
341
Конъюнктива
185
Средостение, БДУ
278
Дно матки
184
Заднее средостение
183
Переднее средостение
277
Миометрий
358
Теменная доля
26
ДНО ПОЛОСТИ РТА
72
ГОРТАНОГЛОТКА
359
Затылочная доля
126
Анальный канал
125
Задний проход (анус), БДУ
306
Неопустившееся яичко
109
ТОЛСТАЯ КИШКА
124
ЗАДНИЙ ПРОХОД (АНУС) И АНАЛЬНЫЙ КАНАЛ
286
Фаллопиева труба
106
Дивертикул Меккеля
340
ГЛАЗ И ЕГО ПРИДАТОЧНЫЙ АППАРАТ
105
Подвздошная кишка
295
Плацента
104
Тощая кишка
389
Эндокринная железа, БДУ
71
Грушевидный синус
70
ГРУШЕВИДНЫЙ СИНУС
112
Восходящая ободочная кишка
338
Мочевая система, БДУ
108
Тонкая кишка, БДУ
285
ДРУГИЕ И НЕУТОЧНЕННЫЕ ЖЕНСКИЕ ПОЛОВЫЕ ОРГАНЫ
409
Неизвестная первичная локализация
370
Слуховой нерв
103
Двенадцатиперстная кишка
132
ЖЕЛЧНЫЙ ПУЗЫРЬ
102
ТОНКАЯ КИШКА
180
Вилочковая железа (тимус)
276
Эндометрий
23
Верхняя десна
59
Задняя стенка ротоглотки
376
Щитовидная железа
308
Яичко, БДУ
307
Опустившееся яичко
378
Кора надпочечника
321
МОЧЕТОЧНИК
304
Предстательная железа
303
ПРЕДСТАТЕЛЬНАЯ ЖЕЛЕЗА
379
Мозговое вещество надпочечников
401
Внутригрудные лимфатические узлы
400
Лимфатические узлы головы, лица и шеи
391
Голова, лицо или шея, БДУ
381
ДРУГИЕ ЭНДОКРИННЫЕ ЖЕЛЕЗЫ И РОДСТВЕННЫЕ СТРУКТУРЫ
177
Поражение, выходящее за пределы легкого
380
Надпочечник, БДУ
371
Черепной нерв, БДУ
56
Ямка надгортанника
375
ЩИТОВИДНАЯ ЖЕЛЕЗА
324
Мочепузырный треугольник
322
Мочеточник
320
Почечная лоханка
319
ПОЧЕЧНАЯ ЛОХАНКА
311
Семенной канатик
310
Придаток яичка
57
Передняя поверхность надгортанника
309
ДРУГИЕ И НЕУТОЧНЕННЫЕ МУЖСКИЕ ПОЛОВЫЕ ОРГАНЫ
275
Перешеек матки
274
ТЕЛО МАТКИ
273
Шейка матки
101
Желудок, БДУ
55
РОТОГЛОТКА
272
Поражение, выходящее за пределы шейки матки
54
Миндалина, БДУ
111
Червеобразный отросток (аппендикс)
271
Слизистая оболочка влагалищной части шейки матки (экзоцервикс)
58
Боковая стенка ротоглотки
270
Слизистая оболочка канала шейки матки (эндоцервикс)
269
ШЕЙКА МАТКИ
268
Влагалище, БДУ
267
ВЛАГАЛИЩЕ
216
Глазное веко
266
Вульва, БДУ
265
Поражение, выходящее за пределы вульвы
259
Молочная железа, БДУ
257
Подмышечный отросток молочной железы
256
Нижне-наружный квадрант молочной железы
255
Верхне-наружный квадрант молочной железы
254
Нижне-внутренний квадрант молочной железы
53
Поражение, выходящее за пределы миндалины
253
Верхне-внутренний квадрант молочной железы
252
Центральная часть молочной железы
217
Наружное ухо
62
Ротоглотка, БДУ
244
Соединительная ткань, подкожная клетчатка и другие мягкие ткани нижней конечности и грудной клетки
50
МИНДАЛИНА
37
ДРУГИЕ И НЕУТОЧНЕННЫЕ ЧАСТИ РТА
52
Дужка миндалины
215
Кожа губы, БДУ
51
Миндаликовая ямка
137
Поражение, выходящее за пределы желчевыводящих путей
243
Соединительная ткань, подкожная клетчатка и другие мягкие ткани нижней конечности и тазобедренной области
198
Поражение, выходящее за пределы костей, суставов и суставных хрящей конечностей
127
Клоакогенная зона
197
Короткие кости нижней конечности и связанные суставы
226
Периферические нервы и вегетативная нервная система головы, лица и шеи
242
Соединительная ткань, подкожная клетчатка и другие мягкие ткани верхней конечности и плечевого пояса
49
Большая слюнная железа, БДУ
145
Другие уточненные части поджелудочной железы
218
Кожа других и неуточненных частей лица
144
Островки Лангерганса
176
Нижняя доля легкого
142
Хвост поджелудочной железы
199
Кость конечности, БДУ
241
Соединительная ткань, подкожная клетчатка и другие мягкие ткани головы, лица и шеи
141
Тело поджелудочной железы
182
Сердце
240
СОЕДИНИТЕЛЬНАЯ ТКАНЬ, ПОДКОЖНАЯ КЛЕТЧАТКА И ДРУГИЕ МЯГКИЕ ТКАНИ
140
Головка поджелудочной железы
196
Длинные кости нижней конечности и связанные суставы
238
Брюшина, БДУ
181
СЕРДЦЕ, СРЕДОСТЕНИЕ И ПЛЕВРА
139
ПОДЖЕЛУДОЧНАЯ ЖЕЛЕЗА
178
Легкое, БДУ
236
Забрюшинное пространство
228
Периферические нервы и вегетативная нервная система нижней конечности и тазобедренной области
175
Средняя доля легкого
227
Периферические нервы и вегетативная нервная система верхней конечности и плечевого пояса
213
Кроветворная система, БДУ
138
Желчевыводящие пути, БДУ
27
Передняя часть дна полости рта
374
ЩИТОВИДНАЯ ЖЕЛЕЗА И ДРУГИЕ ЭНДОКРИННЫЕ ЖЕЛЕЗЫ (C73-C75)
288
Круглая связка
195
Короткие кости верхней конечности и связанные суставы
373
Нервная система, БДУ
174
Верхняя доля легкого
372
Поражение, выходящее за пределы головног мозга и центральной нервной системы
173
Главный бронх
169
Гортань, БДУ
325
Купол мочевого пузыря
377
НАДПОЧЕЧНИК
408
НЕИЗВЕСТНАЯ ПЕРВИЧНАЯ ЛОКАЛИЗАЦИЯ
407
Лимфатический узел, БДУ
406
Лимфатические узлы множественных локализаций
405
Лимфатические узлы таза
404
Лимфатические узлы паховой области или ноги
403
Лимфатические узлы подмышечной впадины или руки
402
Внутрибрюшные лимфатические узлы
172
БРОНХ И ЛЕГКОЕ
399
ЛИМФАТИЧЕСКИЕ УЗЛЫ
212
Ретикулоэндотелиальная система, БДУ
398
Поражение, выходящее за пределы неточно обозначенных локализаций
397
Другие неточно обозначенные локализации
396
Нижняя конечность, БДУ
395
Верхняя конечность, БДУ
394
Таз, БДУ
393
Живот, БДУ
392
Грудная клетка, БДУ
390
ДРУГИЕ И НЕТОЧНО ОБОЗНАЧЕННЫЕ ЛОКАЛИЗАЦИИ
388
Поражение, выходящее за пределы эндокринных желез и родственных структур
387
Аортальный гломус и другие параганглии
386
Каротидный гломус
385
Шишковидная железа
384
Краниофарингеальный проток
383
Гипофиз
250
МОЛОЧНАЯ ЖЕЛЕЗА
317
ПОЧКА
316
МОЧЕВЫВОДЯЩИЕ ПУТИ (C64-C68)
315
Мужские половые органы, БДУ
314
Поражение, выходящее за пределы мужских половых органов
162
Придаточная пазуха, БДУ
313
Другие уточненные части мужских половых органов
312
Мошонка, БДУ
305
ЯИЧКО
302
Половой член, БДУ
301
Поражение, выходящее за пределы полового члена
300
Тело полового члена
299
Головка полового члена
298
Крайняя плоть
297
ПОЛОВОЙ ЧЛЕН
296
МУЖСКИЕ ПОЛОВЫЕ ОРГАНЫ (C60-C63)
294
ПЛАЦЕНТА
293
Женские половые пути, БДУ
292
Поражение, выходящее за пределы женских половых органов
291
Другие уточненные части женских половых органов
290
Придатки матки
289
Параметрий
287
Широкая связка
284
Яичник
283
ЯИЧНИК
282
Матка, БДУ
281
МАТКА, БДУ
280
Тело матки
279
Поражение, выходящее за пределы тела матки
264
Клитор
263
Малая половая губа
262
Большая половая губа
261
ВУЛЬВА
251
Сосок
260
ЖЕНСКИЕ ПОЛОВЫЕ ОРГАНЫ (C51-C58)
249
Соединительная ткань, подкожная клетчатка и другие мягкие ткани, БДУ
248
Поражение, выходящее за пределы соединительной ткани, подкожной клетчатки и других мягких тканей
247
Соединительная ткань, подкожная клетчатка и другие мягкие ткани нижней конечности и туловища, БДУ
246
Соединительная ткань, подкожная клетчатка и другие мягкие ткани нижней конечности и таза
245
Соединительная ткань, подкожная клетчатка и другие мягкие ткани нижней конечности и живота
237
Уточненные части брюшины
214
КОЖА
235
ЗАБРЮШИННОЕ ПРОСТРАНСТВО И БРЮШИНА
234
Вегетативная нервная система, БДУ
233
Поражение, выходящее за пределы периферических нервов и вегетативной нервной системы
232
Периферические нервы и вегетативная нервная система туловища, БДУ
231
Периферические нервы и вегетативная нервная система таза
230
Периферические нервы и вегетативная нервная система живота
229
Периферические нервы и вегетативная нервная система грудной клетки
225
ПЕРИФЕРИЧЕСКИЕ НЕРВЫ И ВЕГЕТАТИВНАЯ НЕРВНАЯ СИСТЕМА
224
Кожа, БДУ
223
Поражение, выходящее за пределы кожи
222
Кожа нижней конечности и тазобедренной области
221
Кожа верхней конечности и плечевого пояса
220
Кожа туловища
219
Кожа волосистой части головыи шеи
164
Голосовая щель
209
Кровь
200
КОСТИ, СУСТАВЫ И СУСТАВНЫЕ ХРЯЩИ ДРУГИХ И НЕУТОЧНЕННЫХ ЛОКАЛИЗАЦИЙ
179
ВИЛОЧКОВАЯ ЖЕЛЕЗА (ТИМУС)
208
КРОВЕТВОРНАЯ И РЕТИКУЛОЭНДОТЕЛИАЛЬНАЯ СИСТЕМЫ
207
Кость, БДУ
206
Поражение, выходящее за пределы костей, суставов и суставных хрящей
191
Неточно обозначенные локализации в органах дыхания
205
Кости таза, крестец, копчик и связанные суставы
204
Ребро, грудина, ключица и связанные суставы
202
Нижняя челюсть
201
Кости черепа и лица и связанные суставы
186
Плевра, БДУ
194
Длинные кости верхней конечности, лопатка и связанные суставы
193
КОСТИ, СУСТАВЫ И СУСТАВНЫЕ ХРЯЩИ КОНЕЧНОСТЕЙ
192
КОСТИ, СУСТАВЫ И СУСТАВНЫЕ ХРЯЩИ (C40-C41)
190
Поражение, выходящее за пределы дыхательной системы и органов грудной клетки
189
Верхние дыхательные пути, БДУ
188
ДРУГИЕ И НЕТОЧНО ОБОЗНАЧЕННЫЕ ЛОКАЛИЗАЦИИ В ОРГАНАХ ДЫХАНИЯ И ГРУДНОЙ КЛЕТКИ
187
Поражение, выходящее за пределы сердца, средостения и плевры
171
Трахея
368
Обонятельный нерв
170
ТРАХЕЯ
168
Поражение, выходящее за пределы гортани
167
Хрящ гортани
166
Подголосовая полость гортани
165
Преддверие полости гортани
163
ГОРТАНЬ
161
Поражение, выходящее за пределы придаточных пазух
160
Клиновидная пазуха
159
Лобная пазуха
158
Решетчатая пазуха
157
Верхнечелюстная пазуха
156
ПРИДАТОЧНЫЕ ПАЗУХИ
155
Среднее ухо
146
Поражение, выходящее за пределы поджелудочной железы
154
Полость носа (за исключением носа, БДУ C76.0)
153
ПОЛОСТЬ НОСА И СРЕДНЕЕ УХО
143
Проток поджелудочной железы
152
ОРГАНЫ ДЫХАНИЯ И ГРУДНОЙ КЛЕТКИ (C30-C39)
151
Желудочно-кишечный тракт, БДУ
150
Поражение, выходящее за пределы пищеварительной системы
149
Кишечный тракт, БДУ
148
ДРУГИЕ И НЕТОЧНО ОБОЗНАЧЕННЫЕ ОРГАНЫ ПИЩЕВАРЕНИЯ
147
Поджелудочная железа, БДУ
136
Фатеров сосок
135
Внепеченочный желчный проток
134
ДРУГИЕ И НЕУТОЧНЕННЫЕ ЧАСТИ ЖЕЛЧЕВЫВОДЯЩИХ ПУТЕЙ
133
Желчный пузырь
131
Внутрипеченочный желчный проток
118
Поражение, выходящее за пределы толстой кишки
130
Печень
129
ПЕЧЕНЬ И ВНУТРИПЕЧЕНОЧНЫЕ ЖЕЛЧНЫЕ ПРОТОКИ
128
Поражение, выходящее за пределы прямой кишки, заднего прохода (ануса) и анального канала
123
Прямая кишка, БДУ
122
ПРЯМАЯ КИШКА
121
Ректосигмоидное соединение
120
РЕКТОСИГМОИДНОЕ СОЕДИНЕНИЕ
119
Толстая кишка, БДУ
116
Нисходящая ободочная кишка
115
Селезеночный изгиб толстой кишки
114
Поперечная ободочная кишка
113
Печеночный изгиб толстой кишки
110
Слепая кишка
69
Носоглотка, БДУ
68
Поражение, выходящее за пределы носоглотки
67
Передняя стенка носоглотки
66
Боковая стенка носоглотки
65
Задняя стенка носоглотки
64
Верхняя стенка носоглотки
63
НОСОГЛОТКА
61
Поражение, выходящее за пределы ротоглотки
60
Жаберная щель
48
Поражение, выходящее за пределы больших слюнных желез
47
Подъязычная железа
46
Поднижнечелюстная железа
45
ДРУГИЕ И НЕУТОЧНЕННЫЕ БОЛЬШИЕ СЛЮННЫЕ ЖЕЛЕЗЫ
44
Околоушная слюнная железа
43
ОКОЛОУШНАЯ СЛЮННАЯ ЖЕЛЕЗА
42
Рот, БДУ
367
Конский хвост
342
Роговица, БДУ
41
Поражение, выходящее за пределы других и неуточненных частей рта
40
Ретромолярная область
39
Преддверие рта
38
Слизистая оболочка щеки
35
Поражение, выходящее за пределы неба
25
Десна, БДУ
34
Язычок
33
Мягкое небо, БДУ
366
Спинной мозг
31
НЕБО
30
Дно полости рта, БДУ
29
Поражение, выходящее за пределы дна полости рта
28
Боковая часть дна полости рта
369
Зрительный нерв
365
СПИННОЙ МОЗГ, ЧЕРЕПНЫЕ НЕРВЫ И ДРУГИЕ ОТДЕЛЫ ЦЕНТРАЛЬНОЙ НЕРВНОЙ СИСТЕМЫ
353
Мозговые оболочки, БДУ
22
ДЕСНА
21
Язык, БДУ
20
Поражение, выходящее за пределы языка
19
Язычная миндалина
18
Передние 2/3 языка, БДУ
17
Вентральная поверхность языка, БДУ
16
Боковая поверхность языка
15
Дорсальная поверхность языка, БДУ
364
Головной мозг, БДУ
363
Поражение, выходящее за пределы головного мозга
362
Ствол мозга
361
Мозжечок, БДУ
360
Желудочек, БДУ
357
Височная доля
355
Большой мозг
354
ГОЛОВНОЙ МОЗГ
352
Оболочки спинного мозга
351
Оболочки головного мозга
350
МОЗГОВЫЕ ОБОЛОЧКИ
349
Глаз, БДУ
348
Поражение, выходящее за пределы глаза и его придаточного аппарата
347
Глазница (орбита), БДУ
346
Слезная железа
345
Ресничное (цилиарное) тело
344
Сосудистая оболочка
343
Сетчатка
339
ГЛАЗ, ГОЛОВНОЙ МОЗГ И ДРУГИЕ ОТДЕЛЫ ЦЕНТРАЛЬНОЙ НЕРВНОЙ СИСТЕМЫ (C69-C72)
337
Поражение, выходящее за пределы органов мочевой системы
336
Парауретральная железа
335
Уретра (мочеиспускательный канал)
334
ДРУГИЕ И НЕУТОЧНЕННЫЕ ОРГАНЫ МОЧЕВОЙ СИСТЕМЫ
333
Мочевой пузырь, БДУ
332
Поражение, выходящее за пределы мочевого пузыря
331
Мочевой проток (урахус)
330
Отверстие мочеточника
329
Шейка мочевого пузыря
328
Задняя стенка мочевого пузыря
327
Передняя стенка мочевого пузыря
326
Боковая стенка мочевого пузыря
14
ДРУГИЕ И НЕУТОЧНЕННЫЕ ЧАСТИ ЯЗЫКА
13
Основание языка, БДУ
12
ОСНОВАНИЕ ЯЗЫКА
10
Поражение, выходящее за пределы губы
9
Спайка губы
8
Слизистая оболочка губы, БДУ
97
Привратник
107
Поражение, выходящее за пределы тонкой кишки
7
Слизистая оболочка нижней губы
6
Слизистая оболочка верхней губы
5
Наружная поверхность губы, БДУ
4
Наружная поверхность нижней губы
3
Наружная поверхность верхней губы
93
Кардия, БДУ
77
Гортаноглотка, БДУ
2
ГУБА
1
ГУБА, ПОЛОСТЬ РТА И ГЛОТКА (C00-C14)
100
Поражение, выходящее за пределы желудка
99
Большая кривизна желудка, БДУ
98
Малая кривизна желудка, БДУ
92
ЖЕЛУДОК
91
Пищевод, БДУ
90
Поражение, выходящее за пределы пищевода
89
Нижняя треть пищевода
88
Средняя треть пищевода
87
Верхняя треть пищевода
86
Брюшной отдел пищевода
85
Грудной отдел пищевода
84
Шейный отдел пищевода
83
ПИЩЕВОД
73
Заперстневидная область
82
ОРГАНЫ ПИЩЕВАРЕНИЯ (C15-C26)
81
Поражение, выходящее за пределы губы, полости рта и глотки
80
Кольцо Пирогова-Вальдейера
79
Глотка, БДУ
78
ДРУГИЕ И НЕТОЧНО ОБОЗНАЧЕННЫЕ ЛОКАЛИЗАЦИИ В ГУБЕ, ПОЛОСТИ РТА И ГЛОТКЕ
76
Поражение, выходящее за пределы гортаноглотки
75
Задняя стенка гортаноглотки
74
Черпалонадгортанная складка нижней части глотки
239
Поражение, выходящее за пределы забрюшинного пространства и брюшины
258
Поражение, выходящее за пределы молочной железы
203
Позвоночный столб
');
 PREPARE stmt3 FROM @t1;
 EXECUTE stmt3;




select vp.*, apt.*
from rbVitalParams vp
join ActionPropertyType apt on apt.vitalParamId = vp.id
where vp.dict_OID = @dict_OID;


select *
from netricaPrehospitalTreatment;
