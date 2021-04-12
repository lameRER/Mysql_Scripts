select * from rbepicrisisproperty r where r.name regexp 'крови' and r.`type` = 8

select * from rbepicrisissections_rbepicrisisproperty rr where rr.id_rbEpicrisisProperty = 584 or rr.id_rbEpicrisisProperty = 1499;

select et.* from epicrisis e 
join epicrisisproperty e2 on e2.id = e.id and e2.htmlTemplate = 584
join epicrisisproperty_table et on et.id = e2.idTable 
where e.event_id = 6213972 and e.isDelete =0;


select * from epicrisisproperty e ;

insert into rbepicrisisproperty (name, description, `type`, defaultValue, valueDomain, printAsTable)
select r.name, r.description, r.`type`, r.defaultValue, r.valueDomain, r.printAsTable from rbepicrisisproperty r where r.id = 584;

select * from rbepicrisistemplates r ;



select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where  ret.id = 64 and resrep.isOld = 0
group by res.id, rep.id
order by  retres.idx, resrep.idx;




SELECT  
  IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y %h:%i'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
  apt.name 'Наименовагие исследования',
  aps.value AS 'Заключение'
  FROM Event e
  INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
  INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=1  AND at.title LIKE 'Клинический анализ крови'
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