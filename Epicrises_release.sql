-- start transaction

select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
-- where rep.name REGEXP 'проведенное ле' and resrep.id = 39871
group by rep.id
order by  retres.idx, resrep.idx;
-- order by rep.id 


set @return2 = null;
set @return3 = null;

set @return2 = (SELECT GROUP_CONCAT(ep.id) FROM rbEpicrisisProperty ep WHERE 
((ep.name REGEXP 'Рекомендации' and description = 'Проведенное лечение') 
or (ep.name REGEXP 'Заключение' and description = 'Предоперационный эпикриз КХО')
));
SET @return = (SELECT GROUP_CONCAT(et.id) FROM rbEpicrisisTemplates et WHERE et.code = '14');
set @return3 = (SELECT GROUP_CONCAT(es.id) FROM rbEpicrisisSections es WHERE 
(es.name REGEXP '' /*and description = ''*//*AND es.description = (SELECT et.name FROM rbEpicrisisTemplates et WHERE et.id= @return)*/)
);



set @temprp = 'SELECT apt.name, IFNULL(aps.value,apd.value), apd.value, aps.value FROM Action a
join ActionType at ON a.actionType_id = at.id AND at.name = ''RW''
JOIN ActionProperty ap ON a.id = ap.action_id
JOIN ActionPropertyType apt ON ap.type_id = apt.id AND ap.type_id = apt.id AND apt.name REGEXP ''^Результат$|^Дата$''
left join ActionProperty_String aps ON aps.id = ap.id
left join ActionProperty_Date apd ON apd.id = ap.id
where a.event_id = %s
order by a.createDatetime desc, apt.idx';


-- SET @ep_ai_s:=@ep_ai_e:= (SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'pes' AND TABLE_NAME = 'rbEpicrisisProperty');
-- INSERT LOW_PRIORITY rbEpicrisisProperty(id, name, description, type, defaultValue)
-- SELECT * FROM (
-- SELECT @ep_ai_e:=@ep_ai_e+1, 'RW' name, (SELECT et.name FROM rbEpicrisisTemplates et WHERE FIND_IN_SET(et.id,@return) LIMIT 1) description, 8 type, REPLACE(@temprp, 'RW', 'RW') defaultValue
-- ) tmp
-- WHERE NOT EXISTS(SELECT * FROM rbEpicrisisProperty ep WHERE ep.name = tmp.name AND ep.description = tmp.description AND ep.type = tmp.type); 
-- set @return2 = NULL;

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
