SELECT 
CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `ФИО`, 
min(Date(e.setDate)),
max(Date(e.setDate)),
Count(if(at2.name regexp
'^МРТ', a.id, NULL)) `МРТ (всего)`,
COUNT(DISTINCT e.client_id) `Всего пациентов`,
count(if(at2.name regexp 'контраст', a.id, NULL)) `Всего с КУ`,
count(if(at2.name = 'МРТ головного мозга и его оболочек', a.id, NULL)) `головной мозг`,
count(if(at2.name = 'МРТ головного мозга с внутривенным контрастным усилением', a.id, NULL)) `головной мозг с в/в контр.`,
count(if(at2.name = 'МРТ сосудов головного мозга (МР-ангиография)', a.id, NULL)) `МР-ангиография`,
'' `МР-венография`,
count(if(at2.name = 'МРТ орбит', a.id, NULL)) `орбиты`,
count(if(at2.name = 'МРТ орбит с внутривенным контрастированием', a.id, NULL)) `орбиты с в/в контр.`,
'' `ППН`,
'' `ППН с К.У`,
count(if(at2.name regexp '^МРТ мягких тканей шеи$|^МРТ мягких тканей A05\.01\.002$', a.id, NULL)) `мягкие ткани `,
count(if(at2.name regexp '^МРТ мягких тканей контрастированием', a.id, NULL)) `мягкие ткани с в/в контр.`,
count(if(at2.name regexp 'МРТ средостения$', a.id, NULL)) `средостение`,
count(if(at2.name = 'МРТ средостения с внутривенным контрастным усилением', a.id, NULL)) `Средостение с К.У`,
count(if(at2.name = 'МРТ брюшной полости', a.id, NULL)) `брюшная полость`,
count(if(at2.name = 'МРТ брюшной полости с внутривенным контрастированием', a.id, NULL)) `брюшная полость с К.У`,
count(if(at2.name = 'МРТ органов малого таза', a.id, NULL)) `малый таз`,
count(if(at2.name = 'МРТ органов малого таза с внутривенным контрастированием', a.id, NULL)) `малый таз с в/в контр.`,
count(if(at2.name regexp 'позвоночника$', a.id, NULL)) `Позвоночник (ш; гр. п/к)`,
count(if(at2.name regexp 'позвоночника с контрастированием', a.id, NULL)) `позвоночник с в/в контр`,
count(if(at2.name = 'МРТ спинного мозга и его оболочек', a.id, NULL)) `спинной мозг`,
count(if(at2.name = 'МРТ спинного мозга и его оболочек с внутривенным контрастным усилением', a.id, NULL)) `спинной мозг с в/в контр`,
count(if(at2.name = 'МРТ плечевого сустава', a.id, NULL)) `плечевой сустав`,
count(if(at2.name = 'МРТ плечевого сустава с внутривенным контрастным усилением', a.id, NULL)) `плечевой сустав с в/в контр`,
count(if(at2.name = 'МРТ коленного сустава', a.id, NULL)) `коленный сустав`,
'' `Голеностопный сустав и др.`,
count(if(at2.name = 'МРТ тазобедренных суставов', a.id, NULL)) `тазобедренные суставы`,
count(if(at2.name = 'МРТ тазобедренных суставов с внутривенным контрастным усилением', a.id, NULL)) `тазобедренные суставы с в/в контр`,
count(if(at2.name = 'МРТ тазобедренных суставов+бедренных костей (Протокол обследования при болезни Гоше)', a.id, NULL)) `бедренные кости`,
'' `Грудная полость`,
count(if(at2.name = 'МРТ забрюшинного пространства', a.id, NULL)) `Забрюшинное пространство`,
count(if(at2.name = 'МРТ костей таза', a.id, NULL)) `Кости таза и др.`,
count(if(at2.name = 'МРТ костей таза c контрастированием', a.id, NULL)) `Кости таза и др. с к.у`,
'' `Все тело`,
'' `Адм. разрешения`,
'' `ВМП`,
'' `ОМС`,
'' `Платные`,
'' `Консультации`
FROM Event e 
join Event e2 on e.id = e2.id
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
join Action a on a.event_id = e2.id and a.deleted = 0 and a.status = 2
left join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and 
at2.name REGEXP "^МРТ головного мозга и его оболочек$|^МРТ головного мозга с внутривенным контрастным усилением$|^МРТ сосудов головного мозга \\(МР-ангиография\\)$|^МРТ орбит$|^МРТ орбит с внутривенным контрастированием$|^МРТ мягких тканей шеи$|^МРТ мягких тканей A05\.01\.002$|^МРТ мягких тканей контрастированием|^МРТ средостения$$|^МРТ средостения с внутривенным контрастным усилением$|^МРТ брюшной полости$|^МРТ брюшной полости с внутривенным контрастированием$|^МРТ органов малого таза$|^МРТ органов малого таза с внутривенным контрастированием$|позвоночника$|позвоночника с контрастированием|^МРТ спинного мозга и его оболочек$|^МРТ спинного мозга и его оболочек с внутривенным контрастным усилением$|^МРТ плечевого сустава$|^МРТ плечевого сустава с внутривенным контрастным усилением$|^МРТ коленного сустава$|^МРТ тазобедренных суставов$|^МРТ тазобедренных суставов с внутривенным контрастным усилением$|^МРТ тазобедренных суставов\\+бедренных костей \\(Протокол обследования при болезни Гоше\\)$|^МРТ забрюшинного пространства$|^МРТ костей таза$|^МРТ костей таза c контрастированием$"
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :Person_id limit 1;


-- Пластинина	Любовь	Васильевна
select * from Person p where id = 1407;


select * from rbSpecialVariablesPreferences rsvp where rsvp.name = 'SpecialVar_OtchetRentgenologam';

select * from rbPrintTemplateMeta rptm  order by id desc;


select * from rbPrintTemplate rpt where id = 34372;



select * from rbSpecialVariablesPreferences rsvp where arguments REGEXP 'person' order by id desc;

select * from rbPrintTemplate rpt where templateText REGEXP 'SpecialVar_039u02Vra';

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_ListNablyudeniyDoc';


select * from rbPrintTemplate rpt where id = 29354;


select * from rbPrintTemplateMeta rptm where template_id = 29354;



select * from rbPrintTemplate rpt where id = 34370;


select * from rbPrintTemplateMeta rptm where template_id = 34370 order by id desc;

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_Temp_List';

-- SELECT 
-- CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `ФИО`, 
-- min(Date(e.setDate)),
-- max(Date(e.setDate)),
-- -- count(DISTINCT case when a.id is not null then a.id
-- -- when a1.id is not null then a1.id end)
-- count(DISTINCT a.id) `МРТ (всего)`,
-- COUNT(DISTINCT e.client_id) `Всего пациентов`,
-- '' `Всего с КУ`,
-- count(DISTINCT a1.id) `головной мозг`,
-- count(DISTINCT a2.id) `головной мозг с в/в контр.`,
-- count(DISTINCT a3.id) `МР-ангиография`,
-- '' `МР-венография`,
-- '' `орбиты`,
-- '' `орбиты с в/в контр.`,
-- '' `ППН`,
-- '' `ППН с К.У`,
-- '' `мягкие ткани `,
-- '' `мягкие ткани с в/в контр.`,
-- '' `средостение`,
-- '' `Средостение с К.У`,
-- '' `брюшная полость`,
-- '' `брюшная полость с К.У`,
-- '' `малый таз`,
-- '' `малый таз с в/в контр.`,
-- ''`Позвоночник (ш; гр. п/к)`,
-- '' `позвоночник с в/в контр`,
-- '' `спинной мозг`,
-- '' `спинной мозг с в/в контр`,
-- '' `плечевой сустав`,
-- '' `плечевой сустав с в/в контр`,
-- '' `коленный сустав`,
-- '' `Голеностопный сустав и др.`,
-- '' `тазобедренные суставы`,
-- '' `тазобедренные суставы с в/в контр`,
-- '' `бедренные кости`,
-- '' `Грудная полость`,
-- '' `Забрюшинное пространство`,
-- '' `Кости таза и др.`,
-- '' `Кости таза и др. с к.у`,
-- '' `Все тело`,
-- '' `Адм. разрешения`,
-- '' `ВМП`,
-- '' `ОМС`,
-- '' `Платные`,
-- '' `Консультации`
-- -- e.execPerson_id, e.* 
-- FROM Event e 
-- join Event e2 on e.client_id = e2.client_id
-- join Event e3 on e.client_id = e3.client_id
-- join Event e4 on e.client_id = e4.client_id
-- join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
-- left join Action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "^МРТ")
-- left join Action a1 on a1.event_id = e2.id and a1.deleted = 0 and a1.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "МРТ головного мозга и его оболочек")
-- left join Action a2 on a2.event_id = e3.id and a2.deleted = 0 and a2.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "МРТ головного мозга с внутривенным контрастным усилением")
-- left join Action a3 on a3.event_id = e4.id and a3.deleted = 0 and a3.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "МРТ сосудов головного мозга (МР-ангиография)")
-- where 
-- e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and 
-- e2.deleted = 0 and e2.setDate BETWEEN :Date1 and :Date2 and e2.execPerson_id = :PersonId and 
-- e3.deleted = 0 and e3.setDate BETWEEN :Date1 and :Date2 and e3.execPerson_id = :PersonId



select * from rbPrintTemplate rpt where templateText REGEXP 'cell';