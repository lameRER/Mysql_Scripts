t

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








# select * from
# update
#               ActionPropertyType
# set penalty = 100
# where valueDomain in ('netricaTypeFromDiseaseStart', 'netricaTransportIntern', 'netricaHospChannel', 'netricaPatientConditionOnAdmission', 'rbTransf') and actionType_id = 15084-- and penalty != 100;
#
#
#
#
# Кем направлен - оставлям
# Прочие направители - оставляем
# Канал доставки - переделали
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