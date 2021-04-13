select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
retres.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id and resrep.isOld = 0
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.name REGEXP 'КХО 4'
group by res.id-- , rep.id
order by  retres.idx, resrep.idx;

select * from rbEpicrisisTemplates ret where ret.name REGEXP 'Выписной';

select * from rbEpicrisisTemplates_rbEpicrisisSections retres ;


INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
select  retres.id_rbEpicrisisTemplates,  res.id id_rbEpicrisisSections, 111 idx from rbEpicrisisTemplates_rbEpicrisisSections retres, (select * from rbEpicrisisSections res order by res.id desc limit 1) res
where retres.id in(3291,3305,3332,3347) GROUP by retres.id_rbEpicrisisTemplates 

select * from rbEpicrisisTemplates_rbEpicrisisSections retres where id_rbEpicrisisTemplates = 136;


select * from rbEpicrisisSections res ;


select * from ActionType at2 where group_id = 20933 and at2.deleted = 0 and at2.class = 4;


INSERT into rbEpicrisisProperty (name, description, `type`,printAsTable, isCopy)
select 'Биохимический профиль', '', 8, 1, 1

insert into rbEpicrisisSections (name, description)
select 'Анализы', '';


insert into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select res.id id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, 0 idx from rbEpicrisisSections_rbEpicrisisProperty resrep,rbEpicrisisProperty rep, rbEpicrisisSections res order by rep.id DESC, res.id desc limit 1;

inset




select * from ActionType at2 where at2.name REGEXP 'Биох';

select * from ActionType at2 where at2.group_id = 20933;



SELECT
  IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y %h:%i'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
  apt.name 'Фактор',
  aps.value AS 'Результат',
  ap.norm 'Норма'
   ,IF(ap.norm LIKE 'Отрицательный', IF(CAST(REPLACE(aps.value,',','.') AS DECIMAL(6,2))>0,'Без отклонений','Замечено отклонение от нормы'),
     IF(CAST(REPLACE(aps.value,',','.') AS DECIMAL(6,2)) BETWEEN
               CAST(REPLACE(SUBSTRING_INDEX(ap.norm,' ',1),',','.') AS DECIMAL(6,2))
               AND CAST(REPLACE(SUBSTRING_INDEX(ap.norm,' ',-1),',','.') AS DECIMAL(6,2)),'Без отклонений','Замечено отклонение от нормы')) 'Отклонение от нормы'
  FROM Event e
  INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
  INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=4 AND at.group_id = 20933
  INNER JOIN ActionPropertyType apt ON apt.actionType_id=at.id AND apt.deleted=0 AND apt.typeName NOT LIKE 'JobTicket'
  INNER JOIN ActionProperty ap ON ap.action_id=a.id AND ap.type_id=apt.id
  LEFT JOIN ActionProperty_String aps ON ap.id=aps.id
  LEFT JOIN ActionPropertyType apt_date ON apt_date.actionType_id=at.id AND apt_date.deleted=0 AND apt_date.typeName LIKE 'JobTicket'
  LEFT JOIN ActionProperty ap_date ON ap_date.action_id=a.id AND ap_date.type_id=apt_date.id AND ap_date.deleted=0
  LEFT JOIN ActionProperty_Job_Ticket  apjt_date ON ap_date.id=apjt_date.id
  LEFT JOIN Job_Ticket jt ON apjt_date.value=jt.id
  WHERE
  e.id=%s
  ORDER BY a.endDate, 2,1 ASC
