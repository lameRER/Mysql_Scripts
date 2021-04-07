


select * from Client c where c.lastName = 'Романова' and c.firstName = 'Валентина' and c.patrName = 'Яковлевна';

18958


select 
a.id,
CONCAT_WS(' ', c2.lastName, c2.firstName, c2.patrName) `ФИО`,
c2.birthDate `Дата рождения`,
e.setDate `Дата поступления`,
GROUP_CONCAT(oshb.code separator '\n'),
GROUP_CONCAT(os.name separator '\n') 
from ActionProperty ap 
left join ActionProperty_OrgStructure apos using(Id)
left join ActionProperty_HospitalBed aphb using(Id)
left join OrgStructure os on os.id = apos.value 
left join OrgStructure_HospitalBed oshb on oshb.id = aphb.value 
join Action a on ap.action_id = a.id
join Event e on e.id = a.event_id 
join Client c2 on c2.id = e.client_id and c2.id = 18958
join ActionType at2 on at2.id = a.actionType_id and at2.flatCode = 'moving'
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and (apt.name = 'койка' or apt.name = 'Отделение пребывания')
-- where os.id = 27
GROUP by a.id
;




select
-- aphb.value,
-- oshb.*,''
at2.name, a.*,
at2.name, at2.flatCode 
from ActionProperty ap 
left join ActionProperty_OrgStructure apos using(Id)
left join ActionProperty_HospitalBed aphb using(Id)
left join OrgStructure os on os.id = apos.value 
left join OrgStructure_HospitalBed oshb on oshb.id = aphb.value 
join Action a on ap.action_id = a.id and a.deleted = 0
join Event e on e.id = a.event_id 
join Client c2 on c2.id = e.client_id and c2.id = 18958
join ActionType at2 on at2.id = a.actionType_id and (at2.flatCode = 'moving' or at2.flatCode = 'received' or at2.flatCode = 'leaved')
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id-- and (apt.name = 'койка' or apt.name = 'Отделение пребывания')
-- where os.id = 27
-- GROUP by a.id


2015-05-18 03:34:49 2015-05-19 12:45:30 -- Назначили койку
2015-05-19 01:05:07 -- Назначили койку


SET @dateStart = '2015-05-18T14:44:37', @dateFinih = '2015-05-19T13:05:07', @ID_orgStr = '27', @ID_hosp = '2';--  816 94

select
e.externalId `Номер ИБ`,
CONCAT_WS(' ', c2.lastName, c2.firstName, c2.patrName) `ФИО`,
c2.birthDate `Дата рождения`,
e.setDate `Дата поступления`,
GROUP_CONCAT(oshb.code separator '\n') `номер палаты`,
GROUP_CONCAT(os.name separator '\n') `Отделение пребывания` 
from ActionProperty ap 
left join ActionProperty_HospitalBed aphb using(Id)
left join OrgStructure_HospitalBed oshb on oshb.id = aphb.value 
left join OrgStructure os on os.id = oshb.master_id 
join Action a on ap.action_id = a.id
join Event e on e.id = a.event_id 
join Client c2 on c2.id = e.client_id-- and c2.id = 18958
join ActionType at2 on at2.id = a.actionType_id and at2.flatCode = 'moving'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id-- and apt.name = 'Отделение пребывания'
where oshb.master_id = @ID_orgStr and oshb.code = @ID_hosp and ((a.createDatetime >= @dateStart AND a.createDatetime <= @dateFinih)
        OR (a.endDate >= @dateStart AND a.endDate <= @dateFinih)
  OR (a.createDatetime <= @dateFinih AND a.endDate IS NULL))
GROUP by a.id;


SET @dateStart = '2015-05-19T13:05:07', @dateFinih = '2015-05-28T12:40:52', @ID_orgStr = '36', @ID_hosp = '306';--  816 94

select
e.externalId `Номер ИБ`,
CONCAT_WS(' ', c2.lastName, c2.firstName, c2.patrName) `ФИО`,
c2.birthDate `Дата рождения`,
e.setDate `Дата поступления`,
GROUP_CONCAT(oshb.code separator '\n') `номер палаты`,
GROUP_CONCAT(os.name separator '\n') `Отделение пребывания` 
from ActionProperty ap 
left join ActionProperty_HospitalBed aphb using(Id)
left join OrgStructure_HospitalBed oshb on oshb.id = aphb.value 
left join OrgStructure os on os.id = oshb.master_id 
join Action a on ap.action_id = a.id
join Event e on e.id = a.event_id 
join Client c2 on c2.id = e.client_id-- and c2.id = 18958
join ActionType at2 on at2.id = a.actionType_id and at2.flatCode = 'moving'
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id-- and apt.name = 'Отделение пребывания'
where oshb.master_id = @ID_orgStr and oshb.code = @ID_hosp and ((a.createDatetime >= @dateStart AND a.createDatetime <= @dateFinih)
        OR (a.endDate >= @dateStart AND a.endDate <= @dateFinih)
  OR (a.createDatetime <= @dateFinih AND a.endDate IS NULL))
GROUP by a.id;


select * from OrgStructure_HospitalBed oshb ;






select * from ActionPropertyType apt where apt.actionType_id = 15080;
select * from ActionProperty ap where ap.action_id = 140532;


select * from OrgStructure_HospitalBed oshb ;


за период с 18.05.2015г по 28.05.2015г кто лежал в палате с пациентом Романова Валентина Яковлевна, дата рождения: 27.03.1953 (68 лет) пол: Ж код: 18958 в отделение id=27 с 18.05.2015-19..05.2015г в палате № 2 и с 19.05.2015 -28.05.2015г в отделение id=36 в палате № 306
база: s11, 10.108.76.7


select * from OrgStructure os where os.id = 27;