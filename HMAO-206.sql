select *
from ActionType where class = 0 and name regexp 'поликлиника';


select * from ActionType where group_id = 84801;


drop temporary table temp_at;
create temporary table temp_at
    (
        select 'Освобождение от физкультуры' as name union
            select 'Обращение на приём' as name
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
       84801 group_id,
       concat('206_', (row_number() over ()) + (select count(id) from ActionType where group_id = 84801)) code,
       temp_at.name as                                                                                    name,
       temp_at.name                                                                                       title,
       flatCode,
       sex,
       age,
       office,
       showInForm,
       genTimetable,
       quotaType_id,
       concat('206_', (select count(id) + 1 from ActionType where group_id = 84801))                      context,
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


drop temporary table temp_apt;
create temporary table temp_apt
(
    select 'Место работы, должность' as name union
select 'Домашний адрес' as name union
select 'В том, что' as name
);

insert ActionPropertyType(deleted, actionType_id, idx, template_id, name, shortName, descr, unit_id, typeName, valueDomain,
                          defaultValue, norm, sex, age, penaltyUserProfile, penaltyDiagnosis, test_id,
                          laboratoryCalculator, visibleInDR, userProfile_id, ticketsNeeded, parent_id, customSelect,
                          autoFieldUserProfile, formulaAlias)
select 0 deleted,
       85281                    actionType_id,
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