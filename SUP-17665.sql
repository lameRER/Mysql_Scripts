use s12;
set @flatCode = 'received';
set @ActionType = (select id from ActionType where flatCode = @flatCode and deleted = 0);
set @ActionPropertyType = 'Доставлен';
set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = @ActionPropertyType and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = @ActionPropertyType and actionType_id = @ActionType and deleted = 0 and typeName = 'Reference');

insert into ActionProperty_String_id_to_delete(id, idx, value)
select aps.*
from ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
where ap.deleted= 0 and aps.id is not null;

insert into ActionProperty_Reference(id, `index`, value)
select aps.id, 0,
       case
           when aps.value regexp '^в первые 6часов|^1 час|^2 часа|^3 часа|^4|^4 часа|^5 часов|^6 часов|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">1 час< /font>< /font>|^< font style="vertical-align: inherit;">< font style="vertical-align: inherit;">4 часа< /font>< /font>' then 4
           when  aps.value regexp '^в течении 7-24 часов|^7-12 часов|^7-24 часов|^12-24 часов' then 5
           when aps.value regexp '^менее 2 суток|^более 24-х часов|^более 7 суток|^менее 3 суток|^менее 4 суток|^менее 5 суток|^менее 6 суток|^менее 7 суток|^позднее 24-х часов' then 6 end
from ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
where ap.deleted= 0 and aps.id is not null;

update
# select ap.* from
    ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
set ap.type_id = @ActionPropertyTypeNew
where ap.deleted= 0 and aps.id is not null;


UPDATE ActionPropertyType SET idx = 5, penalty = 100, penaltyUserProfile = '29; 7; 19; 32; 31; 53; 36; 37; 57; 48; 63', visibleInDR = 1, userProfile_id = null, userProfileBehaviour = 0 WHERE id = 38920;
UPDATE ActionPropertyType SET idx = 20, penalty = 0, penaltyUserProfile = '7;19', visibleInDR = 0, userProfile_id = 1, userProfileBehaviour = 1 WHERE id = 35423;






set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = 'Кем доставлен' and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = 'Канал доставки' and actionType_id = @ActionType and deleted = 0 and typeName = 'Reference');

insert into ActionProperty_String_id_to_delete(id, idx, value)
select aps.*
from ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
where ap.deleted= 0 and aps.id is not null;

insert into ActionProperty_Reference(id, `index`, value)
select aps.id, 0,
       case
           when aps.value = 'Самостоятельно' then 2
           when  aps.value = 'СМП' then 1
           when aps.value = 'Неотложная помощь' then 1
           when aps.value = 'Сан. транспорт' then 1 end
from ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
where ap.deleted= 0 and aps.id is not null;

UPDATE ActionPropertyType SET idx = 2, visibleInDR = 1, userProfile_id = null, userProfileBehaviour = 0 WHERE id = 38922;
UPDATE ActionPropertyType SET idx = 21, visibleInDR = 0, userProfile_id = 1, userProfileBehaviour = 1 WHERE id = 35418;






select *
from ActionProperty_String_copy_07_06_21;


select *
from ActionProperty_String_copy_23_06_21;



