
select * from Event e where e.client_id = 846712;


select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
ret.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.code = 'Код 2'
-- where rep.name REGEXP 'Анамнез заболевания'
group by res.id, rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id 


-- insert into rbEpicrisisTemplates (name, code, id_orgStructure)
-- select ret.name, 'Код 2' code, ret.id_orgStructure from rbEpicrisisTemplates ret where ret.name = 'Выписной эпикриз';

select * from rbEpicrisisTemplates ret ;
select * from rbEpicrisisProperty rep ;
select * from rbEpicrisisSections res ;


INSERT into rbEpicrisisSections (name, description)
select 'Отделение' name, 'Шапка эпикриза' description;


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue)
select 'Отделение' name, 'Шапка эпикриза' description, 8 `type`, 'select os.name from OrgStructure os\nwhere os.id in(12,13,14,15,16,17,18,19,20,22,23,24) ORDER by os.name' defaultValue


INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable)
select res.id id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, 0 idx, resrep.htmlTemplate, resrep.orgStruct, resrep.isRequired, resrep.isEditable from rbEpicrisisSections_rbEpicrisisProperty resrep, rbEpicrisisProperty rep , rbEpicrisisSections res 
where rep.name = 'Отделение' and res.name = 'Отделение'
GROUP by res.id 


INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, isEditable, htmlTemplate, isRequired)
select 4 id_rbEpicrisisTemplates, res.id id_rbEpicrisisSections, 0 idx, isEditable, htmlTemplate, isRequired FROM rbEpicrisisTemplates_rbEpicrisisSections, rbEpicrisisSections res
where res.name  = 'Отделение' GROUP by res.id 

select '' `Отделение`
UNION 
(select os.name `Отделение` from OrgStructure os
where os.id in(12,13,14,15,16,17,18,19,20,22,23,24)) ORDER by `Отделение`

-- UPDATE 
select * from
rbEpicrisisProperty rep 
-- set rep.`type` = 9, defaultValue = 'select ''\nunion\nselect os.name from OrgStructure os\nwhere os.id in(12,13,14,15,16,17,18,19,20,22,23,24) ORDER by os.name'
where rep.name = 'отделение';


select os.name from OrgStructure os where os.id in(12,13,14,15,16,17,18,19,20,22,23,24) ORDER by name 

set @return2 = null;
set @return3 = null;

set @return2 = (SELECT GROUP_CONCAT(ep.id) FROM rbEpicrisisProperty ep WHERE 
((ep.name REGEXP 'ФИО пациента' /*and description = 'Проведенное лечение'*/) 
-- or (ep.name REGEXP 'Заключение' and description = 'Предоперационный эпикриз КХО')
));
SET @return = (SELECT GROUP_CONCAT(et.id) FROM rbEpicrisisTemplates et WHERE et.code = '14');
set @return3 = (SELECT GROUP_CONCAT(es.id) FROM rbEpicrisisSections es WHERE 
(es.name REGEXP '' /*and description = ''*//*AND es.description = (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id= @return)*/)
);





SET @es_ai_s:=@es_ai_e:= (SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'pes' AND TABLE_NAME = 'rbEpicrisisSections');
INSERT LOW_PRIORITY rbEpicrisisSections(id, name, description)
SELECT * FROM (
SELECT @es_ai_e:=@es_ai_e+1, '' name, (SELECT et.name FROM rbEpicrisisTemplates et WHERE FIND_IN_SET(et.id,@return) limit 1) description
) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisSections es WHERE es.name = tmp.name AND es.description = tmp.description); 
set @return3 = NULL;

INSERT LOW_PRIORITY rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
SELECT es.id, ep.id, ROW_NUMBER() OVER(ORDER BY esep.idx) + IFNULL((SELECT MAX(esep.idx) FROM rbEpicrisisSections_rbEpicrisisProperty esep WHERE esep.id_rbEpicrisisSections = (SELECT MAX(es1.id) FROM rbEpicrisisSections es1)),0) FROM rbEpicrisisProperty ep, rbEpicrisisSections es, rbEpicrisisSections_rbEpicrisisProperty esep 
WHERE ((es.id BETWEEN @es_ai_s AND @es_ai_e) or es.id =  @return3) AND ((ep.id BETWEEN @ep_ai_s AND @ep_ai_e)or(FIND_IN_SET(ep.id, @return2)) = IF(esep.id_rbEpicrisisProperty = ep.id, esep.id_rbEpicrisisProperty = ep.id, ep.id))  GROUP BY ep.id;

 set @idx_count = 0;
INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
SELECT * FROM (SELECT et.id et_id, es.id es_id, @idx_count:=@idx_count+1 + IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE etes.id_rbEpicrisisTemplates = FIND_IN_SET(et.id,@return)),0) FROM rbEpicrisisTemplates et, rbEpicrisisSections es, rbEpicrisisTemplates_rbEpicrisisSections etes
WHERE ((es.id BETWEEN @es_ai_s AND @es_ai_e) OR FIND_IN_SET(es.id,@return3)) AND et.id = @return GROUP BY es.id) tmp
WHERE NOT EXISTS(SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE tmp.es_id = etes.id_rbEpicrisisSections AND tmp.et_id = etes.id_rbEpicrisisTemplates);


-- INSERT LOW_PRIORITY rbEpicrisisTemplates_rbEpicrisisSections(id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
-- SELECT * FROM (SELECT et.id et_id, es.id es_id, IFNULL((SELECT MAX(etes.idx) FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE FIND_IN_SET(etes.id_rbEpicrisisTemplates ,@return)),0) FROM rbEpicrisisTemplates et, rbEpicrisisSections es, rbEpicrisisTemplates_rbEpicrisisSections etes
-- WHERE ((es.id BETWEEN @es_ai_s AND @es_ai_e) OR FIND_IN_SET(es.id,@return3)) AND FIND_IN_SET(et.id, @return) GROUP BY es.id,et.id) tmp
-- WHERE NOT EXISTS(SELECT * FROM rbEpicrisisTemplates_rbEpicrisisSections etes WHERE tmp.es_id = etes.id_rbEpicrisisSections AND tmp.et_id = etes.id_rbEpicrisisTemplates);


select * from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where FIND_IN_SET(ret.id,@return) AND (rep.id BETWEEN @ep_ai_s and @ep_ai_e) AND (res.id BETWEEN @es_ai_s and @es_ai_e)
order by retres.idx, resrep.idx ;

 SET @ep_ai_s:=@ep_ai_e:=@es_ai_s:=@es_ai_e:= NULL;

-- commit;
