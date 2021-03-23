select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
-- retres.* 
resrep.*
from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'код 2'
group by res.id, rep.id 
order by  retres.idx, resrep.idx;


set @ret = 1;
INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
select ret.id id_rbEpicrisisTemplates, res.id id_rbEpicrisisSections, @ret:=@ret+1 idx from rbEpicrisisTemplates ret, rbEpicrisisSections res
where ret.code = 'код 2'


select * from rbEpicrisisSections res ;


select rep.* from rbEpicrisisProperty rep, rbEpicrisisSections_rbEpicrisisProperty resrep
where id_rbEpicrisisSections = 1 and resrep.id_rbEpicrisisProperty = rep.id 
ORDER by resrep.idx;


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue, valueDomain, printAsTable, isCopy)
select 'Адрес проживания' name, rep.description, rep.`type`, rep.defaultValue, rep.valueDomain, rep.printAsTable, rep.isCopy from rbEpicrisisProperty rep where rep.id = 5

INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select 1 id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, (select max(resrep.idx) from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = (select res.id from rbEpicrisisSections res where res.id = 1))+1 idx from rbEpicrisisProperty rep where rep.name = 'Адрес проживания';


select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 1 order by resrep.idx;


select * from rbEpicrisisTemplates_rbEpicrisisSections retres 
where retres.id_rbEpicrisisTemplates = 4



select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 1 ORDER by resrep.idx ;

select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 11 ORDER by resrep.idx ;

select * from rbEpicrisisSections res where id = 11;


select * from rbEpicrisisTemplates_rbEpicrisisSections  where id_rbEpicrisisTemplates  = 4 ORDER by idx ;




select * from rbEpicrisisTemplates_rbEpicrisisSections retres 
where retres.id_rbEpicrisisTemplates = (select ret.id from rbEpicrisisTemplates ret where ret.code = 'Код 2')

select ret.* from rbEpicrisisTemplates ret where ret.code = 'Код 2'


select * from rbEpicrisisProperty rep order by id desc;


 

select apt.* from ActionPropertyType apt 
join ActionType at2 on apt.actionType_id = at2.id and at2.deleted = 0 and at2.code = '1-1-2' 
where apt.deleted = 0 ORDER by apt.idx


select apt.name `Название поля`, aps.value `Значение поля` from ActionProperty ap
left join ActionProperty_String aps using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = %s
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.code = '1-1-2'
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.name REGEXP '
Сознание|Температура|Кожные покровы|Видимые слизистые|Периферические лимфоузлы|Пульс|Сатурация|Артериальное давление|Тоны сердце|Шумы сердца|Част. дых|Дыхание|Хрипы|Язык|Живот|При пальпации|напряжен в|Симптомы раздражения брюшины|Печень|Поколачивание в поясничной области|Костно-мышечная система, суставы|Физиологические оправления' and apt.deleted = 0
where ap.deleted = 0 ORDER by a.createDatetime desc, apt.idx 


select rep.*
from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisSections res, rbEpicrisisProperty rep 
where resrep.id_rbEpicrisisSections = res.id and res.id = 5 and resrep.id_rbEpicrisisProperty = rep.id
 GROUP by resrep.id ORDER by resrep.idx
 
 
select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 5;


 select p.org_id from Person p ;	
 
 
 select * from rbDiagnosisType rdt1 ;
 

INSERT into rbEpicrisisSections (name , description)
select 'Результаты исследований' name, 'Результаты исследований' description


select * from rbEpicrisisSections res order by id desc;


INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, isEditable, htmlTemplate, isRequired)
select ret.id id_rbEpicrisisTemplates, 12 id_rbEpicrisisSections, max(retres.idx)+1 idx, retres.isEditable, retres.htmlTemplate, retres.isRequired from rbEpicrisisTemplates_rbEpicrisisSections retres, rbEpicrisisTemplates ret 
where retres.id_rbEpicrisisTemplates = ret.id and ret.code = 'Код 2' 

set @ret = 0;
INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable)
select 12 id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, @ret:=@ret+1 idx, resrep.htmlTemplate, resrep.orgStruct, resrep.isRequired, resrep.isEditable from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep 
where rep.id in(75,74) 
GROUP  by rep.id


INSERT INTO rbEpicrisisProperty (name, description, `type`)
select 'Лабораторные исследования:' name, 'Результаты исследований' description, 8 `type`
union 
select 'Инструментальные методы:' name, 'Результаты исследований' description, 8 `type`


select * from rbEpicrisisProperty rep order by rep.id desc;