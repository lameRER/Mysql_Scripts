-- CREATE DEFINER=`dbuser`@`%` PROCEDURE `s11`.`procedure_Script_Invoicing`(IN aPerson_id int, IN aPC_name varchar(64))
--     COMMENT 'Процедура добавления/изменения записей для выстовления счетов'
-- BEGIN


DROP TEMPORARY TABLE IF EXISTS temp_invo_action;
CREATE TEMPORARY TABLE temp_invo_action
(SELECT
NOW() createDatetime,
NOW() modifyDatetime,
at1.id,
result.event_id,
result.directionDate,
2 status,
result.setPerson_id,
result.begDate,
result.endDate,
'' note,
result.person_id,
'' office,
1 amount,
1 account,
'' MKB,
'' morphologyMKB,
'' coordText
FROM
(SELECT
  e.id event_id,
  e.setDate directionDate,
  a.deleted,
  a.actionType_id,
  a.setPerson_id setPerson_id,
  a.begDate begDate,
  a.begDate endDate,
  a.setPerson_id person_id
FROM Event e
  JOIN Action a ON e.id = a.event_id AND a.deleted = 0
  JOIN ActionType AT  ON (a.actionType_id = AT.id AND AT.code IN ('431010', '431020', '431030'))
WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
AND e.deleted = 0
AND e.id NOT IN (SELECT (aNO.event_id) FROM Action aNO
JOIN ActionType  ON  ActionType.id = aNO.actionType_id  AND aNO.deleted = 0 AND MID(ActionType.code,2,9) = '11.08.011'  
WHERE aNO.event_id = e.id
)) as `result`
JOIN edin ed
JOIN ActionType at1 ON ed.code = at1.code and at1.deleted = 0);


INSERT INTO Action (
createDatetime,
modifyDatetime,
actionType_id,
event_id,
directionDate,
status,
setPerson_id,
begDate,
endDate,
note,
person_id,
office,
amount,
account,
MKB,
morphologyMKB,
coordText)
(select * from temp_invo_action);


  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result1;

--  COMMIT; 
DO SLEEP(3);


DROP TEMPORARY TABLE IF EXISTS temp_invo_action;
CREATE TEMPORARY TABLE temp_invo_action
(select DISTINCT
      NOW() createDatetime,
      NOW() modifyDatetime,
      result.actionType_id actionType_id,
      result.event_id event_id,
      result.directionDate directionDate,
      2 status,
      result.setPerson_id setPerson_id,
      result.begDate begDate,
      result.begDate endDate,
      '' note,
      result.setPerson_id person_id,
      '' office,
      2 amount,
      1 account,
      '' MKB,
      '' morphologyMKB,
      '' coordText
from 
(SELECT 
      at1.id actionType_id,
      e.id event_id,
      e.setDate directionDate,
      a.setPerson_id setPerson_id,
      a.begDate begDate,
      a.begDate endDate
    FROM Event e
      JOIN Action a ON e.id = a.event_id
      JOIN ActionType at1 ON a.actionType_id = at1.id AND at1.code IN ('431040')      
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND e.deleted = 0
    AND e.id NOT IN (SELECT (aNO.event_id) FROM Action aNO
	JOIN ActionType  ON  ActionType.id = aNO.actionType_id  AND aNO.deleted = 0 AND MID(ActionType.code,2,9) = '11.08.011'  
	WHERE aNO.event_id = e.id
	)) as `result`
    JOIN edin ed ON 1
    JOIN ActionType at1 ON at1.code = ed.code);
    
INSERT INTO Action (
createDatetime,
modifyDatetime,
actionType_id,
event_id,
directionDate,
status,
setPerson_id,
begDate,
endDate,
note,
person_id,
office,
amount,
account,
MKB,
morphologyMKB,
coordText)
(select * from temp_invo_action);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result2;

-- COMMIT;


DROP TEMPORARY TABLE IF EXISTS temp_invo_action;
CREATE TEMPORARY TABLE temp_invo_action
(select DISTINCT
      NOW() createDatetime,
      NOW() modifyDatetime,
      at1.id actionType_id,
      result.event_id event_id,
      result.directionDate directionDate,
      2 status,
      result.setPerson_id setPerson_id,
      result.begDate begDate,
      result.begDate endDate,
      '' note,
      result.setPerson_id person_id,
      '' office,
      3 amount,
      1 account,
      '' MKB,
      '' morphologyMKB,
      '' coordText
from 
(SELECT 
      at1.id actionType_id,
      e.id event_id,
      e.setDate directionDate,
      a.setPerson_id setPerson_id,
      a.begDate begDate,
      a.begDate endDate
    FROM Event e
      JOIN Action a ON e.id = a.event_id
      JOIN ActionType at1 ON a.actionType_id = at1.id AND at1.code IN ('431050')      
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND e.deleted = 0
    AND e.id NOT IN (SELECT (aNO.event_id) FROM Action aNO
	JOIN ActionType  ON  ActionType.id = aNO.actionType_id  AND aNO.deleted = 0 AND MID(ActionType.code,2,9) = '11.08.011'  
	WHERE aNO.event_id = e.id
	)) as `result`
    JOIN edin ed ON 1
    JOIN ActionType at1 ON at1.code = ed.code);
    
    
INSERT INTO Action (
createDatetime,
modifyDatetime,
actionType_id,
event_id,
directionDate,
status,
setPerson_id,
begDate,
endDate,
note,
person_id,
office,
amount,
account,
MKB,
morphologyMKB,
coordText)
(select * from temp_invo_action);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result3;



  INSERT INTO Resutl_script_Invoicing
  SET Resutl_script_Invoicing.type_name = 1,
      Resutl_script_Invoicing.Result = @result1 + @result2 + @result3,
      Resutl_script_Invoicing.createDatetime = NOW(),
      Resutl_script_Invoicing.createPerson_id = 1193 /*aPerson_id*/,
      Resutl_script_Invoicing.pc_name = '1193' /*aPC_name*/;
-- 
--    COMMIT;


  DO SLEEP(10);



  UPDATE LOW_PRIORITY

  Event e
  INNER JOIN Action a
    ON e.id = a.event_id
  INNER JOIN ActionType AT
    ON a.actionType_id = AT.id
    AND AT.code IN ('431010', '431020', '431030', '431040', '431050')
  INNER JOIN Action a1
    ON a1.event_id = e.id
  INNER JOIN ActionType at1
    ON at1.id = a1.actionType_id
    AND at1.flatCode LIKE 'leaved'
  INNER JOIN ActionProperty ap
    ON ap.action_id = a1.id
    AND ap.type_id = 37266
  INNER JOIN ActionProperty_Reference apr
    ON apr.id = ap.id
  SET apr.value = 11
  WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
  AND apr.value != 11
  AND e.deleted = 0
  AND a.deleted = 0
  AND a1.deleted = 0
  AND e.result_id IN (229, 230);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result4;

DO SLEEP(3);


  UPDATE LOW_PRIORITY Event e
  INNER JOIN Action a
    ON e.id = a.event_id
  INNER JOIN ActionType AT
    ON a.actionType_id = AT.id
    AND AT.code IN ('431010', '431020', '431030', '431040', '431050')
  INNER JOIN Action a1
    ON a1.event_id = e.id
  INNER JOIN ActionType at1
    ON at1.id = a1.actionType_id
    AND at1.flatCode LIKE 'leaved'
  INNER JOIN ActionProperty ap
    ON ap.action_id = a1.id
    AND ap.type_id = 37266
  INNER JOIN ActionProperty_Reference apr
    ON apr.id = ap.id
  SET apr.value = 9
  WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
  AND apr.value != 9
  AND e.deleted = 0
  AND a.deleted = 0
  AND a1.deleted = 0
  AND e.result_id = 227;

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result5;

  DO SLEEP(3);

  UPDATE LOW_PRIORITY Event e
  INNER JOIN Action a
    ON e.id = a.event_id
  INNER JOIN ActionType AT
    ON a.actionType_id = AT.id
    AND AT.code IN ('431010', '431020', '431030', '431040', '431050')
  INNER JOIN Action a1
    ON a1.event_id = e.id
  INNER JOIN ActionType at1
    ON at1.id = a1.actionType_id
    AND at1.flatCode LIKE 'leaved'
  INNER JOIN ActionProperty ap
    ON ap.action_id = a1.id
    AND ap.type_id = 37266
  INNER JOIN ActionProperty_Reference apr
    ON apr.id = ap.id
  SET apr.value = 10
  WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
  AND apr.value != 10
  AND e.deleted = 0
  AND a.deleted = 0
  AND a1.deleted = 0
  AND e.result_id NOT IN (229, 230, 227);


  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result6;
  INSERT INTO Resutl_script_Invoicing
  SET Resutl_script_Invoicing.type_name = 2,
      Resutl_script_Invoicing.Result = @result4 + @result5 + @result6,
      Resutl_script_Invoicing.createDatetime = NOW(),
      Resutl_script_Invoicing.createPerson_id = 1193 /*aPerson_id*/,
      Resutl_script_Invoicing.pc_name = '1193' /*aPC_name*/;
-- 
--   COMMIT;

 DO SLEEP(10);


DROP TEMPORARY TABLE IF EXISTS temp_invo_actionProperty;
CREATE TEMPORARY TABLE temp_invo_actionProperty
(SELECT
      NOW() createDatetime,
      NOW() modifyDatetime,
      a1.id action_id,
      37266 type_id,
      '' norm
    FROM Event e
      INNER JOIN Action a
        ON e.id = a.event_id
      INNER JOIN ActionType AT
        ON a.actionType_id = AT.id
        AND AT.code IN ('431010', '431020', '431030', '431040', '431050')
      INNER JOIN Action a1
        ON a1.event_id = e.id
      INNER JOIN ActionType at1
        ON at1.id = a1.actionType_id
        AND at1.flatCode LIKE 'leaved'
    WHERE a1.id NOT IN (SELECT
        ap.action_id
      FROM ActionProperty ap
      WHERE ap.type_id = 37266)
    AND e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND e.deleted = 0
    AND a.deleted = 0
    AND a1.deleted = 0);
   
  INSERT LOW_PRIORITY INTO ActionProperty (createDatetime,
  modifyDatetime,
  action_id,
  type_id,
  norm)
  (select * from temp_invo_actionProperty);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result7;

DROP TEMPORARY TABLE IF EXISTS temp_invo_actionProperty;
CREATE TEMPORARY TABLE temp_invo_actionProperty
  SELECT
      ap.id id,
      11 value
    FROM ActionProperty ap
      INNER JOIN Action a
        ON ap.action_id = a.id
      INNER JOIN Event e
        ON a.event_id = e.id
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND ap.deleted = 0
    AND e.deleted = 0
    AND ap.type_id = 37266
    AND e.result_id IN (229, 230)
    AND ap.id NOT IN (SELECT
        apr.id
      FROM ActionProperty_Reference apr WHERE apr.id = ap.id);
     
INSERT INTO ActionProperty_Reference (id,
  value)
(select * from temp_invo_actionProperty);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result8;

  DO SLEEP(3);

DROP TEMPORARY TABLE IF EXISTS temp_invo_actionProperty;
CREATE TEMPORARY TABLE temp_invo_actionProperty  
    SELECT
      ap.id id,
      9 value
    FROM ActionProperty ap
      INNER JOIN Action a
        ON ap.action_id = a.id
      INNER JOIN Event e
        ON a.event_id = e.id
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND ap.deleted = 0
    AND e.deleted = 0
    AND ap.type_id = 37266
    AND e.result_id = 227
    AND ap.id NOT IN (SELECT
        apr.id
      FROM ActionProperty_Reference apr WHERE apr.id = ap.id);

INSERT INTO ActionProperty_Reference (id,
  value)
(select * from temp_invo_actionProperty);

  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result9;


DROP TEMPORARY TABLE IF EXISTS temp_invo_actionProperty;
CREATE TEMPORARY TABLE temp_invo_actionProperty
    SELECT
      ap.id id,
      10 value
    FROM ActionProperty ap
      INNER JOIN Action a
        ON ap.action_id = a.id
      INNER JOIN Event e
        ON a.event_id = e.id
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND ap.deleted = 0
    AND e.deleted = 0
    AND ap.type_id = 37266
    AND e.result_id NOT IN (229, 230, 227)
    AND ap.id NOT IN (SELECT
        apr.id
      FROM ActionProperty_Reference apr WHERE apr.id = ap.id);

INSERT INTO ActionProperty_Reference (id,
  value)
(select * from temp_invo_actionProperty);


  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result10;
   INSERT INTO Resutl_script_Invoicing
  SET Resutl_script_Invoicing.type_name = 3,
      Resutl_script_Invoicing.Result = @result7 + @result8 + @result9 + @result10,
      Resutl_script_Invoicing.createDatetime = NOW(),
      Resutl_script_Invoicing.createPerson_id = 1193 /*aPerson_id*/,
      Resutl_script_Invoicing.pc_name = '1193' /*aPC_name*/;
-- 
--   COMMIT;

 DO SLEEP(10);





  UPDATE LOW_PRIORITY Event e
  JOIN Client c
    ON e.client_id = c.id
    AND c.deleted = 0
  JOIN EventType et
    ON e.eventType_id = et.id
    AND et.name NOT IN ('График','Регистратура','Запись на прием','Платное обслуживание','Не использовать')

  SET e.clientPolicy_id = IFNULL((SELECT
      MAX(CP.id)
    FROM ClientPolicy AS CP
      LEFT JOIN rbPolicyType AS CPT
        ON CPT.id = CP.policyType_id
    WHERE CP.client_id = c.id
    AND CP.deleted = 0
    AND CPT.code IN ('1', '2')
    AND DATE_ADD(e.execDate, INTERVAL 30 DAY) >= CP.begDate
    AND (CP.endDate IS NULL
    OR e.execDate <= CP.endDate)), getClientPolicyId(c.id, 1))
  WHERE e.execDate >= (DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY))
  AND  (SELECT COUNT(*) FROM ClientPolicy cp   WHERE cp.client_id = c.id AND cp.deleted = 0 AND (cp.policyType_id = 1 or cp.policyType_id = 2)) != 0
  AND (e.clientPolicy_id IS NULL
  OR e.clientPolicy_id != (SELECT
      MAX(CP.id)
    FROM ClientPolicy AS CP
      LEFT JOIN rbPolicyType AS CPT
        ON CPT.id = CP.policyType_id
    WHERE CP.client_id = c.id
    AND CP.deleted = 0
    AND CPT.code IN ('1', '2')
    AND DATE_ADD(e.execDate, INTERVAL 30 DAY) >= CP.begDate
    AND (CP.endDate IS NULL
    OR e.execDate <= CP.endDate)));


  SELECT
    IF(ROW_COUNT() = -1, 0, ROW_COUNT()) INTO @result_0;
  INSERT INTO Resutl_script_Invoicing
  SET Resutl_script_Invoicing.type_name = 4,
      Resutl_script_Invoicing.Result = @result_0,
      Resutl_script_Invoicing.createDatetime = NOW(),
      Resutl_script_Invoicing.createPerson_id = 1193 /*aPerson_id*/,
      Resutl_script_Invoicing.pc_name = '1193' /*aPC_name*/;
-- 
--   COMMIT;
select * from Resutl_script_Invoicing order by id desc;
-- END