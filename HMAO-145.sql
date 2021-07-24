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

select *
from ActionPropertyType where actionType_id = 78123 and id = ;


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


 SQL="""SELECT lastname FROM Client where id = context.clientId ;"""