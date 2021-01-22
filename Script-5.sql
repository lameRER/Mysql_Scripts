 SELECT
      NOW() createDatetime,
      NOW() modifyDatetime,
      at1.id actionType_id,
      e.id event_id,
      e.setDate directionDate,
      2 status,
      a.setPerson_id setPerson_id,
      a.begDate begDate,
      a.begDate endDate,
      '' note,
      a.setPerson_id person_id,
      '' office,
      1 amount,
      1 account,
      '' MKB,
      '' morphologyMKB,
      '' coordText

    FROM Event e
      INNER JOIN Action a
        ON e.id = a.event_id AND a.deleted = 0
      INNER JOIN ActionType AT
        ON a.actionType_id = AT.id
        AND AT.code IN ('431010', '431020', '431030')
      INNER JOIN edin ed
        ON 1
      INNER JOIN ActionType at1
        ON at1.code = ed.code
    WHERE e.execDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
    AND e.deleted = 0

    AND e.id NOT IN (SELECT
        event_id
      FROM Action
        INNER JOIN ActionType
          ON ActionType.id = Action.actionType_id
          AND ActionType.code LIKE '_11.08.011'
          AND Action.deleted = 0
      WHERE date (Action.createDatetime) >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH));