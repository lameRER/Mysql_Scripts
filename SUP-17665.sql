
set @flatCode = 'received';
set @ActionType = (select id from ActionType where flatCode = @flatCode and deleted = 0);
set @ActionPropertyType = 'Доставлен';
set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = @ActionPropertyType and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = @ActionPropertyType and actionType_id = @ActionType and deleted = 0 and typeName = 'Reference');




# insert into ActionProperty_Reference(id, `index`, value)
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

# update
select ap.* from
    ActionProperty ap
left Join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.flatCode = @flatCode
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted =0 and ap.type_id = apt.id and apt.id = @ActionPropertyTypeOld
# set ap.type_id = @ActionPropertyTypeNew
where ap.deleted= 0 and aps.id is not null;


set @ActionPropertyTypeOld = (select id from ActionPropertyType where name = 'Кем доставлен' and actionType_id = @ActionType and deleted = 0 and typeName = 'String');
set @ActionPropertyTypeNew = (select id from ActionPropertyType where name = 'Канал доставки' and actionType_id = @ActionType and deleted = 0 and typeName = 'Reference');


select @ActionPropertyTypeNew;

set @test = (select group_concat((select id from ActionPropertyType where actionType_id = @ActionType and (id = @ActionPropertyTypeNew or id = @ActionPropertyTypeOld) and deleted = 0 order by idx) separator ','));

select group_concat((select id from ActionPropertyType where actionType_id = @ActionType and (id = @ActionPropertyTypeNew or id = @ActionPropertyTypeOld) and deleted = 0 order by idx) separator ',')


select *
from ActionPropertyType where actionType_id = @ActionType;

select *
from ActionPropertyType where actionType_id = @ActionType

select *
from netricaHospChannel;

СМП
Самотек
Перевод из ЛПУ прикрепленного района
Перевод из ЛПУ неприкрепленного района
Перевод из первичного сосудистого отделения в региональный сосуд
Перевод из другого отделения ЛПУ в связи с уточнением диагноза
Перевод из другого отделения ЛПУ в связи с возникновением внутри
Перевод из ЛПУ неприкрепленного района








select *
from ActionProperty where type_id = 35423;

select *
from ActionPropertyType where actionType_id = 15084;

select *
from Person;


select *
from ActionProperty_String where id = 250003765;


select action_id
from ActionProperty where id =;

select *
from Action where id = 98151098;


select a.event_id
from ActionProperty ap
join Action a on a.id = ap.action_id
where ap.deleted = 0 and a.event_id is not null



select *
from ActionProperty_String_copy_07_06_21;

select *
from ActionProperty_Reference;

