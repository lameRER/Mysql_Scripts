select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
-- ret.*
-- retres.*
-- resrep.*,
-- res.*
rep.*
from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code REGEXP '^код 2' -- and resrep.id_rbEpicrisisSections = 14
group by res.id, rep.id
order by  retres.idx, resrep.idx;


select * from rbEpicrisisTemplates ret ;

select * from OrgStructure os ;



select 
Date(a1.plannedEndDate) `Дата операции`,
a1.specifiedName `Название операции`
from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a.parent_id = a1.id 
where e.deleted = 0 and e.id = %s;



select * from Action a
where a.event_id = 33721812 and a.deleted = 0




INSERT into rbEpicrisisSections (name, description)
select 'Лист нетрудоспособности' name, description from rbEpicrisisSections where id = 12;


insert into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
select retres.id_rbEpicrisisTemplates, (select id from rbEpicrisisSections where id = LAST_INSERT_ID()) id_rbEpicrisisSections, max(retres.idx)+1 from rbEpicrisisTemplates_rbEpicrisisSections retres 
-- where retres.id_rbEpicrisisTemplates = 4 ;
group by retres.id_rbEpicrisisTemplates 

select * from rbEpicrisisSections res order by id desc;

INSERT into rbEpicrisisProperty (name, description, `type`)
select 'Операции' name, 'ОперБлок' description, 8 `type` from rbEpicrisisProperty where id = 100 limit 1;

insert into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select res.id id_rbEpicrisisSections, (select id from rbEpicrisisProperty where id = LAST_INSERT_ID()) id_rbEpicrisisProperty, IFNULL(max(resrep.idx),0) 
from rbEpicrisisSections res 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
where res.id = 15
limit 1;



select * from rbEpicrisisTemplates_rbEpicrisisSections retres order by id desc;



insert into rbEpicrisisProperty (name, description, `type`)
(SELECT 'ЭКГ', 'Результаты исследований', 8
union
SELECT 'Рентгенограмма органов грудной клетки', 'Результаты исследований', 8
union
SELECT 'Рентгенограмма грудного, поясничного, шейного', 'Результаты исследований', 8
union
SELECT 'УЗИ брюшной полости + почки', 'Результаты исследований', 8
union
SELECT 'УЗИ почек', 'Результаты исследований', 8
union
SELECT 'УЗИ плевральных полостей', 'Результаты исследований', 8
union
SELECT 'ЭХОКГ', 'Результаты исследований', 8
union
SELECT 'УЗДС БЦА ', 'Результаты исследований', 8
union
SELECT 'УЗАС нижних конечностей', 'Результаты исследований', 8
union
SELECT 'УЗАС верхних конечностей', 'Результаты исследований', 8
union
SELECT 'УЗИ щитовидной железы', 'Результаты исследований', 8
union
SELECT 'КТ головного мозга', 'Результаты исследований', 8
union
SELECT 'КТ органов грудной клетки', 'Результаты исследований', 8
union
SELECT 'КТ брюшной полости', 'Результаты исследований', 8
union
SELECT 'МРТ', 'Результаты исследований', 8)


set @return = 0;
insert into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select 13 id_rbEpicrisisSections, id id_rbEpicrisisProperty, @return:=@return+1 idx from rbEpicrisisProperty order by id desc limit 15;


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue, valueDomain, printAsTable, isCopy)
select 'Коагулологические исследования:' name, rep.description, rep.`type`, rep.defaultValue, rep.valueDomain, rep.printAsTable, rep.isCopy from rbEpicrisisProperty rep where rep.name REGEXP 'Анализы стационара'
union
select 'Иммунологические исследования:' name, rep.description, rep.`type`, rep.defaultValue, rep.valueDomain, rep.printAsTable, rep.isCopy from rbEpicrisisProperty rep where rep.name REGEXP 'Анализы стационара'
union
select 'Covid-19:' name, rep.description, rep.`type`, rep.defaultValue, rep.valueDomain, rep.printAsTable, rep.isCopy from rbEpicrisisProperty rep where rep.name REGEXP 'Анализы стационара'


-- Set @return = 0
-- INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
-- select 12 id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, @return:=@return+(max(idx)+1)+1 from rbEpicrisisProperty rep, rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 12 group by rep.id order by rep.id desc limit 3 ;

select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 12;


select * from rbEpicrisisProperty rep where rep.id in(79,78,77);



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
jt
a.status ,
at2.name,
GROUP_CONCAT(CONCAT(apt.name,": ", case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end) separator '\n')
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



CALL procEpicrisisAnalyzes('ActionType', 'createDatetime', 'createDatetime', 'createDatetime', '', '');

SELECT  GROUP_CONCAT(CONCAT('SUM(IF(createDatetime = ', '"', val, '"', ', createDatetime, 0)) AS ', '"', val, '"') SEPARATOR ",
")  INTO @sums FROM ( SELECT DISTINCT createDatetime AS val  FROM ActionType  ORDER BY 1 limit 10 ) AS top

SELECT @sums

SUM(IF(createDatetime = "0000-00-00 00:00:00", createDatetime, 0)) AS "0000-00-00 00:00:00",
SUM(IF(createDatetime = "2000-00-00 00:00:00", createDatetime, 0)) AS "2000-00-00 00:00:00",
SUM(IF(createDatetime = "2011-03-03 19:10:37", createDatetime, 0)) AS "2011-03-03 19:10:37",
SUM(IF(createDatetime = "2011-03-03 20:47:03", createDatetime, 0)) AS "2011-03-03 20:47:03",
SUM(IF(createDatetime = "2011-03-05 13:19:24", createDatetime, 0)) AS "2011-03-05 13:19:24",
SUM(IF(createDatetime = "2011-03-05 13:29:27", createDatetime, 0)) AS "2011-03-05 13:29:27",
SUM(IF(createDatetime = "2011-03-18 17:22:42", createDatetime, 0)) AS "2011-03-18 17:22:42",
SUM(IF(createDatetime = "2011-03-18 17:22:43", createDatetime, 0)) AS "2011-03-18 17:22:43",
SUM(IF(createDatetime = "2011-04-07 14:40:23", createDatetime, 0)) AS "2011-04-07 14:40:23",
SUM(IF(createDatetime = "2011-04-16 16:38:36", createDatetime, 0)) AS "2011-04-16 16:38:36"





SET @subq = CONCAT('SELECT DISTINCT ', 'createDatetime', ' AS val ',
                    ' FROM ', 'ActionType', ' ', '', ' ORDER BY 1');
                   
                   
SELECT @subq                  

SELECT DISTINCT createDatetime AS val  FROM ActionType  ORDER BY 1

                   

SET @cc1 = "CONCAT('SUM(IF(&p = ', &v, ', &t, 0)) AS ', &v)";
    SET @cc2 = REPLACE(@cc1, '&p', 'createDatetime');
    SET @cc3 = REPLACE(@cc2, '&t', 'createDatetime');
    -- select @cc2, @cc3;
    SET @qval = CONCAT("'\"', val, '\"'");
    -- select @qval;
    SET @cc4 = REPLACE(@cc3, '&v', @qval);
    -- select @cc4;

    SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', @cc4, ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;

    SELECT  GROUP_CONCAT(CONCAT('SUM(IF(createDatetime = ', '"', val, '"', ', createDatetime, 0)) AS ', '"', val, '"') SEPARATOR ",
")  INTO @sums FROM ( SELECT DISTINCT createDatetime AS val  FROM ActionType  ORDER BY 1 ) AS top


select @sums


 SET @stmt2 = CONCAT(
            'SELECT ',
                'id', ',\n',
                @sums,
                ',\n SUM(', tally_col, ') AS Total'
            '\n FROM ', 'ActionType', ' ',
            '',
            ' GROUP BY ', 'id',
            '\n WITH ROLLUP',
            '\n', '';



			SELECT 
            ActionType 
            @sums,
            ',\n SUM(', tally_col, ') AS Total'
            '\n FROM ', tbl_name, ' ',
            where_clause,
            ' GROUP BY ', base_cols,
            '\n WITH ROLLUP',
            '\n', order_by



SELECT createDatetime, SUM(id) AS Total FROM ActionType GROUP BY createDatetime WITH ROLLUP






select * from ActionType at2 ;


   SET @subq = CONCAT('SELECT DISTINCT ', pivot_col, ' AS val ',
                    ' FROM ', tbl_name, ' ', where_clause, ' ORDER BY 1');


SET @subq = CONCAT('SELECT DISTINCT ', at2.name, ' AS val ', ' FROM ', s11.ActionType at2, ' ', where_clause, ' ORDER BY 1');
                   
                   select @qsubq
                   
                   
                   
select CONCAT('SELECT DISTINCT ', 'test');






select
apt.name,
GROUP_CONCAT(
case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end separator "\n") as `Результаты`
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866
join Event e2 on e2.id = a.event_id and e2.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования'
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок'
join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
where ap.deleted = 0
GROUP by at3.id, apt.id;



select * from Event e where e.id = 33824866



set @sql_count = 0;

select
at3.name,
SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT CONCAT(date(ttj.datetimeTaken), ';') separator ''), ";", 1) as name,
SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT CONCAT(date(ttj.datetimeTaken), ';') separator ''), ";", 2), ';', -1) as `1`,
SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT CONCAT(date(ttj.datetimeTaken), ';') separator ''), ";", 3), ';', -1) as `2`,
SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT CONCAT(date(ttj.datetimeTaken), ';') separator ''), ";", 4), ';', -1) as `3`,
SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT CONCAT(date(ttj.datetimeTaken), ';') separator ''), ";", 5), ';', -1) as `4`
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
UNION 
select
apt.name ,
case when ttj.datetimeTaken = ttj.datetimeTaken then 
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
-- GROUP by a.takenTissueJournal_id, at3.id -- limit 10







SELECT name AS Item,
COLUMN_JSON("test,test1") AS 'Attribute Names'
FROM ActionType;


select * from ActionType at2 ;


set @sql = null;



select
GROUP_CONCAT(DISTINCT
    CONCAT(
      'MAX(IF(`createDatetime` = ', `createDatetime`, ',data,NULL)) AS data', `createDatetime`)
  ) INTO @sql
  from ActionType;

 
 SET @sql = CONCAT('SELECT  ID, ', @sql, ' 
                  FROM	ActionType
                  GROUP BY id');
                 
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;




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

















select id, createDatetime from ActionType;

	'ActionType'
    'name'
    'createDatetime'
    'id'



SET @subq = 'select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y\n%H:%i") valas, ttj.datetimeTaken val, case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ''Биохимические исследования'' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken';

SELECT @subq;



-- SET @subq = CONCAT('SELECT DISTINCT ', 'Date(createDatetime)', ' AS val ',
--                     ' FROM ', 'ActionType', ' ', '', ' ORDER BY 1 limit 10');
SET @cc1 = "CONCAT('IF(&p = ', &v, ', &t, NULL) AS ', &vas)";
select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'ttj.datetimeTaken');
select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end');
select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc3, '&vas', @qvalas);
select @cc4;


SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', REGEXP_REPLACE(@cc4, '(\'String\')(.*)(\'Reference\')(.*)(\'Date\')', '\'\\1\'\\2\'\\3\'\\4\'\\5\''), ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
SELECT @stmt;

SELECT  GROUP_CONCAT(CONCAT('IF(ttj.datetimeTaken = ', &v, ', case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end, NULL) AS ', '"', valas, '"') SEPARATOR ",
")  INTO @sums FROM ( select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y
%H:%i") valas, ttj.datetimeTaken val case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken ) AS top


SELECT @sums;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name', ',\n',
                @sums,                 
            '\n FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ''Биохимические исследования'' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id', ' ',
            '',
            '\n', '');
SELECT @stmt2

SELECT apt.Name,
IF(ttj.datetimeTaken = "2021-03-17 09:17:00", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, 0) AS "2021-03-17 09:17:00",IF(ttj.datetimeTaken = "2021-03-19 09:16:14", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, 0) AS "2021-03-19 09:16:14"
 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id 
 


call procEpicrisisAnalyzes()
	 

SELECT apt.Name,
GROUP_CONCAT(IF(ttj.datetimeTaken = "2021-03-17 09:17:00", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "2021-03-17 09:17:00",
GROUP_CONCAT(IF(ttj.datetimeTaken = "2021-03-19 09:16:14", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "2021-03-19 09:16:14"
 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id 



 set @temp = "procEpicrisisAnalyzes()"

PREPARE stmt1 FROM @stmt2;
EXECUTE stmt1; 





select
ttj.datetimeTaken val,
case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end 
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866
join Event e2 on e2.id = a.event_id and e2.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0-- and at3.name = 'Биохимические исследования'
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок'
join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
where ap.deleted = 0




select
apt.id,
at3.name ,
apt.name,
ttj.datetimeTaken ,
-- GROUP_CONCAT(case when Date(ttj.datetimeTaken) = '2021-03-17' then
-- case when apt.typeName = 'String' THEN aps.value
-- when apt.typeName = 'Reference' THEN apr.value
-- when apt.typeName = 'Date' THEN apd.value end end separator '') as `Результаты`,
-- GROUP_CONCAT(case when Date(ttj.datetimeTaken) = '2021-03-19' then
-- case when apt.typeName = 'String' THEN aps.value
-- when apt.typeName = 'Reference' THEN apr.value
-- when apt.typeName = 'Date' THEN apd.value end end separator '') as `Результаты`
case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end as `Результаты`,
case when apt.typeName = 'String' THEN aps.value
when apt.typeName = 'Reference' THEN apr.value
when apt.typeName = 'Date' THEN apd.value end  as `Результаты`
from ActionProperty ap
left join ActionProperty_String aps using(id)
left join ActionProperty_Reference apr using(id)
left join ActionProperty_Date apd using(id)
join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33827444
join Event e2 on e2.id = a.event_id and e2.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 -- and at3.name = 'Биохимические исследования'
join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок'
join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id
where ap.deleted = 0 
-- GROUP by at3.id ;



CALL  procEpicrisisAnalyzes(33827444, "'Биохимические исследования'")



SELECT apt.Name,
GROUP_CONCAT(IF(ttj.datetimeTaken = "2021-03-17 09:17:00", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "17.03.21
09:17",
GROUP_CONCAT(IF(ttj.datetimeTaken = "2021-03-19 09:16:14", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "19.03.21
09:16",
GROUP_CONCAT(IF(ttj.datetimeTaken = "2021-03-29 09:10:20", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "29.03.21
09:10"
 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33827444 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id 



SELECT apt.Name,
IF(ttj.datetimeTaken = "2021-03-17 09:17:00", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL) AS "2021-03-17 09:17:00",
IF(ttj.datetimeTaken = "2021-03-19 09:16:14", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL) AS "2021-03-19 09:16:14"
 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id 

 
SELECT @subq


select ttj.datetimeTaken val, case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = Биохимические исследованияjoin ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken





select * from ActionType at2 where at2.group_id = 42943 GROUP by at3.;

SELECT apt.Name,
IF(ttj.datetimeTaken = "2021-03-17 09:17:00", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL) AS "17.03.21
09:17",
IF(ttj.datetimeTaken = "2021-03-19 09:16:14", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL) AS "19.03.21
09:16",
IF(ttj.datetimeTaken = "2021-03-29 09:10:20", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL) AS "29.03.21
09:10"
 FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = 'Биохимические исследования' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP '999|9767|2-9') and apt.name != 'Номерок' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id 






sET @subq = 'select DATE_FORMAT(ttj.datetimeTaken, "%d.%m.%y\n%H:%i") valas, ttj.datetimeTaken val, case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = 33824866 join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ''Биохимические исследования'' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by ttj.datetimeTaken';
    

SET @cc1 = "CONCAT('IF(&p = ', &v, ', &t, NULL) AS ', &as)";
select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'ttj.datetimeTaken');
select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end');
select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
-- select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
select @cc4;
    

SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', REGEXP_REPLACE(@cc4, '(\'String\')(.*)(\'Reference\')(.*)(\'Date\')', '\'\\1\'\\2\'\\3\'\\4\'\\5\''), ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      
    DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name', ',\n',
                @sums,                 
            	'\n FROM ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Reference apr using(id) left join ActionProperty_Date apd using(id) join Action a on a.id = ap.action_id and a.deleted = 0 and a.event_id = ',
            	EventID, 
            	' join Event e2 on e2.id = a.event_id and e2.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0 and at3.name = ',
            	AnalyzesType, 
            	' join ActionPropertyType apt on apt.id = ap.type_id and apt.actionType_id = at2.id and at2.id in (select DISTINCT apt.actionType_id from ActionPropertyType apt where apt.valueDomain REGEXP ''999|9767|2-9'') and apt.name != ''Номерок'' join TakenTissueJournal ttj on ttj.id = a.takenTissueJournal_id and ttj.client_id = e2.client_id where ap.deleted = 0 GROUP by at3.id, apt.id', ' ',
            	'',
            	'\n', '');
--     select @stmt2;                    
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     

select * from Event e where externalId = '11594';






select * from ActionType at2 where at2.group_id  =22228;

select a.endDate val from ActionProperty ap 
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = 33796707
join ActionType at2 on at2.id = a.actionType_id and at2.name  regexp 'брюшной полости' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4
where ap.deleted = 0





set @EventID = 33796707;
set @DiagnosticType = "'брюшной полости'";


SET @subq = CONCAT('select DATE_FORMAT(a.endDate, "%d.%m.%y\n%H:%i") valas, a.endDate val from ActionProperty ap ', 
'join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
@EventID,
' join ActionType at2 on at2.id = a.actionType_id and at2.name  regexp ', 
@DiagnosticType, 
' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4 join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName != ''JobTicket'' ',
'where ap.deleted = 0 GROUP by a.endDate');
    

    SET @cc1 = "CONCAT('GROUP_CONCAT(IF(&p = ', &v, ', &t, NULL)) AS ', &as)";
-- select @cc1;
SET @cc2 = REPLACE(@cc1, '&p', 'a.endDate');
-- select @cc2;
SET @cc3 = REPLACE(@cc2, '&t', 'case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end');
-- select @cc3;
set @qval = CONCAT("'\"', val, '\"'");
set @qvalas = CONCAT("'\"', valas, '\"'");
-- select @qval;
SET @cc4 = REPLACE(@cc3, '&v', @qval);
SET @cc4 = REPLACE(@cc4, '&as', @qvalas);
-- select @cc4;
    

SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', REGEXP_REPLACE(@cc4, '(\'String\')(.*)(\'Reference\')(.*)(\'Date\')', '\'\\1\'\\2\'\\3\'\\4\'\\5\''), ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
    
    SELECT  GROUP_CONCAT(CONCAT('GROUP_CONCAT(IF(a.endDate = ', '"', val, '"', ', case when apt.typeName = ''String'' THEN aps.value when apt.typeName = ''Reference'' THEN apr.value when apt.typeName = ''Date'' THEN apd.value end, NULL)) AS ', '"', valas, '"') SEPARATOR ",")  INTO @sums FROM ( select DATE_FORMAT(a.endDate, "%d.%m.%y
%H:%i") valas, a.endDate val from ActionProperty ap join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = 33796707 join ActionType at2 on at2.id = a.actionType_id and at2.name  regexp 'брюшной полости' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4 join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName != 'JobTicket' where ap.deleted = 0 GROUP by a.endDate ) AS top
    
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      
    DEALLOCATE PREPARE _sql;
SET @stmt2 = CONCAT(
            'SELECT ',
                'apt.Name', ',\n',
                @sums,                 
            	'\n from ActionProperty ap left join ActionProperty_String aps using(id) left join ActionProperty_Date apd using(id) left join ActionProperty_Reference apr using(id) join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = ',
            	@EventID, 
            	' join ActionType at2 on at2.id = a.actionType_id and at2.name  regexp ',
            	@DiagnosticType, 
            	' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4 join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName != ''JobTicket'' where ap.deleted = 0', ' ',
            	'',
            	'\n', '');
    select @stmt2;     
    


   SELECT apt.Name,
GROUP_CONCAT(IF(a.endDate = "2021-03-25 13:41:18", case when apt.typeName = 'String' THEN aps.value when apt.typeName = 'Reference' THEN apr.value when apt.typeName = 'Date' THEN apd.value end, NULL)) AS "25.03.21
13:41"
 from ActionProperty ap 
 left join ActionProperty_String aps using(id) 
 left join ActionProperty_Date apd using(id) 
 left join ActionProperty_Reference apr using(id) 
 join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 and a.event_id = 33796707 
 join ActionType at2 on at2.id = a.actionType_id and at2.name  regexp 'брюшной полости' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4 
 join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName != 'JobTicket' where ap.deleted = 0 group by at2.id, apt.id order by apt.idx

   
   

select a.event_id, apt.name, aps.value, apd.value, apr.value from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Date apd using(id)
left join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.status = 2 -- and a.event_id = 33796707
join ActionType at2 on at2.id = a.actionType_id and at2.name = 'ЭКГ' and at2.class = 1 and at2.deleted = 0 and at2.serviceType != 4
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.deleted = 0 and apt.typeName != 'JobTicket'
where ap.deleted = 0



select * from Event e where e.externalId = '1539';

select * from ActionType where id = 2108 ;


