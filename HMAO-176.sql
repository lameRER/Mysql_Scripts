select eta.*
from EventType_Action eta, EventType et
where et.name in ('Периодический осмотр (ПРОФЫ)')
and eta.eventType_id = et.id
;





select/*bigin*/ deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate,
defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id,
isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant,
propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType,
actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked,
filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate,
advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias from ActionType where id in(
	select EventType_Action.actionType_id from EventType_Action, rbHurtType where EventType_Action.hurtType regexp
	rbHurtType.code group by EventType_Action.id);/*end*/


select *
from EventType where id in
(select EventType_Action.eventType_id
from EventType_Action, rbHurtType where EventType_Action.hurtType regexp rbHurtType.code group by EventType_Action.id)
and deleted = 0;

select EventType_Action.*
from EventType_Action, rbHurtType where EventType_Action.hurtType regexp rbHurtType.code group by EventType_Action.id


select *
from EventType_Action where eventType_id = 140 and hurtType regexp '2.3';

select *
from EventType where name = 'Периодические осмотры для взрослых(для маркетологов)';

select *
from rbService order by id desc  limit 1;


insert into ActionType_Service(master_id, finance_id, service_id)
(select  84994, NULL, 79366);

select *
from ActionType_Service where service_id = 79366;




select *
from rbUserRight where name regexp 'планиров';

select *
from rbFinance;

insert into rbService(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code,
                      name, eisLegacy, license, infis, begDate, endDate, medicalAidProfile_id, medicalAidKind_id,
                      medicalAidType_id, dopService_id, category_id, caseCast_id, Fed_code, type, budget_id)
select
       now() createDatetime,
       NULL createPerson_id,
       NOW() modifyDatetime,
       NULL modifyPerson_id,
       NULL group_id,
       at1.code code,
       at1.name name,
       eisLegacy,
       license,
       infis,
       '2021-01-01' begDate,
       '2200-12-31' endDate,
       medicalAidProfile_id,
       medicalAidKind_id,
       medicalAidType_id,
       dopService_id,
       category_id,
       caseCast_id,
       Fed_code,
       type,
       budget_id
from ActionType at1, rbService s where at1.id = 84994
and s.id = (select id from rbService order by id desc limit 1);

drop temporary table temp_eventType
create temporary table temp_eventType
    (
        select 3 as eventType_id, 68 as idx, 'Мазки на гонорею при поступлении на работу' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 67 as idx, 'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 66 as idx, 'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;24;25;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 65 as idx, 'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 64 as idx, 'Исследование крови на сифилис' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 63 as idx, 'Поля зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 62 as idx, 'Острота зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 61 as idx, 'Определение группы крови и резус-фактора as name, исследование крови на ВИЧ as speciality_id, сифилис as tissueType_id, вирусные гепатиты B и C (при предварительном осмотре)' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory19.1;19.2;19.3;21', '', null, 0 union
        select 3 as eventType_id, 60 as idx, 'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 59 as idx, 'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 58 as idx, 'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 selectingGroup, 0 actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 57 as idx, 'Определение группы крови и резус-фактора при предварительном осмотре' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 56 as idx, 'Ректороманоскопия (1 раз в 5 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 55 as idx, 'Ортопантомография ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 54 as idx, 'Ортопантомография (1 раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 53 as idx, 'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 52 as idx, 'Ультразвуковая допплерография транскраниальная артерий методом мониторирования' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 51 as idx, 'Исследование уровня фибриногена as name, протромбинового индекса as speciality_id, триглицеридов as tissueType_id, мочевой кислоты as sex, общего белка as age, калия as selectingGroup, натрия as actuality, железа as expose, щелочной фосфатазы в крови' as payable, null as hurtType, null as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory', 1, 0, 1, 0, '19.2', '', null, 0 union
        select 3 as eventType_id, 50 as idx, 'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 49 as idx, 'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 48 as idx, 'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 47 as idx, 'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 46 as idx, 'Ортостатическая проба (при предварительном медицинском осмотре)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 45 as idx, 'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 1 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 44 as idx, 'Ультразвуковые исследования печени as name, желчного пузыря as speciality_id, поджелудочной железы as tissueType_id, селезенки as sex, почек (один раз в 3 года);' as age, null as selectingGroup, null as actuality, 0 as expose, '' as payable, 1 as hurtType, 0 as hurtFactorType, 1 as defaultOrg_id, 0 as isCompulsory, '19.1;19.2;19.3;21', '', null, 0 union
        select 3 as eventType_id, 43 as idx, 'Эзофагогастродуоденоскопия (1 раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 42 as idx, 'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 41 as idx, 'Эхокардиография (при предварительном медицинском осмотре и по показаниям)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 40 as idx, 'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 39 as idx, 'Исследование уровня холестерина в крови (до достижения возраста 40 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '-40г' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 38 as idx, 'Мочевина' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 37 as idx, 'Креатинин' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 36 as idx, 'Определение группы крови и резус-фактора as name, исследование крови на ВИЧ as speciality_id, сифилис as tissueType_id, вирусные гепатиты B и C (при предварительном осмотре)' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory19.1;19.2;19.3;21;2.4.2', '', null, 0 union
        select 3 as eventType_id, 35 as idx, 'Электроэнцефалография' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '18.2;19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 34 as idx, 'Исследование цветоощущения по полихроматическим таблицам' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '18.1;18.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 33 as idx, 'Эзофагогастродуоденоскопия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '11;11.1;11.2;11.3;11.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 32 as idx, 'Измерение внутриглазного давления' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '10' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 31 as idx, 'Непрямая ларингоскопия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 30 as idx, 'Исследование цветоощущения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 29 as idx, 'Рефрактометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.1;4.3.1;4.3.2;5.1;5.2.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 28 as idx, 'Исследование аккомодации' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 27 as idx, 'Определение бинокулярного зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 26 as idx, 'Исследование функции вестибулярного аппарата' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.3.1;4.3.2;4.4;4.5;4.6;4.10;6;6.1;6.2;7;8;9;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;19.1;19.2;19.3;20;21;22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 25 as idx, 'Паллестезиметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.3.1;4.3.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 24 as idx, 'УЗИ органов брюшной полости и щитовидной железы' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 23 as idx, 'Офтальмоскопия глазного дна' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 22 as idx, 'Рефрактометрия (или скиаскопия)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.3.1;4.3.2;5.1;5.2.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 21 as idx, 'Психофизиологическое исследование' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 20 as idx, 'Тромбоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.14;1.14.1;1.15;1.27;1.27.1;1.27.2;4.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 19 as idx, 'аланинаминотрансфераза (АЛТ)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 18 as idx, 'аспартатаминотрансфераза (АСТ)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 17 as idx, 'ВИЧ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.3;2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 16 as idx, 'Анализ крови на HBs-Ag as name, анти-HBc-Ig (суммарные) as speciality_id, анти-HCV-Ig (суммарные) as tissueType_id, определение уровня щелочной фосфатазы as sex, билирубина as age,' as selectingGroup, null as actuality, null as expose, 0 as payable, '' as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, 1 as isCompulsory, 0, '2.4.2', '', null, 0 union
        select 3 as eventType_id, 15 as idx, 'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 14 as idx, 'Для работы с препаратами крови определение в крови HBsAg as name, a-HBCOR as speciality_id, IgM as tissueType_id, A-HCV-IgG' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory2.3', '', null, 0 union
        select 3 as eventType_id, 13 as idx, 'Периметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.52.6;6.1;6.2;7;8;9;10;12;13;14;15;16;17;18.1;18.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 12 as idx, 'карбоксигемоглобин в крови' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.39' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 11 as idx, 'Ультразвуковое обследование органов малого таза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 10 as idx, 'УЗИ органов брюшной полости' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.50;1.36;1.36.1;1.36.2;1.36.3;2.4.2;11;11.1;11.2;11.3;11.4;1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 9 as idx, 'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.27;1.27.1;1.27.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 8 as idx, 'Тональная пороговая аудиометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.27;1.27.1;1.27.2;4.3.2;4.4;4.5;4.6;4.8;6;6.1;6.2;7;8;9;10;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;20;21;22;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 7 as idx, 'тромбоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.14;1.14.1;1.15;1.15.1;1.14;1.14.1;1.15;1.15.1;4.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 6 as idx, 'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.8.4.1;1.8.4.2;1.8.4;3.1.7' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 5 as idx, 'Визометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.16;1.19.1;1.19.2;1.19.3;1.23;1.24;1.27;1.27.1;1.27.2;1.30;1.30.1;1.31;1.36;1.36.1;1.36.2;1.36.3;1.37.1;1.37.1.1;1.38;1.39;1.40;1.40.1;1.40.2;1.43;1.43.1;1.43.2;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3.1;4.7;4.8;4.9;4.10;5.1;5.2.1;6.1;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 4 as idx, 'метгемоглобин' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.10;1.21;1.1;1.37.1;1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 3 as idx, 'ретикулоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.6;1.10;1.14;1.14.1;1.15;1.15.1;1.17;1.20;1.21;1.27.2;1.30.1;1.34;1.34.1;1.34.2;1.37.1;1.39;4.1;1.15;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 2 as idx, 'Биомикроскопия глаза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.15.1;1.16;1.19.1;1.19.2;1.19.3;1.23;1.24;1.27;1.27.1;1.27.2;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.30;1.30.1;1.31;1.36;1.36.1;1.36.2;1.36.3;1.37.1;1.37.1.1;1.38;1.39;1.40;1.40.1;1.40.2;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.7;1.47.8;1.47.9;1.48;1.49;1.49.1;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.50;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3.1;4.7;4.8;4.9;4.10;5.1;5.2.1;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;13;17;18.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 1 as idx, 'Пульсоксиметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.12;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18.1;1.18.2;1.19.2;1.19.3;1.23;1.24;1.28;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.33;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.45;1.45.1;1.45.3;1.46;1.47;1.47.1;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 0 as idx, 'Спирометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.12;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18.1;1.18.2;1.19.1;1.19.2;1.19.3;1.21;1.22;1.23;1.24;1.25;1.28;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.33;1.34.1;1.34;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.48;1.49;1.49.1;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.8;1.49.9;1.50;1.51.1;1.51.2;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.2;3.1.9.3;3.1.9.4;3.2;3.3;3.4;11;11.1;11.2;11.3;11.4;12;13;14;16;17;19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 69 as idx, 'Прием дерматовенеролога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.4;1.5;1.5.1;1.6;1.7;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.18.1;1.18.2;1.18.3;1.19.1;1.19.2;1.19.3;1.21;1.22;1.24;1.25;1.26;1.29.5;1.31;1.32;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.4;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3;4.3.1;4.3.2;4.10;19.1;19.2;19.3;20;21;23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 70 as idx, 'Прием оториноларинголог' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18;1.18.1;1.18.2;1.18.3;1.19;1.19.1;1.19.2;1.19.3;1.21;1.22;1.23;1.24;1.25;1.26;1.27;1.27.1;1.27.2;1.28;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.31;1.33;1.34;1.34.1;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4;4.3.1;4.3.2;4.4;4.5;4.6;4.7;4.8;4.10;5.2.2;6;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18;18.1;18.2;19;19.1;19.2;19.3;20;21;22;23;24;25;26;27;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 71 as idx, 'Прием офтальмолога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.15.1;1.16;1.19.1;1.19.2;1.19.3;1.24;1.27;1.27.1;1.27.2;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.30;1.30.1;1.31;1.32;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37;1.37.1;1.37.1.1;1.37.1.2;1.37.2;1.38;1.39;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.6;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3;4.3.1;4.3.2;4.7;4.8;4.9;4.10;5.1;5.2.1;6;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18;18.1;18.2;19;19.1;19.2;19.3;20;21;22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 72 as idx, 'Прием хирурга' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.12;1.12;4.3.1;4.3.2;4.7;4.10;6;6.1;6.2;7;8;10;11;11.1;11.2;11.3;11.4;14;19;19.1;19.2;19.3;20;21;22;5.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 73 as idx, 'Прием стоматолога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.20;11;11.1;11.2;11.3;11.4;12;13;14;17;19.1;19.2;19.3;20;21;22;23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 74 as idx, 'Прием инфекциониста' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 76 as idx, 'Прием врача по водолазной медициние' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 75 as idx, 'Прием уролога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 77 as idx, 'УЗИ молочных желез' as name, null as speciality_id, null as tissueType_id, 2 as sex, '40г' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '11;11.1;11.2;11.3;11.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory
);


select *
from Contract_Specification order by id desc ;

insert into Contract_Specification(deleted, master_id, eventType_id)
select 0, 3227, 140

select *
from ClientWork_Hurt;

select *
from Contract;

select count(Action.id)
from Action where event_id =
(select id
from Event where client_id = 2475859 and deleted = 0);

# select *
# from
     update
         Event
     set deleted = 1
     where client_id = 2475859 and deleted = 0;

select *
from EventType where id = 140;
start transaction;
insert into EventType_Action(eventType_id, idx, actionType_id, speciality_id, tissueType_id, sex, age,
                             selectionGroup, actuality, expose, payable, hurtType, hurtFactorType, defaultOrg_id, isCompulsory)
select eventType_id,
       row_number() over () - 1 idx,
       actionType_id,
       speciality_id,
       tissueType_id,
       sex,
       age,
       selectingGroup,
       actuality,
       expose,
       payable,
       hurtType,
       hurtFactorType,
       defaultOrg_id,
       isCompulsory
from (select et.id  eventType_id,
             0      idx,
             at1.id actionType_id,
             tet.speciality_id,
             tet.tissueType_id,
             tet.sex,
             tet.age,
             tet.selectingGroup,
             tet.actuality,
             tet.expose,
             tet.payable,
             tet.hurtType,
             tet.hurtFactorType,
             tet.defaultOrg_id,
             tet.isCompulsory
      from EventType_Action eta,
           EventType et,
           temp_eventType tet,
           ActionType at1
      where eta.id = (select id from EventType_Action order by id desc limit 1)
        and et.id = 140
        and at1.deleted = 0
        and at1.group_id in (84915, 84914)
        and at1.name = tet.name) as tmp
;

commit ;

select *
from EventType_Action where eventType_id = 140;

select *
from temp_eventType;

select
       3 eventType_id,
       idx,
       at1.name,
       speciality_id,
       tissueType_id,
       EventType_Action.sex,
       EventType_Action.age,
       selectionGroup,
       actuality, expose,
       payable,
       hurtType,
       hurtFactorType,
       EventType_Action.defaultOrg_id,
       isCompulsory
from EventType_Action, rbHurtType, ActionType at1 where EventType_Action.hurtType regexp rbHurtType.code
and rbHurtType.code not regexp 'OLD'
and eventType_id =123 and at1.id = EventType_Action.actionType_id and at1.deleted = 0 group by EventType_Action.id
;

select *
from EventType_Action;

select name
from EventType where deleted = 0;
start transaction ;
insert into s11.EventType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, name, purpose_id, finance_id, scene_id, visitServiceModifier, visitServiceFilter, visitFinance, actionFinance, actionContract, period, singleInPeriod, isLong, dateInput, service_id, context, form, minDuration, maxDuration,
                           showStatusActionsInPlanner, showDiagnosticActionsInPlanner, showCureActionsInPlanner,
                           showMiscActionsInPlanner, limitStatusActionsInput, limitDiagnosticActionsInput,
                           limitCureActionsInput, limitMiscActionsInput, showTime, medicalAidKind_id, medicalAidType_id,
                           eventProfile_id, mesRequired, defaultMesSpecification_id, mesCodeMask, mesNameMask,
                           counter_id, isExternal, generateExternalIdOnSave, externalIdAsAccountNumber, counterType,
                           hasAssistant, hasCurator, hasVisitAssistant, canHavePayableActions, isRequiredCoordination,
                           isOrgStructurePriority, isTakenTissue, isSetContractNumFromCounter, sex, age,
                           isOnJobPayedFilter, permitAnyActionDate, prefix, showLittleStranger, exposeGrouped,
                           uniqueExternalId, uniqueExternalIdInThisYear, defaultOrder, inheritDiagnosis,
                           diagnosisSetDateVisible, isResetSetDate, isAvailInFastCreateMode, defaultEndTime,
                           caseCast_id, isCheck_KSG, weekdays, exposeConfirmation, needMesPerformPercent, showZNO,
                           goalFilter, setFilterStandard, inheritResult, eventKind_id, inheritCheckupResult,
                           payerAutoFilling, dispByMobileTeam, filterPosts, filterSpecialities,
                           compulsoryServiceStopIgnore, voluntaryServiceStopIgnore, inheritGoal, reqDN, reqHealthGroup,
                           isAddTreatmentToDeath, needReferal, referalDateActualityDays, eventGoal, result, MKB,
                           postfix, chk_ZNO, chkMKB_ZNO, chkReason_ZNO, chkstady_ZNO, chkstady_T_ZNO, chkstady_N_ZNO,
                           chkstady_M_ZNO, chkDate_ZNO, chkConsiliumData, isWithoutResponsiblePerson, isKSGCriterion,
                           isKslpShow, chk_SendInIEMK, isSeveralEvents, chkTransf, transfId,
                           availableForExternal, allowCopyDiagnosis)
values (now(), NULL, now(), NULL, 0, '106', 'Периодические осмотры для взрослых(для маркетологов)', 3, null, null, '', '', 1, 1, 0, 6, 0, 0, 0, null, 'f131pe', '131', 0,
        0, 0, 1, 1, 0, 0, 0, 0, 1, 0, null, null, null, 0, null, '', '', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0,
        '', 0, 0, '', 0, 0, 0, 0, 1, 0, 1, 0, 1, '00:00:00', null, 0, 5, 0, 0, 0, 0, 0, 1, null, 1, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, null, null, '', null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0, 0);
rollback;
commit;

select *
from EventType where deleted = 0 order by id desc ;



start transaction;
insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                            code, name, title, flatCode, sex, age, office, showInForm,
                            genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus,
                            defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                            defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
                            defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                            nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination,
                            isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible,
                            propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id,
                            isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec,
                            isActiveGroup, lis_code, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg,
                            filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired,
                            checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, code_f14, code_f30, EGISZ_code)
values (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14004', 'Прием хирурга', 'Прием хирурга', '', 0, '', '220, 8.00-12:00',
        1, 0, null, '', 1, 0, 5, 1, 0, 3, 351, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, '', 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14005', 'Прием дерматовенеролога', 'Прием дерматовенеролога', '', 0, '',
        '313, 9:00-12:00', 1, 0, null, '', 0, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14006', 'Прием невролога', 'Прием невролога', '', 0, '',
        '312/310, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 319, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14007', 'Прием оториноларинголога', 'Прием оториноларинголога', '', 0,
        '', '217-221, 9:00 - 12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 205, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL,
        1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14008', 'Прием офтальмолога', 'Прием офтальмолога', '', 0, '',
        '212-210, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 218, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14019', 'Аудиометрия', 'Аудиометрия', '', 0, '', '', 1, 0, null, '', 1,
        0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 2, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14022', 'Спирометрия', 'Спирометрия', '', 0, '', '314, 9:30-12:30', 1, 0,
        null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1,
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14023', 'Ретнтгенография гр клетки в 2х проекциях',
        'Ретнтгенография гр клетки в 2х проекциях', '', 0, '', '105, 9.30-11.00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 260,
        null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
        null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14024', 'Биомикроскопия сред. глаза', 'Биомикроскопия сред. глаза', '',
        0, '', '210-212', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14025', 'Офтальмоскопия глазного дна', 'Офтальмоскопия глазного дна', '',
        0, '', '210-212', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14027', 'Исследование вестибулярного анализатора',
        'Исследование вестибулярного анализатора', '', 0, '', '', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5,
        0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1,
        0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14028', 'ФГДС', 'ФГДС', '', 0, '', '', 1, 0, null, '', 1, 0, 5, 1, 0, 3,
        null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14029', 'АЛТ АСТ', 'АЛТ АСТ', '', 0, '', '205, 9:00-11:00', 1, 0, null,
        '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14030', 'Билирубин', 'Билирубин', '', 0, '', '', 1, 0, null, '', 1, 0, 5,
        1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14031', 'Узи брюшной полости', 'Узи брюшной полости', '', 0, '',
        '322 или 327/324,', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 298, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14032', 'Исслед крови на сифилис', 'Исслед крови на сифилис', '', 0, '',
        '205, 8:30-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14033',
        'Исслед на носительство возб киш инфекций и серолог обслед на брюш тиф',
        'Исслед на носительство возб киш инфекций и серолог обслед на брюш тиф', '', 0, '', 'НЕТ', 1, 0, null, '', 1, 0,
        5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14034', 'Исслед на гельминтозы', 'Исслед на гельминтозы', '', 0, '',
        '102, 8:30-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14035', 'Мазок из зева и носа на наличие патогенного стафилококка',
        'Мазок из зева и носа на наличие патогенного стафилококка', '', 0, '', '217, 10:00-12:00', 1, 0, null, '', 1, 0,
        5, 1, 0, 3, 205, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14558', 'Первичный прием стоматолога', 'Первичный прием стоматолога', '',
        0, '', '301, 10:00-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 202, null, 3, 0, 0, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', '');

insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                            code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id,
                            context, amount, amountEvaluation, defaultStatus, defaultDirectionDate,
                            defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id,
                            defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology,
                            isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                            nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination,
                            isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible,
                            propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id,
                            isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec,
                            isActiveGroup, lis_code, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg,
                            filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired,
                            checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, code_f14, code_f30,
                            EGISZ_code)
values (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14201', 'Спирометрия', 'Спирометрия', '', 0, '', '314, 9:30-12:30', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14202', 'Пульсоксиметрия', 'Пульсоксиметрия', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 2, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14203', 'Биомикроскопия глаза', 'Биомикроскопия глаза', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14204', 'ретикулоциты', 'ретикулоциты', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14205', 'метгемоглобин', 'метгемоглобин', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14206', 'Визометрия', 'Визометрия', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14207',
        'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года',
        'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14208', 'тромбоциты', 'тромбоциты', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14209', 'Тональная пороговая аудиометрия',
        'Тональная пороговая аудиометрия', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14210',
        'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче',
        'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14211', 'УЗИ органов брюшной полости', 'УЗИ органов брюшной полости',
        '', 0, '', '322 или 327/324', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14212', 'Ультразвуковое обследование органов малого таза',
        'Ультразвуковое обследование органов малого таза', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null,
        0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null,
        0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14213', 'карбоксигемоглобин в крови', 'карбоксигемоглобин в крови', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14214', 'Периметрия', 'Периметрия', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14215',
        'Для работы с препаратами крови определение в крови HBsAg, a-HBCOR, IgM, A-HCV-IgG',
        'Для работы с препаратами крови определение в крови HBsAg, a-HBCOR, IgM, A-HCV-IgG', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14216',
        'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза',
        'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14217',
        'Анализ крови на HBs-Ag, анти-HBc-Ig (суммарные), анти-HCV-Ig (суммарные), определение уровня щелочной фосфатазы, билирубина,',
        'Анализ крови на HBs-Ag, анти-HBc-Ig (суммарные), анти-HCV-Ig (суммарные), определение уровня щелочной фосфатазы, билирубина,',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14218', 'ВИЧ', 'ВИЧ', '', 0, '', '205, 8:30-11:00', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14219', 'аспартатаминотрансфераза (АСТ)',
        'аспартатаминотрансфераза (АСТ)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14220', 'аланинаминотрансфераза (АЛТ)', 'аланинаминотрансфераза (АЛТ)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14222', 'Тромбоциты', 'Тромбоциты', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14223', 'Психофизиологическое исследование',
        'Психофизиологическое исследование', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14224', 'Рефрактометрия (или скиаскопия)',
        'Рефрактометрия (или скиаскопия)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14225', 'Офтальмоскопия глазного дна', 'Офтальмоскопия глазного дна',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14226', 'УЗИ органов брюшной полости и щитовидной железы',
        'УЗИ органов брюшной полости и щитовидной железы', '', 0, '', '322, 327/324', 1, 0, null, '', 1, 0, 0, 1, 0, 2,
        null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14227', 'Паллестезиметрия', 'Паллестезиметрия', '', 0, '',
        '(ВИБРОТЕСТ) 314, 9:30-12:30', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14228', 'Исследование функции вестибулярного аппарата',
        'Исследование функции вестибулярного аппарата', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0,
        0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0,
        0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14229', 'Определение бинокулярного зрения',
        'Определение бинокулярного зрения', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14230', 'Исследование аккомодации', 'Исследование аккомодации', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14231', 'Рефрактометрия', 'Рефрактометрия', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14232', 'Исследование цветоощущения', 'Исследование цветоощущения', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14233', 'Непрямая ларингоскопия', 'Непрямая ларингоскопия', '', 0, '',
        '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0,
        1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0,
        null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14234', 'Измерение внутриглазного давления',
        'Измерение внутриглазного давления', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14235', 'Эзофагогастродуоденоскопия', 'Эзофагогастродуоденоскопия', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14236', 'Исследование цветоощущения по полихроматическим таблицам',
        'Исследование цветоощущения по полихроматическим таблицам', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2,
        null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0,
        0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14237', 'Электроэнцефалография', 'Электроэнцефалография', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14238',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14239', 'Креатинин', 'Креатинин', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14240', 'Мочевина', 'Мочевина', '', 0, '', '', 1, 0, null, '', 1, 0, 0,
        1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14241',
        'Исследование уровня холестерина в крови (до достижения возраста 40 лет)',
        'Исследование уровня холестерина в крови (до достижения возраста 40 лет)', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14242',
        'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям',
        'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям', '', 0, '', '', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14243',
        'Эхокардиография (при предварительном медицинском осмотре и по показаниям)',
        'Эхокардиография (при предварительном медицинском осмотре и по показаниям)', '', 0, '', '', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0,
        1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14244',
        'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)',
        'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14245', 'Эзофагогастродуоденоскопия (1 раз в 3 года)',
        'Эзофагогастродуоденоскопия (1 раз в 3 года)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0,
        0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0,
        0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14246',
        'Ультразвуковые исследования печени, желчного пузыря, поджелудочной железы, селезенки, почек (один раз в 3 года);',
        'Ультразвуковые исследования печени, желчного пузыря, поджелудочной железы, селезенки, почек (один раз в 3 года);',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14247',
        'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)',
        'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14248',
        'Ортостатическая проба (при предварительном медицинском осмотре)',
        'Ортостатическая проба (при предварительном медицинском осмотре)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0,
        2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14249',
        'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)',
        'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14250',
        'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям',
        'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14251',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14252',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14254',
        'Исследование уровня фибриногена, протромбинового индекса, триглицеридов, мочевой кислоты, общего белка, калия, натрия, железа, щелочной фосфатазы в крови',
        'Исследование уровня фибриногена, протромбинового индекса, триглицеридов, мочевой кислоты, общего белка, калия, натрия, железа, щелочной фосфатазы в крови',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14255',
        'Ультразвуковая допплерография транскраниальная артерий методом мониторирования',
        'Ультразвуковая допплерография транскраниальная артерий методом мониторирования', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14256',
        'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)',
        'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14257', 'Ортопантомография (1 раз в 3 года)',
        'Ортопантомография (1 раз в 3 года)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0,
        0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1,
        0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14258', 'Ортопантомография ', 'Ортопантомография ', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14259', 'Ректороманоскопия (1 раз в 5 лет)',
        'Ректороманоскопия (1 раз в 5 лет)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14260',
        'Определение группы крови и резус-фактора при предварительном осмотре',
        'Определение группы крови и резус-фактора при предварительном осмотре', '', 0, '', '', 1, 0, null, '', 1, 0, 0,
        1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14261',
        'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.',
        'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.',
        '', 0, '', '205, 8:30-11:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14262',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14264',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14265',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14270', 'Острота зрения', 'Острота зрения', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14271', 'Поля зрения', 'Поля зрения', '', 0, '', '', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0,
        1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14272', 'Исследование крови на сифилис',
        'Исследование крови на сифилис', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14273',
        'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям',
        'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14274',
        'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям',
        'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14275',
        'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям',
        'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14276', 'Мазки на гонорею при поступлении на работу',
        'Мазки на гонорею при поступлении на работу', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0,
        0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0,
        0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14302', 'Прием дерматовенеролога', 'Прием дерматовенеролога', '', 0, '',
        '313, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14303', 'Прием оториноларинголог', 'Прием оториноларинголог', '', 0, '',
        '217-221, 9:00-12:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, 365, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14304', 'Прием офтальмолога', 'Прием офтальмолога', '', 0, '',
        '212-210, 9:00-12:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1,
        null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14305', 'Прием хирурга', 'Прием хирурга', '', 0, '', '220, 8:00-12:00',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14306', 'Прием стоматолога', 'Прием стоматолога', '', 0, '',
        '301, 10:00-11:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 5, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14307', 'Прием инфекциониста', 'Прием инфекциониста', '', 0, '', '', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14308', 'Прием уролога', 'Прием уролога', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14309', 'Прием врача по водолазной медициние',
        'Прием врача по водолазной медициние', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0,
        0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14278', 'УЗИ молочных желез', 'УЗИ молочных желез', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1,
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, '', 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', '', '', '');

rollback ;
commit ;


start transaction;
insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                        code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context,
                        amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate,
                        defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent,
                        defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id,
                        showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id,
                        shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant,
                        propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible,
                        serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES,
                        frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency,
                        isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod,
                        recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock,
                        refferalType_id, defaultBeginDate, showAPOrg,
                        filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet,
                        defaultIsUrgent, checkEnterNote, formulaAlias, EGISZ_code, code_f30, code_f14)
values (NOW(), NULL, NOW(), NULL, 0, 3, null, '*01', 'Проф.осмотры', '', '', 0, '', '', 1, 0, null, '', 0, 0, 2, 1, 0,
        3, NULL, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 0, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, null, '*01_1', 'Проф.осмотры(новые)', '', '', 0, '', '', 1, 0, null, '', 0, 0,
        2, 1, 0, 3, NULL, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 0, null, null, 0, 0, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', '');

commit ;

select *
from ActionType where group_id in
(select id
from ActionType
where id in (84915, 84914));

select *
from ActionType
where id in (84915, 84914);

select *
from ActionType order by id desc ;

select apt.id,
       apt.deleted,
       actionType_id,
       at1.name,
       idx,
       template_id,
       apt.name,
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
       customSelect,
       autoFieldUserProfile,
       apt.formulaAlias
from ActionType at1, ActionPropertyType apt
where at1.group_id in
(select id
from ActionType where id in(9268,11268))
and apt.actionType_id = at1.id
;


select *
from ActionType where group_id = 9268;

select *
from ActionPropertyType where actionType_id = 9205;

select *
from ActionType;

select *
from rbService;

select *
from rbHurtType;

select *
from rbHurtFactorType;

select *
from EventType_Action, rb where hurtFactorType regexp ;



#
select createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       code,
       regexp_replace(code, '(.*)', 'OLD_\\1') name #
from update rbHurtFactorType set code = regexp_replace(code, '(.*)', 'OLD_\\1');

# select *
# from
update
rbHurtType
set code = regexp_replace(code, '(.*)', 'OLD_\\1');

select */*bigin*/
from rbHurtFactorType;
select *
from rbHurtType;
insert into s11.rbHurtFactorType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name)
values  (now(), NULL, now(), NULL, '0', 'Отсутствие фактора вредности');/*end*/

insert into s11.rbHurtType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name)
values  (now(), NULL, now(), NULL, '0', 'Отсутствие типа вредности'),
        (now(), NULL, now(), NULL, '*', '*'),
        (now(), null, now(), null, '1', ' 1 Химические факторы'),
        (now(), null, now(), null, '1.1', 'Азота неорганические соединения (в том числе азота оксиды (О), азота диоксид(О))'),
        (now(), null, now(), null, '1.2', 'Азотсодержащие органические соединения (в том числе амины, амиды, анилиды, гидразин и его производные, нитросоединения и прочие производные: NN-диметилацетамид(Р), NN-диметилформамид(Р), капролактам(АР) (гексагидро-2Н-азепин-2-он)'),
        (now(), null, now(), null, '1.3', 'Альдегиды алифатические (предельные и непредельные) и ароматические (формальдегид(АКРО), ацетальдегид, проп-2-ен-1-аль (акролеин), бензальдегид, бензол-1,2-дикарбальдегид (фталевый альдегид)'),
        (now(), null, now(), null, '1.4', 'Альдегиды и кетоны галогенопроизводные (хлорбензальдегид (4-хлорбензальдегид), фторацетон, хлорацетофенон)'),
        (now(), null, now(), null, '1.5', 'Алюминий и его соединения, в том числе:'),
        (now(), null, now(), null, '1.5.1', 'Алюмоплатиновые катализаторы(А)'),
        (now(), null, now(), null, '1.6', 'Бериллий и его соединения(АКР)'),
        (now(), null, now(), null, '1.7', 'Бор и его соединения, в том числе:'),
        (now(), null, now(), null, '1.7.1', 'Борная кислота, бор нитрид(Ф), бор трифторид(О), тетраБор карбид(Ф), тетраБор трисилицид(Ф)'),
        (now(), null, now(), null, '1.7.2', 'Бороводороды(О)'),
        (now(), null, now(), null, '1.8', 'Галогены, в том числе:'),
        (now(), null, now(), null, '1.8.1', 'Хлор(О):'),
        (now(), null, now(), null, '1.8.1.1', 'Хлора неорганические соединения (гидрохлорид(О), кислоты, оксиды)'),
        (now(), null, now(), null, '1.8.1.2', 'Хлорсодержащие органические соединения'),
        (now(), null, now(), null, '1.8.2', 'Бром(АО)'),
        (now(), null, now(), null, '1.8.2.1', 'Брома неорганические соединения (бром(АО))'),
        (now(), null, now(), null, '1.8.2.2', 'Бромсодержащие органические соединения (в том числе бромбензол, бромгексан, бромметан)'),
        (now(), null, now(), null, '1.8.3', 'Йод'),
        (now(), null, now(), null, '1.8.3.1', 'Йода неорганические соединения (йод, оксиды, кислоты и прочие)'),
        (now(), null, now(), null, '1.8.3.2', 'Йодсодержащие органические соединения (в том числе йодбензол, йодметилбензол)'),
        (now(), null, now(), null, '1.8.4', 'Фтор(О)'),
        (now(), null, now(), null, '1.8.4.1', 'Фтора неорганические соединения (в том числе фтор(О), гидрофторид(РО), аммоний фторид(Р), соединения металлов с фтором: барий дифторид(Р), калий фторид(Р), литий фторид(Р), натрий фторид(Р), криолит(Р), олово фторид(Р))'),
        (now(), null, now(), null, '1.8.4.2', 'Фторорганические соединения и фторхлорорганические соединения (в том числе дихлорфторметан, дихлорфторметилбензол, фторхлорэтан)'),
        (now(), null, now(), null, '1.9', 'Карбонилдихлорид (фосген)(О)'),
        (now(), null, now(), null, '1.10', 'Гидразин и его производные: фенилгидразин гидрохлорид, борингидразин, диметилгидразин (гептил)(К)'),
        (now(), null, now(), null, '1.11', 'Дибензодиоксины полихлорированные (ПХДД), дибензофураны полихлорированные, 2,3,4,7,8-пентахлордибензофуран, бифенилы полибромированные и полихлорированные(К), 2,3,7,8-тетрахлордибензо-пара-диоксин(К), 3,3,4,4,5-пентахлорбифенил (ПХБ-126)(К), диметилкарбамо'),
        (now(), null, now(), null, '1.12', 'Кадмий и его соединения(К), кадмий ртуть теллур (твердый раствор)(К), октадеканоат кадмия(К)'),
        (now(), null, now(), null, '1.13', 'Карбонилы металлов, в том числе железо пентакарбонил, кобальт гидридотетракарбонил(АО)'),
        (now(), null, now(), null, '1.14', 'Кетоны, в том числе:'),
        (now(), null, now(), null, '1.14.1', 'Кетоны алифатические, ароматические 1-фенилэтанон (ацетофенон), пентан-2-он (метилэтилкетон)'),
        (now(), null, now(), null, '1.14.2', 'Пропан-2-он(Р) (ацетон)'),
        (now(), null, now(), null, '1.15', 'Кислоты органические: метановая (муравьиная), этановая (уксусная), бутановая (масляная), пропионовая, 1-метилбутановая (изовалериановая), этадионовая кислота дигидрат (щавелевая), 4-метилпентановая (изокапроновая), проп-2-еновая (акриловая), бензойная и пр'),
        (now(), null, now(), null, '1.15.1', 'Бензол-1,3-дикарбоновая(А) (изофталевая) и бензол-1,4-дикарбоновая(А) (терефталевая) кислоты'),
        (now(), null, now(), null, '1.16', 'Кремния органические соединения(А) (силаны), в том числе трихлор(хлорметил) силан, фенилтрихлорсилан, трихлорсилан'),
        (now(), null, now(), null, '1.17', 'Марганец(Р) и его соединения, в том числе марганец карбонат гидрат(АР), марганец нитрат гексагидрат(АР), марганец сульфат пентагидрат(А), марганец трикарбонилциклопентадиен(Р)'),
        (now(), null, now(), null, '1.18', 'Медь, золото, серебро и их соединения, в том числе:'),
        (now(), null, now(), null, '1.18.1', 'Медь и ее соединения'),
        (now(), null, now(), null, '1.18.2', 'Золото(А) и его соединения'),
        (now(), null, now(), null, '1.18.3', 'Серебро(Р) и его соединения'),
        (now(), null, now(), null, '1.19', 'Металлы щелочные, щелочноземельные, редкоземельные и их соединения, в том числе:'),
        (now(), null, now(), null, '1.19.1', 'Натрий, калий, литий, рубидий, цезий, цезиевая соль хлорированного бисдикарбонил кобальта и прочие; кальций, магний, стронций, барий, магнид меди(Ф), магний додекаборид; лантан, иттрий, скандий, церий и их соединения'),
        (now(), null, now(), null, '1.19.2', 'Кобальт(А), молибден, вольфрам(Ф), тантал(Ф), ниобий(Ф) и их соединения'),
        (now(), null, now(), null, '1.19.3', 'Ванадий, европий, иттрий, оксид фосфат (люминофор Л-43 (ванадат иттрия фосфат)(Р)'),
        (now(), null, now(), null, '1.20', 'Ртуть(Р) и ее соединения: ртуть(Р); металлоорганические соединения (ртуть неорганические соединения и прочие); органические соединения ртути'),
        (now(), null, now(), null, '1.21', 'Мышьяк и его неорганические(КР) и органические соединения'),
        (now(), null, now(), null, '1.22', 'Никель и его соединения(АК), гептаникель гексасульфид(АК), никель тетракарбонил(АКО), никель хром гексагидрофосфат(АК), никеля соли(АК)'),
        (now(), null, now(), null, '1.23', 'Озон(О)'),
        (now(), null, now(), null, '1.24', 'Оксиды органические и перекиси: эпоксиэтан(КР) (этилена оксид), 1,2-эпоксипропан(К) (пропилена оксид), (хлорметил) оксиран(АК) (эпихлоргидрин)'),
        (now(), null, now(), null, '1.25', 'Олово и его соединения'),
        (now(), null, now(), null, '1.26', 'Платиновые металлы и их соединения: рутений, родий, палладий(А), диАммоний дихлорпалладий(А), осмий, иридий, платина, диАммоний гексахлорплатинат(А)'),
        (now(), null, now(), null, '1.27', 'Свинец, в том числе:'),
        (now(), null, now(), null, '1.27.1', 'Свинец и его неорганические соединения(РК)'),
        (now(), null, now(), null, '1.27.2', 'Свинца органические соединения: тетраэтилсвинец(О), 1,4-дигидрооксибензол свинец аддукт'),
        (now(), null, now(), null, '1.28', 'Селен, теллур и их соединения'),
        (now(), null, now(), null, '1.29', 'Серы соединения, в том числе:'),
        (now(), null, now(), null, '1.29.1', 'Серы оксиды, кислоты'),
        (now(), null, now(), null, '1.29.2', 'Дигидросульфид (сероводород)(О), дигидросульфид(О) (сероводород) смесь с углеводородами C1-5'),
        (now(), null, now(), null, '1.29.3', 'Углерод дисульфид(Р) (сероуглерод)'),
        (now(), null, now(), null, '1.29.4', 'Серусодержащие органические соединения: тиолы (меркаптаны), тиоамиды: метантиол (метилмеркаптан), этантиол (этилмеркаптан)'),
        (now(), null, now(), null, '1.29.5', 'Тетраметилтиопероксидикарбондиамид(А) (тиурам Д)'),
        (now(), null, now(), null, '1.30', 'Спирты, в том числе:'),
        (now(), null, now(), null, '1.30.1', 'Алифатические одно- и многоатомные, ароматические спирты и их производные: этанол, бутан-1-ол, бутан-2-ол, бутанол, метанол, пропан-1-ол, пропан-2-ол, 2-(Проп-2-енокси) этанол, 2-этоксиэтанол(Р), бензилкарбинол(Р), этан-1,2-диол (этиленгликоль), пропан-2-д'),
        (now(), null, now(), null, '1.31', 'Сурьма(Р) и ее соединения'),
        (now(), null, now(), null, '1.32', 'Таллий, индий, галлий и их соединения'),
        (now(), null, now(), null, '1.33', 'Титан(Ф), цирконий, гафний, германий и их соединения'),
        (now(), null, now(), null, '1.34', 'Углеводородов алифатических галогенопроизводные, в том числе:'),
        (now(), null, now(), null, '1.34.1', 'Дихлорметан(Р) (хлористый метилен), 1,2-дихлорэтан, тетрахлорметан (четыреххлористый углерод)(Р), трихлорметан (хлороформ), хлорметан(Р) (хлористый метил), бромэтан, трихлорэтан, трихлорэтен, 1 и 2-хлорбута-1,3-диен (хлоропрен)(Р), тетрафторэтен (перфториз'),
        (now(), null, now(), null, '1.34.2', 'Хлорэтен(КР) (винилхлорид)'),
        (now(), null, now(), null, '1.35', 'Углеводороды гетероциклические: фуран(А), фуран-2-альдегид(А) (фурфураль), пиридин и его соединения, пиперидины, тетрагидро-1,4-оксазин (морфолин) и другие'),
        (now(), null, now(), null, '1.36', 'Углеводороды алифатические предельные, непредельные, циклические, в том числе:'),
        (now(), null, now(), null, '1.36.1', 'Метан, этан, пропан, парафины, этилен, пропилен, ацетилен, циклогексан'),
        (now(), null, now(), null, '1.36.2', 'Бута-1,3-диен(КР) (1,3-бутадиен, дивинил)'),
        (now(), null, now(), null, '1.36.3', '1,7,7триметилбицикло [2,2,1]гептан-2-он (камфара)'),
        (now(), null, now(), null, '1.37', 'Углеводороды ароматические:'),
        (now(), null, now(), null, '1.37.1', 'Бензол(КР) и его производные: (толуол(Р) (метилбензол), ксилол(Р) (диметилбензол), стирол (этенилбензол) и прочие), гидроксибензол(Р) (фенол) и его производные, крезол в том числе:'),
        (now(), null, now(), null, '1.37.1.1', 'Амино- и нитросоединения ароматических углеводородов и их производные: аминобензол (анилин), м-, п-толуидин, N-метиламинобензол (метил-аланин), аминонитро-бензолы; нитрохлорбензолы, нитро-, аминофенолы, 2-метил-1,3,5-тринитробензол (тринитротолуол), диамин'),
        (now(), null, now(), null, '1.37.1.2', 'Галогенопроизводные ароматические углеводороды: хлорбензол, (хлорметил)бензол(А) (хлортолуол; бензилхлорид), бромбензол(А), трихлорбензол, трифтор-метилбензол, 1-гидрокси-2-хлорбензол, 1-гидрокси-4-хлорбензол, 1-гидрокси-2,4,6 трихлорбензол (хлорфенолы), 4'),
        (now(), null, now(), null, '1.37.2', 'Полициклические ароматические углеводороды и их производные (нафталин, нафтолы, бенз(а)пирен(КР), дибенз(a,h)антрацен(К), антрацен, бензантрон, бенз(а)антрацен(К), фенантрен, 4-гидрокси-3-(3оксо-1-фенилбу-2H-1-бензопиран(Р))'),
        (now(), null, now(), null, '1.38', 'Углеводородов алифатических амино- и нитросоединения и их производные (в том числе метиламин, этиленимин(АО), 1,6-диаминогексан (гексаметилендиамин)(А), циклогексиламин)'),
        (now(), null, now(), null, '1.39', 'Углерода оксид(РО)'),
        (now(), null, now(), null, '1.40', 'Фосфор и его соединения, в том числе:'),
        (now(), null, now(), null, '1.40.1', 'Фосфорсодержащие неорганические соединения (в том числе фосфин(О), фосфориллорид(О), фосфиды металлов, галогениды фосфора, фосфор пентаоксид)'),
        (now(), null, now(), null, '1.40.2', 'Фосфорсодержащие органические соединения - трикрезилфосфат(Р) и другие'),
        (now(), null, now(), null, '1.41', 'Хиноны и их производные (в том числе нафтохиноны, бензохиноны, гидрохиноны(А), антрахинон (антрацен-9,10-дион)'),
        (now(), null, now(), null, '1.42', 'Хром (VI) триоксид(КР), диХромтриоксид(А), хром трихлорид гексагидрат(А), хромовая кислота(АК) и ее соли, соединения хрома и сплавы'),
        (now(), null, now(), null, '1.43', 'Цианистые соединения, в том числе:'),
        (now(), null, now(), null, '1.43.1', 'Цианистоводородная кислота(О), ее соли, галоген- и другие производные (цианистый калий(О), хлорциан(О), цианамид и прочие - гидроцианида соли(О), бензилцианид(О)); нитрилы органических кислот: ацетонитрил, бензонитрил и другие'),
        (now(), null, now(), null, '1.43.2', 'Акрилонитрил(РА) (проп-2-енонитрил)'),
        (now(), null, now(), null, '1.44', 'Цинк и его соединения(А)'),
        (now(), null, now(), null, '1.45', 'Эфиры сложные кислот органических, в том числе:'),
        (now(), null, now(), null, '1.45.1', 'Эфиры сложные уксусной кислоты (в том числе этилацетат, бутилацетат, 2-метоксиэтилацетат(Р), 2-этоксиэтилацетат(Р))'),
        (now(), null, now(), null, '1.45.2', 'Эфиры сложные акриловой кислоты (в том числе метилакрилат (метилпроп-2-еноат), бутилакрилат(бутилпроп-2-еноат), метилметакрилат)'),
        (now(), null, now(), null, '1.45.3', 'Эфиры сложные фталевой и терефталевой кислот: дибутилбензол-1,2-дикарбонат (дибутилфталат), диметилбензол-1,2-дикарбонат (диметилтерефталат) и другие'),
        (now(), null, now(), null, '1.46', 'Красители и пигменты органические (в том числе азокрасители, бензидиновые(К), фталоцианиновые, хлортиазиновые, антрахиноновые, триарилметановые, тиоин-дигоидные, полиэфирные)'),
        (now(), null, now(), null, '1.47', 'Пестициды, инсектициды, гербициды, в том числе:'),
        (now(), null, now(), null, '1.47.1', 'Хлорорганические(А) (в том числе метоксихлор, гепта-хлор, хлоридан, дихлор, гексахлорбензол, гексахлорциклогексан (линдан), дикофол, 1,1,-(2,2,2 трихлорэтилиден) бис (4хлорбензол)(Р) (ДДТ)'),
        (now(), null, now(), null, '1.47.2', 'Фосфорорганические (в том числе метафос, метилэтил-тиофос, меркаптофос, карбофос, М-81, рогор, дифлос, хлорофос, глифосфат, гордона, валексон, диазинон, диметоат, малатион, паратионметил, хлорфенвинфос)'),
        (now(), null, now(), null, '1.47.3', 'Ртутьорганические (в том числе этилмеркурхлорид диметилртуть)'),
        (now(), null, now(), null, '1.47.4', 'Производные кислот карбаминовых: (в том числе каторана-вадекс, дихлоральмочевина, метурин, фенуроп, севин(А), манеб(А), дикрезил, ялан, эптам, карбатион(А), цинеб(А), карбофуран, карбосульфан, пиримикарб, тирам, манкоцеб, поликарбацин, десмедифам, фенмедиф'),
        (now(), null, now(), null, '1.47.5', 'Производные кислот алифатических хлорированных (в том числе хлоруксусной, трихлоруксусной)'),
        (now(), null, now(), null, '1.47.6', 'Производные кислоты хлорбензойной'),
        (now(), null, now(), null, '1.47.7', 'Производные кислоты хлороксиуксусной: 2,4-дихлорфеноксиуксусная кислота (2,4Д), аминная соль 2,4-дихлорфеноксиуксусной кислоты (2,4ДА), 4-хлор-2-метилфеноксиуксусная кислота (МСРА)'),
        (now(), null, now(), null, '1.47.8', 'Кислоты хлорфеноксимасляной производные'),
        (now(), null, now(), null, '1.47.9', 'Кислот карбоновых анилиды галоидозамещенные'),
        (now(), null, now(), null, '1.47.10', 'Производные мочевины и гуанидина'),
        (now(), null, now(), null, '1.47.11', 'Производные сим-тразинов: атразин, прометрин, тербутрин'),
        (now(), null, now(), null, '1.47.12', 'Гетероциклические соединения различных групп: зоокумарин(4-гидрокси-3-(3-оксо-1-фенилбу-2H-1-бензопиран-2-онтил), ратиндан (2-(Дифенилацетил)-1H-инден-1,3-(2H)-дион), морестан, пирамин (5-Амино-2-фенил-4-хлорпридазин 3(2H)-он), тиазон (3,5-Диметил-2H-1,3,5'),
        (now(), null, now(), null, '1.47.13', 'Хлорацетоанилиды (ацетохлор, алахлор, метазахлор, метолахлор)'),
        (now(), null, now(), null, '1.47.14', 'Пиретроиды (в том числе бифентрин, перметрин, фенвалерат, лямбдацыгалотрин, цыгалотрин, дельтаметрин)'),
        (now(), null, now(), null, '1.47.15', 'Производные сульфанил-мочевины (в том числе хлорсульфурон, римсульфурон, хлорсульфоксим, метмульфуронметил, трибунуронметил, тифенсульфурон-метил)'),
        (now(), null, now(), null, '1.47.16', 'Азолы (в том числе бромуконазол, ципраконазол, пропиконазол, тритиконазол, триадименол, прохлораз, имозалил)'),
        (now(), null, now(), null, '1.48', 'Синтетические моющие средства на основе анионных поверхностно активных веществ и их соединения (в том числе сульфанол, алкиламиды)(А)'),
        (now(), null, now(), null, '1.49', 'Синтетические полимерные материалы: смолы, лаки, клеи, пластмассы, пресспорошки, волокна, в том числе:'),
        (now(), null, now(), null, '1.49.1', 'Полиакрилаты: полиметакрилаты (оргстекло, плексиглаз), полиакрилонитрил, полиакриламид'),
        (now(), null, now(), null, '1.49.2', 'Поливинилхлорид(АФ) (ПВХ, винилпласты, перхлорвиниловая смола), производство и применение'),
        (now(), null, now(), null, '1.49.3', 'Полимер (1метилэтенил) бензола с этенилбензолом(Р)'),
        (now(), null, now(), null, '1.49.4', 'Полиолефины (полиэтилены, полипропилены(А) (горячая обработка)'),
        (now(), null, now(), null, '1.49.5', 'Полисилоксаны (производство)'),
        (now(), null, now(), null, '1.49.6', 'Полистиролы (производство)'),
        (now(), null, now(), null, '1.49.7', 'Полиуретаны(А) (пенополиуретан) (производство)'),
        (now(), null, now(), null, '1.49.8', 'Полиэфиры (лавсан) (производство)'),
        (now(), null, now(), null, '1.49.9', 'Угле- и органопластики'),
        (now(), null, now(), null, '1.49.10', 'Углеродные волокнистые материалы на основе гидратцеллюлозных волокон и углеродные волокнистые материалы на основе полиакрилонитрильных волокон'),
        (now(), null, now(), null, '1.49.11', 'Фенопласты(АФ) (фенольная смола, бакелитовый лак) (производство)'),
        (now(), null, now(), null, '1.49.12', 'Фторопласты (политетрафторэтилен(Ф), тефлон) (производство и термическая обработка)'),
        (now(), null, now(), null, '1.49.13', 'Фуран(А), фуран-2-альдегид(А), 2,5-фурандион(А)'),
        (now(), null, now(), null, '1.49.14', 'Эпоксидные полимеры(А) (эпоксидные смолы, компаунды, клеи) (производство и применение)'),
        (now(), null, now(), null, '1.50', 'Технические смеси углеводородов: нефти, бензины(Р), коксы(Ф), керосины, уайт-спирит(Р), мазуты, битумы, асфальты, каменноугольные и нефтяные смолы(К), пеки(К), возгоны каменноугольных смол и пеков(К), масла минеральные(К), (кроме высокоочищенных белых меди'),
        (now(), null, now(), null, '1.51', 'Агрохимикаты, в том числе'),
        (now(), null, now(), null, '1.51.1', 'Фосфорные удобрения (аммофос, нитрофоска)'),
        (now(), null, now(), null, '1.51.2', 'Азотные удобрения (нитрат аммония - аммиачная селитра, нитраты натрия, калия)'),
        (now(), null, now(), null, '1.52', 'Фармакологические средства, в том числе:'),
        (now(), null, now(), null, '1.52.1', 'Антибиотики(А) (производство и применение)'),
        (now(), null, now(), null, '1.52.2', 'Противоопухолевые препараты(АК) (производство и применение)'),
        (now(), null, now(), null, '1.52.3', 'Сульфаниламиды(А) (производство и применение)'),
        (now(), null, now(), null, '1.52.4', 'Гормоны (производство и применение)'),
        (now(), null, now(), null, '1.52.5', 'Витамины(А) (производство, применение)'),
        (now(), null, now(), null, '1.52.6', 'Наркотики, психотропные препараты (производство)'),
        (now(), null, now(), null, '1.52.7', 'Фармакологические средства, не вошедшие в подпункты 1.52.1 - 1.52.6 (производство)'),
        (now(), null, now(), null, '1.53', 'Ядохимикаты, в том числе:'),
        (now(), null, now(), null, '1.53.1', 'Гербициды'),
        (now(), null, now(), null, '1.53.2', 'Инсектициды'),
        (now(), null, now(), null, '2', '2. Биологические факторы'),
        (now(), null, now(), null, '2.1', 'Грибы продуценты(А), белково-витаминные концентраты (БВК), кормовые дрожжи(А), комбикорма(А)'),
        (now(), null, now(), null, '2.2', 'Ферментные препараты(А), биостимуляторы'),
        (now(), null, now(), null, '2.3', 'Аллергены для диагностики и лечения(А), компоненты и препараты крови, иммунобиологические препараты(А)'),
        (now(), null, now(), null, '2.4', 'Патогенные биологические агенты (ПБА) - патогенные для человека микроорганизмы - возбудители инфекционных заболеваний (бактерии, вирусы, хламидии, риккетсии, грибы, гельминты, членистоногие), включая генно-инженерно-модифицированные, яды биологического про'),
        (now(), null, now(), null, '2.4.1', 'Возбудители инфекционных заболеваний патогенные микроорганизмы I группы патогенности и возбудители особо опасных инфекций'),
        (now(), null, now(), null, '2.4.2', 'Возбудители инфекционных заболеваний патогенные микроорганизмы II группы патогенности, в т.ч. вирусы гепатитов ВК и СК, вирус иммунодефицита 1-го типа (ВИЧ-1К - СПИД)'),
        (now(), null, now(), null, '2.4.3', 'Возбудители инфекционных заболеваний патогенные микроорганизмы III и IV групп патогенности и возбудители паразитарных заболеваний (гельминты, членистоногие)'),
        (now(), null, now(), null, '2.4.4', 'Биологические токсины (микробного, растительного и животного происхождения)'),
        (now(), null, now(), null, '2.4.5', 'Условно-патогенные микроорганизмы - возбудители инфекционных заболеваний (в том числе аллергозов)'),
        (now(), null, now(), null, '3', '3. Аэрозоли преимущественно фиброгенного действия (АПФД) и пыли'),
        (now(), null, now(), null, '3.1', 'Аэрозоли преимущественно фиброгенного(Ф) и смешанного типа действия, включая:'),
        (now(), null, now(), null, '3.1.1.', 'Аэрозоли абразивные и абразивсодержащие (электрокорундов, карбида бора, альбора, карбида кремния), в том числе с примесью связующих (фенолформальдегидные смолы(АФ), эпоксидные смолы(АФ))'),
        (now(), null, now(), null, '3.1.2', 'Аэрозоли металлов (железо, алюминий, титан, вольфрам) и их сплавов (кремниемедистый, диАлюминий триоксид в смеси со сплавом никеля до 15%, феррохром: сплав хрома 65% с железом, диАлюминий триоксид с примесью кремний диоксида до 15% и диЖелезо триоксида до '),
        (now(), null, now(), null, '3.1.3', 'Кремний диоксид кристаллический а-кварц(К), а-кристобалит(К), а-тридимит(ФА)'),
        (now(), null, now(), null, '3.1.4', 'Кремнийсодержащие аэрозоли: - с содержанием кристаллического диоксида кремния(К) - с содержанием аморфного диоксида кремния в виде аэрозоля дезинтеграции и конденсации - кремний карбид, кремний нитрид, волокнистый карбид кремния(ФА)'),
        (now(), null, now(), null, '3.1.5', 'Огнеупорные материалы (шамотнографитовые огнеупоры), муллитовые (неволокнистые) огнеупоры, магнезиально-силикатные (форстеритовые) огнеупоры, муллито-кремнеземистые, не содержащие и содержащие до 5% Cr3+'),
        (now(), null, now(), null, '3.1.6', 'Руды полиметаллические и содержащие цветные и редкие металлы(А)'),
        (now(), null, now(), null, '3.1.7', 'Сварочные аэрозоли, представляющие сложную смесь АПФД (кремний диоксид аморфный в смеси с оксидами марганца в виде аэрозоля конденсации, дижелезо триоксид, титан диоксид, вольфрам, алюминий и его соединения) и химических веществ разной природы: аэрозоли ме'),
        (now(), null, now(), null, '3.1.8', 'Силикатсодержащие пыли, силикаты, алюмосиликаты, в том числе:'),
        (now(), null, now(), null, '3.1.8.1', 'Асбесты природные (хризотил(К), тремолит(К)), смешанные асбестопородные пыли(К), асбестоцемент(К), асбестобакелит(К), асбесто-резина(ФК)'),
        (now(), null, now(), null, '3.1.8.2', 'Глина, в т.ч. высокоглинистая огнеупорная, цемент, оливин, апатит, шамот коалиновый(ФА)'),
        (now(), null, now(), null, '3.1.8.3', 'Тальк, талькопородные пыли, цеолиты, бокситы, нефелиновые сиениты, дистенсиллиманиты, слюды (флагопит, мусковит), дуниты, известняки, бариты, инфузорная земля, туфы, пемзы, перлит, искусственные минеральные волокна (стекловолокно(ФА), стекловата(ФА), вата '),
        (now(), null, now(), null, '3.1.9', 'Углерода пыли, в том числе:'),
        (now(), null, now(), null, '3.1.9.1', 'Алмазы природные(Ф), искусственные(Ф), металлизированные(Ф)'),
        (now(), null, now(), null, '3.1.9.2', 'Антрацит(Ф) и другие ископаемые угли(Ф) и углеродные пыли(Ф)'),
        (now(), null, now(), null, '3.1.9.3', 'Коксы - каменноугольный(ФК), пековый(ФК), нефтяной(ФК), сланцевый(ФК)'),
        (now(), null, now(), null, '3.1.9.4', 'Сажи черные промышленные(ФК)'),
        (now(), null, now(), null, '3.1.10', 'Шлаки (шлак угольный молотый, строительные материалы на его основе: шлакоблоки, шлакозит; шлак, образующийся при выплавке низколегированных сталей (неволокнистая пыль)'),
        (now(), null, now(), null, '3.2', 'Пыли железорудных(ФК) и полиметаллических концентратов(ФК), металлургических агломератов(ФА)'),
        (now(), null, now(), null, '3.3', 'Сера(Ф)'),
        (now(), null, now(), null, '3.4', 'Пыль животного и растительного происхождения(АФ) (с примесью диоксида кремния(АФ), зерновая(АФ), лубяная(АФ), хлопчатобумажная(АФ), хлопковая(АФ), льняная(АФ), шерстяная(АФ), пуховая(АФ), натурального шелка хлопковая мука (по белку)(А), мучная(АФ), древесн'),
        (now(), null, now(), null, '4', 'Физические факторы'),
        (now(), null, now(), null, '4.1', 'Ионизирующие излучения(К), радиоактивные вещества(К)'),
        (now(), null, now(), null, '4.2', 'Неионизирующие излучения, в том числе:'),
        (now(), null, now(), null, '4.2.1', 'Электромагнитное излучение оптического диапазона (ультрафиолетовое излучение(К), лазерное излучение)'),
        (now(), null, now(), null, '4.2.2', 'Электромагнитное поле радиочастотного диапазона (10 кГц - 300 ГГц)'),
        (now(), null, now(), null, '4.2.3', 'Электрическое и магнитное поле промышленной частоты (50 Гц)'),
        (now(), null, now(), null, '4.2.4', 'Постоянное электрическое и магнитное поле'),
        (now(), null, now(), null, '4.2.5', 'Электромагнитное поле широкополосного спектра частот (5 Гц - 2 кГц, 2 кГц - 400 кГц)'),
        (now(), null, now(), null, '4.3', 'Вибрация:'),
        (now(), null, now(), null, '4.3.1', 'Локальная вибрация'),
        (now(), null, now(), null, '4.3.2', 'Общая вибрация (транспортная, транспортно-технологическая, технологическая)'),
        (now(), null, now(), null, '4.4', 'Шум'),
        (now(), null, now(), null, '4.5', 'Ультразвук воздушный, ультразвук контактный'),
        (now(), null, now(), null, '4.6', 'Инфразвук'),
        (now(), null, now(), null, '4.7', 'Параметры охлаждающего микроклимата (температура, влажность, скорость движения воздуха)'),
        (now(), null, now(), null, '4.8', 'Параметры нагревающего микроклимата (температура, индекс тепловой нагрузки среды, влажность, тепловое излучение)'),
        (now(), null, now(), null, '4.9', 'Освещенность рабочей поверхности'),
        (now(), null, now(), null, '4.10', 'Пониженное давление воздушной и (или) газовой сред и пониженное парциальное давление кислорода во вдыхаемом воздухе или искусственной дыхательной газовой смеси в случае, если указанное давление необходимо поддерживать в производственных зданиях, помещениях'),
        (now(), null, now(), null, '5', '5. Факторы трудового процесса'),
        (now(), null, now(), null, '5.1', 'Тяжесть трудового процесса Подъем, перемещение, удержание груза вручную Стереотипные рабочие движения Рабочее положение тела работника (длительное нахождение работника в положении "стоя", "сидя" без перерывов, "лежа", "на коленях", "на корточках", с наклон'),
        (now(), null, now(), null, '5.2', 'Напряженность трудового процесса (сенсорные нагрузки), в том числе:'),
        (now(), null, now(), null, '5.2.1', 'Работы с оптическими приборами (более 50% времени смены)'),
        (now(), null, now(), null, '5.2.2', 'Нагрузка на голосовой аппарат (суммарное количество часов, наговариваемое в неделю, более 20)'),
        (now(), null, now(), null, '6', 'Работы на высоте:'),
        (now(), null, now(), null, '6.1', 'Работы с высоким риском падения работника с высоты, а также работы на высоте без применения средств подмащивания, выполняемые на высоте 5 м и более; работы, выполняемые на площадках на расстоянии менее 2 м от неогражденных (при отсутствии защитных огражден'),
        (now(), null, now(), null, '6.2', 'Прочие работы, относящиеся в соответствии с законодательством по охране труда к работам на высоте'),
        (now(), null, now(), null, '7', 'Работа лифтера на лифтах скоростных (от 2,0 до 4,0 м/с) и высокоскоростных (свыше 4,0 м/с) при внутреннем сопровождении лифта'),
        (now(), null, now(), null, '8', 'Работы в качестве крановщика (машиниста крана, машинист крана автомобильного)'),
        (now(), null, now(), null, '9', 'Работы, связанные с техническим обслуживанием электроустановок напряжением 50 В и выше переменного тока и 75 В и выше постоянного тока, проведением в них оперативных переключений, выполнением строительных, монтажных, наладочных, ремонтных работ, испытанием'),
        (now(), null, now(), null, '10', 'Работы по валке, сплаву, транспортировке, первичной обработке, охране и восстановлению лесов'),
        (now(), null, now(), null, '11', 'Работы в особых географических регионах с местами проведения работ, транспортная доступность которых от медицинских учреждений, оказывающих специализированную медицинскую помощь в экстренной форме, превышает 60 минут, а именно:'),
        (now(), null, now(), null, '11.1', 'Работы в нефтяной и газовой промышленности, выполняемые в районах Крайнего Севера и приравненных к ним местностях, а также при морском бурении'),
        (now(), null, now(), null, '11.2', 'Работы на гидрометеорологических станциях, сооружениях связи'),
        (now(), null, now(), null, '11.3', 'Работы, не указанные в подпунктах 11.1, 11.2, выполняемые по срочным трудовым договорам в районах Крайнего Севера и приравненных к ним местностях (в отношении проведения предварительных медицинских осмотров для работников, приезжающих на работу в районы Кр'),
        (now(), null, now(), null, '11.4', 'Работы, выполняемые вахтовым методом в необжитых, отдаленных районах и районах с особыми природными условиями (в отношении проведения предварительных медицинских осмотров для работников, выполняющих работу вахтовым методом в указанных районах)'),
        (now(), null, now(), null, '12', 'Работы, непосредственно связанные с обслуживанием оборудования, работающего под избыточным давлением более 0,07 мегапаскаля (МПа) и подлежащего учету в органах Ростехнадзора: а) пара, газа (в газообразном, сжиженном состоянии); б) воды при температуре боле'),
        (now(), null, now(), null, '13', 'Работы, непосредственно связанные с применением легковоспламеняющихся и взрывчатых материалов, работы во взрыво- и пожароопасных производствах, работы на коксовой батарее на открытых производственных зонах'),
        (now(), null, now(), null, '14', 'Работы, выполняемые аварийно-спасательной службой, аварийно-спасательными формированиями, спасателями, а также работы, выполняемые пожарной охраной при тушении пожаров'),
        (now(), null, now(), null, '15', 'Работы, выполняемые непосредственно на механическом оборудовании, имеющем открытые движущиеся (вращающиеся) элементы конструкции, в случае если конструкцией оборудования не предусмотрена защита (ограждение) этих элементов (в том числе токарные, фрезерные и'),
        (now(), null, now(), null, '16', 'Подземные работы, включая работы на рудниках'),
        (now(), null, now(), null, '17', 'Работы, выполняемые непосредственно с применением средств индивидуальной защиты органов дыхания изолирующих и средств индивидуальной защиты органов дыхания фильтрующих с полной лицевой частью'),
        (now(), null, now(), null, '18', 'Управление наземными транспортными средствами <2>:'),
        (now(), null, now(), null, '18.1', 'Категории "A", "B", "BE", трактора и другие самоходные машины, мини-трактора, мотоблоки, автопогрузчики, электрокары, регулировщики и т.п., автомобили всех категорий с ручным управлением для инвалидов, мотоколяски для инвалидов'),
        (now(), null, now(), null, '18.2', 'Категории "C", "C1", "CE", "D1", "D1E", трамвай, троллейбус'),
        (now(), null, now(), null, '19', 'Водолазные работы:'),
        (now(), null, now(), null, '19.1', 'Водолазные работы на глубинах до 60 м (в аварийных случаях до 80 м с применением воздуха для дыхания), за исключением водолазных работ, указанных в пункте 19,3'),
        (now(), null, now(), null, '19.2', 'Водолазные работы на глубинах более 60 метров, выполняемые методом кратковременных погружений'),
        (now(), null, now(), null, '19.3', 'Водолазные работы, выполняемые методом длительного пребывания в условиях повышенного давления водной и газовой сред'),
        (now(), null, now(), null, '20', 'Работы по оказанию медицинской помощи внутри барокамеры при проведении лечебной рекомпрессии или гипербарической оксигенации'),
        (now(), null, now(), null, '21', 'Кессонные работы, работы в барокамерах и других устройствах в условиях повышенного давления воздушной и газовой среды (за исключением работ, указанных в пунктах 19 и 20)'),
        (now(), null, now(), null, '22', 'Работы, при выполнении которых разрешено ношение оружия и его применение (в случаях, когда требования о прохождении медицинских осмотров (освидетельствований) не установлены статьями 12 и 13 Федерального закона от 13 декабря 1996 г. N 150-ФЗ "Об оружии" и '),
        (now(), null, now(), null, '23', 'Работы, где имеется контакт с пищевыми продуктами в процессе их производства, хранения, транспортировки и реализации (в организациях пищевых и перерабатывающих отраслей промышленности, сельского хозяйства, пунктах, базах, складах хранения и реализации, в т'),
        (now(), null, now(), null, '24', 'Работы на водопроводных сооружениях, имеющие непосредственное отношение к подготовке воды, а также обслуживанию водопроводных сетей'),
        (now(), null, now(), null, '25', 'Работы в организациях, деятельность которых связана с воспитанием и обучением детей'),
        (now(), null, now(), null, '26', 'Работы в организациях, деятельность которых связана с коммунальным и бытовым обслуживанием населения'),
        (now(), null, now(), null, '27', 'Работы в медицинских организациях');


select *
from Person where userProfile_id = 1;