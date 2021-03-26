-- set @return = '';
set @return = 'кал';
select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
regexp_substr(rep.defaultValue, '(AND at).(name|title).*LIKE.*'),
rep.* 
 from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id = 57 -- and rep.name regexp 'кров'
and res.name = 'За время пребывания в ЦРБ проведены обследования' and rep.`type` != 9 and rep.defaultValue regexp @return
group by res.id, rep.id
order by rep.name ;-- retres.idx, resrep.idx;

-- select a2.code, a2.name, a2.title, a.* from action a
--   join actiontype a2 on a2.id = a.actionType_id and class = 1 and (a2.name regexp @return or a2.title regexp @return)
--   where  a.deleted = 0 group by a2.id order by a2.title;
-- 
-- select a2.code, a2.name, a2.title, a.* from action a
--   join actiontype a2 on a2.id = a.actionType_id and class = 1 and (a2.name regexp @return or a2.title regexp @return)
--   where a.event_id = 6137807 and a.deleted = 0 order by a2.title ;


 
 SELECT  
  at.name , at.title ,
  IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
  apt.name 'Фактор',
  aps.value AS 'Результат',
  apt.norm 'Норма' 
  FROM Event e
  INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
  INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=1 AND (at.name regexp @return or at.title regexp @return)
  INNER JOIN ActionPropertyType apt ON apt.actionType_id=at.id AND apt.deleted=0 AND apt.typeName NOT LIKE 'JobTicket'
  INNER JOIN ActionProperty ap ON ap.action_id=a.id AND ap.type_id=apt.id
  LEFT JOIN ActionProperty_String aps ON ap.id=aps.id
  LEFT JOIN ActionPropertyType apt_date ON apt_date.actionType_id=at.id AND apt_date.deleted=0 AND apt_date.typeName LIKE 'JobTicket'
  LEFT JOIN ActionProperty ap_date ON ap_date.action_id=a.id AND ap_date.type_id=apt_date.id AND ap_date.deleted=0
  LEFT JOIN ActionProperty_Job_Ticket  apjt_date ON ap_date.id=apjt_date.id 
  LEFT JOIN Job_Ticket jt ON apjt_date.value=jt.id
--   WHERE
--   e.id=6137807
 ORDER BY a.endDate, 2,1 asc;
 
  SELECT  
  e.id, at.name , at.title ,
  IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
  apt.name 'Фактор',
  aps.value AS 'Результат',
  apt.norm 'Норма' 
  FROM Event e
  INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
  INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=1 AND (at.name regexp @return or at.title regexp @return)
  INNER JOIN ActionPropertyType apt ON apt.actionType_id=at.id AND apt.deleted=0 AND apt.typeName NOT LIKE 'JobTicket'
  INNER JOIN ActionProperty ap ON ap.action_id=a.id AND ap.type_id=apt.id
  LEFT JOIN ActionProperty_String aps ON ap.id=aps.id
  LEFT JOIN ActionPropertyType apt_date ON apt_date.actionType_id=at.id AND apt_date.deleted=0 AND apt_date.typeName LIKE 'JobTicket'
  LEFT JOIN ActionProperty ap_date ON ap_date.action_id=a.id AND ap_date.type_id=apt_date.id AND ap_date.deleted=0
  LEFT JOIN ActionProperty_Job_Ticket  apjt_date ON ap_date.id=apjt_date.id 
  LEFT JOIN Job_Ticket jt ON apjt_date.value=jt.id
  group by a.id ORDER BY a.endDate, 2,1 asc;
  
  
  
-- 
-- select * from rbepicrisistemplates r ;
-- 
-- SELECT  
--   IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
--   apt.name 'Фактор',
--   aps.value AS 'Результат',
--   apt.norm 'Норма'
-- --   ,IF(apt.norm LIKE 'Отрицательный', IF(CAST(REPLACE(aps.value,',','.') AS DECIMAL(6,2))>0,'Без отклонений','Замечено отклонение от нормы'),
-- --     IF(CAST(REPLACE(aps.value,',','.') AS DECIMAL(6,2)) BETWEEN
-- --               CAST(REPLACE(SUBSTRING_INDEX(apt.norm,' ',1),',','.') AS DECIMAL(6,2)) 
-- --               AND CAST(REPLACE(SUBSTRING_INDEX(apt.norm,' ',-1),',','.') AS DECIMAL(6,2)),'Без отклонений','Замечено отклонение от нормы')) 'Отклонение от нормы'  
--   FROM Event e
--   INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
--   INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=1 AND at.name LIKE 'Клинический анализ кала'
--   INNER JOIN ActionPropertyType apt ON apt.actionType_id=at.id AND apt.deleted=0 AND apt.typeName NOT LIKE 'JobTicket'
--   INNER JOIN ActionProperty ap ON ap.action_id=a.id AND ap.type_id=apt.id
--   LEFT JOIN ActionProperty_String aps ON ap.id=aps.id
--   LEFT JOIN ActionPropertyType apt_date ON apt_date.actionType_id=at.id AND apt_date.deleted=0 AND apt_date.typeName LIKE 'JobTicket'
--   LEFT JOIN ActionProperty ap_date ON ap_date.action_id=a.id AND ap_date.type_id=apt_date.id AND ap_date.deleted=0
--   LEFT JOIN ActionProperty_Job_Ticket  apjt_date ON ap_date.id=apjt_date.id 
--   LEFT JOIN Job_Ticket jt ON apjt_date.value=jt.id
--   WHERE
--   e.id=%s
--   ORDER BY a.endDate, 2,1 ASC
-- 
-- 
-- 
--   
--   
--   select a2.code, a2.name, a2.title, a.* from action a
--   join actiontype a2 on a2.id = a.actionType_id and class = 1-- and a2.name regexp 'мочи'
--   where a.event_id = 6137807 and a.deleted = 0 order by a2.title 
--   
--   
--   select * from actiontype a where a.name = 'Общий (клинический) анализ крови';
  
  