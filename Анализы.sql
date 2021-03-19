SET @eventid = '33741633';
SET @actionid ='' -- '98398194'-- '^98398195$'
  ;
SET @begdatarus = ''-- '2020-08-20 20:12:14'
;



SELECT 
CONCAT_WS(' ', CONCAT('s11(',s11event.aID, ')'), CONCAT('s12(',s12event.aID,')'))AS ifaid,
CONCAT_WS(' ', CONCAT('s11(',s11event.aBegDate, ')'), CONCAT('s12(',s12event.aBegDate,')')) AS ifabegdate,
CONCAT_WS(' ', CONCAT('s11(',s11event.atID, ')'), CONCAT('s12(',s12event.atID,')')) AS ifatid,
CONCAT_WS(' ', CONCAT('s11(',s11event.atName, ')'), CONCAT('s12(',s12event.atName,')'))AS ifatname,
CONCAT_WS(' ', CONCAT('s11(',s11event.aptID, ')'), CONCAT('s12(',s12event.aptID,')'))AS ifaptid,
CONCAT_WS(' ', CONCAT('s11(',s11event.aptName, ')'), CONCAT('s12(',s12event.aptName,')'))AS ifaptname,
CONCAT_WS(' ', CONCAT('s11(',s11event.apid, ')'), CONCAT('s12(',s12event.apid,')')) AS ifapid,
CONCAT_WS(' ', CONCAT('s11(',s11event.apsValue, ')'), CONCAT('s12(',s12event.apsValue,')'))AS ifapsvalue,
--        IF(STRCMP(IFNULL(s11event.aID, 'error'), IFNULL(s12event.aID, 'error')), CONCAT_WS(' ', 'ERROR', s12event.aID), s11event.aID) AS ifaid,
--        IF(STRCMP(IFNULL(s11event.aBegDate, 'error'), IFNULL(s12event.aBegDate, 'error')), CONCAT_WS(' ', 'ERROR',s12event.aBegDate), s11event.aBegDate) AS ifabegdate,
--        IF(STRCMP(IFNULL(s11event.atID, 'error'), IFNULL(s12event.atID, 'error')), CONCAT_WS(' ', 'ERROR',s12event.atID), s11event.atID) AS ifatid,
--        IF(STRCMP(IFNULL(s11event.atName, 'error'), IFNULL(s12event.atName, 'error')), CONCAT_WS(' ', 'ERROR',s12event.atName), s11event.atName) AS ifatname,
--        IF(STRCMP(IFNULL(s11event.aptID, 'error'), IFNULL(s12event.aptID, 'error')), CONCAT_WS(' ', 'ERROR',s12event.aptID), s11event.aptID) AS ifaptid,
--        IF(STRCMP(IFNULL(s11event.aptName, 'error'), IFNULL(s12event.aptName, 'error')), CONCAT_WS(' ', 'ERROR',s12event.aptName), s11event.aptName) AS ifaptname,
--        IF(STRCMP(IFNULL(s11event.apid, 'error'), IFNULL(s12event.apid, 'error')), CONCAT_WS(' ', 'ERROR', s12event.apid), s11event.apid) AS ifapid,
       IF(STRCMP(IFNULL(s11event.apsValue, 'error'), IFNULL(s12event.apsValue, 'error')), CONCAT_WS(' ',CONCAT_WS(' ',s11event.apsValue,'ERROR'),s12event.apsValue), s11event.apsValue) AS ifapsvalue1 
       FROM (SELECT a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, aps.value AS apsValue FROM s11.Event e
JOIN s11.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
JOIN s11.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
JOIN s11.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.visibleInDR = 1
LEFT JOIN s11.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
LEFT JOIN s11.ActionProperty_String aps ON ap.id = aps.id
 WHERE e.id = @eventid  AND a.id REGEXP @actionid 
  UNION
  SELECT a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, apjt.value AS apsValue FROM s11.Event e
JOIN s11.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
JOIN s11.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
JOIN s11.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.name IN('Номерок')
LEFT JOIN s11.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
LEFT JOIN s11.ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
 WHERE e.id = @eventid  AND a.id REGEXP @actionid) s11event
  
 
  LEFT JOIN (SELECT  a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, aps.value AS apsValue FROM s12.Event e
JOIN s12.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
JOIN s12.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
JOIN s12.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.visibleInDR = 1
LEFT JOIN s12.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
LEFT JOIN s12.ActionProperty_String aps ON ap.id = aps.id
 WHERE e.id = @eventid  AND a.id REGEXP @actionid 
  UNION
  SELECT a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, apjt.value AS apsValue FROM s12.Event e
JOIN s12.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
JOIN s12.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
JOIN s12.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.name IN('Номерок')
LEFT JOIN s12.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
LEFT JOIN s12.ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
 WHERE e.id = @eventid  AND a.id REGEXP @actionid) s12event ON s11event.aID = s12event.aID AND s11event.apid = s12event.apid
--   RIGHT JOIN (SELECT a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, aps.value AS apsValue FROM s11.Event e
-- JOIN s11.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
-- JOIN s11.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
-- JOIN s11.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.visibleInDR = 1
-- LEFT JOIN s11.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
-- LEFT JOIN s11.ActionProperty_String aps ON ap.id = aps.id
--  WHERE e.id = @eventid  AND a.id REGEXP @actionid 
--   UNION
--   SELECT a.id AS aID, a.begDate AS aBegDate, at.id AS atID, at.name AS atName, apt.id AS aptID, apt.name AS aptName, ap.id AS apid, apjt.value AS apsValue FROM s11.Event e
-- JOIN s11.Action a ON e.id = a.event_id AND a.deleted= 0 AND a.status = 2   AND a.begDate REGEXP @begdatarus
-- JOIN s11.ActionType at ON a.actionType_id = at.id AND at.code REGEXP '^lis' AND at.deleted = 0 -- AND at.group_id = 43199-- 43200
-- JOIN s11.ActionPropertyType apt ON at.id = apt.actionType_id  AND apt.deleted = 0  AND apt.name IN('Номерок')
-- LEFT JOIN s11.ActionProperty ap ON a.id = ap.action_id AND ap.type_id = apt.id
-- LEFT JOIN s11.ActionProperty_Job_Ticket apjt ON ap.id = apjt.id
--  WHERE e.id = @eventid  AND a.id REGEXP @actionid) s11event1 ON s11event.aID = s11event1.aID AND s11event.apid = s11event1.apid
-- GROUP BY s11event.apid
ORDER BY s11event.aID, s11event.aBegDate, s11event.atID