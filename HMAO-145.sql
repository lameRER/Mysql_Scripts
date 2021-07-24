select *
from ActionType
where name regexp 'GRASE';

select *
from ActionPropertyType where actionType_id = 25728;

insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, period, singleInPeriod, checkPeriod, isCustomSum, recommendationExpirePeriod, recommendationControl, lis_code, isExecRequiredForEventExec, isActiveGroup, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, EGISZ_code, EGISZ_typecons_code, SMS, SEMD, consultationTypeId, formulaAlias, instrumentalId)
values  (now(), null, now(), null, 0, 0, null, '1193-1', 'Шкала GRASE', '', '', 0, '', '', 1, 0, null, '1193-1', 0, 0, 0, 0, 0, 0, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, 0, 0, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, null, null, 0, 0, 0, 0, '', 0, 0, 0, 0, null, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', null, null, null, null, '', null);

insert into ActionPropertyType(deleted)
select 0;

select *
from ActionType order by id desc;


select *
from ActionType where id = 439588;


insert into ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, ticketsNeeded, parent_id, customSelect, autoFieldUserProfile, formulaAlias)
values  (0, 84654, 0, null, 'ЧСС', '', '', null, 'String', '"менее 50","50-69","70-89","90-109","110-149","150-199","более 200"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value1'),
        (0, 84654, 1, null, 'САД', '', '', null, 'String', '"менее 80","80-99","100-119","120-139","140-159","160-199","более 200"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value2'),
        (0, 84654, 2, null, 'Уровень креатинина сыворотки', '', '', null, 'String', '"0-35.3","35-70","71-105","106-140","141-176","177-353","более 354"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value3'),
        (0, 84654, 3, null, 'Класс сердченой недостаточности', '', '', null, 'String', '"I. Отсутствие признаков застойной сердечной недостаточности","II. Наличие хрипов в легких и/или повышенного давления в югулярных венах","III. Наличие отека легких","IV. Наличие кардиогенного шока"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value4'),
        (0, 84654, 4, null, 'Остановка сердца на момент поступления пациента', '', '', null, 'String', '"","да"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value5'),
        (0, 84654, 5, null, 'Отклонение сегмента ST', '', '', null, 'String', '"","да"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value6'),
        (0, 84654, 6, null, 'Наличие диагностически значимого повышения уровня кардиоспецифических ферментов', '', '', null, 'String', '"","да"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, null, null, null, null, 'value7'),
        (0, 84654, 7, null, 'Результат', '', '', null, 'String', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, 'SQL="""SELECT CONCAT_WS('' '', ( SUM( CASE apt.formulaAlias
WHEN ''value1'' THEN CASE aps.value WHEN ''менее 50'' THEN 0 WHEN ''50-69'' THEN 3 WHEN ''70-89'' THEN 9 WHEN ''90-109'' THEN 15 WHEN ''110-149'' THEN 24 WHEN ''150-199'' THEN 38 WHEN ''более 200'' THEN 46 END
WHEN ''value2'' THEN CASE aps.value WHEN ''менее 80'' THEN 58 WHEN ''80-99'' THEN 53 WHEN ''100-119'' THEN 43 WHEN ''120-139'' THEN 34 WHEN ''140-159'' THEN 24 WHEN ''160-199'' THEN 10 WHEN ''более 200'' THEN 0 END
WHEN ''value3'' THEN CASE aps.value WHEN ''0-35.3'' THEN 1 WHEN  ''35-70'' THEN 4 WHEN  ''71-105'' THEN 7 WHEN  ''106-140'' THEN 10 WHEN ''141-176'' THEN 13 WHEN  ''177-353'' THEN 21  WHEN  ''более 354'' THEN 28 END
WHEN ''value4'' THEN CASE aps.value WHEN ''I. Отсутствие признаков застойной сердечной недостаточности'' THEN 0 WHEN ''II. Наличие хрипов в легких и/или повышенного давления в югулярных венах'' THEN 20 WHEN ''III. Наличие отека легких'' THEN 39 WHEN ''IV. Наличие кардиогенного шока'' THEN 59  END
WHEN ''value5'' THEN CASE aps.value WHEN ''да'' THEN 39 ELSE 0 END
WHEN ''value6'' THEN CASE aps.value WHEN ''да'' THEN 28 ELSE 0 END
WHEN ''value7'' THEN CASE aps.value WHEN ''да'' THEN 14 ELSE 0 END
END ) +
CASE
WHEN age(c.birthDate,CURRENT_DATE())<31 THEN 0
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 31 AND 39 THEN 8
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 40 AND 49 THEN 25
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 50 AND 59 THEN 41
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 60 AND 69 THEN 58
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 70 AND 79 THEN 75
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 80 AND 89 THEN 91
WHEN age(c.birthDate,CURRENT_DATE())>89 THEN 100
END ),
CASE
WHEN ( SUM( CASE apt.formulaAlias
WHEN ''value1'' THEN CASE aps.value WHEN ''менее 50'' THEN 0 WHEN ''50-69'' THEN 3 WHEN ''70-89'' THEN 9 WHEN ''90-109'' THEN 15 WHEN ''110-149'' THEN 24 WHEN ''150-199'' THEN 38 WHEN ''более 200'' THEN 46 END
WHEN ''value2'' THEN CASE aps.value WHEN ''менее 80'' THEN 58 WHEN ''80-99'' THEN 53 WHEN ''100-119'' THEN 43 WHEN ''120-139'' THEN 34 WHEN ''140-159'' THEN 24 WHEN ''160-199'' THEN 10 WHEN ''более 200'' THEN 0 END
WHEN ''value3'' THEN CASE aps.value WHEN ''0-35.3'' THEN 1 WHEN  ''35-70'' THEN 4 WHEN  ''71-105'' THEN 7 WHEN  ''106-140'' THEN 10 WHEN ''141-176'' THEN 13 WHEN  ''177-353'' THEN 21  WHEN  ''более 354'' THEN 28 END
WHEN ''value4'' THEN CASE aps.value WHEN ''I. Отсутствие признаков застойной сердечной недостаточности'' THEN 0 WHEN ''II. Наличие хрипов в легких и/или повышенного давления в югулярных венах'' THEN 20 WHEN ''III. Наличие отека легких'' THEN 39 WHEN ''IV. Наличие кардиогенного шока'' THEN 59  END
WHEN ''value5'' THEN CASE aps.value WHEN ''да'' THEN 39 ELSE 0 END
WHEN ''value6'' THEN CASE aps.value WHEN ''да'' THEN 28 ELSE 0 END
WHEN ''value7'' THEN CASE aps.value WHEN ''да'' THEN 14 ELSE 0 END
END ) +
CASE
WHEN age(c.birthDate,CURRENT_DATE())<31 THEN 0
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 31 AND 39 THEN 8
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 40 AND 49 THEN 25
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 50 AND 59 THEN 41
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 60 AND 69 THEN 58
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 70 AND 79 THEN 75
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 80 AND 89 THEN 91
WHEN age(c.birthDate,CURRENT_DATE())>89 THEN 100
END )<109 THEN ''Низкий''
WHEN ( SUM( CASE apt.formulaAlias
WHEN ''value1'' THEN CASE aps.value WHEN ''менее 50'' THEN 0 WHEN ''50-69'' THEN 3 WHEN ''70-89'' THEN 9 WHEN ''90-109'' THEN 15 WHEN ''110-149'' THEN 24 WHEN ''150-199'' THEN 38 WHEN ''более 200'' THEN 46 END
WHEN ''value2'' THEN CASE aps.value WHEN ''менее 80'' THEN 58 WHEN ''80-99'' THEN 53 WHEN ''100-119'' THEN 43 WHEN ''120-139'' THEN 34 WHEN ''140-159'' THEN 24 WHEN ''160-199'' THEN 10 WHEN ''более 200'' THEN 0 END
WHEN ''value3'' THEN CASE aps.value WHEN ''0-35.3'' THEN 1 WHEN  ''35-70'' THEN 4 WHEN  ''71-105'' THEN 7 WHEN  ''106-140'' THEN 10 WHEN ''141-176'' THEN 13 WHEN  ''177-353'' THEN 21  WHEN  ''более 354'' THEN 28 END
WHEN ''value4'' THEN CASE aps.value WHEN ''I. Отсутствие признаков застойной сердечной недостаточности'' THEN 0 WHEN ''II. Наличие хрипов в легких и/или повышенного давления в югулярных венах'' THEN 20 WHEN ''III. Наличие отека легких'' THEN 39 WHEN ''IV. Наличие кардиогенного шока'' THEN 59  END
WHEN ''value5'' THEN CASE aps.value WHEN ''да'' THEN 39 ELSE 0 END
WHEN ''value6'' THEN CASE aps.value WHEN ''да'' THEN 28 ELSE 0 END
WHEN ''value7'' THEN CASE aps.value WHEN ''да'' THEN 14 ELSE 0 END
END ) +
CASE
WHEN age(c.birthDate,CURRENT_DATE())<31 THEN 0
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 31 AND 39 THEN 8
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 40 AND 49 THEN 25
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 50 AND 59 THEN 41
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 60 AND 69 THEN 58
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 70 AND 79 THEN 75
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 80 AND 89 THEN 91
WHEN age(c.birthDate,CURRENT_DATE())>89 THEN 100
END ) BETWEEN 109 AND 140 THEN ''Средний''
WHEN ( SUM( CASE apt.formulaAlias
WHEN ''value1'' THEN CASE aps.value WHEN ''менее 50'' THEN 0 WHEN ''50-69'' THEN 3 WHEN ''70-89'' THEN 9 WHEN ''90-109'' THEN 15 WHEN ''110-149'' THEN 24 WHEN ''150-199'' THEN 38 WHEN ''более 200'' THEN 46 END
WHEN ''value2'' THEN CASE aps.value WHEN ''менее 80'' THEN 58 WHEN ''80-99'' THEN 53 WHEN ''100-119'' THEN 43 WHEN ''120-139'' THEN 34 WHEN ''140-159'' THEN 24 WHEN ''160-199'' THEN 10 WHEN ''более 200'' THEN 0 END
WHEN ''value3'' THEN CASE aps.value WHEN ''0-35.3'' THEN 1 WHEN  ''35-70'' THEN 4 WHEN  ''71-105'' THEN 7 WHEN  ''106-140'' THEN 10 WHEN ''141-176'' THEN 13 WHEN  ''177-353'' THEN 21  WHEN  ''более 354'' THEN 28 END
WHEN ''value4'' THEN CASE aps.value WHEN ''I. Отсутствие признаков застойной сердечной недостаточности'' THEN 0 WHEN ''II. Наличие хрипов в легких и/или повышенного давления в югулярных венах'' THEN 20 WHEN ''III. Наличие отека легких'' THEN 39 WHEN ''IV. Наличие кардиогенного шока'' THEN 59  END
WHEN ''value5'' THEN CASE aps.value WHEN ''да'' THEN 39 ELSE 0 END
WHEN ''value6'' THEN CASE aps.value WHEN ''да'' THEN 28 ELSE 0 END
WHEN ''value7'' THEN CASE aps.value WHEN ''да'' THEN 14 ELSE 0 END
END ) +
CASE
WHEN age(c.birthDate,CURRENT_DATE())<31 THEN 0
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 31 AND 39 THEN 8
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 40 AND 49 THEN 25
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 50 AND 59 THEN 41
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 60 AND 69 THEN 58
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 70 AND 79 THEN 75
WHEN age(c.birthDate,CURRENT_DATE()) BETWEEN 80 AND 89 THEN 91
WHEN age(c.birthDate,CURRENT_DATE())>89 THEN 100
END ) >140 THEN ''Высокий''
END)
FROM Event JOIN Action ON Event.id = Action.event_id AND Action.deleted=0
JOIN Client c ON Event.client_id = c.id
JOIN ActionType at ON Action.actionType_id = at.id AND at.name=''Шкала GRASE''
JOIN ActionPropertyType apt ON at.id = apt.actionType_id and apt.deleted=0 AND apt.formulaAlias REGEXP ''value''
JOIN ActionProperty ap ON Action.id = ap.action_id AND ap.deleted=0 AND ap.type_id=apt.id
JOIN ActionProperty_String aps ON ap.id = aps.id
WHERE Action.id = context.actionId"""', null, null);

insert into OrgStructure_ActionType(master_id, actionType_id)
select  id, 84654
from OrgStructure where name regexp 'Травматологическое отделение';

insert into DestinationTree_ActionType(master_id, actionType_id, name)
select id, 84654, (select name from ActionType where id = 84654)
from DestinationTree where deleted = 0 and name = 'Осмотры';

select *
from ActionType where name regexp 'дежурного';


select *
from ActionType where  name regexp 'Осмотр отделения травматологии Стационар
';

select ActionPropertyType.customSelect, ActionPropertyType.*
from ActionPropertyType where actionType_id in(78123,40662)


select *
from ActionPropertyType where id = 376989;


select *
from ActionType where name regexp 'осмотр травматолога';

select * from ActionPropertyType where actionType_id = 40662

# SQL="""
select aps.value from ActionProperty ap
join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at on at.id = a.actionType_id  and at.deleted = 0 and at.id = 40662
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at.id and apt.deleted =0 and  apt.id = 380
order by aps.id desc limit 1;
# """


actionTypeId, actionPropertyTypeId,


select *
from Event where id = 4404977;

select at.name, a.*
from Action a, ActionType at where a.event_id = 4404977 and at.id = a.actionType_id;

select *
from Client where ;

 SQL="""SELECT lastname FROM Client where id = context.clientId ;"""


# SQL="""
select '' union
(select aps.value from ActionProperty ap
join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and at.id = 40662
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at.id and apt.deleted =0 and apt.id = 380
join Event e on a.event_id = e.id and e.deleted = 0 and e.eventType_id = context.eventTypeId
join Client c on c.id = e.client_id and c.id = context.clientId
where ap.deleted = 0
order by aps.id desc limit 1);
# """

clientId, eventTypeId

select distinct rep.*
from rbEpicrisisTemplates ret
join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
join rbEpicrisisSections res on res.id = retres.id_rbEpicrisisSections
join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
join rbEpicrisisProperty rep on rep.id = resrep.id_rbEpicrisisProperty
where ret.id = 5


select *
from rbEpicrisisTemplates;


select *
from rbEpicrisisProperty where id = 111;

select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.id = 40662
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name = 'An. morbi' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc limit 1



select *
from ActionType where name regexp 'Реанимация.Показатели';


select *
from ActionPropertyType where actionType_id= 49878;

insert into s12.ActionType (EGISZ_code, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration, visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
                            recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate,
                            refferalType_id, filterPosts, filterSpecialities, showAPOrg, isIgnoreEventExecDate,
                            checkPersonSet, formulaAlias)
values  ('', '2020-04-01 09:32:41', 200, '2020-04-01 09:32:41', 200, 0, 0, null, '001', 'Реанимация.Показатели', 'Реанимация.Показатели',
         'reanimation_sheet', 0, '', '', 0, 0, null, '', 0, 0, 0, 2, 0, 0, null, 0, 0,
         0, 0, 0, null, 0, 0, null, 0, 0, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0,
         0, 0, 0, null, 0, 0, 0, 0, 0, '', 0, 0, null, null, 0, 1, null, 0, 0, 0, 0, 0, null);

insert into s12.ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis,
                                    visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation,
                                    canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable,
                                    redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour,
                                    copyModifier, ticketsNeeded, customSelect,
                                    autoFieldUserProfile, formulaAlias)
values  (0, 84657, 0, null, 'Температура', '', '', null, 'Temperature', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 1, null, 'Пульс', '', '', null, 'Pulse', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 2, null, 'Артериальное давление систолическое', '', '', null, 'ArterialPressure', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 3, null, 'Артериальное давление диастолическое', '', '', null, 'ArterialPressure', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 4, null, 'Сатурация', '', '', null, 'Double', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 5, null, 'Количество выпитой воды', '', '', null, 'Double', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84657, 6, null, 'Диурез', '', '', null, 'Double', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null);

select *
from rbPrintTemplate where context = '';

select *
from ActionPropertyType where actionType_id = 9749;

insert into s12.ActionType (EGISZ_code, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title,
                            flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation,
                            defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                            defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired,
                            defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id,
                            shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible,
                            propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
                            recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code,
                            locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id,
                            filterPosts, filterSpecialities, showAPOrg, isIgnoreEventExecDate, checkPersonSet, formulaAlias)
values  ('', '2011-11-16 13:26:56', null, '2020-02-06 14:28:54', 970, 0, 0, 9748, '4', 'Температурный лист', 'Температурный лист',
         'temperatureSheet', 0, '', '', 0, 0, null, '', 0, 0, 2, 2, 0, 1, null, 0, 0, 0, 0, 0, null, 0, 0, null, 1, 1, null, null, 0, 0,
         0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, '', 0, 0, null, null, 0, 1, null, 0, 0, 1, 0, 0, null);


select *
from ActionType order by  id desc ;

insert into s12.ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier,
                                    ticketsNeeded, customSelect, autoFieldUserProfile,
                                    formulaAlias)
values
        (1, 84656, 0, null, 'ТемператураDEL', '', '', null, 'Temperature', '', '36.6', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 2, null, 'АД-макс', '', '', 17, 'ArterialPressure', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (1, 84656, 3, null, 'ПульсDEL', '', '', 32, 'Pulse', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 4, null, 'День болезни', '', '', null, 'Integer', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 3, null, 'АД-мин', '', '', 17, 'ArterialPressure', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 5, null, 'Гиг. ванны', '', '', null, 'String', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 6, null, 'Вып. жидкость', '', '', null, 'String', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 7, null, 'Спец. процедуры', '', '', null, 'String', '', '', 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 0, null, 'Температура', '', '', null, 'Temperature', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 1, null, 'Пульс', '', '', null, 'Pulse', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 8, null, 'Педикулез', '', '', null, 'String', '"+","-"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (0, 84656, 9, null, 'Смена белья', '', '', null, 'String', '"+","-"', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, null, null, null, null),
        (1, 84656, 11, null, 'Сатурация вечер', '', '', null, 'Integer', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null),
        (0, 84656, 10, null, 'Сатурация', '', '', null, 'Integer', '', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, null, null, null);


select
Date(a1.plannedEndDate) `Дата операции`,
a1.specifiedName `Название операции`
from Event e
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a.parent_id = a1.id
where e.deleted = 0 and e.id = 4405084;1


select at.name, a.*
from Action a, ActionType at where a.event_id = 4405084 and at.id = a.actionType_id;

select *
from Event where externalId = '16231';



select *
from DestinationTree where name regexp 'опера';

insert into s12.DestinationTree (deleted, parent_id, name, visible, selectionMode, code, isVisibleForReanimationOnly)
values  (0, 10003, 'Операции', 1, 'single', '', 0);

select * from DestinationTree where id = 10003

insert into DestinationTree_ActionType (master_id, actionType_id, name)
select '10199', '84659', (select name from ActionType where id = 84659)

select *
from ActionType where serviceType = 4;

select * from ActionPropertyType where actionType_id = 13108




select *
from ActionType where name = 'Биопсия кожи' and group_id =72059;

select *
from ActionType where id in(72073,72059,79661);

select * from ActionType order by id desc

insert into s12.ActionType (EGISZ_code, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name, title,
                            flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation,
                            defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                            defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired,
                            defaultOrg_id, maxOccursInEvent, isMES, showTime, isPreferable, prescribedType_id,
                            shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible,
                            propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
                            recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code,
                            locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts,
                            filterSpecialities, showAPOrg,  isIgnoreEventExecDate, checkPersonSet, formulaAlias)
values  ('','2013-01-01 00:00:00', null, '2018-04-23 10:33:38', 970, 0, 0, 72059, 'мЗ004а', 'Пункция верхнечелюстной пазухи',
         'Пункция верхнечелюстной пазухи', 'мЗ004а', 0, '', '', 1, 0, null, '', 1, 0, 2, 1, 0, 2, null, 3, 0, 0, 0, 0, null, 0,
         null, 1, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 4, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0,
         null, null, 0, 2, null, 0, 0, 1, 0, 0, null);


insert into s12.ActionPropertyType (deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName,
                                    valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis,
                                    visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation,
                                    canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable,
                                    redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour,
                                    copyModifier, ticketsNeeded, customSelect,
                                    autoFieldUserProfile, formulaAlias)
values  (0, 84659, 1, null, 'Тип операции', '', '', null, 'String', '"Полостная", "Лапароскопическая", "БИОС", "Металостеосинтез", "Эндопротезирование", "PFN"', '', 0, '', 0, '', 0, null, null,
         0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, 0, null, null, null),
        (0, 84659, 2, null, 'Операционная', '', '', null, 'OrgStructure', '', '', 0, '', 0, '', 0,
         null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 1, 0, null, null, null);


insert into rbService (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code, name, eisLegacy,
                       license, infis, begDate, endDate, medicalAidProfile_id, medicalAidKind_id, medicalAidType_id, dopService_id,
                       category_id, caseCast_id, Fed_code, type, budget_id)
select
       s.createDatetime,
       s.createPerson_id,
       s.modifyDatetime,
       s.modifyPerson_id,
       s.group_id,
       at.code code,
       at.name name,
       eisLegacy,
       license,
       at.code infis,
       begDate,
       endDate,
       medicalAidProfile_id,
       medicalAidKind_id,
       medicalAidType_id,
       dopService_id,
       category_id,
       caseCast_id,
       Fed_code,
       type,
       budget_id
from ActionType at
join rbService s on s.id = (select id from rbService order by id desc  limit  1)
where at.id = 84659


insert into ActionType_Service(master_id, finance_id, service_id)
select at.id master_id, 2 finance_id, s.id service_id
from ActionType at
join rbService s on s.code = at.code and s.name = at.name
join ActionType_Service ats on ats.id = (select id from ActionType_Service order by id desc limit 1)
where at.id = 84659


select *
from ActionType_Service where finance_id is not null;

select * from ActionType where name regexp 'протокол операции' order by id desc

select *
from ActionPropertyType where actionType_id = 43604a;

select *
from rbPrintTemplate where context = 'DR_oper';


insert into s12.ActionType (EGISZ_code,createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id, code, name,
                            title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context, amount, amountEvaluation,
                            defaultStatus, defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                            defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired,
                            defaultOrg_id, maxOccursInEvent, isMES, nomenclativeService_id, showTime, isPreferable, prescribedType_id,
                            shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant, propertyAssignedVisible,
                            propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            visible, isSubstituteEndDateToEvent, isPrinted, withoutAgree, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
                            recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code,
                            locked, filledLock, period, singleInPeriod, checkPeriod, defaultBeginDate, refferalType_id, filterPosts,
                            filterSpecialities, showAPOrg, isIgnoreEventExecDate, checkPersonSet, formulaAlias)
values  ('','2019-11-24 12:28:46', 877, '2019-11-24 12:48:08', 877, 0, 2, null, '7889-1', 'Протокол операции', 'Протокол операции', '', 0,
         '', '', 1, 0, null, 'DR_oper', 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 0, 0, null, 0, 0, null, 0, 0, null, null, 0, 0, 0, 0, 0, 0, 0,
         0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 0, 0, '', 0, 0, null, null, 0, 0, null, 0, 0, 0, 0, 0, null);


insert into s12.ActionPropertyType (id, deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain, defaultValue, isVector, norm, sex, age, penalty, penaltyUserProfile, penaltyDiagnosis, visibleInJobTicket, visibleInTableRedactor, isAssignable, test_id, defaultEvaluation, canChangeOnlyOwner, isActionNameSpecifier, laboratoryCalculator, inActionsSelectionTable, redactorSizeFactor, isFrozen, typeEditable, visibleInDR, userProfile_id, userProfileBehaviour, copyModifier, isVitalParam, vitalParamId, isODIIParam, ticketsNeeded, customSelect, autoFieldUserProfile, formulaAlias, incrementOnSave)
values  (48536, 0, 84661, 0, null, 'Номерок', '', '', null, 'JobTicket', '7889', null, 0, '', 0, '', 0, null, null, 0, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48537, 0, 84661, 3, null, 'Наименование', '', '', null, 'String', '"Эндохирургическая аппендэктомия","Пластика позвонка","Удаление грыжи межпозвонкового диска",*', null, 0, '', 0, '', 100, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48538, 0, 84661, 4, null, 'Операция', '', '', null, 'String', '"1 - основная", "0 - не основная"', null, 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48539, 0, 84661, 5, null, 'Тип операции', '', '', null, 'String', '"Полостная", "Лапароскопическая", "БИОС", "Металостеосинтез", "Эндопротезирование", "PFN"', null, 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48540, 0, 84661, 6, null, 'Характер операции', '', '', null, 'String', '', null, 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48541, 0, 84661, 7, null, 'Анестезия', '', '', null, 'String', '"1 - общая", "2 - местная"', null, 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48542, 0, 84661, 8, null, 'Хирургические осложнения', '', '', null, 'String', '', 'нет', 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48543, 0, 84661, 9, null, 'Протокол оперпации', '', '', null, 'String', '', null, 0, '', 0, '', 0, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48544, 0, 84661, 1, null, 'Операционная', '', '', null, 'String', '"1","2","3","4"', null, 0, '', 0, '', 100, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0),
        (48545, 0, 84661, 2, null, 'Показания к оперативному вмешательству', '', '', null, 'String', '', null, 0, '', 0, '', 100, null, null, 1, 0, 0, null, 0, 0, 0, null, 0, 0, 0, 1, 1, null, 0, 0, 0, null, 0, null, null, null, null, 0);

insert into s12.rbPrintTemplate (id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, default, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, pageOrientation)
values  (1136, '2019-11-24 12:54:30', 877, '2019-11-26 18:07:40', 877, 'DR_oper', 'Протокол операции', 'DR_oper', '', '
<html>
<!--Параметры страницы-->



{setPageSize(''A4'')}
<!--Формат листа А4-->
{setOrientation(''P'')}
<!--Альбомная страница-->
{setMargins(5)}
<!--Отступы по краям листа-->



<body style="font-size: 16pt">
<br>Ф.И.О. {client.fullName}
  <br>Номер и/б: {event.externalId}
    <br>Дата: {action.endDate.toString(''dd.MM.yyyy'')}

    <p align="center">
        <B>{action.name} </B>
    </p><br>


    <table width="100%" border="0">


        {for: prop in action}
            {if: prop.value}
                <tr><td><b>{prop.name}</b> {prop.value :n}</td></tr>
            {end:}
        {end:}
    </table>
    <br>
      <table width="100%">
        <tr>
            <td>Врач</td>
            <td align="right">{action.person.shortName}</td>
        </tr>

    </table>
</body>


</html>', 0, 0, 0, 0, null, 0, 0, '', null, 0, 'P');