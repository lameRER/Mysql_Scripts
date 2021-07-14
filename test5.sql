select distinct *
from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on ret.id = retres.id_rbEpicrisisTemplates
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on res.id = resrep.id_rbEpicrisisSections
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'Код 1';


select *
from OrgStructure where deleted = 0 and name regexp 'травма|анестези';

INSERT INTO s11.rbEpicrisisTemplates (name, code, id_orgStructure, printTemplate, type, isVisible, actionType_id, editableTime, canCopyOrgStr)
VALUES ('Тест_Выписной эпикриз', 'Код 1', ' 18, 33,', '<div style="font-size:14pt; text-align:center;">
<b>САНКТ-ПЕТЕРБУРГСКОЕ ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ <br>
УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ «ГОРОДСКАЯ БОЛЬНИЦА №15»</b></div>', null, 1, null, 0, ' 12, 13, 14, 15, 16, 17, 18, 19,  20, 28,');

insert into s11.rbEpicrisisSections (name, description)
values  ('Паспортная часть', 'Выписной'),
        ('Диагноз при выписке', null),
        ('Шапка эпикриза', 'Шапка эпикриза'),
        ('Лабораторные исследования', 'Результаты исследований'),
        ('Инструментальные методы', 'Результаты исследований'),
        ('Консультации специалистов', 'Результаты исследований'),
        ('Лечение', ''),
        ('Прочее', 'Результаты исследований'),
        ('Состояние при поступлении', 'Неврологический'),
        ('Лист нетрудоспособности', 'Результаты исследований');

insert into s11.rbEpicrisisProperty (name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
values  ('ФИО пациента', '', 7, '#SELECT CONCAT_WS('' '',  Client.lastName,Client.firstName, Client.patrName, DATE_FORMAT(Client.birthDate,''%d.%m.%Y''), '' '', age(Client.birthDate,CURDATE()), ''лет'',''ИБ №'',Event.externalId) '' ''
#FROM Event INNER JOIN Client ON Event.client_id = Client.id
#WHERE Event.id = %s;

SELECT CONCAT_WS('' '',  Client.lastName,Client.firstName, Client.patrName, ''Дата рождения'', DATE_FORMAT(Client.birthDate,''%d.%m.%Y''), '' '', age(Client.birthDate,CURDATE()), ''лет'',''ИБ №'',Event.externalId) '' ''
FROM Event INNER JOIN Client ON Event.client_id = Client.id
WHERE Event.id = %s', '', 0, 1),
        ('Находился(ась) на стационарном лечении', 'Кол-во дней прибывания', 7, 'select CONCAT_WS('' '', ''с'', Date(e.setDate), ''по'', if(e.execDate is null, CURDATE(), Date(e.execDate))) from Event e
where e.id = %s', null, 0, 0),
        ('Адрес регистрации', null, 7, 'SELECT
  CONCAT(k.NAME,'', Район '', rd.name, '', улица '',s.NAME,'', д.'', ah.number,IF(ah.corpus LIKE '''','''',CONCAT('', корпус '',ah.corpus)),IF(a.flat LIKE '''','''',CONCAT('', кв '',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  INNER JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  INNER JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on rd.id = ca.district_id
WHERE
  (
  ca.id = getClientRegAddressId(ca.client_id)
  )
  AND
  e.id= %s
  ORDER BY ca.type ASC
  LIMIT 1', null, 0, 1),
        ('Полис', null, 7, '   SELECT concat (cp.serial,'' '',cp.number)
  FROM Event e
  INNER JOIN Client c ON e.client_id = c.id
    INNER JOIN ClientPolicy cp ON c.id = cp.client_id

  WHERE e.id=%s

  LIMIT 1

 ', null, 0, 1),
        ('Снилс', null, 7, '   SELECT c.SNILS
  FROM Event e
  INNER JOIN Client c ON e.client_id = c.id


  WHERE e.id=%s

  LIMIT 1

 ', null, 0, 1),
        ('Адрес проживания', '', 7, 'SELECT
  CONCAT(k.NAME,'', Район '', rd.name, '', улица '',s.NAME,'', д.'', ah.number,IF(ah.corpus LIKE '''','''',CONCAT('', корпус '',ah.corpus)),IF(a.flat LIKE '''','''',CONCAT('', кв '',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  INNER JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  INNER JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on rd.id = ca.district_id
WHERE
  (
  ca.id = getClientLocAddressId(ca.client_id)
  )
  AND
  e.id= %s
  ORDER BY ca.type ASC
  LIMIT 1', null, 0, 1),
        ('Паспорт', 'Паспортная часть', 7, 'select CONCAT_WS('' '', CONCAT_WS('' '', ''Серия:'', cd.serial), CONCAT_WS('' '', ''№:'', cd.`number`)) from Client c
 join ClientDocument cd on cd.id = (select max(cd2.id) from ClientDocument cd2 where cd2.client_id = c.id and cd2.deleted = 0)
 join Event e on e.client_id = c.id and e.id = %s', null, 0, 1),
        ('Заключительный диагноз', 'совм.осм. с зав. посл', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''1''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 1, 1),
        ('Сопутствующие заболевания', '', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''9''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 0, 1),
        ('Осложнения основного заболевания', '', 7, 'select CONCAT_WS('' '', d.MKB,m2.DiagName) from Event e
 join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0
 join Diagnosis d on d.id = d2.diagnosis_id and d.deleted = 0 and d.client_id = e.client_id
 join rbDiagnosisType rdt on rdt.id = d2.diagnosisType_id and rdt.code = ''3''
 join MKB m2 on m2.DiagID = d.MKB
 where e.deleted = 0 and e.id = %s ORDER by d2.createDatetime desc limit 1', null, 0, 1),
        ('Клинический диагноз', '', 7, null, null, 0, 1),
        ('ИБ', '', 7, 'SELECT Event.externalId
FROM Event INNER JOIN Client ON Event.client_id = Client.id
WHERE Event.id = %s', null, 0, 1),
        ('Отделение', 'Шапка эпикриза', 7, 'select os.name from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id and os.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        ('Биохимические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Биохимические исследования''")', null, 1, 1),
        ('Анализы стационара', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Анализы стационара''")', null, 1, 1),
        ('Covid-19', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Covid-19''")', null, 1, 1),
        ('Иммунологические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Иммунологические исследования''")', null, 1, 1),
        ('Коагулологические исследования', 'Результаты исследований', 8, 'call procEpicrisisAnalyzes(%s, "''Коагулологические исследования''")', null, 1, 1),
        ('Диагностические назначения', 'Результаты исследований', 8, 'call procEpicrisisDiagnostic(%s, "''Заключение''")', null, 1, 1),
        ('инструментальные исследования', 'Результаты исследований', 7, 'SELECT "" ', null, 0, 1),
        ('', 'Консультации специалистов', 8, 'call procEpicrisisConsult(%s,"''Рекомендовано.?''")', null, 1, 1),
        ('заключения специалистов', 'Консультации специалистов(ручной ввод)', 7, 'SELECT "" ', null, 0, 1),
        ('Диета', 'Лечение', 8, 'select
rd.name `Название диеты`,
min(date(ef.date)) `Дата начала`,
max(date(ef.date)) `Дата окончания`
from Event e
join Event_Feed ef ON ef.event_id = e.id
join rbDiet rd on rd.id = ef.diet_id
where e.id = %s
GROUP by ef.diet_id
order by ef.createDatetime', null, 0, 1),
        ('Лекарственная терапия', 'Лечение', 8, 'select DATE_FORMAT(min(dds.takeDatetime), "%d.%m.%y %H:%i") `Начало`,DATE_FORMAT(max(dds.takeDatetime), "%d.%m.%y\\n%H:%i") `Окончание`, sum(dds.takeDose) `Доза`, rsn.mnn `МНН`
from DrugDestinationSchedule dds
join Action a on a.id = dds.action_id and a.deleted = 0 and a.event_id = %s
join rbStockNomenclature rsn on rsn.id = dds.nomenclature_id and rsn.deleted = 0
join ActionProperty ap on ap.action_id = a.id and ap.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP ''Статус'' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP ''drug_theraphy|drug_theraphy_complex'' and at2.deleted = 0))
join ActionProperty ap2 on ap2.action_id = a.id and ap2.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP ''код'' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP ''drug_theraphy|drug_theraphy_complex'' and at2.deleted = 0))
join ActionProperty_Integer api on ap.id = api.id  and (api.value = 2 or api.value = 1)
join ActionProperty_Integer api2 on ap2.id = api2.id and api2.value = dds.nomenclature_id
WHERE dds.deleted = 0
GROUP by a.id order by dds.id desc', null, 0, 1),
        ('Процедуры и манипуляции', 'Лечение', 7, null, null, 0, 1),
        ('Динамика состояния', 'Лечение', 8, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.code = ''145-6480'' and flatCode = ''diary''
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.name REGEXP ''Состояние''
where ap.deleted = 0
order by a.createDatetime desc limit 1', null, 0, 1),
        ('Лекарственная терапия', 'Лечение', 7, null, null, 0, 1),
        ('Операции', 'ОперБлок', 8, 'select
Date(a1.plannedEndDate) `Дата операции`,
a1.specifiedName `Название операции`
from Event e
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a.parent_id = a1.id
where e.deleted = 0 and e.id = %s;', null, 0, 1),
        ('Рекомендации', 'Лечение', 7, null, null, 0, 1),
        ('Лечащий врач', 'Лечение', 7, 'select CONCAT_WS('' '', p.lastName, p.firstName, p.patrName) from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        ('Зав. отделением', 'Лечение', 7, 'select
CONCAT_WS('' '', p1.lastName, p1.firstName, p1.patrName)
from Event e
join Person p on p.id = e.execPerson_id and p.deleted = 0
join OrgStructure os on os.id = p.orgStructure_id
join Person p1 on p1.id = os.chief_id and p1.deleted = 0
where e.deleted = 0 and e.id = %s', null, 0, 1),
        ('Жалобы при поступлении', 'Неврологический', 7, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name REGEXP ''^Жалобы'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc limit 1', null, 0, 1),
        ('Анамнез заболевания', 'Неврологический', 7, 'select aps.value from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name = ''Анамнез заболевания'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc limit 1', null, 0, 1),
        ('Объективный статус при поступлении', 'Неврологический', 8, 'select apt.name `Название поля`, aps.value `Значение поля` from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = ''''
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name REGEXP ''Сознание|Температура|Кожные покровы|Видимые слизистые|Периферические лимфоузлы|Пульс|Сатурация|Артериальное давление|Тоны сердце|Шумы сердца|Част. дых|Дыхание|Хрипы|Язык|Живот|При пальпации|напряжен в|Симптомы раздражения брюшины|Печень|Поколачивание в поясничной области|Костно-мышечная система, суставы|Физиологические оправления'' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc, apt.idx ', null, 0, 1),
        ('Лист нетрудоспособности', 'Лечение', 8, '(SELECT CONCAT_WS('' '', ti.serial,ti.number) `Больничный лист №` ,ti.begDate `Дата начала`,ti.endDate `Дата окончания` FROM Event e
JOIN TempInvalid ti ON e.client_id = ti.client_id AND ti.deleted = 0
WHERE e.deleted = 0 AND (ti.begDate >= date(e.createDatetime)) AND e.id = %s ORDER BY e.createDatetime DESC LIMIT 1)
UNION
(SELECT tie.number, tie.begDate,tie.endDate FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
WHERE e.id = %s AND e.deleted =0 AND (tie.begDate >= date(e.createDatetime)) ORDER BY e.createDatetime DESC LIMIT 1)', null, 0, 1);

insert into s11.rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, isEditable, htmlTemplate, isRequired)
values  (5, 1, 2, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 4, 4, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 11, 0, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em;''>
    {value}
</div>', 0),
        (5, 12, 6, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 13, 7, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 14, 8, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 15, 9, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
 <b>{name} </b>
</div>
{value}', 0),
        (5, 17, 11, 1, '{value}', 0),
        (5, 19, 5, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
    <b>{name} </b>
</div>
{value}', 0),
        (5, 21, 10, 1, '<div style=''font-size: 14pt; text-align:center; margin-bottom: 0.25em; margin-top: 0.25em; border-bottom:1px solid black; border-top:1px solid black;''>
 <b>{name} </b>
</div>
{value}', 0);


insert into s11.rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
values  (1, 2, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 3, 8, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 5, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 53, 6, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 54, 7, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 71, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (1, 72, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (4, 10, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (4, 11, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (4, 12, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (4, 122, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (11, 49, 1, '<p style=''font-size: 11pt; text-align:center; margin-bottom: 0.1em; margin-top: 0.1em;''>Медицинская карта № </b>{value}</p>
<p style=''font-size: 14pt; text-align:center; margin-bottom: 0.5em; margin-top: 0.5em; border-bottom:1px;''> <b>Выписной эпикриз</b> <br> </p>', 'NULL', 0, 1, 0),
        (11, 70, 0, '<p style=''font-size: 11pt; text-align:center; margin-bottom: 0.5em; margin-top: 0.5em;''> {value}</p>', 'NULL', 0, 1, 0),
        (12, 74, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (12, 75, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (12, 79, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (12, 78, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (12, 77, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (13, 83, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (13, 123, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (14, 98, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (14, 124, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (15, 99, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (15, 100, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 0, 0),
        (15, 101, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (15, 103, 5, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (15, 120, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (15, 121, 4, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (17, 104, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (17, 106, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (17, 107, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (19, 111, 1, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (19, 112, 2, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (19, 113, 3, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0),
        (21, 105, 0, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''> <b>{name}: </b>{value}</p>', 'NULL', 0, 1, 0);

select *
from rbEpicrisisTemplates;