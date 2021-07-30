Регис-ХСН-093
Региз-ОНМК-007
Региз-онко-095
Региз-МБ-093
Региз-ВП-091
Региз-covid19-014


set @name = 'Региз-covid19-014';
set @code = '19073';

insert into ActionType(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
                       quotaType_id, context, defaultPlannedEndDate, defaultExecPerson_id, defaultOrg_id, isMES, nomenclativeService_id, prescribedType_id, shedule_id, counter_id,
                       isActiveGroup, lis_code, period, singleInPeriod, refferalType_id, formulaAlias)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       class,
       group_id,
       concat(@code, '-', (select count(code) from ActionType where group_id = 56182 and code regexp @code)+1) code,
       @name name,
       @name title,
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
from ActionType at where at.group_id = 56182 and at.id = (select id from ActionType where group_id = at.group_id order by id desc limit 1)


select *
from ActionType where group_id = 56182 and code regexp @code;