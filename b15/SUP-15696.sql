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



select at2.name, a.* from Action a
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
where a.deleted = 0 and a.event_id = 33721812
order by a.createDatetime desc




select * from ActionType at2
where at2.group_id = (select at3.id from ActionType at3 where at3.code = 'analyses_new' and at3.deleted= 0)


select at3.* from ActionType at3 where at3.code = 'analyses_new' and at3.deleted= 0







select
jt.*,
a.signature,
at2.code,
a.status ,
at2.name
-- GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' THEN aps.value
-- when apt.typeName = 'Reference' THEN apr.value
-- when apt.typeName = 'Date' THEN apd.value end) separator '\n')
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
left join ActionProperty_Job_Ticket apjt using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33796707
join (select at2.* from ActionType at2 where at2.deleted =0 and at2.group_id = 42943 union select at3.* from ActionType at2 join ActionType at3 on at2.id = at3.group_id where at2.group_id = 42943) at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id-- and apt.typeName != 'JobTicket'
join Job_Ticket jt on jt.id = apjt.value
where ap.deleted = 0
GROUP by a.id ORDER by a.createDatetime, at2.name, apt.idx


select * from Job_Ticket jt ;

select * from rbJobType

select * from ActionType at2 where at2.id in (select apt.actionType_id from ActionPropertyType apt where apt.valueDomain = '999') and at2.deleted = 0;


select jt.* from rbJobType rjt
join Job j on j.jobType_id = rjt.id
join Job_Ticket jt on jt.master_id = j.id
where rjt.code = '999'





select 
case when date(an.datetimeTaken) = '2021.03.17' then an.datetimeTaken end,
case when date(an.datetimeTaken) = '2021.03.19' then an.datetimeTaken end,
date(an.datetimeTaken)
from  
(
select
ttj.datetimeTaken,
at3.name ,
a.id,
a.takenTissueJournal_id ,
-- case when ttj.datetimeTaken
-- at2.name ,
-- a.begDate,
GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end) separator '\n')
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866
join Event e2 on e2.id = a.event_id and e2.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования'
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9')--  and apt.name != 'Номерок'
join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
where ap.deleted = 0
GROUP by a.takenTissueJournal_id, at3.id -- limit 10
) an
-- GROUP by a.id ORDER by a.createDatetime, at2.name, apt.idx










set @sql = null;



select
GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(`createDatetime` = ', `createDatetime`, ',data,NULL)) AS data', `createDatetime`)
  ) INTO @sql
  from ActionType
  
  select @sql;

 
 SET @sql = CONCAT('SELECT  ID, ', @sql, ' 
                  FROM	ActionType
                  GROUP BY id');
                 
                 prepare stmt from @sql;
                execute stml




select
GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(`datetimeTaken` = ', `order`, ',data,NULL)) AS data', `order`)
  ) INTO @sql
--   GROUP_CONCAT(DISTINCT MAX(IF(Date(ttj.datetimeTaken) = Date(ttj.datetimeTaken), Date(ttj.datetimeTaken), NULL))) INTO @sql
-- ttj.datetimeTaken,
-- at3.name ,
-- a.id,
-- a.takenTissueJournal_id,
-- GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' THEN aps.value
-- when apt.typeName = 'Reference' THEN apr.value
-- when apt.typeName = 'Date' THEN apd.value end) separator '\n')
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866
join Event e2 on e2.id = a.event_id and e2.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования'
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9')--  and apt.name != 'Номерок'
join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
where ap.deleted = 0
GROUP by a.takenTissueJournal_id, at3.id









select lastName , [1193] FROM Person PIVOT(count(lastName) for id in ([1193])) as pivottable


select * from TakenTissueJournal ttj where ttj.id = 65370;

select * from Action where id = 99838563;


select * from rbJobType_ActionType rjtat ;