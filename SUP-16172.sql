INSERT INTO s11.rbPrintTemplate
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb)
VALUES(NOW(), NULL, NOW(), NULL, '16042', 'QR-Code Пациент', 'QR', '', '<html>

<head>
    {setPageSize(''A5'')}
    {setOrientation(''P'')}
    {setLeftMargin(15)} {setTopMargin(15)} {setBottomMargin(15)} {setRightMargin(15)}
    {: from PyQt4 import QtGui }
    {: from library.Utils import forceString }
    {: from library.PrintTemplates import get_qr_code_img_b64}
    {: import base64 }
    {: db = QtGui.qApp.db }
    {: ref = db.getRecordEx(stmt=u"""
    select CONCAT_WS(''/'', IFNULL(c.lastName,''''), ifnull(c.firstName,''''), ifnull(c.patrName,''''),
    ifnull(DATE_FORMAT(c.birthDate, ''%d.%m.%Y''),''''), CASE when c.sex = 1 then ''Мужской'' when c.sex = 2 then ''Женский'' else
    '''' end,
    ifnull(c.SNILS,''''), ifnull(cd.serial,''''),ifnull(cd.`number`,''''), ifnull(cp.`number`,''''),
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = ''String'' then aps.value
    when apt.typeName = ''Date'' then apd.value
    when apt.typeName = ''Integer'' then api.value
    when apt.typeName = ''Temperature'' then apt2.value
	when apt.typeName = ''Reference'' then if(apt.valueDomain !=''SpravYesNo'', apr.value, (SELECT syn.code FROM SpravYesNo syn where syn.id = apr.value)) end, '''') separator ''/''), ''''),
    ifnull(rdt.code,''''),ifnull(DATE_FORMAT(cd.`date`, ''%d.%m.%Y''),''''),ifnull(rpk.code,''''),ifnull(ns.SMOCOD,''''),
    ifnull(p2.lastName ,''''),ifnull(p2.firstName ,''''),ifnull(p2.patrName ,''''),ifnull(p2.SNILS ,'''')) as `client`
    from Client c
    left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select cd2.id from ClientDocument
    cd2 where cd.client_id = cd2.client_id and cd2.deleted = 0 order by cd2.createDatetime desc LIMIT 1)
    left join ClientPolicy cp on cp.client_id = c.id and cp.deleted = 0 and cp.id = (select cp2.id from ClientPolicy cp2
    where cp2. client_id= cp.client_id and cp2.deleted = 0 ORDER by cp2.createDatetime desc limit 1)
    join Event e on e.client_id = c.id and e.deleted = 0
    join Action a on a.event_id = e.id and a.deleted = 0
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 43222
    JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
    left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id
    left join ActionProperty_String aps on aps.id = ap.id
    left join ActionProperty_Integer api on api.id = ap.id
    left join ActionProperty_Date apd on apd.id = ap.id
    left join ActionProperty_Temperature apt2 on apt2.id = ap.id
    left join ActionProperty_Reference apr on apr.id = ap.id
    join rbDocumentType rdt on rdt.id = cd.documentType_id
    join rbPolicyKind rpk on rpk.id = cp.policyKind_id
    join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
    left join netricaSMO ns on ns.OGRN = o2.OGRN
    join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
    where c.deleted = 0 and e.id = {EventId}""".format(EventId=event.id)) }
    {if: ref }
    {: qr = forceString(ref.value(''client''))}
    {end:}
</head>

<body>
    <table width="100%">
        <tr>
            <td><img src="data:image/png;base64,{get_qr_code_img_b64(base64.b64encode(qr))}" width="250"></td>
            <td></td>
        </tr>
    </table>
</body>

</html>', 0, 0, 0, NULL, 0, 0, '', NULL, 1);






INSERT INTO s11.ActionType
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, defaultBeginDate, refferalType_id)
VALUES(NOW(), NULL, NOW(), NULL, 0, 0, NULL, 'QR', 'QR-Code Пациент', '', '', 0, '', '', 1, 0, NULL, 'QR', 0.0, 0, 2, 2, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, '', 0, 0, 1, NULL);






INSERT INTO s11.ActionPropertyType
(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty)
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 0, NULL, 'Температура', '', '', NULL, 'Temperature', '', NULL, 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 1, 0, 'Общее состояния', '', '', NULL, 'String', '''Удовлетворительное'', ''Неудовлетворительное''', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 2, 0, 'Дыхание', '', '', NULL, 'String', '''Везикулярное'', ''Жесткое''', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 3, 0, 'Хрипы', '', '', NULL, 'String', '''Нет'', ''Сухие рассеянные'', ''Влажные'', ''Крепитирующие''', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 4, 0, 'ЧДД', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 5, 0, 'Сатурация', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 6, 0, 'Сердечный тон', '', '', NULL, 'String', '''Ясные'', ''Приглушены'', ''Глухие''', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 7, 0, 'ЧСС', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 8, 0, 'АД', '', '', NULL, 'String', '', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 9, 0, 'Контакты с инфекционными больными', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 10, 0, 'Болел COVID-19', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 11, 0, 'Прививка от гриппа', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 12, 0, 'Вид прививки', '', '', NULL, 'Reference', 'netricaVaccinationType', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 13, 0, 'Прививка от гриппа (иное)', '', '', NULL, 'String', '', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 14, 0, 'Аллергические реакции', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 15, 0, 'Описание аллергических реакций', '', '', NULL, 'String', '', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 16, 0, 'Прививка от пневмококка', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 17, 0, 'Хронические заболевания бронхолегочной системы', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 18, 0, 'Хронические заболевания сердечно-сосудистой системы', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 19, 0, 'Хронические заболевания эндокринной системы', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 20, 0, 'Онкологические заболевания', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
60UNI51ON
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 21, 0, 'Болезнь, вызванная ВИЧ', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 22, 0, 'Туберкулез', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 23, 0, 'Сифилис', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 24, 0, 'Гепатит', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 25, 0, 'Иные болезни', '', '', NULL, 'String', '', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 26, 0, 'Лекарства за месяц до иммунизации', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 27, 0, 'Принимаемые лекарственные средства', '', '', NULL, 'String', '', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 28, 0, 'Принимаются иммуносупрессивные препараты', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 29, 0, 'Принимаемые препараты', '', '', NULL, 'String', '', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 30, 0, 'Противопоказания к вакцинации', '', '', NULL, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 31, 0, 'Противопоказание', '', '', NULL, 'Reference', 'netricaContraindication', '', 0, '', 0, '', 0)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 32, 0, 'Допуск к вакцинации', '', '', NULL, 'Reference', 'netricaAccessVaccination', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 33, 0, 'Категория гражданства', '', '', NULL, 'Reference', 'netricarbCitizenship', '', 0, '', 0, '', 100)
UNION
VALUES(0, (select id from ActionType where id = LAST_INSERT_ID()), 34, 0, 'Группа риска', '', '', NULL, 'Reference', 'netricaRiskGroup', '', 0, '', 0, '', 100)
UNION
VALUES(1, (select id from ActionType where id = LAST_INSERT_ID()), 35, 0, 'Тип документа', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)
UNION
VALUES(1, (select id from ActionType where id = LAST_INSERT_ID()), 36, 0, 'Дата выдачи документа', '', '', NULL, 'Date', '', '', 0, '', 0, '', 100)
UNION
VALUES(1, (select id from ActionType where id = LAST_INSERT_ID()), 37, 0, 'Тип полиса', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)
UNION
VALUES(1, (select id from ActionType where id = LAST_INSERT_ID()), 38, 0, 'Страховая компания', '', '', NULL, 'Integer', '', '', 0, '', 0, '', 100)


select * from ActionPropertyType apt order by id desc;

select * from rbPrintTemplate rpt where rpt.context = 'qr';


select * from ActionPropertyType apt where apt.actionType_id = 14375;



select * from ActionType at2 order by id desc;



    select CONCAT_WS('/', IFNULL(c.lastName,''), ifnull(c.firstName,''), ifnull(c.patrName,''),
    ifnull(DATE_FORMAT(c.birthDate, '%d.%m.%Y'),''), CASE when c.sex = 1 then 'Мужской' when c.sex = 2 then 'Женский' else
    '' end,
    ifnull(c.SNILS,''), ifnull(cd.serial,''),ifnull(cd.`number`,''), ifnull(cp.`number`,''),
    ifnull(GROUP_CONCAT(
    ifnull(case when apt.typeName = 'String' then aps.value
    when apt.typeName = 'Date' then apd.value
    when apt.typeName = 'Integer' then api.value
    when apt.typeName = 'Temperature' then apt2.value
	when apt.typeName = 'Reference' then if(apt.valueDomain !='SpravYesNo', apr.value, (SELECT syn.code FROM SpravYesNo syn where syn.id = apr.value)) end, '') separator '/'), ''),
    ifnull(rdt.code,''),ifnull(DATE_FORMAT(cd.`date`, '%d.%m.%Y'),''),ifnull(rpk.code,''),ifnull(ns.SMOCOD,''),
    ifnull(p2.lastName ,''),ifnull(p2.firstName ,''),ifnull(p2.patrName ,''),ifnull(p2.SNILS ,'')) as `client`
    from Client c
    left join ClientDocument cd on cd.client_id = c.id and cd.deleted = 0 and cd.id = (select cd2.id from ClientDocument
    cd2 where cd.client_id = cd2.client_id and cd2.deleted = 0 order by cd2.createDatetime desc LIMIT 1)
    left join ClientPolicy cp on cp.client_id = c.id and cp.deleted = 0 and cp.id = (select cp2.id from ClientPolicy cp2
    where cp2. client_id= cp.client_id and cp2.deleted = 0 ORDER by cp2.createDatetime desc limit 1)
    join Event e on e.client_id = c.id and e.deleted = 0
    join Action a on a.event_id = e.id and a.deleted = 0
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 43222
    JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
    left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id
    left join ActionProperty_String aps on aps.id = ap.id
    left join ActionProperty_Integer api on api.id = ap.id
    left join ActionProperty_Date apd on apd.id = ap.id
    left join ActionProperty_Temperature apt2 on apt2.id = ap.id
    left join ActionProperty_Reference apr on apr.id = ap.id
    join rbDocumentType rdt on rdt.id = cd.documentType_id
    join rbPolicyKind rpk on rpk.id = cp.policyKind_id
    join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
    left join netricaSMO ns on ns.OGRN = o2.OGRN
    join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
    where c.deleted = 0 and e.id = (select id from Event order by id desc limit 1)
    
    SELECT * FROM netricaAccessVaccination;
SELECT * FROM netricaContraindication;
SELECT * FROM netricarbCitizenship;
SELECT * FROM netricaRiskGroup;
SELECT * FROM netricaVaccinationType;
SELECT * FROM SpravYesNo;
select * from netricaSMO;
    
    
    select * from ActionType at2 where name ='QR-Code Пациент';
