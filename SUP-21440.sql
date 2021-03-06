select *
from ActionPropertyType where actionType_id in
(select id from ActionType where flatCode = 'received');



select *
from s11.ActionPropertyType where id in (
64274,64275,64276,64277,64268,64269);


select apt.name, aps.value
from ActionProperty ap
         left join ActionProperty_String aps using(id)
         left join ActionProperty_Reference apr using(id)
         join Action a on ap.action_id = a.id and a.event_id= 33880064
         join ActionType at on at.id = a.actionType_id
    join ActionPropertyType apt on apt.actionType_id = at.id and ap.type_id = apt.id and apt.id in (35423,38920)

select aps.value
from ActionProperty_String aps,
     ActionProperty ap,
     ActionPropertyType apt,
     ActionType at,
     Action a
where aps.id = ap.id
  and apt.id = ap.type_id and a.id = ap.action_id
  and at.id = apt.actionType_id and apt.id = 35423
  and a.actionType_id = at.id
group by value;


select *
from ActionPropertyType where name = 'доставлен';


use s13;
set @flatCode = 'received';
# set @flatCode = 'leaved';

drop temporary table if exists temp_aptId;
create temporary table if not exists temp_aptId(
    select apt.id from ActionPropertyType apt, ActionType at1 where apt.id in(64274,64275,64276,64277,64268,64269) and at1.id = apt.actionType_id and at1.flatCode = @flatCode
);

select *
from temp_aptId;

insert into ActionProperty(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, action_id, type_id, unit_id, norm, evaluation)
select *
from
    (select
         now() createDatetime,
         null createPerson_id,
         now() modifyDatetime,
         null modifyPerson_id,
         0 deleted,
         a.id action_id,
         tad.id type_id,
         unit_id,
         norm,
         evaluation
     from Action a, ActionProperty ap, temp_aptId tad where a.deleted = 0 and a.actionType_id in (select id from ActionType where flatCode = @flatCode and deleted = 0) and ap.id = (select id from ActionProperty order by id desc limit 1)) as tmp
where not exists(select * from ActionProperty where tmp.deleted = 0 and deleted = 0 and tmp.action_id = action_id and tmp.type_id = type_id);

insert into ActionProperty_Reference(id, `index`, value)
select *
from
    (select ap.id, 0 `index`, if(apt.id in(64268,64269,64275),'13', 'не указан') value
     from ActionProperty ap
              left join ActionProperty_Reference apr using(id)
              join Action a on a.id = ap.action_id
              join ActionType at1 on at1.id = a.actionType_id and at1.deleted = 0 and at1.flatCode = @flatCode
              join ActionPropertyType apt on apt.actionType_id = at1.id and apt.deleted = 0
              join temp_aptId tad on tad.id = apt.id
     where apr.id is null) as tmp
where not exists(select * from ActionProperty_Reference where tmp.id = id and tmp.value = value);

select *
from ActionProperty where action_id = 5205485 and type_id = 64269;
# UPDATE ActionPropertyType SET idx = 5, penalty = 100, penaltyUserProfile = '29; 7; 19; 32; 31; 53; 36; 37; 57; 48; 63', visibleInDR = 1, userProfile_id = null, userProfileBehaviour = 0 WHERE id = @ActionPropertyTypeNew;
# UPDATE ActionPropertyType SET idx = 20, penalty = 0, penaltyUserProfile = '7;19', visibleInDR = 0, userProfile_id = 1, userProfileBehaviour = 1 WHERE id = @ActionPropertyTypeOld;

insert into ActionProperty(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, action_id, type_id, unit_id, norm, isAssigned, evaluation, isAutoFillCancelled)
select *
from
    (select
         ap.createDatetime,
         ap.createPerson_id,
         ap.modifyDatetime,
         ap.modifyPerson_id,
         ap.deleted,
         action_id,
         @ActionPropertyTypeNew type_id,
         ap.unit_id,
         ap.norm,
         isAssigned,
         evaluation,
         isAutoFillCancelled
     from ActionProperty ap
              left Join ActionProperty_String aps using(id)
              join Action a on ap.action_id = a.id and a.deleted = 0
              join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
              join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeNew
     where ap.deleted= 0 and aps.id is not null) as tmp
where not exists(select * from ActionProperty where action_id = tmp.action_id and type_id = tmp.type_id and deleted = tmp.deleted);

insert into ActionProperty_Reference(id, `index`, value)
select *
from
    (select ap1.id, 0, case
                           when aps.value regexp '^в первые 6часов|^1 час|^2 часа|^3 часа|^4|^4 часа|^5 часов|^6 часов|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">1 час< /font>< /font>|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">4 часа< /font>< /font>|^4$' then 4
                           when  aps.value regexp '^в течении 7-24 часов|^7-12 часов|^7-24 часов|^12-24 часов|^5$' then 5
                           when aps.value regexp '^менее 2 суток|^более 24-х часов|^более 7 суток|^менее 3 суток|^менее 4 суток|^менее 5 суток|^менее 6 суток|^менее 7 суток|^позднее 24-х часов|^6$' then 6 end as `value`
     from ActionProperty ap
              join ActionProperty_String aps on aps.id = ap.id
              join Action a on ap.action_id = a.id and a.deleted = 0
              join ActionProperty ap1 on ap1.action_id = a.id and ap1.deleted = 0 and ap1.type_id = @ActionPropertyTypeNew
              left join ActionProperty_Reference apr on apr.id = ap1.id
              join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
     where ap.deleted= 0 and ap.type_id = @ActionPropertyTypeOld and apr.id is null group by ap.action_id, ap.type_id) as tmp
where not exists(select * from ActionProperty_Reference where tmp.id = id and tmp.value = value);


set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = 'Кем доставлен' and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = 'Канал доставки' and actionType_id = @ActionType and deleted = 0 and typeName = 'Reference');


# UPDATE ActionPropertyType SET idx = 2, visibleInDR = 1, userProfile_id = null, userProfileBehaviour = 0 WHERE id = @ActionPropertyTypeNew;
# UPDATE ActionPropertyType SET idx = 21, visibleInDR = 0, userProfile_id = 1, userProfileBehaviour = 1 WHERE id = @ActionPropertyTypeOld;

insert into ActionProperty(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, action_id, type_id, unit_id, norm, isAssigned, evaluation, isAutoFillCancelled)
select *
from
    (select
         ap.createDatetime,
         ap.createPerson_id,
         ap.modifyDatetime,
         ap.modifyPerson_id,
         ap.deleted,
         action_id,
         @ActionPropertyTypeNew type_id,
         ap.unit_id,
         ap.norm,
         isAssigned,
         evaluation,
         isAutoFillCancelled
     from ActionProperty ap
              left Join ActionProperty_String aps using(id)
              join Action a on ap.action_id = a.id and a.deleted = 0
              join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
              join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
     where ap.deleted= 0 and aps.id is not null) as tmp
where not exists(select * from ActionProperty where action_id = tmp.action_id and type_id = tmp.type_id and deleted = tmp.deleted);

replace into ActionProperty_Reference(id, `index`, value)
select ap1.id, 0, case
                      when aps.value = 'Самостоятельно' then 2
                      when  aps.value = 'СМП' then 1
                      when aps.value = 'Неотложная помощь' then 1
                      when aps.value = 'Сан. транспорт' then 1 end
from ActionProperty ap
         join ActionProperty_String aps on aps.id = ap.id
         join Action a on ap.action_id = a.id and a.deleted = 0
         join ActionProperty ap1 on ap1.action_id = a.id and ap1.deleted = 0 and ap1.type_id = @ActionPropertyTypeNew
         left join ActionProperty_Reference apr on apr.id = ap1.id
         join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
where ap.deleted= 0 and ap.type_id = @ActionPropertyTypeOld and apr.id is null group by ap.action_id, ap.type_id;


set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = '№ машины' and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = '№ бригады' and actionType_id = @ActionType and deleted = 0 and typeName = 'Integer');

# UPDATE ActionPropertyType SET idx = 6, visibleInDR = 1, userProfile_id = null, userProfileBehaviour = 0 WHERE id = 39729;
# UPDATE ActionPropertyType SET idx = 23, visibleInDR = 0, userProfile_id = 1, userProfileBehaviour = 1 WHERE id = 35471;

insert into ActionProperty(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, action_id, type_id, unit_id, norm, isAssigned, evaluation, isAutoFillCancelled)
select *
from
    (select
         ap.createDatetime,
         ap.createPerson_id,
         ap.modifyDatetime,
         ap.modifyPerson_id,
         ap.deleted,
         action_id,
         @ActionPropertyTypeNew type_id,
         ap.unit_id,
         ap.norm,
         isAssigned,
         evaluation,
         isAutoFillCancelled
     from ActionProperty ap
              left Join ActionProperty_String aps using(id)
              join Action a on ap.action_id = a.id and a.deleted = 0-- and a.event_id = 33868109
              join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
              join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
     where ap.deleted= 0 and aps.id is not null) as tmp
where not exists(select * from ActionProperty where action_id = tmp.action_id and type_id = tmp.type_id and deleted = tmp.deleted);



replace into ActionProperty_Integer(id, `index`, value)
select ap1.id, 0, left(if(regexp_replace(aps.value, '\\D', '')= '',112, regexp_replace(aps.value, '\\D', '')),8) as `value`
from ActionProperty ap
    join ActionProperty_String aps on aps.id = ap.id
    join Action a on ap.action_id = a.id and a.deleted = 0
    join ActionProperty ap1 on ap1.action_id = a.id and ap1.deleted = 0 and ap1.type_id = @ActionPropertyTypeNew
    left join ActionProperty_Integer apr on apr.id = ap1.id
    join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
where ap.deleted= 0 and ap.type_id = @ActionPropertyTypeOld and apr.id is null group by ap.action_id, ap.type_id;


# delete from ActionProperty_Integer
                  # where id in(
    # select id
# from ActionProperty where type_id = 39729 and deleted = 0);

# delete from ActionProperty
                  # where id in(
    # select id
# from ActionProperty where type_id = 39729 and deleted = 0);


# update ActionProperty
    # set deleted = 1
      # where id in (select id from ActionProperty where type_id = 39729 and deleted = 0);


select *
from ActionProperty_Integer where id = 253138657;
select *
from ActionProperty where id = 253138657;
select event_id
from Action where id = 100788001;
select *
from ActionPropertyType where id = 39729;
select *
from s11.ActionProperty where action_id = 100788001;

select *
from ActionProperty where action_id = 93981719;


select *
from ActionProperty
where type_id = 39729
  and deleted = 0
  and id not in (select min(ap.id) from ActionProperty ap where ap.type_id = type_id and id = ap.id and ap.deleted = 0)
group by action_id, type_id having count(type_id) > 1



select *
from ActionProperty where type_id = 39729 and deleted = 0 and id not in (select min(ap.id) from ActionProperty ap where /*ap.id = id and ap.type_id = type_id*/ ap.type_id = 39729 group by ap.action_id);
select *
from ActionProperty where action_id =8528991-- 96128815;


select *
from ActionProperty ap where ap.type_id = 39729 and ap.action_id in(select action_id from ActionProperty where ap.type_id = ap.type_id group by action_id having count(type_id)>1)








select * from
    # update
              s12.ActionPropertyType
# set penalty = 100
where valueDomain in ('netricaTypeFromDiseaseStart', 'netricaTransportIntern', 'netricaHospChannel', 'netricaPatientConditionOnAdmission', 'rbTransf') and actionType_id = 15084-- and penalty != 100;

select *
from s11.ActionPropertyType where actionType_id = 15084 and deleted = 0 and (name = 'Канал доставки' or name = 'Доставлен')
union all
select *
from s12.ActionPropertyType where actionType_id = 15084 and deleted = 0 and (name = 'Канал доставки' or name = 'Доставлен')

select *
from Event where externalId = '30769';


select *
from Client where id = 962656;

select *
from Action limit 1;
#
#
#
#
# Кем направлен - оставлям
# Прочие направители - оставляем
# Канал доставки - переделали4
# Подстанция СМП - оставляем
# Признак поступления - оставляем
# Доставлен - переделали
# № машины - скрываем, копируем - запретить ставить ноль, Integer
# № Наряда - оставляем
# Транспортировка - оставляем
# Район доставки - оставляем
# Диагноз направителя - оставляем
# Диагноз приемного отделения - оставляем
# Направлен в отделение - оставляем
# Доставлен в состоянии  опьянения - переделали, без штрафа
# Доставлен в состоянии опьянения - убрать, удалить
# Профиль - оставляем
# Выявлено при поступлении - оставляем
# Причина отказа от госпитализации - оставляем
# Талон ОМС ВМП - оставляем
# Состояние при поступлении - оставляем
# Доставлен - омтавляем
# Кем доставлен - оставляем
# квота - оставляем
# № бригады - перенести


select *
from ActionPropertyType where actionType_id = 15084 and deleted = 0 order by  idx ;


select DATE_SUB(CURDATE(), INTERVAL 2 DAY)



select *
from Event where eventType_id = 94 order by id desc;


select * from ActionType where name regexp 'осмотр.* врача' order by id desc
;




SELECT `a`.`id`, `a`.`actualAppointmentDuration`, `a`.`age`, `a`.`amount`, `a`.`amountEvaluation`, `a`.`checkPeriod`, `a`.`checkPersonSet`, `a`.`class`, `a`.`code`, `a`.`context`, `a`.`counter_id`, `a`.`createDatetime`, `a`.`createPerson_id`, `a`.`defaultBeginDate`, `a`.`defaultDirectionDate`, `a`.`defaultEndDate`, `a`.`defaultExecPerson_id`, `a`.`defaultMES`, `a`.`defaultMKB`, `a`.`defaultMorphology`, `a`.`defaultOrg_id`, `a`.`defaultPersonInEditor`, `a`.`defaultPersonInEvent`, `a`.`defaultPlannedEndDate`, `a`.`defaultStatus`, `a`.`deleted`, `a`.`eventStatusMod`, `a`.`filledLock`, `a`.`filterPosts`, `a`.`filterSpecialities`, `a`.`flatCode`, `a`.`formulaAlias`, `a`.`frequencyCount`, `a`.`frequencyPeriod`, `a`.`frequencyPeriodType`, `a`.`genTimetable`, `a`.`group_id`, `a`.`hasAssistant`, `a`.`isActiveGroup`, `a`.`isAllowedAfterDeath`, `a`.`isAllowedDateAfterDeath`, `a`.`isCustomSum`, `a`.`isExecRequiredForEventExec`, `a`.`isFrequencyPeriodByCalendar`, `a`.`isIgnoreEventExecDate`, `a`.`isMES`, `a`.`isMorphologyRequired`, `a`.`isNomenclatureExpense`, `a`.`isPreferable`, `a`.`isPrinted`, `a`.`isRequiredCoordination`, `a`.`isStrictFrequency`, `a`.`isSubstituteEndDateToEvent`, `a`.`lis_code`, `a`.`locked`, `a`.`maxOccursInEvent`, `a`.`modifyDatetime`, `a`.`modifyPerson_id`, `a`.`name`, `a`.`nomenclativeService_id`, `a`.`office`, `a`.`period`, `a`.`prescribedType_id`, `a`.`propertyAssignedVisible`, `a`.`propertyEvaluationVisible`, `a`.`propertyNormVisible`, `a`.`propertyUnitVisible`, `a`.`quotaType_id`, `a`.`recommendationControl`, `a`.`recommendationExpirePeriod`, `a`.`refferalType_id`, `a`.`serviceType`, `a`.`sex`, `a`.`shedule_id`, `a`.`showAPNotes`, `a`.`showAPOrg`, `a`.`showInForm`, `a`.`showTime`, `a`.`singleInPeriod`, `a`.`title`, `a`.`visible`, `a`.`withoutAgree`
FROM `ActionType` AS `a`
WHERE (`a`.`name` = 'Осмотр дежурного врача') AND (`a`.`code` = '2282-1')
