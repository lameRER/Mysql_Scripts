insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted,
                       class, group_id, code, name, title, flatCode, sex, age, office, showInForm,
                       genTimetable, quotaType_id, context, defaultPlannedEndDate,
                       defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id,
                       counter_id, period, singleInPeriod, lis_code, isActiveGroup, refferalType_id,
                       EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias,
                       instrumentalId, old_group_id, old_id, code_f30, code_f14, tarifForEgorichev, isAllowedDateAfterDeath)
select now()   createDatetime,
       null    createPerson_id,
       now()   modifyDatetime,
       null    modifyPerson_id,
       0       deleted,
       0       class,
       null    group_id,
       ''      code,
       'ВИМИС' name,
       'ВИМИС' title,
       flatCode,
       sex,
       age,
       office,
       showInForm,
       genTimetable,
       quotaType_id,
       ''      context,
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
       tarifForEgorichev,
       isAllowedDateAfterDeath
from ActionType at1
order by at1.id desc
limit 1
;

88020
select *
from ActionType order by id desc ;


insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, period, singleInPeriod, checkPeriod, isCustomSum, recommendationExpirePeriod, recommendationControl, lis_code, isExecRequiredForEventExec, isActiveGroup, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId, code_f30, code_f14)
values  ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'УП01.02.006', 'Гистология: Приготовление гистологических препаратов (1 биоптат - не более двух блоков) с последующим патоморфологическим заключением', 'Гистология: Приготовление гистологических препаратов (1 биоптат - не более двух блоков) с последующим патоморфологическим заключением', 'histology_epicrisis', 0, '', '', 1, 0, null, 'gist', 1, 0, 5, 2, 0, 0, null, null, 0, 0, 5, 5, 0, null, 0, 0, 0, 1, null, null, 0, 0, 1, 0, 0, 0, 0, 5, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, 'УП01.02.006', 0, 0, 0, 0, null, 1, 1, 0, 0, 1, 0, 0, 0, 0, '8329', null, null, null, null, '', 8, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'УП01.04.031', 'ЛД: Ультразвуковые исследования: Дуплексное сканирование вен нижних конечностей', 'ЛД: Ультразвуковые исследования: Дуплексное сканирование вен нижних конечностей', 'УП01.04.031', 0, '', '', 1, 0, null, 'uzi', 1, 0, 0, 2, 3, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 0, 0, 0, 0, 0, 20, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 1, null, 2, 1, 0, 0, 1, 0, 0, 0, 0, '7845', null, null, null, null, '', 3, '5115_2.1', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'ДР1', 'Лекарственная терапия (препарат)', 'Лекарственная терапия (препарат)', 'drug_theraphy', 0, '', '', 0, 0, null, 'drug_theraphy', 0, 0, 0, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 1, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, null, 1, 0, 0, 0, null, 2, 1, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, null, null, null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, '1.045', 'КДО: Прием (осмотр, консультация) врача-специалиста: врач, кандидат медицинских наук (гинеколог/уролог) (повторный - по назначению врача)', 'КДО: Прием (осмотр, консультация) врача-специалиста: врач, кандидат медицинских наук (гинеколог/уролог) (повторный - по назначению врача)', '1.045', 0, '', '', 1, 0, null, 'cons_red_new_rls_sms5', 1, 0, 2, 1, 0, 1, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 1, 0, 0, 0, 0, 2, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 1, 0, 0, 0, null, 2, 1, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, 21, '', null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, '22.2.053', 'Цитология: Цитологические исследования: Исследование цитологических препаратов', 'Цитология: Цитологические исследования: Исследование цитологических препаратов', '22.2.053', 0, '', '', 1, 0, null, 'citolog', 1, 0, 5, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 1, 0, 0, 0, 0, 5, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 1, 1, 0, 0, 1, 0, 0, 0, 0, '2368', null, null, null, null, '', 8, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, '22.010', 'МЦ: Цитологические исследования: Исследование цитологических препаратов', 'МЦ: Цитологические исследования: Исследование цитологических препаратов', '22.010', 0, '', '', 1, 0, null, 'citolog', 1, 9, 5, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 1, 0, 0, 0, 0, 5, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 1, 1, 0, 0, 1, 0, 0, 0, 0, '2368', null, null, null, null, '', 8, '5300_1.3', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'oper_protocol', 'Протокол операции', 'Протокол операции', 'oper_protocol', 0, '', '', 1, 0, null, 'oper_protocol', 0, 0, 0, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 0, 0, 0, 0, 0, 15, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 1, 1, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, null, '', null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, '13', 'Исследования свертывающей системы крови', 'Исследования свертывающей системы крови', '', 0, '', '', 1, 0, null, 'analyses5', 0, 0, 0, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 0, null, null, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, null, '', null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'Death', 'Констатация смерти', 'Констатация смерти', 'Death', 0, '', '', 1, 0, null, 'const_death', 0, 0, 0, 2, 0, 0, null, null, 0, 0, 0, 0, 0, null, 1, 0, 1, 1, null, null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, null, '', null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'СМС 6', 'СМС 6 Консилиум', 'СМС 6 Консилиум', '', 0, '', '', 1, 0, null, 'SMS6', 0, 0, 2, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 2, 0, 0, 0, 1, 0, 0, 0, 0, '3416', null, null, null, null, '', null, '', ''),
        ('2021-12-03 16:43:57', null, '2021-12-03 16:43:57', null, 0, 0, 88020, 'СМС 11', 'СМС 11 Протокол на случай выявления у больного запущенной формы злокачественного новообразования', 'СМС11 Протокол на случай выявления у больного запущенной формы злокачественного новообразования', 'СМС 11', 0, '', '', 1, 0, null, 'SMS11', 0, 0, 2, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, null, null, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 2, 0, 0, 0, 1, 0, 0, 0, 0, '', null, null, null, 21, '', null, '', '');


select *
from ActionType where group_id = 88020;

insert into ActionPropertyType(actionType_id, idx, template_id, name, shortName, descr, unit_id,
typeName, valueDomain, defaultValue, norm, sex, age,
penaltyUserProfile, penaltyDiagnosis, test_id, laboratoryCalculator, userProfile_id, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias)
select
       at1.id actionType_id,
       tap.idx,
       tap.template_id,
       tap.name,
       tap.shortName,
       tap.descr,
       tap.unit_id,
       tap.typeName,
       tap.valueDomain,
       tap.defaultValue,
       tap.norm,
       tap.sex,
       tap.age,
       tap.penaltyUserProfile,
       tap.penaltyDiagnosis,
       null test_id,
       tap.laboratoryCalculator,
       tap.userProfile_id,
       tap.ticketsNeeded,
       tap.parent_id,
       tap.customSelect,
       tap.autoFieldUserProfile,
       tap.formulaAlias
from temp_apt_pes tap,
     ActionType at1
where at1.group_id = 88020 and tap.at_name = at1.name;


select * from rbLabForceOrgStructure;
select * from rbMaterialcomplexityCat;
select * from rbProcessCharacter;
select * from rbAnatomicalLocalities;
select * from rbReferralType_EGISZ;
select * from rbEquipment;
select * from rbRECIST;
select * from rbODII;
select * from rbRoute;
select * from rbStockNomenclature;
select * from rbCaseVisit;
select * from rbfactorriskZNO;
select * from rbsiptomZNO;
select * from rbCarnotianIndex;
select * from rbECOG;
select * from rbSeverityCondition;
select * from rbpatolreak;
select * from rbLekarstva;
select * from rbReferralType_EGISZ;
select * from rbklassgroupzdorov;
select * from rbKlinGroup;
select * from rbRRVidPMO;
select * from rbfactdetection;
select * from rbRECIST;
select * from rbmetodpodtvdiag;
select * from rbfactdetection;
select * from rbLabForceOrgStructure;
select * from rbDruQuality;
select * from rbStroketype;
select * from rbCytologicalsignsofpathology;
select * from rbReferralType_EGISZ;
select * from rbLabForceOrgStructure;
select * from rbReferralType_EGISZ;
select * from rbDruQuality;
select * from rbAnesthesia;
select * from rbLabForceOrgStructure;
select * from rbTypeMRofdeath;
select * from rbGroundsofdeath;
select * from rbConsiliumResult;
select * from rbConditionsMedicalAssistance;
select * from rbMedicalPlace;
select * from rbConsiliumGoal;
select * from rbConsiliumForm;
select * from rbOncoSurgeryTypes;
select * from rbOncoHirTypeTreatment;
select * from rbRRRadiationTherapy;
select * from rbRadiationTherapyMethods;
select * from rbIrradiationMethods;
select * from rbRadioModifiers;
select * from rbChemotherapyType;
select * from rbConditionsMedicalAssistance;
select * from rbTreatmentStagesNeoplasm;
select * from rbLekarstva;
select * from rbConditionsMedicalAssistance;
select * from rbTreatmentStagesNeoplasm;
select * from rbConditionsMedicalAssistance;
select * from rbTreatmentStagesNeoplasm;
select * from rbTreatmentStagesNeoplasm;
select * from rbConditionsMedicalAssistance;
select * from rbLekarstva;
select * from rbReasonsforlatediagnosis;


-- auto-generated definition
create table rbDruQuality
(
    id   int         null,
    code varchar(16) null comment '1.2.643.5.1.13.13.11.1502',
    name varchar(64) null
);
insert into s11.rbDruQuality (id, code, name)
values  (1, '1', 'Адекватный'),
        (2, '2', 'Недостаточно адекватный'),
        (3, '3', 'Неадекватный');


create table rbStroketype
(
    id   int          null,
    code varchar(32)  null comment '1.2.643.5.1.13.13.11.1505',
    name varchar(255) null
);
insert into s11.rbStroketype (id, code, name)
values  (1, '1', 'Цитограмма без  особенностей  (для  репродуктивного возраста)'),
        (2, '2', 'Цитограмма с возрастными изменениями слизистой оболочки'),
        (3, '3', 'Атрофический тип мазка'),
        (4, '4', 'Эстрогенный тип мазка');

-- auto-generated definition
create table rbCytologicalsignsofpathology
(
    id   int          null,
    code varchar(32)  null comment '1.2.643.5.1.13.13.11.1509',
    name varchar(255) null
);

insert into s11.rbCytologicalsignsofpathology (id, code, name)
values  (1, '1', 'Признаки соответствуют пролиферации (гиперлазии) железистого эпителия'),
        (2, '2', 'Признаки соответствуют гиперкератозу плоского эпителия'),
        (3, '3', 'Признаки соответствуют воспалительному процессу слизистой оболочки (вагинит, экзоцервицит, эндоцервицит)'),
        (4, '4', 'Признаки соответствуют бактериальному вагинозу'),
        (5, '5', 'Признаки соответствуют атрофическому кольпиту'),
        (6, '6', 'Признаки соответствуют нерезко выраженным изменениям клеток плоского эпителия'),
        (7, '7', 'Признаки соответствуют нерезко выраженным изменениям клеток плоского эпителия - легкой дисплазии'),
        (8, '8', 'Признаки соответствуют нерезко выраженным изменениям клеток плоского эпителия - характерным для папилломавирусной инфекции'),
        (9, '9', 'Признаки соответствуют выраженным изменениям клеток плоского эпителия'),
        (10, '10', 'Признаки соответствуют выраженным изменениям клеток плоского эпителия - умеренной дисплазии'),
        (11, '11', 'Признаки соответствуют выраженным изменениям клеток плоского эпителия - тяжелой дисплазии'),
        (12, '12', 'Признаки соответствуют раку');


-- auto-generated definition
create table rbTypeMRofdeath
(
    id                int          null,
    code              varchar(32)  null comment '1.2.643.5.1.13.13.99.2.22',
    name              varchar(128) null,
    `name 106/у-08`   varchar(255) null,
    `name 106-2/у-08` varchar(255) null,
    `code 106-2/у-08` varchar(255) null
);
insert into s11.rbTypeMRofdeath (id, code, name, `name 106/у-08`, `name 106-2/у-08`, `code 106-2/у-08`)
values  (1, '1', 'врач, только установивший смерть', 'врач, только установивший смерть', 'врач, только удостоверивший смерть', '1'),
        (2, '2', 'лечащий врач', 'лечащий врач', null, null),
        (3, '3', 'фельдшер (акушерка)', 'фельдшер (акушерка)', null, null),
        (4, '4', 'патологоанатом', 'патологоанатом', 'врач-паталогоанатом', '4'),
        (5, '5', 'судебно-медицинский эксперт', 'судебно-медицинский эксперт', 'судебно-медицинский эксперт', '5'),
        (6, '6', 'врач-акушер-гинеколог, принимавший роды', null, 'врач-акушер-гинеколог, принимавший роды', '2'),
        (7, '7', 'врач-неонатолог (педиатр), лечивший ребенка', null, 'врач-неонатолог (педиатр), лечивший ребенка', '3'),
        (8, '8', 'фельдшер', null, 'фельдшер', '7'),
        (9, '9', 'акушерка', null, 'акушерка', '6');
create table rbReasonsforlatediagnosis
(
    id   int          null,
    code varchar(32)  null comment '1.2.643.5.1.13.13.99.2.144',
    name varchar(255) null
);
insert into s11.rbReasonsforlatediagnosis (id, code, name)
values  (1, '1', 'скрытое течение болезни'),
        (2, '2', 'несвоевременное обращение'),
        (3, '3', 'отказ от обследования'),
        (4, '4', 'неполное обследование'),
        (5, '5', 'несовершенство диспансеризации'),
        (6, '6', 'ошибка клиническая'),
        (7, '7', 'ошибка рентгенологическая'),
        (8, '8', 'ошибка морфологическая'),
        (9, '9', 'ошибка других специалистов'),
        (10, '10', 'другие причины'),
        (11, '11', 'неизвестны');

insert into rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons, pageOrientation, sendMail)
values  ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01', 'УЗИ', 'uzi', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style=" font-family:''Times New Roman''; font-size:14px; font-weight:400; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100%>
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
{:setLeftMargin(10)}
{:setTopMargin(5)}
{:setBottomMargin(5)}
<tr><td width=100% align=center>
{currentOrganisation.shortName}<br>Отделение лучевой диагностики
<br>
<b>УЛЬТРАЗВУКОВОЕ ИССЛЕДОВАНИЕ</b>
</td></tr><br></table>
<u>{action.name}</u>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Фамилия, Имя, Отчество: {client.fullName}</b><br>
<b>Номер А/K(ID): {client.id} </b><br>
<b>Возраст: {client.age}</b><br>
<b>Дата исследования: {action[u"Дата оказания услуги"]}</b><br>
<b>Область исследования: {action[u"Исследование области"]} </b><br>
<b>Номер исследования: {if: action[u"№ исследования"]==0}{else:}{action[u"№ исследования"]}{end:}</b></td></tr>
</table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td width=100% align=left>
{if: action[u"Заключение"].value}{action[u''Протокол''] :n}<br>
<b>Заключение: </b>{action[u"Заключение"] :n}<br>
{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{else:}{action[u''Протокол''] :n}<br>{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{end:}<br>
{if: action[u"Комментарий заведующего"].value} <b>Комментарий заведующего: </b>{action[u"Комментарий заведующего"] :n}{else:}{end:}<br>
{if: action[u"Отказ"].value==u"Да"} <b>Отказ: </b>{action[u"Отказ"] :n}<b>/Причина отказа: </b>{action[u"Причина отказа"] :n}{else:}{end:}</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100% border="0">
<tr><td width=50% align=left>{if: action.endDate}Дата описания: {action.endDate.date.toString(u"dd MMMM yyyy г.")}{else:}Дата описания:____________{end:}</td><td width=50% align=left>Врач:____________/{action.person.shortName}</td></tr>
</table>
</body>

<!--НОВАЯ СТРАНИЦА-->
<p style="page-break-after: always"></p>

<body style=" font-family:''Times New Roman''; font-size:14px; font-weight:400; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100%>
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
{:setLeftMargin(10)}
{:setTopMargin(5)}
{:setBottomMargin(5)}
<tr><td width=100% align=center>
{currentOrganisation.shortName}<br>Отделение лучевой диагностики
<br>
<b>УЛЬТРАЗВУКОВОЕ ИССЛЕДОВАНИЕ</b>
</td></tr><br></table>
<u>{action.name}</u>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Фамилия, Имя, Отчество: {client.fullName}</b><br>
<b>Номер А/K(ID): {client.id} </b><br>
<b>Возраст: {client.age}</b><br>
<b>Дата исследования: {action[u"Дата оказания услуги"]}</b><br>
<b>Область исследования: {action[u"Исследование области"]} </b><br>
<b>Номер исследования: {if: action[u"№ исследования"]==0}{else:}{action[u"№ исследования"]}{end:}</b></td></tr>
</table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td width=100% align=left>
{if: action[u"Заключение"].value}{action[u''Протокол''] :n}<br>
<b>Заключение: </b>{action[u"Заключение"] :n}<br>
{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{else:}{action[u''Протокол''] :n}<br>{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{end:}<br>
{if: action[u"Комментарий заведующего"].value} <b>Комментарий заведующего: </b>{action[u"Комментарий заведующего"] :n}{else:}{end:}<br>
{if: action[u"Отказ"].value==u"Да"} <b>Отказ: </b>{action[u"Отказ"] :n}<b>/Причина отказа: </b>{action[u"Причина отказа"] :n}{else:}{end:}</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100% border="0">
<tr><td width=50% align=left>{if: action.endDate}Дата описания: {action.endDate.date.toString(u"dd MMMM yyyy г.")}{else:}Дата описания:____________{end:}</td><td width=50% align=left>Врач:____________/{action.person.shortName}</td></tr>
</table>
</body>
</html>', 0, 0, 2, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '02', 'УЗИ во внешнее ЛПУ', 'uzi', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style=" font-family:''Times New Roman''; font-size:14px; font-weight:400; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100%>
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
{:setLeftMargin(10)}
{:setTopMargin(5)}
{:setBottomMargin(5)}
<tr><td align=left><img src="blank/image/LOGO2.JPG"></td>
<td width=100% align=center>
{currentOrganisation.shortName}<br>Отделение лучевой диагностики<br>
{currentOrganisation.address}  телефон: 439-95-55<br><b>Ультразвуковое исследование</b>
</td></tr></table><br>
<u>{action.name}</u>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Фамилия, Имя, Отчество:   {client.fullName}</b><br>
<b>Номер А/K(ID): {client.id} </b><br>
<b>Возраст:     {client.age}</b><br>
<b>Дата исследования:    {action[u"Дата оказания услуги"]}</b><br>
<b>Область исследования:   {action[u"Исследование области"]} </b><br>
<b>Номер исследования:   {if: action[u"№ исследования"]==0}{else:}{action[u"№ исследования"]}{end:}</b>
</td></tr>
</table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td width=100% align=left>
{if: action[u"Заключение"].value} {action[u''Протокол''] :n}<br>
<b>Заключение: </b>{action[u"Заключение"] :n}<br>
{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:} {else:} {action[u''Протокол''] :n}<br>{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:} {end:}<br>
{if: action[u"Комментарий заведующего"].value} <b>Комментарий заведующего: </b>{action[u"Комментарий заведующего"] :n}{else:}{end:}<br>
{if: action[u"Отказ"].value==u"Да"} <b>Отказ: </b>{action[u"Отказ"] :n}/<b>Причина отказа: </b>{action[u"Причина отказа"] :n}{else:}{end:}</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100% border="0">
<tr><td width=50% align=left>{if: action.endDate}Дата описания: {action.endDate.date.toString(u"dd MMMM yyyy г.")}{else:}Дата описания:____________{end:}</td><td width=50% align=left>Врач:____________/ {action.person.shortName}</td></tr>
<br><br>
</table>
</body>

<!--НОВАЯ СТРАНИЦА-->
<p style="page-break-after: always"></p>
<body style=" font-family:''Times New Roman''; font-size:14px; font-weight:400; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100%>
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
{:setLeftMargin(10)}
{:setTopMargin(5)}
{:setBottomMargin(5)}
<tr><td align=left><img src="blank/image/LOGO2.JPG"></td>
<td width=100% align=center>
{currentOrganisation.shortName}<br>Отделение лучевой диагностики<br>
{currentOrganisation.address}  телефон: 439-95-55<br> <b>Ультразвуковое исследование</b>
</td></tr></table><br>
<u>{action.name}</u>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Фамилия, Имя, Отчество:   {client.fullName}</b><br>
<b>Номер А/K(ID): {client.id} </b><br>
<b>Возраст:     {client.age}</b><br>
<b>Дата исследования:    {action[u"Дата оказания услуги"]}</b><br>
<b>Область исследования:   {action[u"Исследование области"]} </b><br>
<b>Номер исследования:   {if: action[u"№ исследования"]==0}{else:}{action[u"№ исследования"]}{end:}</b>
</td></tr>
</table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td width=100% align=left>
{if: action[u"Заключение"].value} {action[u''Протокол''] :n}<br>
<b>Заключение: </b>{action[u"Заключение"] :n}<br>
{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:} {else:} {action[u''Протокол''] :n}<br>{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:} {end:}<br>
{if: action[u"Комментарий заведующего"].value} <b>Комментарий заведующего: </b>{action[u"Комментарий заведующего"] :n}{else:}{end:}<br>
{if: action[u"Отказ"].value==u"Да"} <b>Отказ: </b>{action[u"Отказ"] :n}/<b>Причина отказа: </b>{action[u"Причина отказа"] :n}{else:}{end:}</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100% border="0">
<tr><td width=50% align=left>{if: action.endDate}Дата описания: {action.endDate.date.toString(u"dd MMMM yyyy г.")}{else:}Дата описания:____________{end:}</td><td width=50% align=left>Врач:____________/ {action.person.shortName}</td></tr>
<br><br>
</table>
</body>

</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '03', 'УЗИ для стационара', 'uzi', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style=" font-family:''Times New Roman''; font-size:14px; font-weight:400; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100% style="font-size:inherit;">
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
{:setMargins(10)}
<tr><td width=100% align=center>
{currentOrganisation.shortName}<br>Отделение лучевой диагностики
<br>
<b>УЛЬТРАЗВУКОВОЕ ИССЛЕДОВАНИЕ</b>
</td></tr>
</table>
<u>{action.name}</u>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Фамилия, Имя, Отчество:   {client.fullName}</b><br>
<b>Номер А/K(ID): {client.id} </b><br>
<b>Возраст: {client.age}</b><br>
<b>Дата исследования: {action[u"Дата оказания услуги"]}</b><br>
<b>Область исследования: {action[u"Исследование области"]} </b><br>
<b>Номер исследования: {if: action[u"№ исследования"]==0}{else:}{action[u"№ исследования"]}{end:}</b></td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%  style="font-size:inherit;">
<tr><tr><td width=100% align=left>
{if: action[u"Заключение"].value} {action[u''Протокол''] :n}<br>
<b>Заключение: </b>{action[u"Заключение"] :n}<br>
{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{else:}{action[u''Протокол''] :n}<br>{if: action[u"Рекомендации"].value} <b>Рекомендации: </b>{action[u"Рекомендации"] :n}{else:}{end:}{end:}<br>
{if: action[u"Комментарий заведующего"].value} <b>Комментарий заведующего: </b>{action[u"Комментарий заведующего"] :n}{else:}{end:}<br>
{if: action[u"Отказ"].value==u"Да"} <b>Отказ: </b>{action[u"Отказ"] :n}/<b>Причина отказа: </b>{action[u"Причина отказа"] :n}{else:}{end:}</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%  style="font-size:inherit;">
<tr><td width=50% align=left>{if: action.endDate}Дата описания: {action.endDate.date.toString(u"dd MMMM yyyy г.")}{else:}Дата описания:____________{end:}</td><td width=50% align=left>Врач:____________/ {action.person.shortName}</td></tr>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01', 'Протокол установления смерти человека', 'const_death', '', '<html>
<head>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{: setLeftMargin(20)}
{: setTopMargin(5)}
{: setBottomMargin(5)}
{: setRightMargin(15)}
{: from library.Utils import forceRef }
{: from Orgs.PersonInfo import CPersonInfo }
</head>
<body STYLE="font-family: Times New Roman; font-size: 11pt; color: black">
	<!--<p>{action.code}</p>-->
{for: action in event.actions}
{if: action.code == u''Death'' or action.code == u''Death_bad'' or action.code == u''Death_old''}
{: actionCreatePerson = action.context.getInstance(CPersonInfo, forceRef(action._record.value(''createPerson_id''))) }
<table border="0" cellspacing="0" width="100%">
<tr><td align="center"; STYLE="font-size: 11pt" width="75%"><br>Федеральное государственное бюджетное учреждение<br>
"Национальный медицинский исследовательский центр онкологии имени Н.Н. Петрова"<br>
Министерства здравоохранения Российской Федерации
<br>197758, Санкт-Петербург, пос. Песочный, ул. Ленинградская, д.68<br>+7 (812)439-95-55; oncl@rion.spb.ru;<br>ОКПО 01897995, ОГРН 1027812406687, ИНН 7821006887; КПП 784301001</td>
<td  align="center"; STYLE="font-size: 11pt" width="25%"><br>Форма № 950, <br>утвержденная <br>постановлением <br>Правительства Российской <br>Федерации от 20 сентября <br>2012 г.</td></tr>
</table>
<br>
<br>
<table border="0" cellspacing="0" width="100%">
<tr><td align="center"><b>Протокол установления смерти человека</b></td></tr>
</table>
<br>
<table border="0" cellspacing="0" width="100%">
<tr><td align="left" width="3%">Я,&nbsp;</td><td>{actionCreatePerson.longName},</td></tr>
<tr style="height: 1px"><td align="left" width="3%"></td><td style="height: 1px"><font style="text-decoration: overline; font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Ф.И.О. врача-реаниматолога)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td></tr>
</table>
<table border="0" cellspacing="0" width="100%">
<tr>
<td align="left">{actionCreatePerson.post}, {actionCreatePerson.organisation},</td>
</tr>
<tr style="height: 1px">
<td style="height: 1px"><font style="text-decoration: overline; font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(должность, место работы)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
</tr>
</table>
<table border="0" cellspacing="0" width="100%">
<tr>
<td align="left" width="20%">констатирую смерть</td>
<td  width="80%">&nbsp;{client.fullName},</td>
</tr>
<tr style="height: 1px">
<td width="20%"></td>
<td width="80%" style="height: 1px"><font style="text-decoration: overline; font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
(Ф.И.О.пациента)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
</tr>
</table>
<table border="0" cellspacing="0" width="100%">
<tr>
<td align="left" width="15%">дата рождения&nbsp;</td>
<td width="85%">{if: client.birthDate} {client.birthDate} {else:} не установлен {end:}</td>
</tr>
<tr style="height: 1px">
<td width="15%"></td>
<td style="height: 1px" width="85%"><font style="text-decoration: overline; font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(число, месяц, год или не установлено)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
</tr>
</table>
<br>пол <u>{client.sex}</u>
<table border="0" cellspacing="0" width="100%">
<tr>
<td align="center">{client.document.serial} {client.document.number} {client.document.date} {client.document.origin}</td>
</tr>
<tr style="height: 1px">
<td style="height: 1px"><font style="text-decoration: overline; font-size: 6pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(номер и серия паспорта, когда и кем выдан, или номер и серия свидетельства о рождении)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
</tr>
</table>
<br>ИБ № <u>{event.externalId}</u>
<br>
<br>
{for: prop in action} {if: prop.name == u"Реанимационные мероприятия прекращены по причине"}{if: prop.value != ''''}<b>Реанимационные мероприятия прекращены по причине:</b><br>
{prop.value :n}{end:}{end:}{end:}<br>
{for: prop in action} {if: prop.name == u"Реанимационные мероприятия не проводились по причине"}{if: prop.value != ''''}<b>Реанимационные мероприятия не проводились по причине:</b><br>
{prop.value :n}{end:}{end:}{end:}<br>
<table border="0" cellspacing="0" width="100%">
<tr><td width="40%"></td><td width="10%">Дата</td><td width="20%"><b><u>{action.endDate.date.toString(''dd.MM.yyyy'')}</u></b></td></tr>
<tr><td width="40%"></td><td width="10%"></td><td width="20%"; STYLE= "font-size: 6pt">(день, месяц, год)</td></tr>
<tr><td width="40%"></td><td width="10%">Время</td><td><b><u>{action.endDate.time.toString(''hh:mm'')}</u></b></td></tr>
</table>
<br>
<br>
<table border="0" cellspacing="0" width="95%">
<tr>
<td align="left">Подпись ______________________</td><td align="right">/<u>{action.person.shortName}</u>/</td>
</tr>
<tr><td></td><td align="right"; STYLE="font-size: 6pt">(Ф.И.О. врача)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr></table>
{end:}{end:}
</body>
</html>
', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01', 'НАПРАВЛЕНИЕ НА ЦИТОЛОГИЧЕСКОЕ ИССЛЕДОВАНИЕ', 'citolog', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
</head>
<body style="font-family:''Arial''; font-size:11px; font-weight:300; font-style:normal;">
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=right><font face="Code 3 de 9" style="font-size:25pt;">*{action.id}*</font></td></tr>
<tr><td align=right>*{action.id}*</td></tr>
<table cellpadding=0 cellspacing=0 width=100%>
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
<tr>
<td align="center"><b>{currentOrganisation.shortName}</b></td></tr>
<br>
<tr><td align="center">НАПРАВЛЕНИЕ НА ЦИТОЛОГИЧЕСКОЕ ИССЛЕДОВАНИЕ</td></tr>
<tr><td>
<br>
{if: action[u"Номер предыдущего обследования (если было)"].value}
ОБСЛЕДОВАНИЕ ПОВТОРНО, номер предыдущего обследования <b>{action[u"Номер предыдущего обследования (если было)"]}</b><br>{else:}
ОБСЛЕДОВАНИЕ ПЕРВИЧНО<br>{end:}
<br>
Результат необходимо вернуть в:<b><big> {action[u"Отделение, на которое необходимо вернуть результат"]}</b></big>
<br>
Отделение <b>{event.execPerson.orgStructure.code}  {event.execPerson.orgStructure.name}</b><br><br>
Лечащий врач <b>_______________________________</b> или <b>пациент обратился самостоятельно</b><br>
<hr>
Фамилия, имя, отчество <b><big> {client.fullName}</big></b><br>
<b>№ амб. карты <big>{client.id}</big></b><br>
Дата рождения (возраст) <b>{client.birthDate} ({client.age})</b><br>
Пол пациента <b>{u"М" if client.sexCode == 1 else u"Ж"}</b><br>
{if:event.eventType.id==89 or event.eventType.id==84}<b><big>№ И/Б { event.externalId }</big></b>{else:}{end:}
<hr>
Дата и время забора биоматериала: <b>{action[u"Дата забора биоматериала"]} {action[u"Время забора биоматериала"]}</b><br>
Материал сдал: <big><u>{action[u"Материал сдал"]}</u></big><br>
Клинический диагноз {if: action[u"Клинический диагноз"]} <b>{action[u"Клинический диагноз"]}</b>{end:}<br>  {action._record.value(''MKB'').toString()}
<!--Заключительный диагноз --><big><b>{action.MKB.descr}</b><br></big>
</td></tr>
</table>
Клинические симптомы важнейшие (наличие или отсутствие выделений, мокроты и пр) <b>{action[u"Клинические симптомы важнейшие"]}</b>
<br>
Лечебные пособия <b>{action[u"Лечебные пособия"]}</b>; доза <b>{action[u"Доза"]}</b>; эффект <b>{action[u"Эффект"]}</b><br>
Откуда взят материал для исследования, номера стекол <b>{action[u"Откуда взят материал для исследования, номера стекол"]}</b><br>
Способ получения материала <b>{if: action[u"Способ получения материала"] and action[u"Способ получения материала"].value} {action[u"Способ получения материала"].value}{else:} {end:}</b><br>
{for: i,prop in enumerate([x for x in action if x.value])}{if: prop.name == u"Последние месячные"}
Последние месячные <b>{prop.value}</b><br>{end:}{if: prop.name == u"Продолжительность постменопаузного периода"}<br>
Продолжительность постменопаузного периода  <b>{prop.value}</b>{end:}{end:}
Дополнительные сведения: <b>{action[u"Дополнительные сведения"]}</b><br>
Время оформления направления: <b>{action.begDate.datetime.toString(u"hh ч. mm мин.")}</b><br>
Подпись врача:_______________________________<b>{action.setPerson}  ({action.begDate.date.toString(u"dd.MM.yyyy г.")})</b><br>
<hr>
<b>Я, ______________________________________________________________, (заполняетcя самостоятельно)<br>
{if: client.sexCode == 1}Cогласен{else:}Cогласна{end:} на консультацию моих исследований, мне разъяснен порядок консультации и ясна цель данной услуги.<br>
{if: client.sexCode == 1}Cогласен{else:}Cогласна{end:} на дополнительные виды исследований, мне разъяснён порядок доплаты за данный вид услуги.</b><br>
<hr>
<i>Актуальный телефон </i>_____________________________<br><br>
_______________________<small>(подпись пациента)</small>________________________________<small>(расшифровка)</small></b>
</td></tr>
</table>
</body>
</html>', 0, 0, 0, 2, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '1', 'ПРОТОКОЛ ОПЕРАЦИИ', 'oper_protocol', '', '<html>
<head>
<title> {client.shortName}, №и/б { event.externalId }</title>
{: QDate = type(client.birthDate.date)}
</head>
<body style="font-family: ''Times New Roman''; font-weight: normal; font-size: 12pt;">
<table width="100%">
<tr> <td align="center">
<h2>{currentOrganisation.shortName}</h2>
<br />
</td></tr>
<tr><td align="left">
<b>Ф.И.О. больного</b>: {client.fullName}, <b>дата рождения(возраст)</b>: {client.birthDate} ({client.age})<br />
<b>Карта стационарного больного №</b>: { event.externalId }<br />
<b>Место жительства</b>: {if: client.regAddress.freeInput} {client.regAddress.freeInput} {else:}{client.regAddress}{end:}</td></tr>
<tr><td align="left">
<b>Дата операции</b> {action.endDate.date.toString("dd.MM.yyyy")}<br >
<b>Хирург</b> {action[u''Операционная бриагада (осн.)'']}<br >
<b>Диагноз до операции:</b> {action[u"Диагноз до операции"]}<br />
{if: action[u"Операционная бриагада (доп.)"].value and action[u"Операции в ГРР"].value.code!=u"9032"}<b>Операционная бриагада (доп.):</b> {action[u''Операционная бриагада (доп.)'']:n}<br>{end:}
<b>Анестезиолог:</b> {action[u"Анестезиолог"]} <br />
{if: action[u"Операционная сестра"].value}<b>Операционная сестра:</b> {action[u''Операционная сестра'']:n}<br>{end:}
<b>Диагноз после операции:</b> {action[u"Диагноз после операции"]}<br />
<b>Время начала операции:</b> {action[u"Время начала операции"]}<br />
<b>Время окончания операции:</b> {action[u"Время окончания операции"]}<br />
<b>Кровопотеря:</b> {action[u"Кровопотеря"]}<br />
<b>Наименование операции:</b> {action[u"Наименование операции"]}<br />
<b>Препарат:</b> {action[u"Препарат"]}<br />
{if: action[u"Анестезия/Наркоз"].value}<b>Наркоз:</b> {action[u''Анестезия/Наркоз'']:n}<br>{end:}
<b>Осложнения во время операции:</b> {action[u"Осложнения во время операции"]}
<hr>
<b><h3>ПРОТОКОЛ ОПЕРАЦИИ:</h3></b> {action[u"Протокол операции"]}<br />
<b>Исход операции:</b> {action[u"Исход операции"]}
<hr>
<b>Цель:</b> {action[u"Цель"]}<br />
<b>Хирургическое лечение (для ЗНО):</b>{action[u"Хирургическое лечение (для ЗНО)"]} <br />
<b>Операции в ГРР:</b>{action[u"Операции в ГРР"].value.code} {action[u"Операции в ГРР"].value.name} <br />
</td></tr>
<tr><td>{if: action[u"Операции в ГРР"].value.code!=u"9032"}
<B>Подпись хирурга:____________________/</B><u>{action[u''Операционная бриагада (осн.)'']}</u><b>/</b>
{else:}<B>Подпись врача:____________________/</B><u>{action[u''Операционная бриагада (осн.)'']}</u><b>/</b>
{if:action[u"Операционная бриагада (доп.)"].value}<br><B>Подпись врача:____________________/</B><u>{action[u"Операционная бриагада (доп.)"].value}</u><b>/</b>{end:}
{end:}
</td></tr>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '03', 'РЕЗУЛЬТАТ ЦИТОЛОГИЧЕСКОГО ИССЛЕДОВАНИЯ', 'citolog', '', '<<html>
<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style="font-family:''MS Shell Dlg 2''; font-size:12px; font-weight:300; font-style:normal;">
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
<table width=100%>
<tr><td align=left><img src="blank/image/LOGO.JPG"></td>
<td width=90% align=center><b>{currentOrganisation.fullName} </b>
<br>
</td></tr></table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=center><br><b>Цитологическая лаборатория<br><b>РЕЗУЛЬТАТ<b> ЦИТОЛОГИЧЕСКОГО ИССЛЕДОВАНИЯ</td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Регистрационный номер: </b><big>{action[u"№ исследования"]}</big><br>
{if: action[u"Номер предыдущего обследования (если было)"].value} ОБСЛЕДОВАНИЕ ПОВТОРНО, номер предыдущего обследования <b>{action[u"Номер предыдущего обследования (если было)"]}</b><br>
{else:}ОБСЛЕДОВАНИЕ ПЕРВИЧНО<br>
{end:}
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Фамилия, имя, отчество <b><big> {client.fullName}, {client.id} </big></b><br>
Дата рождения (возраст) <b>{client.birthDate} ({client.age}). </b>Пол <b>{u"М" if client.sexCode == 1 else u"Ж"}</b><br>
Адрес места жительства <b>{if: client.locAddress} {client.locAddress} {else:}{client.locAddress.freeInput}{end:}</b>
<hr>
<b>Отделение: </b>{action[u"Отделение, на которое необходимо вернуть результат"]}<br>
<b>Направивший врач </b>{action.setPerson} <br>
<b>Дата направления: </b>{action.begDate.date.toString(u"dd.MM.yyyy г.")}<br>
<b>Хар.материала: </b>{action[u"Способ получения материала"]}<br>
<b>Клинический диагноз {if: action[u"Клинический диагноз"]} </b>{action[u"Клинический диагноз"]}{end:}<br>{action._record.value(''MKB'').toString()}
<!--Заключительный диагноз -->{action.MKB.descr}</td></tr></table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b>Лечебные пособия </b>{action[u"Лечебные пособия"]}; <b>доза </b>{action[u"Доза"]}; <b>эффект </b>{action[u"Эффект"]}<br>
<b>Мероприятие </b>{action[u"Мероприятие"]}<br>
{for: i,prop in enumerate([x for x in action if x.value])}{if: prop.name == u"Последние месячные"}Последние месячные {prop.value}<br>{end:}{if: prop.name == u"Продолжительность постменопаузного периода"}<br>Продолжительность постменопаузного периода  {prop.value}{end:}{end:}
<b>Откуда взят материал для исследования, номера стекол </b>{action[u"Откуда взят материал для исследования, номера стекол"]}<br>
<b>Дата и время забора биоматериала: </b>{action[u"Дата забора биоматериала"]} {action[u"Время забора биоматериала"]}<br>
<b>Дополнительные сведения: </b>{action[u"Дополнительные сведения"]}<br>
{if: action[u"Статус заключения"] ==  u"подписано"}
<hr>
<b>Количество стекол: </b>{action[u"Количество стекол"]}<br>
<b>ЦИТОЛОГИЧЕСКИЙ ДИАГНОЗ: </b><br>{action[u"Результаты цитологического исследования"]}<br>
<b>ПЕРЕЧЕНЬ ОКРАСОК: </b>{action[u"Назначенные окраски (если назначены)"]}<br>
<b>РЕЗУЛЬТАТЫ ИЦХ: </b>{action[u"Результаты ИЦХ (если назначено)"]}{else:} {end:}
<hr>
ИССЛЕДОВАНИЯ ВЫПОЛНЯЛИ:<br><br>
<b>Врач:_______________________________</b>{action.person.shortName}<br></td></tr>
</table>
<b>Дата исследования: </b>{action.endDate.date.toString(u"dd.MM.yyyy г.")}<br>

</body>
</html>

', 0, 0, 0, 2, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '03', 'ТЕСТ+АНАЛИЗЫ', 'gist', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style="font-family:''MS Shell Dlg 2''; font-size:11px; font-weight:300; font-style:normal;">
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=right><font face="Code 3 de 9" style="font-size:25pt;">*{action.id}*</font></td></tr>
<tr><td align=right>*{action.id}*</td></tr>
<tr><td align=center><br><b> Патолого-анатомическое отделение<br>
<b> {currentOrganisation.shortName}</b><br>
<b> НАПРАВЛЕНИЕ НА ГИСТОЛОГИЧЕСКОЕ ИССЛЕДОВАНИЕ (Клинические данные) <b></td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
{if: action[u"Номер предыдущего обследования (если было)"].value}ОБСЛЕДОВАНИЕ ПОВТОРНО, номер предыдущего обследования <b>{action[u"Номер предыдущего обследования (если было)"]}</b><br>{else:}ОБСЛЕДОВАНИЕ ПЕРВИЧНО{end:}
<br>
{if:event.eventType.id==89 or event.eventType.id==84}
{for: act in event.actions}
{if:act.name==u''Осмотр врача приемного отделения''}
<b>
RW{if: act[u"RW"].value}: {act[u"RW"] :n}{end:}<br>
Ф-50{if: act[u"Ф-50"].value}: {act[u"Ф-50"] :n}{end:}<br>
HbsAg{if: act[u"HbsAg"].value}: {act[u"HbsAg"] :n}{end:}</b>
{else:}{end:}{end:}{end:}
<hr>
Результат необходимо вернуть в: <b><big>{action[u"Отделение, на которое необходимо вернуть результат"]}</b></big><br></td></tr></table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Отделение: <b>{event.execPerson.orgStructure.code}  {event.execPerson.orgStructure.name}</b><br>
Лечащий врач: <b>_______________________________</b><br>
Фамилия, имя, отчество: <b><big> {client.fullName}, {client.id}</big></b><br>
Дата рождения (возраст) <b>{client.birthDate} ({client.age})</b>, Пол:<b>{u"М" if client.sexCode == 1 else u"Ж"}</b>
</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Дата и время забора биоматериала: <b>{action[u"Дата забора биоматериала"]} {action[u"Время забора биоматериала"]}</b><br>
Материал сдал: <big><u>{action[u"Материал сдал"]}</u></big><br>
Данные цитологического исследования: <b>{action[u"Данные цитологического исследования"]}</b><br>
Клинический диагноз {if: action[u"Клинический диагноз"]} <b><big> {action[u"Клинический диагноз"]} </big></b>{end:} <br> {action._record.value(''MKB'').toString()}<!--Заключительный диагноз --><big><i><b>{action.MKB.descr}</b></i></big>
Клинические симптомы важнейшие <b>{action[u"Клинические симптомы важнейшие"]}</b><br>
Когда замечена опухоль: <b>{action[u"Когда замечена опухоль"]}</b><br>
Темп роста: <b>{action[u"Темп роста"]}</b><br>
Размеры опухоли: <b><big>  {action[u"Размеры опухоли"]}</big> </b><br>
Отношение к окружающим тканям: <b>{action[u"Отношение к окружающим тканям"]}</b><br>
Лечебные пособия: <b>{action[u"Лечебные пособия"]}</b></i>; доза  <b><i> {action[u"Доза"]}</b></i>; эффект <b><i> {action[u"Эффект"]}</b></i><br>
Мероприятие: <b>{action[u"Мероприятие"]}</b><br>
Откуда взят материал для исследования: <b>{action[u"Откуда взят материал для исследования"]}</b>; Кусочков - <b>{action[u"Сколько кусочков"]}</b><br>
Дополнительные сведения. Особые пожелания клинического отделения: <b>{action[u"Дополнительные сведения. Особые пожелания клинического отделения"]}</b><br>
<u>Время создания направления материала: <b>{action.begDate.datetime.toString(u"hh ч. mm мин.")}</b></u><br>
Подпись врача:_______________________________<b>{action.setPerson} ({action.begDate.date.toString(u"dd.MM.yyyy г.")})</b></td></tr>
<hr>
<b>СОГЛАСИЕ НА ДОПОЛНИТЕЛЬНЫЕ УСЛУГИ ГИСТОЛОГИЧЕСКОЙ ЛАБОРАТОРИИ: </b><br>
УП01.02.003 Гистология: Изготовление срезов с готовых парафиновых блоков (1 блок) 500,00 / <b>количество устанавливает в процессе работы над материалом</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
УП01.02.004 Гистология: Исправление готовых стекол (перезаключение) 300,00 / <b>количество устанавливает в процессе работы над материалом</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
УП01.02.007 Гистология: Иммуногистохимическое исследование материала (1 антитело) 3 000,00 / <b>количество устанавливает в процессе работы над материалом (оплачивается максимально 10)</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b>
<hr>
<i>Актуальный телефон </i>_____________________________<br><br>
_______________________<small>(подпись пациента)</small>________________________________<small>(расшифровка)</small></b>
</table>
</body>
</html>', 0, 0, 0, 2, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01', 'АМБ_НАПРАВЛЕНИЕ НА ГИСТОЛОГИЧЕСКОЕ ИССЛЕДОВАНИЕ', 'gist', '', '<html>
<head>
<!--Главный скрипт-->
{:Diabet = client.analyzes.Diabet}
{:F50 = client.analyzes.F50}
{:HbsAg = client.analyzes.HbsAg}
{:RW = client.analyzes.RW}
{:Tuberkulez = client.analyzes.Tuberkulez}
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style="font-family:''Arial''; font-size:9px; font-weight:300; font-style:normal;">
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=right><font face="Code 3 de 9" style="font-size:25pt;">*{action.id}*</font></td></tr>
<tr><td align=right>*{action.id}*</td></tr>
<tr><td align=center><br><b> Патолого-анатомическое отделение<br>
<b>{currentOrganisation.shortName}</b><br>
<b>Направление на прижизненное патолого-анатомическое исследование<b>
</td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
{if: action[u"Номер предыдущего обследования (если было)"].value}ОБСЛЕДОВАНИЕ ПОВТОРНО, номер предыдущего обследования <b><i> {action[u"Номер предыдущего обследования (если было)"]}</i></b><br>{else:}ОБСЛЕДОВАНИЕ ПЕРВИЧНО<br>{end:}
№ Амб. карты: <b><big>{client.id}</big></b>
<br>
{if:event.eventType.id==89 or event.eventType.id==84}
{for: act in event.actions}
{if:act.name==u''Осмотр врача приемного отделения''}
<b>
RW{if: act[u"RW"].value}: {act[u"RW"] :n}{end:}<br>
Ф-50{if: act[u"Ф-50"].value}: {act[u"Ф-50"] :n}{end:}<br>
HbsAg{if: act[u"HbsAg"].value}: {act[u"HbsAg"] :n}{end:}</b>
{end:}{end:}
{else:}
<b>RW{if: RW  == 1 } Отр {else:} Пол {end:}<br>
Ф-50{if: F50  == 1 } Отр {else:} Пол {end:}<br>
HbsAg{if: HbsAg  == 1 } Отр {else:} Пол {end:}</b>
{end:}
<hr>
Результат необходимо вернуть в: <b><big>{action[u"Отделение, на которое необходимо вернуть результат"]}</b></big></td></tr></table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Отделение: <b>{event.execPerson.orgStructure.code} {event.execPerson.orgStructure.name}</b><br>
Лечащий врач: <b>_______________________________</b><br>
<b>Фамилия, имя, отчество: <big>{client.fullName}, <br>
Дата рождения (возраст): <b>{client.birthDate} ({client.age})</b>, Пол:<b>{u"М" if client.sexCode == 1 else u"Ж"}</b>
</td></tr></table>
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Дата и время забора биоматериала: <b>{action[u"Дата забора биоматериала"]} {action[u"Время забора биоматериала"]}</b><br>
Материал сдал: <big><u>{action[u"Материал сдал"]}</u></big><br>
Данные цитологического исследования: <b>{action[u"Данные цитологического исследования"]}</b><br>
Клинический диагноз {if: action[u"Клинический диагноз"]} <b><big> {action[u"Клинический диагноз"]} </big></b>{end:} <br> {action._record.value(''MKB'').toString()}<!--Заключительный диагноз --><big><b>{action.MKB.descr}</b></big>
Клинические симптомы важнейшие <b>{action[u"Клинические симптомы важнейшие"]}</b><br>
Когда замечена опухоль: <b>{action[u"Когда замечена опухоль"]}</b><br>
Темп роста: <b>{action[u"Темп роста"]}</b><br>
Размеры опухоли: <b><big>  {action[u"Размеры опухоли"]}</big> </b><br>
Отношение к окружающим тканям: <b>{action[u"Отношение к окружающим тканям"]}</b><br>
Лечебные пособия: <b>{action[u"Лечебные пособия"]}</b>; доза  <b>{action[u"Доза"]}</b>; эффект <b>{action[u"Эффект"]}</b><br>
Мероприятие: <b>{action[u"Мероприятие"]}</b><br>
Место взятия материала для исследования: <b>{action[u"Откуда взят материал для исследования"]}</b>; Кусочков - <b>{action[u"Сколько кусочков"]}</b><br>
Дополнительные сведения. Особые пожелания клинического отделения: <b>{action[u"Дополнительные сведения. Особые пожелания клинического отделения"]}</b><br>
<u>Время оформления направления: <b>{action.begDate.datetime.toString(u"hh ч. mm мин.")}</b></u><br>
Подпись врача:_______________________________<b>{action.setPerson} ({action.begDate.date.toString(u"dd.MM.yyyy г.")})</b></td></tr>
<hr>
<i>Заключение гистологической лаборатории отделения может соответствовать заключению внешней лаборатории, если оно изначально верно оформлено в терминах действующей классификации опухолей Всемирной организации здравоохранения.</i>
<hr>
<b>Я, ______________________________________________________________, (заполняетcя самостоятельно)</b><br>
{if: client.sexCode == 1}согласен{else:}согласна{end:} на консультацию моих исследований, мне разъяснён порядок консультации и ясна цель данной услуги.</b>
<hr>
<b>СОГЛАСИЕ НА ДОПОЛНИТЕЛЬНЫЕ УСЛУГИ ГИСТОЛОГИЧЕСКОЙ ЛАБОРАТОРИИ: </b><br>
УП01.02.003 Гистология: Изготовление срезов с готовых парафиновых блоков (1 блок) 500,00 / <b>количество устанавливает в процессе работы над материалом</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
УП01.02.004 Гистология: Исправление готовых стекол (перезаключение) 300,00 / <b>количество устанавливает в процессе работы над материалом</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
УП01.02.007 Гистология: Иммуногистохимическое исследование материала (1 антитело) 3 000,00 / <b>количество устанавливает в процессе работы над материалом (оплачивается максимально 10)</b><br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
<b>MMR</b> 12 000, 00<br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b><br>
<b>PD-L1 (CPS) </b> 24 000,00<br>
<b><i>{if: client.sexCode == 1}Согласен // Не согласен (нужное подчеркнуть){else:}Согласна // Не согласна (нужное подчеркнуть){end:} </i></b>
<hr>
<i>Актуальный телефон </i>_____________________________<br>
_______________________<small>(подпись пациента)</small>________________________________<small>(расшифровка)</small></b>
</table>
<br>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
<b><i>Рекомендации по выполнению исследования:</b><br>
Морфологический тип опухоли и ее характеристики являются определяющими при планировании лечения. <br>
Для исключения диагностической ошибки на этапе морфологической диагностики, уточнения характеристик опухоли (возможных в объеме предоставленного материала) или подтверждения диагноза рекомендуется пересмотр в условиях НМИЦ, т.к. патологоанатомическое отделение центра обладает большим опытом в плане диагностики опухолевой патологии и является референс-центром Минздрава РФ. <br>
Пересмотр необходим:<br>
- во всех случаях несоответствия гистологического заключения и клинической картины, половозрастных характеристик пациента или данных лучевых методов исследования,<br>
- при редких опухолях (неспециализированные учреждения не могут иметь большого опыта работы с редкими опухолями, что повышает риск получения неполного или некорректного гистологического заключения),<br>
- при отсутствии в гистологическом заключении характеристик опухоли, необходимых клиницисту для планирования лечения,<br>
- объективных сомнениях в качестве гистологического заключения (использование неактуальной или неприемлемой терминологии, грейдинга, наличие противоречия между описанными параметрами и т.п.). <br>
Выполнение дополнительных исследований (прогностических и предиктивных) методом ИГХ или FISH невозможно без предварительного пересмотра гистологического материала, который необходим для того чтобы убедиться в пригодности материала для тестирования, его достаточности (количества клеток) и наличии соответствующего типа опухоли (субстрата) в нем.</i>
</table>
</body>
</html>', 0, 0, 2, 2, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01_1', 'НАПРАВЛЕНИЕ НА ГИСТОЛОГИЧЕСКОЕ ИССЛЕДОВАНИЕ', 'gist', '', '<html>
<head>
<!--Главный скрипт-->
{:Diabet = client.analyzes.Diabet}
{:F50 = client.analyzes.F50}
{:HbsAg = client.analyzes.HbsAg}
{:RW = client.analyzes.RW}
{:Tuberkulez = client.analyzes.Tuberkulez}
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style="font-family:''Arial''; font-size:9px; font-weight:300; font-style:normal;">
{: setPageSize(''A4'')}
{: setOrientation(''P'')}
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=right><font face="Code 3 de 9" style="font-size:25pt;">*{action.id}*</font></td></tr>
<tr><td align=right>*{action.id}*</td></tr>
<tr><td align=center><br>
<tr><td align=center><br><b>Патолого-анатомическое отделение<br>
<b>{currentOrganisation.shortName}</b><br>
<b>Направление на прижизненное патолого-анатомическое исследование<b>
</td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
{if: action[u"Номер предыдущего обследования (если было)"].value}ОБСЛЕДОВАНИЕ ПОВТОРНО, номер предыдущего обследования <b><i> {action[u"Номер предыдущего обследования (если было)"]}</i></b><br>{else:}ОБСЛЕДОВАНИЕ ПЕРВИЧНО<br>{end:}
№ И/Б: <b><big>{ event.externalId }</big></b>
<br>
{if:event.eventType.id==89 or event.eventType.id==84}
{for: act in event.actions}
{if:act.name==u''Осмотр врача приемного отделения''}
<b>
RW{if: act[u"RW"].value}: {act[u"RW"] :n}{end:}<br>
Ф-50{if: act[u"Ф-50"].value}: {act[u"Ф-50"] :n}{end:}<br>
HbsAg{if: act[u"HbsAg"].value}: {act[u"HbsAg"] :n}{end:}</b>
{end:}{end:}
{else:}
<b>RW{if: RW  == 1 } Отр {else:} Пол {end:}<br>
Ф-50{if: F50  == 1 } Отр {else:} Пол {end:}<br>
HbsAg{if: HbsAg  == 1 } Отр {else:} Пол {end:}</b>
{end:}
<hr>
Результат необходимо вернуть в: <b><big>{action[u"Отделение, на которое необходимо вернуть результат"]}</b></big></td></tr></table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Отделение: <b>{event.execPerson.orgStructure.code}  {event.execPerson.orgStructure.name}</b><br>
Лечащий врач: <b>_______________________________</b><br>
<b>Фамилия, имя, отчество: <big>{client.fullName}</big></b><br>
Дата рождения (возраст) <b>{client.birthDate} ({client.age})</b>, Пол:<b>{u"М" if client.sexCode == 1 else u"Ж"}</b><br>
№ Амб. карты: <b><big>{client.id}</big></b><br>
</td></tr></table>
{if:event.eventType.id==89 or event.eventType.id==84}
{for: act in event.actions}
{if:act.name==u''Поступление''}
{if: act[u"Вид ОМС"].value}<b>{act[u"Вид ОМС"] :n}</b><br>{end:}
{end:}{end:}{end:}
<hr>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
Дата и время забора биоматериала: <b>{action[u"Дата забора биоматериала"]} {action[u"Время забора биоматериала"]}</b><br>
Материал сдал: <big><u>{action[u"Материал сдал"]}</u></big><br>
Данные цитологического исследования: <b>{action[u"Данные цитологического исследования"]}</b><br>
Клинический диагноз {if: action[u"Клинический диагноз"]} <b><big> {action[u"Клинический диагноз"]} </big></b>{end:} <br> {action._record.value(''MKB'').toString()}<!--Заключительный диагноз --><big><b>{action.MKB.descr}</b></big>
Клинические симптомы важнейшие <b>{action[u"Клинические симптомы важнейшие"]}</b><br>
Когда замечена опухоль: <b>{action[u"Когда замечена опухоль"]}</b><br>
Темп роста: <b>{action[u"Темп роста"]}</b><br>
Размеры опухоли: <b><big>  {action[u"Размеры опухоли"]}</big> </b><br>
Отношение к окружающим тканям: <b>{action[u"Отношение к окружающим тканям"]}</b><br>
Лечебные пособия: <b>{action[u"Лечебные пособия"]}</b>; доза  <b>{action[u"Доза"]}</b>; эффект <b>{action[u"Эффект"]}</b><br>
Мероприятие: <b>{action[u"Мероприятие"]}</b><br>
Место взятия материала для исследования: <b>{action[u"Откуда взят материал для исследования"]}</b>; Кусочков - <b>{action[u"Сколько кусочков"]}</b><br>
Дополнительные сведения. Особые пожелания клинического отделения: <b>{action[u"Дополнительные сведения. Особые пожелания клинического отделения"]}</b><br>
<u>Время оформления направления: <b>{action.begDate.datetime.toString(u"hh ч. mm мин.")}</b></u><br>
Подпись врача:_______________________________<b>{action.setPerson} ({action.begDate.date.toString(u"dd.MM.yyyy г.")})</b></td></tr>
<hr>
<i>Заключение гистологической лаборатории отделения может соответствовать заключению внешней лаборатории, если оно изначально верно оформлено в терминах действующей классификации опухолей Всемирной организации здравоохранения.</i><br>
<b>Я, ______________________________________________________________, (заполняетcя самостоятельно)</b><br>
{if: client.sexCode == 1}согласен{else:}согласна{end:} на консультацию моих исследований, мне разъяснен порядок консультации и ясна цель данной услуги.</b><br>
<hr>
<b>СОГЛАСИЕ НА ДОПОЛНИТЕЛЬНЫЕ УСЛУГИ ГИСТОЛОГИЧЕСКОЙ ЛАБОРАТОРИИ: </b><br>
<hr>
<i>Количество устанавливается в процессе работы над материалом.</i></b><br>
{if: client.sexCode == 1}Согласен // Не согласен{else:}Согласна //Не согласна{end:} (нужное подчеркнуть)
<hr>
<i>Актуальный телефон </i>_____________________________<br>
_______________________<small>(подпись пациента)</small>________________________________<small>(расшифровка)</small></b>
</table>
</table>
</body>
</html>', 0, 0, 0, 2, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '02_1', 'ПРОТОКОЛ_ФОРМА №014-1/у МинЗдрава', 'gist', '', '{: jobTicketIdList = [p._property.getValue() for p in action if p._property.type().typeName == ''JobTicket'']}
<HTML>
<BODY>
{:
from PyQt4 import QtGui
from Orgs.Utils import COrgStructureInfo
from library.Utils import forceString, forceDate

app = QtGui.qApp
db = app.db

def get_org_path(os_id):
    return forceString(db.selectExpr(db.func.getOrgStructurePath(os_id)).value(0))

def get_real_orderer(event):
    ctx = event.context
    person = event.execPerson
    org_structure = person.orgStructure
    event_type = event.eventType
    KDO_id = 152

    os_id = org_structure.id
    os_path = get_org_path(os_id)
    if not os_path or u''ГОСПИТАЛИЗАЦИЯ'' in event_type.name:
        return ctx.getInstance(COrgStructureInfo, os_id)
    root_id = int(os_path.split(''.'')[0])
    root = ctx.getInstance(COrgStructureInfo, root_id)
    if root.code == u''Институт'':
        return ctx.getInstance(COrgStructureInfo, KDO_id)
    return root

org_structure = get_real_orderer(event)

call = u"SELECT   DATE(ttj.datetimeTaken) AS ''date'', TIME(ttj.datetimeTaken) AS ''time''  FROM TakenTissueJournal ttj   INNER JOIN Action a     ON ttj.id = a.takenTissueJournal_id WHERE ttj.deleted = 0  AND a.id = aiid ORDER BY ttj.id DESC LIMIT 1;"

call = call.replace(u"aiid", str(action.id))

myquery = db.query(call)

myquery.next()

}

    {: tq1 = u"SELECT at.code, a.amount FROM ActionProperty_Job_Ticket apjt " }
    {: tq1 += u"JOIN ActionProperty_Job_Ticket apjt1 ON apjt.value=apjt1.value " }
    {: tq1 += u"JOIN ActionProperty ap ON apjt1.id = ap.id AND ap.deleted=0 " }
    {: tq1 += u"JOIN ActionProperty ap1 ON apjt.id = ap1.id AND ap1.deleted=0 " }
    {: tq1 += u"JOIN Action a ON ap.action_id = a.id " }
    {: tq1 += u"JOIN  ActionType at ON a.actionType_id = at.id " }
    {: tq1 += u"WHERE ap1.action_id={actionid} ; " }
    {: tq1 = tq1.format(actionid=action.id)}




<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 8pt; color: black">
<TR><TD align="left" COLSPAN=3><b>{currentOrganisation.fullName}</b></TD><BR/>
<b>{currentOrganisation.address}</b></TD></TR>
<TR><TD align="right" COLSPAN=5>Код формы по ОКУД__________</TD></TR>
<TR><TD align="right" COLSPAN=5>Код учреждения по ОКПО______________</TD></TR>
<TR><TD align="right" COLSPAN=5>Медицинская документация</TD></TR>
<TR><TD align="right" COLSPAN=5>Учетная форма N 014-1/у</TD></TR>
<TR><TD align="right" COLSPAN=5>Утверждена приказом Минздрава России</TD></TR>
<TR><TD align="right" COLSPAN=5>от "24" марта 2016 г. N 179н</TD></TR>
</TABLE>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=center>ПРОТОКОЛ<br>ПРИЖИЗНЕННОГО ПАТОЛОГО-АНАТОМИЧЕСКОГО ИССЛЕДОВАНИЯ<br>БИОПСИЙНОГО (ОПЕРАЦИОННОГО) МАТЕРИАЛА</td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
1. Отделение, направившее биопсийный (операционный) материал <b>{org_structure.name}</b><br>
2. Фамилия, имя, отчество (при наличии) пациента <b>{client.fullName}</b><br>
3. Пол: <b>{u"М" if client.sexCode == 1 else u"Ж"}</b>, 4. Дата рождения: число<b> {client.birthDate.date.day()}</b> месяц <b>{client.birthDate.date.month()}</b> год <b>{client.birthDate.date.year()}</b><br>
5. Полис ОМС {client.policy.serial} {client.policy.number} 6. СНИЛС <b>{client.SNILS}</b><br>
7. Место регистрации: <b>{if: client.regAddress} {client.regAddress}{else:} {client.regAddress.freeInput}{end:}</b>, тел. <b>{u'', ''.join(u''%s'' % (contact) for code, name, contact, notes in client.contacts if code != ''5'')}</b><br>
8. Местность: {if:(str(client.regAddress.KLADRCode)[8:11])==''000''}<u><b> городская - 1</u></b>, сельская - 2{else:} городская - 1,<u><b> сельская - 2</u></b>{end:}<br>
9. Диагноз заболевания (состояния) по данным направления {if: action[u"Клинический диагноз"]} <b>{action[u"Клинический диагноз"]}</b>{end:} {action._record.value(''MKB'').toString()}<br>
10. Код по МКБ* <big><b>{action.MKB.descr}</b></big><br>
<hr>
11. Дата забора материала по данным направления {action[u"Дата забора биоматериала"]} время {action[u"Время забора биоматериала"]}<br>
12. Материал доставлен в 10%-ный раствор нейтрального формалина <b>{if:action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value.find(u"1")>=0}да{elif:action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value.find(u"0")>=0}нет{else:}{action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value}{end:}</b><br>
загрязнен <b>{if:action[u"загрязнен (да/нет)"].value.find(u"1")>=0}да{elif:action[u"загрязнен (да/нет)"].value.find(u"0")>=0}нет{else:}{action[u"загрязнен (да/нет)"].value}{end:}</b><br>
13. Дата поступления биопсийного (операционного) материала: дата {if: myquery.value(0)} { forceDate(myquery.value(0)).toString(''dd.MM.yyyy'') } {else:}________________ {end:}, время {if: myquery.value(1)} { myquery.value(1).toString()[0:2] }:00:00 {else:}________________ {end:}<br>
14. Отметка о сохранности упаковки{if:action[u"Отметка о сохранности упаковки"].value}<u>  {action[u"Отметка о сохранности упаковки"].value}  </u>{else:}______________________________________{end:}<br>
15. Дата регистрации биопсийного (операционного) материала: дата {if: myquery.value(0)} { forceDate(myquery.value(0)).toString(''dd.MM.yyyy'') } {else:}________________ {end:}, время {if: myquery.value(1)} { myquery.value(1).toString() } {else:}________________ {end:}<br>
16. Регистрационный номер <big><b>{action[u"№ исследования"]}</b></big><br>
17. Медицинские услуги: <br>
 {: myquerygist = db.query(tq1)}
             {for: i in range(0, myquerygist.size())}{: myquerygist.next() }
             <b>код</b> {myquerygist.value(0).toString()} <b>кол-во</b> {myquerygist.value(1).toString()} <br>
             {end:}
18. Категория сложности (1-5) {if:action[u"Категория сложности"].value}<u> {action[u"Категория сложности"]}</u>{else:} ________{end:}<br>
19. Вырезка проводилась:
{if:action[u"Вырезка проводилась дата, время"].value}
<b>дата </b><u>{action[u"Вырезка проводилась дата, время"].value[6:8]}.{action[u"Вырезка проводилась дата, время"].value[4:6]}.{action[u"Вырезка проводилась дата, время"].value[0:4]}</u>
<b>, время </b><u>{action[u"Вырезка проводилась дата, время"].value[8:10]}:{action[u"Вырезка проводилась дата, время"].value[10:12]} </u>
{else:}<b>дата ________________, время________</b> {end:}<br>
20. В проводку взято: {if:action[u"Морфология на входе"]==u"К - консультация"}0{else:}{action[u"Количество блоков"]}{end:} объектов<br>
21. Назначенные окраски (реакции, определения): {action[u"Назначенные окраски"]}<br>
{if: action[u"Статус заключения"] ==  u"подписано"}
22. <b>Макроскопическое описание:</b> {action[u"Макроописание"]}<br>
23. <b>Микроскопическое описание:</b> {action[u"Микроописание"]}<br>
24. <b>Заключение:</b> {action[u"Гистологическое заключение"]}<br>
{else:}{end:}
25. Код по МКБ: <b>{if:action[u"Онкошифр"].value}{action[u"Онкошифр"]}{end:}</b><br>
26. <b>Комментарии к заключению и рекомендации:</b> {action[u"Описание дополнительных исследований"]}<br>
27. Прижизненное патолого-анатомическое исследование выполнили:
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td>
<b>Врач-патологоанатом</b> {action.person.shortName}</td><td><br>___________________________<br><small>(подпись)</small><br>М.П.
</td></tr>
<tr><td><b>Врач-специалист,<br>
осуществляющий консультирование</b>
{if:action[u"Врач-специалист, осуществляющий консультирование"].value}<u>  {action[u"Врач-специалист, осуществляющий консультирование"].value}  </u>{else:}
___________________________{end:}</td><td><br> ___________________________<br><small>(подпись)</small><br>М.П.
</td></tr>
</table>
28. Дата проведения прижизненного патолого-анатомического исследования: <b>{action.endDate.date.toString(u"dd.MM.yyyy г.")}</b>
<hr>
{if: action[u"Подписано ЭЦП"] == u"да"}
<br><br>
<table cellpadding=2 cellspacing=2 border=1 width=100%>
<tr><td align=center>
Подлинник электронного документа, подписанного ЭП, хранится в лабораторной информационной системе ЛабФорс патологоанатомического отделения НМИЦ онкологии им. Н. Н. Петрова
<br>
<b>Сведения о сертификате ЭП</b><br>
Кому выдан: {action.person.fullName}<br>
Серийный номер: {action.person.federalCode}<br>
Действителен: {action.person.birthPlace}</td></tr></table>
{else:} {end:}
</body>
</html>
', 2, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '01_2', 'Направление №014/у МинЗдрава', 'gist', '', '<HTML>
<head>
<meta name="qrichtext" content="1" />
</head>
<BODY  style=" font-family:''Arial''; font-size:10pt; font-weight:400; font-style:normal;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{setLeftMargin(5)}
{setTopMargin(5)}
{setBottomMargin(5)}
{setRightMargin(5)}
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=right><font face="Code 3 de 9" style="font-size:25pt;">*{action.id}*</font></td></tr>
<tr><td align=right>*{action.id}*</td></tr>
</table>
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 10pt; color: black">
<TR><TD   WIDTH="65%"><small>Наименование медицинской организации</small><br><b>{currentOrganisation.shortName}</b></TD><TD  align="center" >Код формы по ОКУД____________<br>Код учреждения по ОКПО____________<br></TD></TR>
<TR><TD><small>Адрес</small><br><b>{currentOrganisation.address}</b></TD><TD  align="center" >Медицинская документация<br>Учетная форма № 014/у<br>Утверждена приказом Минздрава России<br>от 24 марта 2016 г. № 179н</TD></TR>
</TABLE>
<br>
<center><big><b>НАПРАВЛЕНИЕ<br>НА ПРИЖИЗНЕННОЕ ПАТОЛОГО-АНАТОМИЧЕСКОЕ<br>ИССЛЕДОВАНИЕ БИОПСИЙНОГО (ОПЕРАЦИОННОГО)<br>МАТЕРИАЛА</b></big></center>
<br>
<b>1. Отделение, направившее биопсийный (операционный) материал</b><u>   {action[u"Отделение, на которое необходимо вернуть результат"]}</u><br>
<b>2. Фамилия, имя, отчество (при наличии) пациента</b><u>     {client.lastName} {client.firstName} {client.patrName}     </u><br>
<b>3. Пол:</b>{if: client.sex==''М''} <b><u>муж. - 1</u></b>, жен. - 2{else:} муж. - 1,<b><u> жен. - 2</u></b>{end:}    <b>4. Дата рождения:</b>число<u>     {client.birthDate.date.day()}     </u>месяц<u>     {client.birthDate.date.month()}     </u>год<u>     {client.birthDate.date.year()}     </u><br>
<b>5. Полис ОМС</b><u> {client.policy}</u>   <b>6. СНИЛС</b><u> {client.SNILS}  </u><br>
<b>7. Место регистрации:</b><u>   {if: client.regAddress} {client.regAddress} {else:}{client.regAddress.freeInput}{end:}   </u>	<br>
   <b>тел.</b><u>   {client.phones}  </u><br>
<b>8. Местность:</b> городская — 1, сельская — 2.		<br>
<b>9. Диагноз основного заболевания (состояния)</b><br>
{if: action[u"Клинический диагноз"].value}<u> {action[u"Клинический диагноз"]}</u>{else:}
      _______________________________________________________________________________________________<br>
      _______________________________________________________________________________________________<br>
      _____________________________________________________{end:}<b>10. Код по МКБ*</b><u>{for: diagnosis in event.diagnosises} {diagnosis.MKB.code}{end:}</u><br>
<b>11. Задача прижизненного патолого-анатомического исследования биопсийного (операционного) материала</b><br>
{if: action[u"Дополнительные сведения. Особые пожелания клинического отделения"].value}<u> {action[u"Дополнительные сведения. Особые пожелания клинического отделения"]}</u>{else:}
      _______________________________________________________________________________________________{end:}<br>
<b>12. Дополнительные клинические сведения </b>(основные симптомы, оперативное или гормональное, или лучевое лечение,
результаты инструментальных и лабораторных исследований)
{:p12=''''}
{if: action[u"Клинические симптомы важнейшие"].value}<u> Клинические симптомы важнейшие: {action[u"Клинические симптомы важнейшие"]}{:p12=p12+action[u"Клинические симптомы важнейшие"]}</u>{end:}
{if: action[u"TNM стадия"].value}<u>{if: p12}.{end:} TNM стадия: {action[u"TNM стадия"]}{:p12=p12+action[u"TNM стадия"]}</u>{end:}
{if: action[u"Когда замечена опухоль"].value}<u>{if: p12}.{end:} Когда замечена опухоль: {action[u"Когда замечена опухоль"]}{:p12=p12+action[u"Когда замечена опухоль"]}</u>{end:}
{if: action[u"Размеры опухоли"].value}<u>{if: p12}.{end:} Размеры опухоли: {action[u"Размеры опухоли"]}{:p12=p12+action[u"Размеры опухоли"]}</u>{end:}
{if: action[u"Темп роста"].value}<u>{if: p12}.{end:} Темп роста: {action[u"Темп роста"]}{:p12=p12+action[u"Темп роста"]}</u>{end:}
{if: p12}{else:}_____________________________________<br>
      _______________________________________________________________________________________________{end:}<br>
<b>13. Результаты предыдущих прижизненных патолого-анатомических исследований</b> (наименование медицинской организации,
дата, регистрационный номер, заключение)	<br>{if: action[u"Номер предыдущего обследования (если было)"].value}<u>{action[u"Номер предыдущего обследования (если было)"]}</u>{else:}      _______________________________________________________________________________________________{end:}<br>
<b>14. Проведенное предоперационное лечение </b>(вид лечения, его сроки, дозировка лекарственного препарата, доза облучения)<br>
{:p14=''''}
{if: action[u"Лечебные пособия"].value}<u> Лечебные пособия: {action[u"Лечебные пособия"]}{:p14=p14+action[u"Лечебные пособия"]}</u>{end:}
{if: action[u"Доза"].value}<u>{if: p14}.{end:} Доза: {action[u"Доза"]}{:p14=p14+action[u"Доза"]}</u>{end:}
{if: action[u"Эффект"].value}<u>{if: p14}.{end:} Эффект: {action[u"Эффект"]}{:p14=p14+action[u"Эффект"]}</u>{end:}
{if: p14}{else:}      _______________________________________________________________________________________________<br>
      _______________________________________________________________________________________________{end:}<br>
<b>15. Способ получения биопсийного (операционного) материала:</b> эндоскопическая биопсия — 1, пункционная биопсия — 2, аспирационная биопсия — 3, инцизионная биопсия — 4, операционная биопсия — 5, операционный материал — 6, самопроизвольно отде-лившиеся фрагменты тканей — 7.<br>
<b>16. Дата забора материала</b>{if: action[u"Дата забора биоматериала"].value}<u> {action [u"Дата забора биоматериала"]} </u>{else:}___________________________{end:}<b>время</b>{if: action[u"Время забора биоматериала"].value}<u> {action[u"Время забора биоматериала"]} </u>{else:}___________________________{end:}.<br>
<b>17. Материал помещен в 10%-ный раствор нейтрального формалина</b> (да/нет)_______________<br>
<b>18. Маркировка биопсийного (операционного) материала</b> (расшифровка маркировки флаконов):<br>
<TABLE BORDER=1 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 10pt; color: black">
<TR><TD align="center" WIDTH="10%">Номер<br>флакона</TD><TD  align="center" WIDTH="30%">Локализация<br>патологического процесса<br>(орган, топография)</TD>
<TD  align="center"  WIDTH="45%">Характер патологического процесса<br>(эрозия, язва, полип, пятно, узел, внешне не измененная<br>ткань, отношение к окружающим тканям)</TD><TD  align="center" WIDTH="15%">Количество<br>объектов</TD></TR>
<TR><TD  align="center">1</TD><TD>{action[u"Откуда взят материал для исследования"]}</TD><TD>{if: action[u"Характер патологического процесса"].value}{action[u"Характер патологического процесса"]}<br>{end:}
{if: action[u"Отношение к окружающим тканям"].value} Отношение к окружающим тканям: {action[u"Отношение к окружающим тканям"]}{end:}
</TD><TD>{action[u"Сколько кусочков"]}</TD></TR>
<TR><TD  align="center">2</TD><TD></TD><TD></TD><TD></TD></TR>
<TR><TD  align="center">3</TD><TD></TD><TD></TD><TD></TD></TR>
<TR><TD  align="center">4</TD><TD></TD><TD></TD><TD></TD></TR>
<TR><TD  align="center">5</TD><TD></TD><TD></TD><TD></TD></TR>
</TABLE><br>
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 10pt; color: black">
<TR><TD WIDTH="65%"><b>19. Фамилия, инициалы врача </b><u> {action.setPerson.shortName}</u></TD><TD>подпись _______________<br></TD></TR>
<TR><TD><b>20. Дата направления:</b> <u>{action.begDate.date.toString(u"dd.MM.yyyy г.")}</u></TD><TD>телефон _______________<br></TD></TR>
</TABLE>
<br>________________________<br>
<small>* Международная статистическая классификация болезней и проблем, связанных со здоровьем.</small>

</BODY></HTML>

', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '1', 'Шаблон осмотра', 'cons_red_new_rls_sms5', '', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
</head>
<body style="font-family: Arial; font-size: 9pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2><b>Пациент: </b> {client.fullName},<b> {client.birthDate} г. р. ({client.age})</b></td></tr>
<b>Дата: </b> {action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b>Осмотр: </b>{action.name}
<br>
<b>Врач: </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table cellpadding=0 cellspacing=0 width=100%>
{if: action[u"Жалобы"].value}<b>Жалобы: </b>{action[u"Жалобы"] :n}<br>
{end:}
<b>Страховой анамнез: </b>
<br>
{if: action[u"Страховой анамнез: работает (указать профессию)"].value}<b>Работает </b>{action[u"Страховой анамнез: работает (указать профессию)"] :n}.{end:} {if: action[u"Страховой анамнез: является инвалидом (указать группу)"].value}<b>Является инвалидом: </b>{action[u"Страховой анамнез: является инвалидом (указать группу)"] :n}<br>
{end:}
{if: action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"].value}<b>По данному заболеванию листок нетрудоспособности </b>{action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"] :n}<br>
{end:}
{if: action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"].value}<b>Первичный листок нетрудоспособности </b>{action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"] :n}<br>
{end:}
{if: action[u"Остается"].value}<b>Остается </b>{action[u"Остается"] :n}<br>
{end:}
{if: action[u"Нуждается в выдаче листка нетрудоспособности"].value}<b>Нуждается в выдаче листка нетрудоспособности </b>{action[u"Нуждается в выдаче листка нетрудоспособности"] :n}<br>{end:}
{if: action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"].value}<b><u>Прошу продлить(выдать)листок нетрудоспособности </u>{action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"] :n}, лечения, обследования, уточнения диагноза, симптоматической терапии</b> (нужное подчеркнуть) <br>{end:}
{if: action[u"Анамнез заболевания"].value}<b>Анамнез заболевания: </b>{action[u"Анамнез заболевания"] :n}
{end:}<br>
{if: action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"].value}<b>Перенесенные инфекционные заболевания: </b>{action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"] :n}<br>{end:}
{if: action[u"Анамнез Vitae: Хронические заболевания"].value}<b>Хронические заболевания: </b>{action[u"Анамнез Vitae: Хронические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Аллергические реакции"].value}<b>Аллергические реакции: </b>{action[u"Анамнез Vitae: Аллергические реакции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Травмы/хирургические операции"].value}<b>Травмы/хирургические операции: </b>{action[u"Анамнез Vitae: Травмы/хирургические операции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Перенесенные онкологические заболевания"].value}<b>Перенесенные онкологические заболевания: </b>{action[u"Анамнез Vitae: Перенесенные онкологические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Онкологические заболевания в семье"].value}<b>Онкологические заболевания в семье: </b>{action[u"Анамнез Vitae: Онкологические заболевания в семье"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные привычки"].value}<b>Вредные привычки: </b>{action[u"Анамнез Vitae: Вредные привычки"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные факторы труда"].value}<b>Вредные факторы труда: </b>{action[u"Анамнез Vitae: Вредные факторы труда"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"].value}<b>Акушерский/Гинекологический анамнез: </b>{action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"] :n}<br>
{end:}
{if: action[u"Осмотр на педикулез"].value}<b>Осмотр на педикулез: </b>{action[u"Осмотр на педикулез"] :n}<br>
{end:}
{if: action[u"Объективный статус"].value}<b>Объективный статус: </b>
{if: action[u"Артериальное давление систолическое"].value}Артериальное давление систолическое: {action[u"Артериальное давление систолическое"] :n}.{end:}
{if: action[u"Артериальное давление диастолическое"].value}Артериальное давление диастолическое: {action[u"Артериальное давление диастолическое"] :n}.{end:}
{if: action[u"Частота сердечных сокращений"].value}Частота сердечных сокращений: {action[u"Частота сердечных сокращений"] :n}.{end:}
{if: action[u"Частота дыхания"].value}Частота дыхания: {action[u"Частота дыхания"] :n}.{end:}{if: action[u"Температура тела"].value}Температура тела: {action[u"Температура тела"] :n}.{end:}<br>
{action[u"Объективный статус"] :n}<br>
{end:}
{if: action[u"Основное заболевание"].value}<b>Основное заболевание: </b>{action[u"Основное заболевание"]:n}<br>
{end:}
{if: action[u"Осложнения основного заболевания"].value}<b>Осложнения основного заболевания: </b>{action[u"Осложнения основного заболевания"]:n}<br>
{end:}
{if: action[u"Сопутствующие заболевания"].value}<b>Сопутствующие заболевания:  </b>{action[u"Сопутствующие заболевания"]:n}<br>
{end:}
{if: action[u"Осложнения сопутствующего заболевания"].value}<b>Осложнения сопутствующего заболевания:  </b>{action[u"Осложнения сопутствующего заболевания"]:n}<br>
{end:}
{if: action[u"Получаемое пациентом(кой) лечение"].value}<b>Получаемое пациентом(кой) лечение:  </b>{action[u"Получаемое пациентом(кой) лечение"]:n}<br>
{end:}
<!-- Все коды МКФ в текущем обращении(вставить после осложнения соп диагноза) -->
{:kodmcf=''''}
{:opismcf=''''}
{: t=0}
{for: act1 in sorted([x for x in actions], key = lambda item: item.begDate.date)}
{if:act1.name.find("МКФ")>=0}
{: tt=0}
{for: (i, prop1) in enumerate([x for x in act1])}
{if:prop1.value}
{if: i==0 and t==1}{:kodmcf=kodmcf+''; ''}{:opismcf=opismcf+''; ''}{end:}
{if: i==0}{:kodmcf=kodmcf+prop1.value[:4]}{:opismcf=opismcf+prop1.value[5:]}{:t=1}{:tt=1}
{if:prop1.value[0]==''s'' or prop1.value[0]==''d''}{:kodmcf=kodmcf+''.''}{end:}
{else:}{:kodmcf=kodmcf+prop1.value[:2]}{:opismcf=opismcf+'' ''+str(i)+''-''+prop1.value[5:]}{end:}{else:}{if: tt==1}{:kodmcf=kodmcf+''_x''}{end:}
{end:}{end:}{end:}{end:}
{if:len(kodmcf)}<b>Реабилитационный диагноз: </b>{kodmcf}<br>{opismcf}<br> {end:}
<!-- Все коды МКФ в текущем обращении   КОНЕЦ -->
{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}<br>{end:}
{if: action[u"Рекомендации по обследованию"].value}<b>Рекомендации по обследованию: </b>{action[u"Рекомендации по обследованию"] :n}<br>
{end:}
{if: action[u"Рекомендации по лечению"].value}<b>Рекомендации по лечению: </b>{action[u"Рекомендации по лечению"] :n}<br>
{end:}
{:l = [x for x in action if x.value]}
{for: i, prop in enumerate(l) }
{if: prop.name == u"Медикаментозные назначения"}
<b>Рекомендации по медикаментозной терапии: </b>
{: rlsList = prop.value if isinstance(prop.value, list) else [prop.value]}
{for: rls in rlsList}<br>
{rls.rls.tradeName},{rls.form},{rls.amount},{rls.note}{end:}{end:}{end:}
<br>
{if: action[u"Рекомендации по изменению образа жизни"].value}<b>Рекомендации по изменению образа жизни: </b>{action[u"Рекомендации по изменению образа жизни"] :n}<br>
{end:}
{if: action[u"Протокол"].value  and action[u"Протокол"].value!=action[u"Объективный статус"].value}<b>Протокол: </b>{action[u"Протокол"] :n}<br>{end:}
{for: prop2 in action}{if: prop2.value and prop2.name=="Заключение"}<b>{prop2.name}: </b>{prop2.value :n}<br>{end:}{end:}
<HR>
Исследования и манипуляции, рекомендуемые для <b><u>ЗАПИСИ:</u></b>
<table width=100%>
{for:recommendation in event.recommendations}
<tr><td align=left><i><b>{recommendation.actionType.code}</b> {recommendation.actionType.name}.</i></td></tr>
{end:}
</table>
<HR>
<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body></html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '2', 'Консультативное заключение', 'cons_red_new_rls_sms5', '', '<html>
<head>
<meta name="qrichtext" content="1" />
</head>
<body>
<table width=100%>
<tr><td align=left><img src="blank/image/LOGO.JPG"></td>
<td width=90% align=center><b><big>{currentOrganisation.fullName} </b></big>
<br>
<b>{if: action.name.find("МЦ:")>=0}
Консультативно-диагностический центр. Амбулаторное отделение №1</b> <br>
ул. Красного Текстильщика, д.10-12, лит. В
{elif: action.name.find("ЦнМ:")>=0}
Консультативно-диагностический центр. Амбулаторное отделение №2</b> <br>
Моравский пер., д.5, лит. А
{else:}
({currentOrganisation.shortName})</b> <br>
{currentOrganisation.address}
{end:}
<br>
телефон {currentOrganisation.phone} Факс: (812) 596-8947. Эл.почта: oncl@rion.spb.ru <br>
www.niioncologii.ru <br>
ИНН {currentOrganisation.INN} КПП {currentOrganisation.KPP}
</td></tr>
<br><br>
</table>
<tr>
<td width=50% align=left>г.Санкт-Петербург</td> <td width=50% align=right>{action.endDate.date.toString(u"dd MMMM yyyy г.")}</td></tr>
<br>
<tr><td colspan=2 align=center><big><b>КОНСУЛЬТАТИВНОЕ ЗАКЛЮЧЕНИЕ</b></big></td></tr>
ПО МЕСТУ ТРЕБОВАНИЯ
<br>
<tr><td colspan=2><b>Ф.И.О. </b>{client.fullName} <b>Дата рождения: </b> {client.birthDate}</td></tr>
<br>
<tr><td colspan=2><b>Жалобы: </b>{action[u"Жалобы"]:n}</td></tr>
<tr><td colspan=2><b>Анамнез заболевания: </b>{action[u"Анамнез заболевания"]:n}</td></tr>
<tr><td colspan=2><b>Основное заболевание: </b>{action[u"Основное заболевание"]:n}</td></tr>
<tr><td colspan=2><b>Осложнения основного заболевания: </b>{action[u"Осложнения основного заболевания"]:n}</td></tr>
<tr><td colspan=2><b>Сопутствующие заболевания: </b>{action[u"Сопутствующие заболевания"]:n}</td></tr>
<tr><td colspan=2><b>Осложнения сопутствующего заболевания: </b>{action[u"Осложнения сопутствующего заболевания"]:n}</td></tr>
<tr><td colspan=2><b>Объективный статус: </b>{action[u"Объективный статус"] :n}</td></tr>
{if: action[u"Получаемое пациентом(кой) лечение"].value and action[u"Получаемое пациентом(кой) лечение"].value!=u''со слов пациента, не получает''}<tr><td colspan=2><b>Получаемое пациентом(кой) лечение: </b>{action[u"Получаемое пациентом(кой) лечение"] :n}</td></tr>{end:}
{if: action[u"Рекомендации"].value}<tr><td colspan=2><b>Рекомендации: </b>{action[u"Рекомендации"] :n}</td></tr>{end:}
{if: action[u"Рекомендации по обследованию"].value}<tr><td colspan=2><b>Рекомендации по обследованию: </b>{action[u"Рекомендации по обследованию"] :n}</td></tr>{end:}
{if: action[u"Рекомендации по лечению"].value}<tr><td colspan=2><b>Рекомендации по лечению: </b>{action[u"Рекомендации по лечению"] :n}</td></tr>{end:}
{:l = [x for x in action if x.value]}
{for: i, prop in enumerate(l) }
{if: prop.name == u"Медикаментозные назначения"}
<b><u>Рекомендации по медикаментозной терапии: </u></b>
{: rlsList = prop.value if isinstance(prop.value, list) else [prop.value]}
{for: rls in rlsList}<br>
{rls.rls.tradeName},{rls.form},{rls.amount},{rls.note}{end:}{end:}{end:}<br>
{if: action[u"Рекомендации по изменению образа жизни"].value}<tr><td colspan=2><b>Рекомендации по изменению образа жизни: </b>{action[u"Рекомендации по изменению образа жизни"] :n}</td></tr>{end:}
{if: action[u"Протокол"].value  and action[u"Протокол"].value!=action[u"Объективный статус"].value}<tr><td colspan=2><b>Протокол: </b>{action[u"Протокол"] :n}</td></tr>{end:}
<tr><td colspan=2><b>Заключение: </b>{for: prop2 in action}{if: prop2.value and prop2.name=="Заключение"}{prop2.value :n}<br>{end:}{end:}</td></tr>
<HR>
Исследования и манипуляции, рекомендуемые для <b><u>ЗАПИСИ:</u></b>
<table width=100%>
{for:recommendation in event.recommendations}
<tr><td align=left><i><b>{recommendation.actionType.code}</b> {recommendation.actionType.name}.</i></td></tr>
{end:}
</table>
<HR>
Врач_________________/{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}<br>
__________________________________<br>
<small>МП/личная печать врача/</small>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '3', 'Печать документов приёма', 'cons_red_new_rls_sms5', '', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
</head>
<body style="font-family: Arial; font-size: 9pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2><b>Пациент: </b> {client.fullName},<b> {client.birthDate} г. р. ({client.age})</b></td></tr>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b> Осмотр: </b>{action.name}
<br>Врач:<b> </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table cellpadding=0 cellspacing=0 width=100%>
{if: action[u"Жалобы"].value}<b>Жалобы: </b>{action[u"Жалобы"] :n}<br>{end:}
<b>Страховой анамнез: </b><br>
{if: action[u"Страховой анамнез: работает (указать профессию)"].value}<b>Работает </b>{action[u"Страховой анамнез: работает (указать профессию)"] :n}.
{end:}
{if: action[u"Страховой анамнез: является инвалидом (указать группу)"].value}<b>Является инвалидом: </b>{action[u"Страховой анамнез: является инвалидом (указать группу)"] :n}<br>
{end:}
{if: action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"].value}<b>По данному заболеванию листок нетрудоспособности </b>{action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"] :n}<br>
{end:}
{if: action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"].value}<b>Первичный листок нетрудоспособности </b>{action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"] :n}<br>
{end:}
{if: action[u"Остается"].value}<b>Остается</b>{action[u"Остается"] :n}<br>{end:}
{if: action[u"Нуждается в выдаче листка нетрудоспособности"].value}<b>Нуждается в выдаче листка нетрудоспособности </b>{action[u"Нуждается в выдаче листка нетрудоспособности"] :n}<br>
{end:}
{if: action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"].value}<b>Прошу продлить(выдать)листок нетрудоспособности {action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"] :n}, лечения, обследования, уточнения диагноза, симптоматической терапии</b> (нужное подчеркнуть) <br>
{end:}
{if: action[u"Анамнез заболевания"].value}<b>Анамнез заболевания: </b>{action[u"Анамнез заболевания"] :n}<br>{end:}
{if: action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"].value}<b>Перенесенные инфекционные заболевания: </b>{action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Хронические заболевания"].value}<b>Хронические заболевания: </b>{action[u"Анамнез Vitae: Хронические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Аллергические реакции"].value}<b>Аллергические реакции: </b>{action[u"Анамнез Vitae: Аллергические реакции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Травмы/хирургические операции"].value}<b>Травмы/хирургические операции: </b>{action[u"Анамнез Vitae: Травмы/хирургические операции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Перенесенные онкологические заболевания"].value}<b>Перенесенные онкологические заболевания: </b>{action[u"Анамнез Vitae: Перенесенные онкологические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Онкологические заболевания в семье"].value}<b>Онкологические заболевания в семье: </b>{action[u"Анамнез Vitae: Онкологические заболевания в семье"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные привычки"].value}<b>Вредные привычки: </b>{action[u"Анамнез Vitae: Вредные привычки"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные факторы труда"].value}<b>Вредные факторы труда: </b>{action[u"Анамнез Vitae: Вредные факторы труда"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"].value}<b>Акушерский/Гинекологический анамнез: </b>{action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"] :n}<br>
{end:}
{if: action[u"Осмотр на педикулез"].value}<b>Осмотр на педикулез: </b>{action[u"Осмотр на педикулез"] :n}<br>
{end:}
{if: action[u"Объективный статус"].value}<b>Объективный статус: </b>
{if: action[u"Артериальное давление систолическое"].value}Артериальное давление систолическое: {action[u"Артериальное давление систолическое"] :n}.{end:}
{if: action[u"Артериальное давление диастолическое"].value}Артериальное давление диастолическое: {action[u"Артериальное давление диастолическое"] :n}.{end:}
{if: action[u"Частота сердечных сокращений"].value}Частота сердечных сокращений: {action[u"Частота сердечных сокращений"] :n}.{end:}
{if: action[u"Частота дыхания"].value}Частота дыхания: {action[u"Частота дыхания"] :n}.{end:}{if: action[u"Температура тела"].value}Температура тела: {action[u"Температура тела"] :n}.{end:}<br>
{action[u"Объективный статус"] :n}<br>
{end:}
{if: action[u"Основное заболевание"].value}<b>Основное заболевание: </b>{action[u"Основное заболевание"]:n}<br>
{end:}
{if: action[u"Осложнения основного заболевания"].value}<b>Осложнения основного заболевания: </b>{action[u"Осложнения основного заболевания"]:n}<br>
{end:}
{if: action[u"Сопутствующие заболевания"].value}<b>Сопутствующие заболевания: </b>{action[u"Сопутствующие заболевания"]:n}<br>{end:}
{if: action[u"Осложнения сопутствующего заболевания"].value}<b>Осложнения сопутствующего заболевания: </b>{action[u"Осложнения сопутствующего заболевания"]:n}<br>{end:}
{if: action[u"Получаемое пациентом(кой) лечение"].value}<b>Получаемое пациентом(кой) лечение:  </b>{action[u"Получаемое пациентом(кой) лечение"]:n}<br>
{end:}
{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}<br>{end:}
{if: action[u"Рекомендации по обследованию"].value}<b>Рекомендации по обследованию: </b>{action[u"Рекомендации по обследованию"] :n}<br>
{end:}
{if: action[u"Рекомендации по лечению"].value}<b>Рекомендации по лечению: </b>{action[u"Рекомендации по лечению"] :n}<br>
{end:}
{:l = [x for x in action if x.value]}
{for: i, prop in enumerate(l) }
{if: prop.name == u"Медикаментозные назначения"}
<b><u>Рекомендации по медикаментозной терапии: </u></b>
{: rlsList = prop.value if isinstance(prop.value, list) else [prop.value]}
{for: rls in rlsList}<br>
{rls.rls.tradeName},{rls.form},{rls.amount},{rls.note}{end:}{end:}{end:}<br>
{if: action[u"Рекомендации по изменению образа жизни"].value}<b>Рекомендации по изменению образа жизни: </b>{action[u"Рекомендации по изменению образа жизни"] :n}<br>{end:}
{if: action[u"Протокол"].value  and action[u"Протокол"].value!=action[u"Объективный статус"].value}<b>Протокол: </b>{action[u"Протокол"] :n}{end:}
{for: prop2 in action}{if: prop2.value and prop2.name=="Заключение"}<b>{prop2.name}: </b>{prop2.value :n}<br>{end:}{end:}
<HR>
Исследования и манипуляции, рекомендуемые для <b><u>ЗАПИСИ:</u></b>
<table width=100%>
{for:recommendation in event.recommendations}
<tr><td align=left><i><b>{recommendation.actionType.code}</b> {recommendation.actionType.name}.</i></td></tr>
{end:}
</table>
<HR>
<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body>

<!--НОВАЯ СТРАНИЦА-->
<p style="page-break-after: always"></p>
<body>
<table width=100%>
<tr><td align=left><img src="blank/image/LOGO.JPG"></td>
<td width=90% align=center><b><big>{currentOrganisation.fullName} </b></big>
<br>
<br>
<b>{if: action.name.find("МЦ:")>=0}
Консультативно-диагностический центр. Амбулаторное отделение №1</b> <br>
ул. Красного Текстильщика, д.10-12, лит. В
{elif: action.name.find("ЦнМ:")>=0}
Консультативно-диагностический центр. Амбулаторное отделение №2</b> <br>
Моравский пер., д.5, лит. А
{else:}
({currentOrganisation.shortName})</b> <br>
{currentOrganisation.address}
{end:}<br>
телефон {currentOrganisation.phone} Факс: (812) 596-8947. Эл.почта: oncl@rion.spb.ru <br>
www.niioncologii.ru <br>
ИНН {currentOrganisation.INN} КПП {currentOrganisation.KPP}
</td></tr>
<br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr>
<td width=40% align=left>г.Санкт-Петербург</td> <td width=60% align=right>{action.endDate.date.toString(u"dd MMMM yyyy г.")}</td></tr>
<br>
<tr><td colspan=2 align=center><big><b>КОНСУЛЬТАТИВНОЕ ЗАКЛЮЧЕНИЕ</b></big></td></tr>
ПО МЕСТУ ТРЕБОВАНИЯ
<br>
<tr><td colspan=2><b>Ф.И.О. </b>{client.fullName} <b>Дата рождения: </b> {client.birthDate}</td></tr></table>
<HR>
<table cellpadding=0 cellspacing=0 width=100%>
{if: action[u"Основное заболевание"].value}<b>Основное заболевание: </b>{action[u"Основное заболевание"]:n}<br>
{end:}
{if: action[u"Осложнения основного заболевания"].value}<b>Осложнения основного заболевания: </b>{action[u"Осложнения основного заболевания"]:n}<br>
{end:}
{if: action[u"Сопутствующие заболевания"].value}<b>Сопутствующие заболевания: </b>{action[u"Сопутствующие заболевания"]:n}<br>
{end:}
{if: action[u"Осложнения сопутствующего заболевания"].value}<b>Осложнения сопутствующего заболевания: </b>{action[u"Осложнения сопутствующего заболевания"]:n}<br>{end:}
{if: action[u"Жалобы"].value}<b>Жалобы: </b>{action[u"Жалобы"] :n}<br>
{end:}
<b>Страховой анамнез: </b>
<br>
{if: action[u"Страховой анамнез: работает (указать профессию)"].value}<b>Работает </b>{action[u"Страховой анамнез: работает (указать профессию)"] :n}.{end:} {if: action[u"Страховой анамнез: является инвалидом (указать группу)"].value}<b>Является инвалидом: </b>{action[u"Страховой анамнез: является инвалидом (указать группу)"] :n}<br>
{end:}
{if: action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"].value}<b>По данному заболеванию листок нетрудоспособности </b>{action[u"По данному заболеванию листок нетрудоспособности (с ___по ___, ___дней)"] :n}<br>
{end:}
{if: action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"].value}<b>Первичный листок нетрудоспособности </b>{action[u"Первичный листок нетрудоспособности  (с ___по ___, ___ дней)"] :n}<br>
{end:}
{if: action[u"Остается"].value}<b>Остается </b>{action[u"Остается"] :n}<br>
{end:}
{if: action[u"Нуждается в выдаче листка нетрудоспособности"].value}<b>Нуждается в выдаче листка нетрудоспособности </b>{action[u"Нуждается в выдаче листка нетрудоспособности"] :n}<br>{end:}
{if: action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"].value}<b><u>Прошу продлить(выдать)листок нетрудоспособности </u>{action[u"Прошу продлить(выдать)листок нетрудоспособности (на ___ дней с ___по ___)"] :n}, лечения, обследования, уточнения диагноза, симптоматической терапии</b> (нужное подчеркнуть) <br>{end:}
{if: action[u"Анамнез заболевания"].value}<b>Анамнез заболевания: </b>{action[u"Анамнез заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"].value}<b>Перенесенные инфекционные заболевания: </b>{action[u"Анамнез Vitae: Перенесенные инфекционные заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Хронические заболевания"].value}<b>Хронические заболевания: </b>{action[u"Анамнез Vitae: Хронические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Аллергические реакции"].value}<b>Аллергические реакции: </b>{action[u"Анамнез Vitae: Аллергические реакции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Травмы/хирургические операции"].value}<b>Травмы/хирургические операции: </b>{action[u"Анамнез Vitae: Травмы/хирургические операции"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Перенесенные онкологические заболевания"].value}<b>Перенесенные онкологические заболевания: </b>{action[u"Анамнез Vitae: Перенесенные онкологические заболевания"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Онкологические заболевания в семье"].value}<b>Онкологические заболевания в семье: </b>{action[u"Анамнез Vitae: Онкологические заболевания в семье"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные привычки"].value}<b>Вредные привычки: </b>{action[u"Анамнез Vitae: Вредные привычки"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Вредные факторы труда"].value}<b>Вредные факторы труда: </b>{action[u"Анамнез Vitae: Вредные факторы труда"] :n}<br>
{end:}
{if: action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"].value}<b>Акушерский/Гинекологический анамнез: </b>{action[u"Анамнез Vitae: Акушерский/Гинекологический анамнез"] :n}<br>
{end:}
{if: action[u"Объективный статус"].value}<b>Объективный статус: </b>{action[u"Объективный статус"] :n}<br>
{end:}
{if: action[u"Получаемое пациентом(кой) лечение"].value and action[u"Получаемое пациентом(кой) лечение"].value!=u''со слов пациента, не получает''}<b>Получаемое пациентом(кой) лечение:  </b>{action[u"Получаемое пациентом(кой) лечение"]:n}<br>
{end:}
{if: action[u"Рекомендации"].value}<b>Рекомендации: </b>{action[u"Рекомендации"] :n}<br>{end:}
{if: action[u"Рекомендации по обследованию"].value}<b>Рекомендации по обследованию: </b>{action[u"Рекомендации по обследованию"] :n}<br>
{end:}
{if: action[u"Рекомендации по лечению"].value}<b>Рекомендации по лечению: </b>{action[u"Рекомендации по лечению"] :n}<br>
{end:}
{:l = [x for x in action if x.value]}
{for: i, prop in enumerate(l) }
{if: prop.name == u"Медикаментозные назначения"}
<b>Рекомендации по медикаментозной терапии: </b>
{: rlsList = prop.value if isinstance(prop.value, list) else [prop.value]}
{for: rls in rlsList}<br>
{rls.rls.tradeName},{rls.form},{rls.amount},{rls.note}{end:}{end:}{end:}<br>
{if: action[u"Рекомендации по изменению образа жизни"].value}<b>Рекомендации по изменению образа жизни: </u></b>{action[u"Рекомендации по изменению образа жизни"] :n}<br>
{end:}
{if: action[u"Протокол"].value and action[u"Протокол"].value!=action[u"Объективный статус"].value}<b>Протокол: </b>{action[u"Протокол"] :n}{end:}
{for: prop2 in action}{if: prop2.value and prop2.name=="Заключение"}<b>{prop2.name}: </b>{prop2.value :n}<br>{end:}{end:}
<HR>
Исследования и манипуляции, рекомендуемые для <b><u>ЗАПИСИ:</u></b>
<table width=100%>
{for:recommendation in event.recommendations}
<tr><td align=left><i><b>{recommendation.actionType.code}</b> {recommendation.actionType.name}.</i></td></tr>
{end:}
</table>
<HR>
Врач_________________/ {action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}<br>
__________________________________<br>
<small>МП/личная печать врача/</small>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '7', 'Памятка пациенту по эфферентной терапии', 'cons_red_new_rls_sms5', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body>
<table width=100%>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td width=90% align=center><b><big>Уважаемый пациент(ка). </b></big><br>
Для Вас в ФГБУ "НМИЦ онкологии им. Н.Н. Петрова" Минздрава России открыт ЦЕНТР ЭФФЕРЕНТНОЙ ТЕРАПИИ </td></tr>
</table>
<br>
<br>
<tr>
<td width=100% align=left>
ЭФФЕРЕНТНАЯ ТЕРАПИЯ – группа методов, которые позволяют снизить симптомы эндогенной интоксикации и прервать патологические процессы, ей обусловленные. К ним относятся:<br>
<b>Плазмаферез</b> – удаление части плазмы со всеми патологическими элементами;<br>
<b>Гемосорбция</b> – сорбирование токсинов на специальных фильтрах.<br>
При каждой процедуре провидится обработка всей крови, циркулирующей в организме. Для полной очистки крови и получения длительного эффекта при хронических состояниях необходимо провести не менее 1 процедуры гемосорбции или 3 процедур плазмафереза. В НИИ онкологии им.Н.Н Петрова осуществляется индивидуальный подбор необходимого количества процедур и времени их проведения относительно проводимого противоопухолевого лечения для достижения наилучшего результата терапии.<br>
<i>Зачем нужна очистка крови?</i><br>
Замена плазмы в крови человека (по аналогии с заменой старого масла в двигателе машины) позволяет сохранить органы (детали машины) в хорошем состоянии на более длительный срок. В отличие от машины в человеке заменить старую «деталь» новой почти невозможно. Поэтому следить за собственным здоровьем нужно, по крайней мере, не хуже, чем следовать предписаниям автомеханика машины.<br>
<b>Плазма</b> – это транспортная среда для доставки клеткам всего необходимого для жизни и удаления различного продуктов жизнедеятельности и прочего «мусора». В норме, в молодом возрасте цвет плазмы соответствует цвету мочи и бывает желтым и прозрачным. То есть, органы детоксикации полностью перерабатывают «отходы», переводя их в такие неактивные соединения, которые беспрепятственно фильтруются почками и удаляются с мочой.<br>
С возрастом и на фоне неблагоприятной экологии (у нас в СПб это начинается с 25-30 лет), а также при развитии заболеваний организм не успевает «перерабатывать» весь поток отмирающих клеток, красителей, консервантов, тяжелых металлов и пр., постоянно попадающих в кровь. С этого момента в плазме крови появляется повышенное количество химически активных веществ, так как организм не успевает перерабатывать все химические вещества и переводить в такую форму, чтобы почки могли их выделить наружу. Во время хронических заболеваний нагрузка на системы очистки многократно возрастает, что приводит к их быстрому износу и задержке вредных веществ в организме. При накоплении эти вещества, с одной стороны, ухудшают текучесть крови и ее равномерное распределение по капиллярам и, с другой стороны, затрудняют работу органов, вступая во взаимодействие с ферментами и рецепторами этих органов, «отвлекая» их от выполнения основных функций жизнедеятельности.<br>
Поэтому эти вещества нужно удалять (аналогично частичкам металла, образующимся при трении деталей машины). И именно для этого проводится очистка крови при помощи эфферентной терапии<br>.
<b>Показания к эфферентной терапии:</b><br>
ЭНДОГЕННАЯ ИНТОКСИКАЦИЯ – состояние, характеризующееся накоплением в организме различных продуктов жизнедеятельности клеток и токсических веществ из-за повышенного их образования при различных патологических процессах, таких как:<br>
<i>злокачественных опухолях;</i><br>
<i>инфекциях;</i><br>
<i>аутоиммунных заболеваниях;</i><br>
<i>при проведении токсичного лечения</i><br>
Эндотоксины подавляют работу иммунной и эндокринной систем, затрудняют питание тканей. В результате состояние больного ухудшается и  снижается эффективность проводимого лечения.<br>
Процедура плазмафереза напоминает установку капельницы для внутривенного введения лекарств. Далее из одной руки забирается определенное небольшое количество крови (около 10 мл) и проталкивается насосом через плазмофильтр или сорбент. При этом очищенная кровь возвращаются пациенту. В случае проведения плазмафереза отобранная плазма собирается в специальную емкость. И снова производится забор аналогичного количества крови. При этом пациент не испытывает никаких неприятных ощущений. Он просто отдыхает. Вся процедура плазмафереза занимает в среднем около 2 часов.<br>
На фоне терапии нежелательные явления возникают у 11% пациентов, однако все они быстро и эффективно купируются за 1-2 мин.<br>
Записаться на предварительную консультацию трансфузиолога Вы можете без направления по единому телефону 439-95-55 (работа информационного центра ежедневно с 09.00 до 21.00) либо в регистратуре клинико – диагностического отделения с 08.00 до 18.00 в будние дни и главного корпуса института с 09.00 до 21.00 в будние дни.<br>
Прием  и проведение эфферентной терапии осуществляют врачи – онкологи, трансфузиологи <u>Латипова Д.Х. и Новик А.В.</u><br>
Перед процедурой врач исключает возможные противопоказания и определяет индивидуальный план и количество процедур.<br>
</td></tr>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '8', 'Осмотр (СМС5)', 'cons_red_new_rls_sms5', '', '<html>
<head>
<body style="font-family: Arial; font-size: 9pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2>
<b>Пациент: </b>{client.fullName},<b>{client.birthDate} г. р. ({client.age})</b>
</td></tr>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b>Осмотр: </b>{action.name}
<br>
<b>Врач: </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table style="font-family: Arial; font-size: 9pt; color: black;" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
{for: prop in action}
{if: prop.value}
<TR><TD colspan="3">
<b>{prop.name}: </b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else ''''}
</TD></TR>
{end:}
{end:}
</tbody>
</table>
<HR>
Исследования и манипуляции, рекомендуемые для <b><u>ЗАПИСИ:</u></b>
<table width=100%>
{for:recommendation in event.recommendations}
<tr><td align=left><b><i>{recommendation.actionType.code}</b> {recommendation.actionType.name}.</i></td></tr>
{end:}
</table>
<HR>
<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body></html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '9', 'Протокол инструментального исследования (СМС2)', 'uzi', '', '<html>
<head>
<body style="font-family: Arial; font-size: 9pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2>
<b>Пациент: </b>{client.fullName},<b>{client.birthDate} г. р. ({client.age})</b>
</td></tr>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b>Осмотр: </b>{action.name}
<br>
<b>Врач: </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table style="font-family: Arial; font-size: 9pt; color: black;" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
{for: prop in action}
{if: prop.value}
<TR><TD colspan="3">
<b>{prop.name}: </b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else ''''}
</TD></TR>
{end:}
{end:}
</tbody>
</table>
<HR>

<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body></html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '1', 'КОНСИЛИУМ', 'SMS6', '', '{: from library.Utils import forceString}
{: from PyQt4 import QtGui}
<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body style="font-family: Times New Roman; font-size: 10pх; color: black;">
<FONT FACE="Code 3 de 9" SIZE=+2>*{client.id}*</FONT>  {client.id}<br>
<table width=100%>
<tr>
<td width=10% align=left><img src="blank/image/LOGO.JPG"></td>
<td width=90% align=center><b>
Федеральное государственное бюджетное учреждение<br>
"Национальный медицинский исследовательский центр онкологии имени Н.Н. Петрова" Министерства здравоохранения<br>
Российской Федерации</b><br>
<small>ФГБУ "НМИЦ онкологии им. Н.Н. Петрова" Минздрава России
<hr>
Ленинградская ул, д.68, пос. Песочный, Санкт-Петербург, 197758; тел. (812) 439-9555, факс (812) 596-8947,<br>
e-mail: oncl@rion.spb.ru; https://www.niioncologii.ru ОКПО 01897995; ОГРН {currentOrganisation.OGRN}; ИНН {currentOrganisation.INN}; КПП {currentOrganisation.KPP}</small>
<br>
</td></tr>
<br>
</table>
<table width=100%>
<tr><td width=100% align=center>
<big><b>ОНКОЛОГИЧЕСКИЙ  КОНСИЛИУМ</big></b>
</td></tr>
<tr><td width=100% align=left><b>Ф.И.О. пациента:</b> {client.fullName}, {client.birthDate} г.р.</td></tr>
<tr><td><b>Адрес регистрации по месту жительства, номер телефона:</b><br>
{if: client.regAddress} {client.regAddress}{else:}{client.regAddress.freeInput}{end:}, {u'', ''.join(u''%s'' % (contact) for code, name, contact, notes in client.contacts if code != ''5'')}</td></tr>
<tr><td><b>Адрес фактического проживания:</b><br>
{if: client.locAddress} {client.locAddress} {else:}{client.locAddress.freeInput}{end:}</td></tr>
<HR>
{for: prop in action}
{if: prop.value and prop.name not in (u"Председатель консилиума",u"Председатель",u"Особое мнение (Председатель)",u"Секретарь консилиума",u"Члены консилиума") and not (prop.name==u''Данные о медицинском работнике, установившем диагноз'' and prop.value==''-'')}
<TR> <TD>
<b>{prop.name}:</b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else '''':n}</TD></TR>
{end:}
{end:}
<br>
{if:event.eventType.id!=101}<b>{action.begDate.date.toString("dd.MM.yyyy")}</b>{end:}
<HR>
{:gp=0}
<tr><td>
{for: event in client.events}
{for: act in event.actions}
{if:act.getPrintTemplateContext()=="gist" or act.getPrintTemplateContext()=="gist_oms" }
{if: act[u"Статус заключения"].value=="подписано"}
{if: gp==0}{:gp=1}<b>Гистологическое заключение:  </b>{end:}
Гистологическое заключение № {act[u"№ исследования"].value} ({act.begDate.date.toString(u"dd MMMM yyyy г.")}): {act[u"Гистологическое заключение"].value}.
{if:act[u''Описание дополнительных исследований''].value}  Описание дополнительных исследований: {act[u''Описание дополнительных исследований'']}{end:}<br>{end:}{end:}{end:}{end:}</td></tr>
{if: action[u"Особое мнение (Председатель)"].value and action[u"Особое мнение (Председатель)"].value!=u"нет"}<tr><td><b>Особое мнение (Председатель):</b>{action[u"Особое мнение (Председатель)"]}</td></tr>{end:}
</table>
<table>
<tr><td><b>Председатель:</b></td><td></td></tr><tr><td></td><td>________________________________________________{action[u"Председатель"]}</td></tr>
<tr><td><b>Члены консилиума:</b></td><td></td></tr>{for: p in action[u"Члены консилиума"].value}<tr><td></td><td>________________________________________________{p}</td></tr> {end:}
{if:action[u"Секретарь консилиума"].value}<tr><td><b>Секретарь:</b></td><td></td></tr><tr><td></td><td>________________________________________________{action[u"Секретарь консилиума"]}</td></tr>{end:}

</table>
</body>
</html>
', 0, 0, 0, 1, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '1', 'Протокол на случай выявления у больного запущенной формы злокачественного новообразования', 'SMS11', '', '<html>
<head>
<body style="font-family: Arial; font-size: 9pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2>
<b>Пациент: </b>{client.fullName},<b>{client.birthDate} г. р. ({client.age})</b>
</td></tr>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b>{action.name}</b>
<br>
<b>Врач: </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table style="font-family: Arial; font-size: 9pt; color: black;" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
{for: prop in action}
{if: prop.value}
<TR><TD colspan="3">
<b>{prop.name}: </b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else ''''}
</TD></TR>
{end:}
{end:}
</tbody>
</table>
<HR>
<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body></html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '02', 'МЕДИЦИНСКОЕ СВИДЕТЕЛЬСТВО О СМЕРТИ', 'const_death', '', '<html>
<head>
<!--Главный скрипт-->
<!--Конец главного скрипта-->
<meta name="qrichtext" content="1" />
</head>
<body>
<table width=100%>
<tr>
<td align=left><img src="blank/image/LOGO.JPG"></td>
<td width=100% align=center><b><big>{currentOrganisation.fullName} </b></big>
<br>
телефон {currentOrganisation.phone} Факс: (812) 596-8947. Эл.почта: oncl@rion.spb.ru <br>
www.niioncologii.ru <br>
ИНН {currentOrganisation.INN} КПП {currentOrganisation.KPP}
</td>
</tr>
</table>
<table width=100%>
<tr>
<td width=50% align=left>г.Санкт-Петербург</td> <td width=50% align=right>{action.endDate.date.toString(u"dd MMMM yyyy г.")}</td></tr>
</table>
<table width=100%>
<tr><td align="center"><b>МЕДИЦИНСКОЕ СВИДЕТЕЛЬСТВО О СМЕРТИ</b></td></tr>
</table>
<br>
<b>ДАННЫЕ ОБ УМЕРШЕМ: </b>{client.fullName},<b>{client.birthDate} г. р. ({client.age})</b>
</td></tr>
<br>
<b>Врач, ответственный за правильность заполнения медицинских свидетельств: </b>{action.person}
<HR>
<table style="font-family: Arial; font-size: 9pt; color: black;" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
{for: prop in action}
{if: prop.value}
<TR><TD colspan="3">
<b>{prop.name}: </b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else ''''}
</TD></TR>
{end:}
{end:}
</tbody>
</table>
<HR>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}</b>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '02_1_1', 'test - ПРОТОКОЛ_ФОРМА №014-1/у МинЗдрава_1', 'gist', '', '{: jobTicketIdList = [p._property.getValue() for p in action if p._property.type().typeName == ''JobTicket'']}
<HTML>
<BODY>
{:
from PyQt4 import QtGui
from Orgs.Utils import COrgStructureInfo
from library.Utils import forceString, forceDate

app = QtGui.qApp
db = app.db

def get_org_path(os_id):
    return forceString(db.selectExpr(db.func.getOrgStructurePath(os_id)).value(0))

def get_real_orderer(event):
    ctx = event.context
    person = event.execPerson
    org_structure = person.orgStructure
    event_type = event.eventType
    KDO_id = 152

    os_id = org_structure.id
    os_path = get_org_path(os_id)
    if not os_path or u''ГОСПИТАЛИЗАЦИЯ'' in event_type.name:
        return ctx.getInstance(COrgStructureInfo, os_id)
    root_id = int(os_path.split(''.'')[0])
    root = ctx.getInstance(COrgStructureInfo, root_id)
    if root.code == u''Институт'':
        return ctx.getInstance(COrgStructureInfo, KDO_id)
    return root

org_structure = get_real_orderer(event)

call = u"SELECT   DATE(ttj.datetimeTaken) AS ''date'', TIME(ttj.datetimeTaken) AS ''time''  FROM TakenTissueJournal ttj   INNER JOIN Action a     ON ttj.id = a.takenTissueJournal_id WHERE ttj.deleted = 0  AND a.id = aiid ORDER BY ttj.id DESC LIMIT 1;"

call = call.replace(u"aiid", str(action.id))

myquery = db.query(call)

myquery.next()
}




<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 8pt; color: black">
<TR><TD align="left" COLSPAN=3><b>{currentOrganisation.fullName}</b></TD><BR/>
<b>{currentOrganisation.address}</b></TD></TR>
<TR><TD align="right" COLSPAN=5>Код формы по ОКУД__________</TD></TR>
<TR><TD align="right" COLSPAN=5>Код учреждения по ОКПО______________</TD></TR>
<TR><TD align="right" COLSPAN=5>Медицинская документация</TD></TR>
<TR><TD align="right" COLSPAN=5>Учетная форма N 014-1/у</TD></TR>
<TR><TD align="right" COLSPAN=5>Утверждена приказом Минздрава России</TD></TR>
<TR><TD align="right" COLSPAN=5>от "24" марта 2016 г. N 179н</TD></TR>
</TABLE>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=center>ПРОТОКОЛ<br>ПРИЖИЗНЕННОГО ПАТОЛОГО-АНАТОМИЧЕСКОГО ИССЛЕДОВАНИЯ<br>БИОПСИЙНОГО (ОПЕРАЦИОННОГО) МАТЕРИАЛА</td></tr><br>
</table>
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align=left>
1. Отделение, направившее биопсийный (операционный) материал <b>{org_structure.name}</b><br>
2. Фамилия, имя, отчество (при наличии) пациента <b>{client.fullName}</b><br>
3. Пол: <b>{u"М" if client.sexCode == 1 else u"Ж"}</b>, 4. Дата рождения: число<b> {client.birthDate.date.day()}</b> месяц <b>{client.birthDate.date.month()}</b> год <b>{client.birthDate.date.year()}</b><br>
5. Полис ОМС {client.policy.serial} {client.policy.number} 6. СНИЛС <b>{client.SNILS}</b><br>
7. Место регистрации: <b>{if: client.regAddress} {client.regAddress}{else:} {client.regAddress.freeInput}{end:}</b>, тел. <b>{u'', ''.join(u''%s'' % (contact) for code, name, contact, notes in client.contacts if code != ''5'')}</b><br>
8. Местность: {if:(str(client.regAddress.KLADRCode)[8:11])==''000''}<u><b> городская - 1</u></b>, сельская - 2{else:} городская - 1,<u><b> сельская - 2</u></b>{end:}<br>
9. Диагноз заболевания (состояния) по данным направления {if: action[u"Клинический диагноз"]} <b>{action[u"Клинический диагноз"]}</b>{end:} {action._record.value(''MKB'').toString()}<br>
10. Код по МКБ* <big><b>{action.MKB.descr}</b></big><br>
<hr>
11. Дата забора материала по данным направления {action[u"Дата забора биоматериала"]} время {action[u"Время забора биоматериала"]}<br>
12. Материал доставлен в 10%-ный раствор нейтрального формалина <b>{if:action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value.find(u"1")>=0}да{elif:action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value.find(u"0")>=0}нет{else:}{action[u"Материал доставлен в 10%-ный раствор нейтрального формалина (да/нет)"].value}{end:}</b><br>
загрязнен <b>{if:action[u"загрязнен (да/нет)"].value.find(u"1")>=0}да{elif:action[u"загрязнен (да/нет)"].value.find(u"0")>=0}нет{else:}{action[u"загрязнен (да/нет)"].value}{end:}</b><br>
13. Дата поступления биопсийного (операционного) материала: дата {if: myquery.value(0)} { forceDate(myquery.value(0)).toString(''dd.MM.yyyy'') } {else:}________________ {end:}, время {if: myquery.value(1)} { myquery.value(1).toString() } {else:}________________ {end:}<br>
14. Отметка о сохранности упаковки{if:action[u"Отметка о сохранности упаковки"].value}<u>  {action[u"Отметка о сохранности упаковки"].value}  </u>{else:}______________________________________{end:}<br>
15. Дата регистрации биопсийного (операционного) материала: дата {if: myquery.value(0)} { forceDate(myquery.value(0)).toString(''dd.MM.yyyy'') } {else:}________________ {end:}, время {if: myquery.value(1)} { myquery.value(1).toString() } {else:}________________ {end:}<br>
16. Регистрационный номер <big><b>{action[u"№ исследования"]}</b></big><br>
17. Медицинские услуги: <br>
{for: evgist in client.events}{for: act in evgist.actions}{if: act.name.find(u''Гистология'')>=0 or act.name.find(u''Патолого-анатомическое исследование биопсийного'')>=0}{if: act[u"№ исследования"].value and (action[u"№ исследования"]==act[u"№ исследования"]  or jobTicketIdList == [p._property.getValue() for p in act  if p._property.type().typeName == ''JobTicket''])}
<b>код</b> {act.code} <b>кол-во</b> {act.amount}<br>
{end:}{end:}{end:}{end:}
18. Категория сложности (1-5) {if:action[u"Категория сложности"].value}<u> {action[u"Категория сложности"]}</u>{else:} ________{end:}<br>
19. Вырезка проводилась:
{if:action[u"Вырезка проводилась дата, время"].value}
<b>дата </b><u>{action[u"Вырезка проводилась дата, время"].value[6:8]}.{action[u"Вырезка проводилась дата, время"].value[4:6]}.{action[u"Вырезка проводилась дата, время"].value[0:4]}</u>
<b>, время </b><u>{action[u"Вырезка проводилась дата, время"].value[8:10]}:{action[u"Вырезка проводилась дата, время"].value[10:12]} </u>
{else:}<b>дата ________________, время________</b> {end:}<br>
20. В проводку взято: {action[u"Количество блоков"]} объектов<br>
21. Назначенные окраски (реакции, определения): {action[u"Назначенные окраски"]}<br>
{if: action[u"Статус заключения"] ==  u"подписано"}
22. <b>Макроскопическое описание:</b> {action[u"Макроописание"]}<br>
23. <b>Микроскопическое описание:</b> {action[u"Микроописание"]}<br>
24. <b>Заключение:</b> {action[u"Гистологическое заключение"]}<br>
{else:}{end:}
25. Код по МКБ: <b>{if:action[u"Онкошифр"].value}{action[u"Онкошифр"]}{end:}</b><br>
26. <b>Комментарии к заключению и рекомендации:</b> {action[u"Описание дополнительных исследований"]}<br>
27. Прижизненное патолого-анатомическое исследование выполнили:
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td>
<b>Врач-патологоанатом</b> {action.person.shortName}</td><td><br>___________________________<br><small>(подпись)</small><br>М.П.
</td></tr>
<tr><td><b>Врач-специалист,<br>
осуществляющий консультирование</b>
{if:action[u"Врач-специалист, осуществляющий консультирование"].value}<u>  {action[u"Врач-специалист, осуществляющий консультирование"].value}  </u>{else:}
___________________________{end:}</td><td><br> ___________________________<br><small>(подпись)</small><br>М.П.
</td></tr>
</table>
28. Дата проведения прижизненного патолого-анатомического исследования: <b>{action.endDate.date.toString(u"dd.MM.yyyy г.")}</b>
<hr>
{if: action[u"Подписано ЭЦП"] == u"да"}
<br><br>
<table cellpadding=2 cellspacing=2 border=1 width=100%>
<tr><td align=center>
Подлинник электронного документа, подписанного ЭП, хранится в лабораторной информационной системе ЛабФорс патологоанатомического отделения НМИЦ онкологии им. Н. Н. Петрова
<br>
<b>Сведения о сертификате ЭП</b><br>
Кому выдан: {action.person.fullName}<br>
Серийный номер: {action.person.federalCode}<br>
Действителен: {action.person.birthPlace}</td></tr></table>
{else:} {end:}
</body>
</html>
', 2, 0, 2, 0, null, 1, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '1', 'Назначение лекарственных препаратов', 'drug_theraphy', '', '<html>
<head>
<body style="font-family: Arial; font-size: 10pt; color: black;">
{setPageSize(''A4'')}
{setOrientation(''P'')}
{:setTopMargin(5)}
{:setLeftMargin(20)}
<tr><td colspan=2>
<b>Пациент: </b>{client.fullName},<b>{client.birthDate} г. р. ({client.age})</b>
</td></tr>
<b>Дата: </b>{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br>
<b>{action.name}</b>
<br>
<b>Врач: </b>{action.person}{if:action.person.birthPlace},{action.person.birthPlace}{end:}
<HR>
<table style="font-family: Arial; font-size: 10pt; color: black;" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
{for: prop in action}
{if: prop.value}
<TR><TD colspan="3">
<b>{prop.name}: </b>
{('', ''.join(unicode(p) for p in prop.value) if isinstance(prop.value, list) else prop.value) if prop.value else ''''}
</TD></TR>
{end:}
{end:}
</tbody>
</table>
<HR>
<B>Врач:____________________/</B><u>{action.person.shortName}</u><b>/</b>
</body></html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '6', 'ПАМЯТКА ПАЦИЕНТУ по подготовке к сдаче биоматериала', 'cons_red_new_rls_sms5', '', '<!doctype html>
<html>
<head>
<meta charset="utf-8">
{:dial = dialogs.dialMultiList(u"Выберите шаблон", [u"Моча",
u"Кровь",
u"Кал на наличие скрытой крови"], 0) }
{: valueses = dial.getVar()}
<!--Конец главного скрипта-->
</head>
{: firstPage = True}
{for: (i,j) in enumerate(valueses)}
{if: not firstPage}
<!--НОВАЯ СТРАНИЦА-->
<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
{end:}
{: firstPage = False}
{if: j ==0}
<body style=" font-family:''Arial''; font-size:11px; font-weight:400; font-style:normal;">
{ setPageSize(''A4'') }
{ setOrientation(''P'') }
{ setTopMargin(10) }
{ setLeftMargin(10) }
{ setRightMargin(10) }
<table   width=100%   border="0" cellpadding=3 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td>
<center>
<b>ПАМЯТКА ПАЦИЕНТУ<br>
по подготовке к сдаче мочи <br>
для клинических лабораторных исследований<br>
</b>
</center>
<ol>
<li>Рекомендуется собирать утреннюю мочу, выпущенную при свободном мочеиспускании. Желательно, чтобы предыдущее мочеиспускание было не позднее, чем в 2:00 часа ночи.</li>
<li>Накануне дня сбора мочи РЕКОМЕНДУЕТСЯ: <br>
ИСКЛЮЧИТЬ:
<ul>
<li>острую, соленую, копченую пищу</li>
<li>овощи и фрукты, которые могут изменить цвет мочи (свекла, морковь, клюква, виноград темных сортов и пр.)</li>
<li>тяжелые физические нагрузки</li>
<li>посещение бани (сауны)</li>
<li>прием алкоголя</li>
</ul>
СОБЛЮДАТЬ ПРИВЫЧНЫЙ ПИТЬЕВОЙ РЕЖИМ</li>
<li>УТРЕННИЙ ПРИЕМ ЛЕКАРСТВЕННЫХ ПРЕПАРАТОВ ОСУЩЕСТВЛЯЙТЕ ТОЛЬКО ПОСЛЕ СБОРА МОЧИ!</li>
<li>Перед сбором мочи необходимо провести тщательный туалет наружных половых органов (промыв их под душем с мылом), чтобы во время мочеиспускания в мочу не попали выделения из половых органов. Женщинам рекомендуется использовать влагалищный тампон.</li>
<li>Женщинам не рекомендуется сдавать мочу на анализ во время менструации.</li>
<li>Лежачего больного перед сбором мочи необходимо подмыть, промежность вытереть сухим стерильным ватным тампоном в направлении от половых органов к заднему проходу. Собирая мочу, необходимо следить, чтобы сосуд был расположен выше промежности – во избежание загрязнения из области анального отверстия.</li>
<li>Моча, собранная <i>для общего анализа</i>, может храниться при комнатной температуре не более 2-х часов.</li>
<li>Не рекомендуется собирать в один день мочу для двух разных исследований, например, для общего анализа мочи и анализа мочи по Земницкому.</li>
<li>Для контроля лабораторных показателей в динамике рекомендуется проводить повторные исследования в одинаковых условиях: в одной лаборатории; сбор мочи осуществлять в одно и то же время суток.</li>
</ol>
</td></tr></table>
</body>
{end:}
{if: j ==1}
<body style=" font-family:''Arial''; font-size:11px; font-weight:400; font-style:normal;">
{ setPageSize(''A4'') }
{ setOrientation(''P'') }
{ setTopMargin(10) }
{ setLeftMargin(10) }
{ setRightMargin(10) }
<table   width=100%   border="0" cellpadding=3 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td>
<center>
<b>ПАМЯТКА ПАЦИЕНТУ<br>
по подготовке к сдаче крови <br>
для клинических лабораторных исследований<br>
</b>
</center>
<ol>
<li>ЗАПРЕЩАЕТСЯ сдавать кровь для лабораторного исследования в день после рентгенологического и эндоскопического обследования, физиотерапевтических процедур, массажа и других медицинских вмешательств.</li>
<li>Рекомендуется сдавать кровь в период с 8 до 11 часов утра, натощак (не менее 8-10 часов голодания).</li>
<li>Накануне сдачи крови РЕКОМЕНДУЕТСЯ: <br>
ИСКЛЮЧИТЬ:
<ul>
<li>жирную и жаренную пищу</li>
<li>тяжелые физические нагрузки </li>
<li>прием алкоголя </li>
<li>эмоциональные стрессы</li>
</ul>
НЕ КУРИТЬ не менее 2 часов до взятия крови
</li>
<li>Рекомендуется соблюдать ПРИВЫЧНЫЙ ПИТЬЕВОЙ РЕЖИМ. В день взятия крови допускается прием кипяченой воды.</li>
<li>В случае приема лекарственного препарата:
<ul>
<li>проконсультируйтесь с врачом по поводу целесообразности проведения исследования на фоне приема лекарственного препарата или о возможности отмены приема препарата перед сдачей крови</li>
<li>утренний прием лекарственного препарата осуществляйте только после взятия крови</li>
<li>если вы приняли лекарственный препарат в день взятия крови, то обязательно проинформируйте об этом медицинского работника, осуществляющего процедуру.</li>
</ul>
</li>
<li>Рекомендуется отдохнуть (лучше - посидеть) около 10-20 минут после прихода в пункт сдачи крови до осуществления процедуры взятия крови</li>
<li>Для контроля лабораторных показателей в динамике рекомендуется проводить повторные исследования в одинаковых условиях: в одной лаборатории; сдавать кровь в одно и то же время суток.</li>
</ol>
</td></tr></table>
</body>
{end:}
{if: j ==2}
<body style=" font-family:''Arial''; font-size:11px; font-weight:400; font-style:normal;">
{ setPageSize(''A4'') }
{ setOrientation(''P'') }
{ setTopMargin(10) }
{ setLeftMargin(10) }
{ setRightMargin(10) }
<table   width=100%   border="0" cellpadding=3 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td>
<center>
<b>ПАМЯТКА ПАЦИЕНТУ<br>
по подготовке к сдаче кала <br>
для исследования на наличие скрытой крови<br>
</b>
</center>
<br>
<b>ВНИМАНИЕ! Для получения достоверных результатов НЕЛЬЗЯ сдавать кал при кровотечениях (геморрой, менструация и т.п.).</b>
<ol>
<li>НЕ РЕКОМЕНДУЕТСЯ проводить сбор кала для анализа на наличие скрытой крови в течение 2-х недель после инструментальных исследований желудочно-кишечного тракта (колоноскопия, ректороманоскопия и т.д.) или медицинских процедур (очищение кишечника с помощью клизм и т.п.).</li>
<li>В случае применения лекарственных препаратов, повышающих риск кровотечения (например, нестероидные противовоспалительные препараты), следует обсудить порядок проведения исследования с лечащим врачом.</li>
<li>НЕ ТРЕБУЕТСЯ специальных ограничений в диете накануне и в день сбора кала. </li>
<li>Накануне сбора кала ЗАПРЕЩАЮТСЯ анальные половые контакты</li>
<li>В день сбора кала НЕ РЕКОМЕНДУЕТСЯ чистить зубы щеткой, можно прополоскать рот раствором соды.</li>
<li>Перед сбором кала необходимо провести гигиенические процедуры БЕЗ ИСПОЛЬЗОВАНИЯ душистых мыльных и косметических средств, масел.</li>
<li>До сбора кала на исследование необходимо помочиться в унитаз. Далее путем естественной дефекации в чистое подкладное судно собрать испражнения (следить чтобы не попала моча). <br>
В стерильный контейнер одноразовой ложечкой собрать из ТРЕХ РАЗНЫХ УЧАСТКОВ кал в количестве не менее 50 грамм.
</li>
<li>Доставить контейнер с калом в лабораторию НЕ ПОЗДНЕЕ 12 часов после дефекации. До транспортировки материал должен храниться при температуре от +4 до +6 С&#176;.</li>
</ol>
</td></tr></table>
</body>
{end:}
{end:}
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '4', 'ЗАПРЕТ
на разглашение сведений, составляющих врачебную тайну_ПАЦИЕНТ', 'cons_red_new_rls_sms5', '', '<!doctype html>
<html>
<head>
<meta charset="utf-8">
<body style=" font-family:''Arial''; font-size:11px; font-weight:400; font-style:normal;">
{ setPageSize(''A4'') }
{ setOrientation(''P'') }
{ setTopMargin(10) }
{ setLeftMargin(10) }
{ setRightMargin(10) }
<table   width=100%   border="0" cellpadding=0 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td align = right>
ФГБУ «НМИЦ онкологии им. Н.Н. Петрова» Минздрава России
от <b>{client.fullName}</b><br>
Паспорт гражданина: <b>{client.document.type} {client.document.origin}, {client.document.date}</b><br>
Серия паспорта: <b>{client.document.serial}</b><br>
Номер паспорта: <b>{client.document.number}</b><br>
Место жительства (пребывания): <b>{if: client.locAddress} {client.locAddress} {else:}{client.locAddress.freeInput}{end:}</b><br>
Телефон, адрес электронной почты (при наличии): <b>{u'', ''.join(u''%s: %s %s'' % (name, contact, notes) for code, name, contact, notes in client.contacts if code == ''5'' or ''1'')}</b><br>
</td></tr>
<tr><td align = center>
<b>ЗАПРЕТ<br>
на разглашение сведений, составляющих врачебную тайну
</b>
</center>
</td></tr>
</table>
<table   width=100%   border="0" cellpadding=3 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td align = left>
Работником ФГБУ «НМИЦ онкологии им. Н.Н. Петрова» Минздрава России мне разъяснены положения части 3.1 статьи 13, а также частей 3 - 5 статьи 22 Федерального закона от 21.11.2011 № 323-ФЗ «Об основах охраны здоровья граждан в Российской Федерации» (далее – Закон №323-ФЗ), согласно которым:<br>
<i>
- После смерти гражданина допускается разглашение сведений, составляющих врачебную тайну, супругу (супруге), близким родственникам (детям, родителям, усыновленным, усыновителям, родным братьям и родным сестрам, внукам, дедушкам, бабушкам) либо иным лицам, указанным гражданином или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, по их запросу, <u>если гражданин или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 3.1 ст. 13 Закона №323-ФЗ);</u><br>
 - Информация о состоянии здоровья не может быть предоставлена пациенту против его воли. В случае неблагоприятного прогноза развития заболевания информация должна сообщаться в деликатной форме гражданину или его супругу (супруге), одному из близких родственников (детям, родителям, усыновленным, усыновителям, родным братьям и родным сестрам, внукам, дедушкам, бабушкам), <u>если пациент не запретил сообщать им об этом и (или) не определил иное лицо, которому должна быть передана такая информация (ч. 3 ст. 22 Закона №323-ФЗ);</u><br>
- Супруг (супруга), близкие родственники (дети, родители, усыновленные, усыновители, родные братья и родные сестры, внуки, дедушки, бабушки) либо иные лица, указанные пациентом или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, имеют право непосредственно знакомиться с медицинской документацией пациента, в том числе после его смерти, <u>если пациент или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 4 ст. 22 Закона № 323-ФЗ);</u><br>
- Супруг (супруга), близкие родственники (дети, родители, усыновленные, усыновители, родные братья и родные сестры, внуки, дедушки, бабушки) либо иные лица, указанные пациентом или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, имеют право получать медицинские документы (их копии) и выписки из них, в том числе после его смерти, <u>если пациент или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 5 ст. 22 Закона № 323-ФЗ).</u></i> <br>
<b>Получив вышеуказанные разъяснения, я ЗАПРЕЩАЮ федеральному государственному бюджетному учреждению «Национальный медицинский исследовательский центр онкологии имени Н.Н. Петрова» Министерства здравоохранения Российской Федерации (ИНН 7821006887) разглашать сведения, составляющие врачебную тайну обо мне</b><br>
<hr>
<small align=center>(Ф.И.О., дата рождения пациента)
</small>
<br>
<br>
Приложение: документы, подтверждающие полномочия законного представителя, подписывающего заявление (в том случае, если заявление подписывается законным представителем).<br>
</td></tr>
<tr><td align=left>
{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br><br>
 _______________________________/{client.shortName}<br>
<small> Подпись пациента/Инициалы и фамилия </small>
</td></tr>
</table>
</body>
</html>

', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0),
        ('2021-12-03 17:35:35', null, '2021-12-03 17:35:35', null, '5', 'ЗАПРЕТ
на разглашение сведений, составляющих врачебную тайну_ПРЕДСТАВИТЕЛЬ', 'cons_red_new_rls_sms5', '', '<!doctype html>
<html>
<head>
<meta charset="utf-8">
<body style=" font-family:''Arial''; font-size:11px; font-weight:400; font-style:normal;">
{ setPageSize(''A4'') }
{ setOrientation(''P'') }
{ setTopMargin(10) }
{ setLeftMargin(10) }
{ setRightMargin(10) }
<table   width=100%   border="0" cellpadding=0 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td align = right>
ФГБУ «НМИЦ онкологии им. Н.Н. Петрова» Минздрава России
от _________________________________________________________________________________<br>
Паспорт гражданина:_______________________________<br>
Серия паспорта:_______________________________<br>
Номер паспорта:_______________________________<br>
Место жительства (пребывания):_______________________________	<br>
Телефон, адрес электронной почты (при наличии):_______________________________<br>
</td></tr>
<tr><td align = center>
<b>ЗАПРЕТ<br>
на разглашение сведений, составляющих врачебную тайну
</b>
</center>
</td></tr>
</table>
<table   width=100%   border="0" cellpadding=3 cellspacing=0   style="font-family:''Times New Roman''; font-size:12pt; font-weight:300; font-style:normal;">
<tr><td align = left>
Работником ФГБУ «НМИЦ онкологии им. Н.Н. Петрова» Минздрава России мне разъяснены положения части 3.1 статьи 13, а также частей 3 - 5 статьи 22 Федерального закона от 21.11.2011 № 323-ФЗ «Об основах охраны здоровья граждан в Российской Федерации» (далее – Закон №323-ФЗ), согласно которым:<br>
<i>
- После смерти гражданина допускается разглашение сведений, составляющих врачебную тайну, супругу (супруге), близким родственникам (детям, родителям, усыновленным, усыновителям, родным братьям и родным сестрам, внукам, дедушкам, бабушкам) либо иным лицам, указанным гражданином или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, по их запросу, <u>если гражданин или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 3.1 ст. 13 Закона №323-ФЗ);</u><br>
 - Информация о состоянии здоровья не может быть предоставлена пациенту против его воли. В случае неблагоприятного прогноза развития заболевания информация должна сообщаться в деликатной форме гражданину или его супругу (супруге), одному из близких родственников (детям, родителям, усыновленным, усыновителям, родным братьям и родным сестрам, внукам, дедушкам, бабушкам), <u>если пациент не запретил сообщать им об этом и (или) не определил иное лицо, которому должна быть передана такая информация (ч. 3 ст. 22 Закона №323-ФЗ);</u><br>
- Супруг (супруга), близкие родственники (дети, родители, усыновленные, усыновители, родные братья и родные сестры, внуки, дедушки, бабушки) либо иные лица, указанные пациентом или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, имеют право непосредственно знакомиться с медицинской документацией пациента, в том числе после его смерти, <u>если пациент или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 4 ст. 22 Закона № 323-ФЗ);</u><br>
- Супруг (супруга), близкие родственники (дети, родители, усыновленные, усыновители, родные братья и родные сестры, внуки, дедушки, бабушки) либо иные лица, указанные пациентом или его законным представителем в письменном согласии на разглашение сведений, составляющих врачебную тайну, или информированном добровольном согласии на медицинское вмешательство, имеют право получать медицинские документы (их копии) и выписки из них, в том числе после его смерти, <u>если пациент или его законный представитель не запретил разглашение сведений, составляющих врачебную тайну (ч. 5 ст. 22 Закона № 323-ФЗ).</u></i> <br>
<b>Получив вышеуказанные разъяснения, я ЗАПРЕЩАЮ федеральному государственному бюджетному учреждению «Национальный медицинский исследовательский центр онкологии имени Н.Н. Петрова» Министерства здравоохранения Российской Федерации (ИНН 7821006887) разглашать сведения, составляющие врачебную тайну о пациенте</b><br>
<hr>
<small align=center>(Ф.И.О., дата рождения пациента)
</small>
<br>
<br>
Приложение: документы, подтверждающие полномочия законного представителя, подписывающего заявление (в том случае, если заявление подписывается законным представителем).<br>
</td></tr>
<tr><td align=left>
{action.endDate.date.toString(u"dd MMMM yyyy г.")}
<br><br>
 _______________________________/_______________________<br>
<small> Подпись законного представителя/Инициалы и фамилия </small>
</td></tr>
</table>
</body>
</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 0, 0, 'P', 0);