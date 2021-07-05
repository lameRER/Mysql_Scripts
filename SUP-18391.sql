select *
from ActionType where name regexp 'qr' and deleted = 0;


set @id = 11468;

select *
from ActionType where id = @id;


insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, defaultBeginDate, refferalType_id, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, isAllowedAfterDeath, isAllowedDateAfterDeath, eventStatusMod)
values  (now(), NULL, now(), NULL, 0, 0, null, 'QR', 'QR-Code Пациент', '', '', 0, '', '', 1, 0, null, 'QR', 0, 0, 2, 2, 0, 1, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 0, null, null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 0, 0, '', 0, 0, 1, null, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0);

select *
from ActionType order by id desc ;

select *
from ActionPropertyType where actionType_id = @id and deleted = 0;

insert into s11.ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, customSelect, autoFieldUserProfile, formulaAlias, parent_id)
values  (0, 45259, 0, null, 'Температура', '', '', null, 'Temperature', '', null, 0, '', 0, '', 100, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 1, 0, 'Общее состояния', '', '', null, 'String', '''Удовлетворительное'', ''Неудовлетворительное''', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 2, 0, 'Дыхание', '', '', null, 'String', '''Везикулярное'', ''Жесткое''', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 3, 0, 'Хрипы', '', '', null, 'String', '''Нет'', ''Сухие рассеянные'', ''Влажные'', ''Крепитирующие''', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 4, 0, 'ЧДД', '', '', null, 'Integer', '', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 5, 0, 'Сатурация', '', '', null, 'Integer', '', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 6, 0, 'Сердечный тон', '', '', null, 'String', '''Ясные'', ''Приглушены'', ''Глухие''', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 7, 0, 'ЧСС', '', '', null, 'Integer', '', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 8, 0, 'АД', '', '', null, 'String', '', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 9, 0, 'Контакты с инфекционными больными', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 10, 0, 'Болел COVID-19', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 11, 0, 'Прививка от гриппа', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 12, 0, 'Вид прививки', '', '', null, 'Reference', 'netricaVaccinationType', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 13, 0, 'Прививка от гриппа (иное)', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 14, 0, 'Аллергические реакции', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 15, 0, 'Описание аллергических реакций', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 16, 0, 'Прививка от пневмококка', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 17, 0, 'Хронические заболевания бронхолегочной системы', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 18, 0, 'Хронические заболевания сердечно-сосудистой системы', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 19, 0, 'Хронические заболевания эндокринной системы', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 20, 0, 'Онкологические заболевания', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 21, 0, 'Болезнь, вызванная ВИЧ', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 22, 0, 'Туберкулез', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 23, 0, 'Сифилис', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 24, 0, 'Гепатит', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 25, 0, 'Иные болезни', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 26, 0, 'Лекарства за месяц до иммунизации', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 27, 0, 'Принимаемые лекарственные средства', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 28, 0, 'Принимаются иммуносупрессивные препараты', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 29, 0, 'Принимаемые препараты', '', '', null, 'String', '', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 30, 0, 'Противопоказания к вакцинации', '', '', null, 'Reference', 'SpravYesNo', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 31, 0, 'Противопоказание', '', '', null, 'Reference', 'netricaContraindication', '', 0, '', 0, '', 0, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 32, 0, 'Допуск к вакцинации', '', '', null, 'Reference', 'netricaAccessVaccination', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 33, 0, 'Категория гражданства', '', '', null, 'Reference', 'netricarbCitizenship', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null),
        (0, 45259, 34, 0, 'Группа риска', '', '', null, 'Reference', 'netricaRiskGroup', '', 0, '', 0, '', 100, '', null, 0, 0, 0, null, 0, 0, 0, '', 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null);

select *
from rbPrintTemplate where context = (select ActionType.context from ActionType where id = @id);


insert into s11.rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, chkProfiles, chkPersons)
values  (now(), null, now(), null, '18391', 'QR-Code Пациент', 'QR', '', '<html>

<head>
    {setPageSize(''A4'')}
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
    ifnull(case when apt.typeName = ''String'' then REPLACE(aps.value, ''/'', ''.'')
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
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.context = ''QR''
    JOIN ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0
    left join ActionProperty ap on ap.action_id = a.id and ap.deleted = 0 and apt.id = ap.type_id
    left join ActionProperty_String aps on aps.id = ap.id
    left join ActionProperty_Integer api on api.id = ap.id
    left join ActionProperty_Date apd on apd.id = ap.id
    left join ActionProperty_Temperature apt2 on apt2.id = ap.id
    left join ActionProperty_Reference apr on apr.id = ap.id
    left join rbDocumentType rdt on rdt.id = cd.documentType_id
    left join rbPolicyKind rpk on rpk.id = cp.policyKind_id
    left join Organisation o2 on o2.id = cp.insurer_id and o2.deleted = 0
    left join netricaSMO ns on ns.OGRN = o2.OGRN AND o2.KPP = ns.KPP
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

</html>', 0, 0, 2, null, 0, 0, '', null, 1, 0, 0);