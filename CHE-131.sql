select count(rep.id) num,
GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
rep.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.id in(127,128,130,129)
group by res.id, rep.id
order by  retres.idx, resrep.idx;



select * from rbEpicrisisTemplates ret ;





select 
at2.name, GROUP_CONCAT(apt.name, ': ' ,
CASE when apt.typeName regexp 'String|Constructor|text' THEN aps.value 
when apt.typeName regexp 'Double' THEN apd.value 
when apt.typeName regexp 'Regerence' THEN apr.value end separator '\n')
from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Double apd using(id)
left join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0 and a.id = (select a.id from Action a where a.deleted = 0 /*and a.event_id = %s */and a.actionType_id in (select id from ActionType where class = 4 and deleted = 0) order by a.createDatetime desc limit 1)
JOIN ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.class = 4 
join ActionPropertyType apt on apt.actionType_id = at2.id and apt.id = ap.type_id and apt.deleted = 0 and apt.name != 'Номерок' and apt.typeName != 'TissueType'
where ap.deleted = 0 order by apt.idx







select 
at2.name, GROUP_CONCAT(apt.typeName, ' werwe', apt.name, ': ',
CASE when apt.typeName regexp 'String|Constructor|text' THEN aps.value 
when apt.typeName regexp 'Double' THEN apd.value 
when apt.typeName regexp 'Regerence' THEN apr.value end separator '\n')
from ActionProperty ap 
left join ActionProperty_String aps using(id)
left join ActionProperty_Double apd using(id)
left join ActionProperty_Reference apr using(id)
join Action a on ap.action_id = a.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.class = 4 and at2.deleted = 0
join ActionPropertyType apt on apt.id = ap.type_id and at2.id = apt.actionType_id and apt.deleted = 0
where ap.deleted = 0
GROUP by apt.typeName 




select * FROM ActionProperty ap 
join Action a on a.id = ap.action_id 
join ActionType at2 on at2.id = a.actionType_id and at2.id = 21472
join ActionPropertyType apt on apt.actionType_id = at2.id and ap.type_id = apt.id and apt.id = 186112




select * from ActionProperty_ArterialPressure apap where id in(275607,276165,280684,281869,289007,290342,290600,295512);


select * from Probe p ;







select * from TakenTissueJournal ttj ;







SELECT
    aps.value AS result,
    apt.name AS nameresult,
    apt.unit_id,
    ttj.createDatetime,
    ttj.modifyDatetime,
    ttj.tissueType_id AS tisType,
    nlol.datetime AS datatime
    FROM logger.N3LabOrderLog nlol
    JOIN s11.Client c ON nlol.client_id = c.id
    JOIN TakenTissueJournal ttj ON ttj.id = nlol.takenTissueJournal_id
    JOIN Action a ON ttj.id = a.takenTissueJournal_id
    JOIN Event e ON a.event_id = e.id
    JOIN ActionType at ON a.actionType_id = at.id
    JOIN ActionProperty ap ON a.id = ap.action_id
    JOIN ActionProperty_String aps ON ap.id = aps.id
    JOIN ActionPropertyType apt ON ap.type_id = apt.id
    WHERE nlol.datetime in (SELECT nlol.datetime
    FROM logger.N3LabOrderLog nlol
    JOIN s11.Client c ON nlol.client_id = c.id
    JOIN TakenTissueJournal ttj ON ttj.id = nlol.takenTissueJournal_id
    JOIN Action a ON ttj.id = a.takenTissueJournal_id
    JOIN Event e ON a.event_id = e.id
    JOIN ActionType at ON a.actionType_id = at.id
    JOIN ActionProperty ap ON a.id = ap.action_id
    JOIN ActionProperty_String aps ON ap.id = aps.id
    JOIN ActionPropertyType apt ON ap.type_id = apt.id
     ORDER BY nlol.datetime )






