select
r3.* 
from rbepicrisistemplates r 
join rbepicrisistemplates_rbepicrisissections rr on rr.id_rbEpicrisisTemplates = r.id 
join rbepicrisissections r2 on r2.id = rr.id_rbEpicrisisSections
join rbepicrisissections_rbepicrisisproperty rr2 on rr2.id_rbEpicrisisSections = r2.id
join rbepicrisisproperty r3 on r3.id = rr2.id_rbEpicrisisProperty
where r.id = 79 and r2.name = 'За время пребывания в ЦРБ проведены обследования' and r3.name regexp '^К'
order by rr.idx, rr2.idx 


select * from rbepicrisissections_rbepicrisisproperty rr where rr.id_rbEpicrisisProperty = 1496;






INSERT INTO s11vm.rbepicrisissections_rbepicrisisproperty
(id, id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable)
VALUES(6601, 193, 1496, 77, '<p style=''font-size: 11pt; text-align:left; margin-bottom: 0.5em; margin-top: 0.5em;''>
 <b>{name}: </b>{value}
</p>', NULL, 0, 1);




select * from actiontype a where a.name regexp 'Коагулограмма';



select distinct a3.name, a3.typeName from actionproperty ap
join action a on a.id = ap.action_id and a.deleted = 0
join actiontype a2 on a2.id = a.actionType_id and a2.deleted = 0 and a2.class = 1
join actionpropertytype a3 on a3.actionType_id = a2.id and a3.id = ap.type_id and a3.deleted = 0






SELECT  
  IFNULL(DATE_FORMAT(a.endDate,'%d.%m.%Y'),'ДАТА НЕ УКАЗАНА') AS 'Дата',
  apt.name 'Фактор',
  aps.value AS 'Результат',
  apt.norm 'Норма' 
  FROM Event e
  INNER JOIN Action a ON a.event_id=e.id AND a.deleted=0
  INNER JOIN ActionType at ON a.actionType_id=at.id AND at.deleted=0 AND at.class=1 AND at.name regexp 'Коагулограмма'
  INNER JOIN ActionPropertyType apt ON apt.actionType_id=at.id AND apt.deleted=0 AND apt.typeName NOT LIKE 'JobTicket'
  INNER JOIN ActionProperty ap ON ap.action_id=a.id AND ap.type_id=apt.id
  LEFT JOIN ActionProperty_String aps ON ap.id=aps.id
  LEFT JOIN ActionPropertyType apt_date ON apt_date.actionType_id=at.id AND apt_date.deleted=0 AND apt_date.typeName LIKE 'JobTicket'
  LEFT JOIN ActionProperty ap_date ON ap_date.action_id=a.id AND ap_date.type_id=apt_date.id AND ap_date.deleted=0
  LEFT JOIN ActionProperty_Job_Ticket  apjt_date ON ap_date.id=apjt_date.id 
  LEFT JOIN Job_Ticket jt ON apjt_date.value=jt.id
  WHERE
  e.id= %s
  ORDER BY a.endDate, 2,1 ASC



