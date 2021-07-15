select *
from rbPrintTemplate where name in('Отчет по поступившим, переведенным, выписанным - круглосуточный стационар', 'Сводная 007 за период ПО ВСЕМ ОТДЕЛЕНИЯМ');

select aph.value
from Action a
join ActionType at on at.id = a.actionType_id and at.deleted = 0 and flatCode != ''
join ActionPropertyType apt on apt.actionType_id = at.id and apt.deleted = 0 and apt.name = 1616
join ActionProperty ap on ap.action_id = a.id and ap.type_id = apt.id
join ActionProperty_HospitalBed aph on aph.id = ap.id
where a.event_id = 20427951 and a.deleted = 0 order by apt.actionType_id,  apt.idx



select distinct aph.*, a.createDatetime, ap.*
from ActionProperty ap
left join ActionProperty_HospitalBed aph using(id)
join Action a on a.id = ap.action_id and a.begDate >= '2021-06-01' and a.begDate <= '2021-07-01'
join ActionType at on at.id = a.actionType_id and at.flatCode = 'moving'
join ActionPropertyType apt on apt.id = ap.type_id and at.id = apt.actionType_id and apt.code = 'hospitalBed'
where aph.value is null


select *
from Action
where begDate between '2021-06-01' and '2021-07-01';



select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_form007day_new';

select  getHospitalDayByDatetime('2021-06-01', false)

SELECT
  formatDateToRussian(_dates.Date),
  COALESCE(income.income, 0)             AS income,
  COALESCE(income1.income_from_other, 0) AS income_from_other,

  COALESCE(outcome1.outcome_to_other, 0) AS outcome_to_other,
  COALESCE(outcome.outcome, 0)           AS outcome,
  COALESCE(outcome.death, 0)             AS death
-- --------------------------------------------------------
FROM OrgStructure _os_
  CROSS JOIN (SELECT getHospitalDayByDatetime(rbCalendar.Date, TRUE) AS Date
              FROM rbCalendar
              WHERE rbCalendar.Date >= :beg_date AND rbCalendar.Date < :end_date) _dates
  LEFT JOIN (
              SELECT
                _inner.effective_os                             AS os_id,
                getHospitalDayByDatetime(_inner.begDate, FALSE) AS hosp_date,
                SUM(_inner.income)                              AS income
              --  SUM(_inner.income_from_other) AS income_from_other
              FROM (
                     -- Поступления и переводы В отделение
                     -- То есть все новые для отделения люди
                     SELECT
                       e.id                      AS event_id,
                       e.externalId              AS externalId,
                       -- Является ли движение поступлением
                       -- Если движение первое в ИБ - то это поступление в (effective_os)
                       (a.id = first_move.id)    AS income,
                       -- Является ли движение переводом В отделение (effective_os)
                       -- обязательно есть предыдущее движение
                       -- Если запрошена реанимация, то текущее движение
                       -- у которого текущее отделение не равно
                       -- 1) если запрошена реанимация, то предыдущему отделению
                       -- 2) если предыдущее отделение реанимация, то пред-предыдущему отделению
                       -- 3) если предыдущее отделение - НЕ реанимация, то предыдущему отдлению
                       (
                         previous_move.id IS NOT NULL
                         AND (
                           CASE
                           WHEN (:org_str IN (27, 162))
                             THEN os.id <> previous_os.id
                           WHEN (previous_os.id IN (27, 162))
                             THEN os.id <> pre_previous_os.id
                           WHEN (os.id NOT IN (27, 162))
                             THEN os.id <> previous_os.id
                           ELSE FALSE
                           END
                         )
                       )                         AS income_from_other,
                       -- Текущее движение
                       a.id                      AS moving,
                       a.begDate                 AS begDate,
                       a.endDate                 AS endDate,
                       -- Отделения
                       os.id                     AS current_os,
                       previous_os.id            AS previous_os,
                       pre_previous_os.id        AS pre_previous_os,

                       os.shortName              AS current_os_name,
                       previous_os.shortName     AS previous_os_name,
                       pre_previous_os.shortName AS pre_previous_os_name,
                       -- Отделение пребывания ( с учетом реанимаций)
                       -- 1) Если запрошена реанимация, то текущее отделение
                       -- 2) Если текущее отделение реанимация, то считать текщим отделением отделение из предыдущего движения
                       -- 3) текущее отделение
                       CASE
                       WHEN (:org_str IN (27, 162))
                         THEN os.id
                       WHEN (os.id IN (27, 162))
                         THEN COALESCE(previous_os.id, os.id)
                       ELSE os.id
                       END                       AS effective_os,
                       -- Предыдущее движение
                       previous_move.id          AS previous_move,
                       previous_move.begDate     AS previous_move_begDate,
                       previous_move.endDate     AS previous_move_endDate,
                       -- Первое движение
                       first_move.id             AS first_move,
                       first_move.begDate        AS first_move_begDate,
                       first_move.endDate        AS first_move_endDate
                     FROM Event e
                       INNER JOIN EventType et ON et.id = e.eventType_id
                       INNER JOIN rbRequestType rt ON rt.id = et.requestType_id
                       -- Движение
                       INNER JOIN Action a ON a.event_id = e.id
                       INNER JOIN ActionType aty ON aty.id = a.actionType_id AND aty.flatCode = 'moving'
                       -- Отделение пребывания (из койки)
                       INNER JOIN OrgStructure os ON os.id = (
                         SELECT _os_hb.master_id
                         FROM ActionProperty _ap
                           INNER JOIN ActionProperty_HospitalBed _ap_hb ON _ap_hb.id = _ap.id
                           INNER JOIN OrgStructure_HospitalBed _os_hb ON _os_hb.id = _ap_hb.value
                           INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                         WHERE _ap.deleted = 0 AND _apt.code = 'hospitalBed'
                               AND _ap.action_id = a.id
                         LIMIT 1
                       )
                       -- Первое движение в рамках ИБ
                       INNER JOIN Action first_move ON first_move.id = (
                         SELECT _a.id
                         FROM Action _a
                           INNER JOIN ActionType _atype ON _a.actionType_id = _atype.id AND _atype.flatCode = 'moving'
                         WHERE _a.deleted = 0
                               AND _a.begDate IS NOT NULL
                               -- В той-же ИБ
                               AND _a.event_id = e.id
                         ORDER BY _a.begDate ASC
                         LIMIT 1
                       )
                       -- Предыдущее движение
                       LEFT JOIN (
                           Action previous_move
                           -- Отделение пребывания предыдущего движения
                           INNER JOIN OrgStructure previous_os ON previous_os.id = (
                           SELECT _os_hb.master_id
                           FROM ActionProperty _ap
                             INNER JOIN ActionProperty_HospitalBed _ap_hb ON _ap_hb.id = _ap.id
                             INNER JOIN OrgStructure_HospitalBed _os_hb ON _os_hb.id = _ap_hb.value
                             INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                           WHERE _ap.deleted = 0 AND _apt.code = 'hospitalBed'
                                 AND _ap.action_id = previous_move.id
                           LIMIT 1
                         )
                           -- AP[Переведен из отделения] для предыдущего движения
                           LEFT JOIN OrgStructure pre_previous_os ON pre_previous_os.id = (
                           SELECT _apv.value
                           FROM ActionProperty _ap
                             INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                             INNER JOIN ActionProperty_OrgStructure _apv ON _apv.id = _ap.id
                           WHERE _ap.deleted = 0 AND _apt.code = 'orgStructReceived'
                                 AND _ap.action_id = previous_move.id
                           LIMIT 1
                         )
                         ) ON previous_move.id = (
                         SELECT _a.id
                         FROM Action _a
                           INNER JOIN ActionType atype ON _a.actionType_id = atype.id AND atype.flatCode = 'moving'
                         WHERE _a.deleted = 0
                               -- Из той-же ИБ и раньше
                               AND _a.event_id = e.id AND _a.begDate < a.begDate
                         ORDER BY _a.begDate DESC
                         LIMIT 1
                       )
                     -- --------------------------------------------------------
                     WHERE e.deleted = 0
                           AND a.deleted = 0
                           -- стационарные обращения
                           AND rt.code IN ('stationary', 'hospital')
                           -- Дата НАЧАЛА движения попадает в интервал
                           AND (TIMESTAMP(a.begDate) BETWEEN getHospitalDayByDatetime(:beg_date, TRUE) AND
                     getHospitalDayByDatetime(:end_date, TRUE))
                           AND :org_str = (
                       CASE
                       WHEN (:org_str IN (27, 162))
                         THEN os.id
                       WHEN (os.id IN (27, 162))
                         THEN COALESCE(previous_os.id, os.id)
                       ELSE os.id
                       END
                     )
                   ) AS _inner
              GROUP BY _inner.effective_os, getHospitalDayByDatetime(_inner.begDate, FALSE)

            ) AS income ON income.os_id = _os_.id AND _dates.Date = income.hosp_date

  LEFT JOIN (
              SELECT
                _inner.effective_os                             AS os_id,
                getHospitalDayByDatetime(_inner.endDate, FALSE) AS hosp_date,
                SUM(_inner.outcome)                             AS outcome,
                SUM(_inner.death)                               AS death
              --  SUM(_inner.outcome_to_other) AS outcome_to_other
              FROM (
                     -- Выписки и переводы ИЗ отделения
                     -- То есть все выбывшие для отделения люди
                     SELECT
                       e.id                                                               AS event_id,
                       e.externalId                                                       AS externalId,
                       -- Является ли движение выпиской
                       -- Если движение последнее в ИБ - то это выписка
                       (a.id = last_move.id AND (res.id IS NULL OR res.name <> 'умер'))   AS outcome,
                       -- Смерти
                       (a.id = last_move.id AND res.id IS NOT NULL AND res.name = 'умер') AS death,
                       -- Является ли движение переводом ИЗ отделения
                       -- 1) Если запрошена реанимация, то следующее отделение не равно текущему
                       -- 2) Если текущее отделение реанимация, то следующее отделение не равно предыдущему
                       -- 3) Если текущее отделение не реанимация, то следующее отделение не равно текущему и при этом следующее не реанимация
                       (
                         next_move.id IS NOT NULL
                         AND (
                           CASE
                           WHEN (:org_str IN (27, 162))
                             THEN next_os.id <> os.id
                           WHEN (os.id IN (27, 162))
                             THEN next_os.id <> previous_os.id
                           WHEN (os.id NOT IN (27, 162))
                             THEN next_os.id <> os.id AND next_os.id NOT IN (27, 162)
                           ELSE FALSE
                           END
                         )
                       )                                                                  AS outcome_to_other,
                       -- Текущее движение
                       a.id                                                               AS moving,
                       a.begDate                                                          AS begDate,
                       a.endDate                                                          AS endDate,
                       -- Отделения
                       os.id                                                              AS current_os,
                       previous_os.id                                                     AS previous_os,
                       next_os.id                                                         AS next_os,

                       os.shortName                                                       AS current_os_name,
                       previous_os.shortName                                              AS previous_os_name,
                       next_os.shortName                                                  AS next_os_name,
                       -- Отделение пребыания ( с учетом реанимаций)
                       -- Если текущее отделение реанимация, то считать текщим отделением отделение из предыдущего движения
                       CASE
                       WHEN (:org_str IN (27, 162))
                         THEN os.id
                       WHEN (os.id IN (27, 162))
                         THEN COALESCE(previous_os.id, os.id)
                       ELSE os.id
                       END                                                                AS effective_os,
                       -- Следующее движение
                       next_move.id                                                       AS next_move,
                       next_move.begDate                                                  AS next_move_begDate,
                       next_move.endDate                                                  AS next_move_endDate,
                       -- Последнее движение
                       last_move.id                                                       AS last_move,
                       last_move.begDate                                                  AS last_move_begDate,
                       last_move.endDate                                                  AS last_move_endDate
                     FROM Event e
                       INNER JOIN EventType et ON et.id = e.eventType_id
                       INNER JOIN rbRequestType rt ON rt.id = et.requestType_id
                       LEFT JOIN rbResult res ON res.id = e.result_id
                       -- Движение
                       INNER JOIN Action a ON a.event_id = e.id
                       INNER JOIN ActionType aty ON aty.id = a.actionType_id AND aty.flatCode = 'moving'
                       -- Отделение пребывания (из койки)
                       INNER JOIN OrgStructure os ON os.id = (
                         SELECT _os_hb.master_id
                         FROM ActionProperty _ap
                           INNER JOIN ActionProperty_HospitalBed _ap_hb ON _ap_hb.id = _ap.id
                           INNER JOIN OrgStructure_HospitalBed _os_hb ON _os_hb.id = _ap_hb.value
                           INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                         WHERE _ap.deleted = 0 AND _apt.code = 'hospitalBed'
                               AND _ap.action_id = a.id
                         LIMIT 1
                       )
                       -- Предыдущее отделение
                       LEFT JOIN OrgStructure previous_os ON previous_os.id = (
                         SELECT _apv.value
                         FROM ActionProperty _ap
                           INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                           INNER JOIN ActionProperty_OrgStructure _apv ON _apv.id = _ap.id
                         WHERE _ap.deleted = 0 AND _apt.code = 'orgStructReceived'
                               AND _ap.action_id = a.id
                         LIMIT 1
                       )
                       -- Последнее движение в рамках ИБ
                       INNER JOIN Action last_move ON last_move.id = (
                         SELECT _a.id
                         FROM Action _a
                           INNER JOIN ActionType _atype ON _a.actionType_id = _atype.id AND _atype.flatCode = 'moving'
                         WHERE _a.deleted = 0
                               AND _a.begDate IS NOT NULL
                               -- В той-же ИБ
                               AND _a.event_id = e.id
                         ORDER BY _a.begDate DESC
                         LIMIT 1
                       )
                       -- Предыдущее движение
                       LEFT JOIN (
                           Action next_move
                           -- Отделение пребывания предыдущего движения
                           INNER JOIN OrgStructure next_os ON next_os.id = (
                           SELECT _os_hb.master_id
                           FROM ActionProperty _ap
                             INNER JOIN ActionProperty_HospitalBed _ap_hb ON _ap_hb.id = _ap.id
                             INNER JOIN OrgStructure_HospitalBed _os_hb ON _os_hb.id = _ap_hb.value
                             INNER JOIN ActionPropertyType _apt ON _apt.id = _ap.type_id AND _apt.deleted = 0
                           WHERE _ap.deleted = 0 AND _apt.code = 'hospitalBed'
                                 AND _ap.action_id = next_move.id
                           LIMIT 1
                         )
                         ) ON next_move.id = (
                         SELECT _a.id
                         FROM Action _a
                           INNER JOIN ActionType atype ON _a.actionType_id = atype.id AND atype.flatCode = 'moving'
                         WHERE _a.deleted = 0
                               -- Из той-же ИБ и позже
                               AND _a.event_id = e.id AND _a.begDate > a.begDate
                         ORDER BY _a.begDate ASC
                         LIMIT 1
                       )
                     -- --------------------------------------------------------
                     WHERE e.deleted = 0
                           AND a.deleted = 0
                           -- стационарные обращения
                           AND rt.code IN ('stationary', 'hospital')
                           -- Дата ОКОНЧАНИЯ движения попадает в интервал
                           AND (TIMESTAMP(a.endDate) BETWEEN getHospitalDayByDatetime(:beg_date, TRUE) AND
                     getHospitalDayByDatetime(:end_date, TRUE))
                           AND :org_str = (
                       CASE
                       WHEN (:org_str IN (27, 162))
                         THEN os.id
                       WHEN (os.id IN (27, 162))
                         THEN COALESCE(previous_os.id, os.id)
                       ELSE os.id
                       END
                     )
                   ) _inner
              GROUP BY _inner.effective_os,
                getHospitalDayByDatetime(_inner.endDate, FALSE)
            ) outcome ON outcome.os_id = _os_.id
                         AND _dates.Date = outcome.hosp_date
  -- ==================================================
  -- ==================================================
  -- ==================================================
  -- ==================СЛЕДУЮЩИЙ JOIN==================
  -- ==================================================
  -- ==================================================
  -- ==================================================
  LEFT JOIN (
              SELECT
                -- В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В-В
                _inner1.effective_os                             AS os_id,
                getHospitalDayByDatetime(_inner1.begDate, FALSE) AS hosp_date,
                count(_inner1.outcome_to_other)                  AS outcome_to_other
              FROM (-- переведенные без реанимации
                     SELECT
                       -- Person.id AS Person_id
                       -- , Person.lastName AS Person_lastName
                       --  , Person.firstName AS Person_firstName
                       --  , Person.patrName AS Person_patrName
                       --  , Client.id AS Client_id
                       --    ,FirstMoving.id AS actionToOtherOrg
                       -- ,a2.id
                       --   , concat_ws(' ', Client.lastName
                       --   , substr(Client.firstName, 1, 1)
                       --   , substr(Client.patrName, 1, 1)) AS 'ФИО'
                       --  , Client.birthDate AS Client_birthDate
                       --  , Event.id AS Event_id
                       --  , Event.externalId AS externalId
                       --  , Event.client_id AS Event_client_id
                       --  , Event.setDate AS Event_setDate
                       --   , Event.execPerson_id AS Event_execPerson_id
                       MovingTransfer.id        AS outcome_to_other
                       --  , MovingTransfer.event_id AS MovingTransfer_event_id
                       --  , MovingTransfer.begDate AS 'Дата перевода'
                       ,
                       MovingTransfer.begDate   AS begDate
                       --   , MovingTransfer.flatCode AS MovingTransfer_flatCode
                       --   , MovingTransfer.is_resuscitation AS MovingTransfer_is_resuscitation
                       --  , TransferStayOrgStruct.id AS effective_os
                       --   , TransferStayOrgStruct.shortName AS 'Переведен ИЗ отделения'
                       ,
                       TransferFromOrgStruct.id AS effective_os
                     --   , TransferFromOrgStruct.shortName AS 'Переведен В отделение'
                     -- ==========================================================
                     FROM
                       Event
                       INNER JOIN Client
                         ON
                           Client.id = Event.client_id
                       INNER JOIN EventType
                         ON
                           EventType.id = Event.eventType_id
                       INNER JOIN rbRequestType
                         ON
                           rbRequestType.id = EventType.requestType_id
                       LEFT OUTER JOIN Person
                         ON
                           Event.execPerson_id = Person.id
                       INNER JOIN vEventMovings AS MovingTransfer
                         ON
                           MovingTransfer.event_id = Event.id
                           AND MovingTransfer.begDate >= TIMESTAMP(:beg_date)
                           AND MovingTransfer.begDate < (TIMESTAMP(:end_date) - INTERVAL 1 SECOND)
                       LEFT OUTER JOIN vEventMovings AS MovingTransferPrev
                         ON
                           MovingTransferPrev.id = (
                             SELECT Action.id AS action_id
                             FROM
                               Action
                               INNER JOIN ActionType
                                 ON
                                   ActionType.id = Action.actionType_id
                             WHERE
                               Action.event_id = Event.id
                               AND Action.deleted = 0
                               AND ActionType.flatCode = 'moving'
                               AND Action.begDate < MovingTransfer.begDate
                             ORDER BY
                               Action.begDate DESC
                             LIMIT
                               1
                           )
                       LEFT OUTER JOIN Action AS FirstMoving
                         ON
                           FirstMoving.id = (
                             SELECT FirstMoving.id AS action_id
                             FROM
                               Action AS FirstMoving
                               INNER JOIN ActionType
                                 ON
                                   ActionType.id = FirstMoving.actionType_id
                             WHERE
                               FirstMoving.event_id = Event.id
                               AND ActionType.flatCode = 'moving'
                               AND FirstMoving.deleted = 0
                             ORDER BY
                               FirstMoving.begDate
                             LIMIT
                               1
                           )
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_From_TransferMoving
                         ON
                           AP_OS_From_TransferMoving.action_id = MovingTransfer.id
                           AND AP_OS_From_TransferMoving.code = 'orgStructReceived'
                       LEFT OUTER JOIN OrgStructure AS TransferFromOrgStruct
                         ON
                           TransferFromOrgStruct.id = AP_OS_From_TransferMoving.value
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_Stay_TransferMoving
                         ON
                           AP_OS_Stay_TransferMoving.action_id = MovingTransfer.id
                           AND AP_OS_Stay_TransferMoving.code = 'orgStructStay'
                       LEFT OUTER JOIN OrgStructure AS TransferStayOrgStruct
                         ON
                           TransferStayOrgStruct.id = AP_OS_Stay_TransferMoving.value
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_Stay_TransferPrevMoving
                         ON
                           AP_OS_Stay_TransferPrevMoving.action_id = MovingTransferPrev.id
                           AND AP_OS_Stay_TransferPrevMoving.code = 'orgStructStay'
                       LEFT OUTER JOIN OrgStructure AS TransferPrevStayOrgStruct
                         ON
                           TransferPrevStayOrgStruct.id = AP_OS_Stay_TransferPrevMoving.value
                     -- ========================================================
                     WHERE
                       Event.deleted = 0
                       AND rbRequestType.code IN ('hospital', 'stationary')
                       /* AND rbRequestType.code IN(
                         'clinic',
                         'hospital',
                         'stationary'
                       ) */
                       AND (
                         Event.execDate IS NULL
                         OR Event.execDate >= TIMESTAMP(:beg_date)
                       )
                       AND TransferFromOrgStruct.id = :org_str

                       /* AND(
                         TransferFromOrgStruct.id = 17
                         OR TransferStayOrgStruct.id = 17
                       ) */
                       AND MovingTransfer.id != FirstMoving.id
                       AND TransferFromOrgStruct.id != TransferStayOrgStruct.id
                       AND NOT MovingTransfer.is_resuscitation
                     -- =========================================================
                     ORDER BY
                       MovingTransfer.is_resuscitation
                       , TransferStayOrgStruct.shortName
                       , MovingTransfer.begDate
                     DESC
                   ) _inner1
              GROUP BY _inner1.effective_os,
                getHospitalDayByDatetime(_inner1.begDate, FALSE)
            ) outcome1 ON outcome1.os_id = _os_.id
                          AND _dates.Date = outcome1.hosp_date
  -- ==================================================
  -- ==================================================
  -- ==================================================
  -- ==================СЛЕДУЮЩИЙ JOIN==================
  -- ==================================================
  -- ==================================================
  -- ==================================================

  LEFT JOIN (
              -- ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ-ИЗ
              SELECT
                _inner1.effective_os                             AS os_id,
                getHospitalDayByDatetime(_inner1.begDate, FALSE) AS hosp_date,
                count(_inner1.income_from_other)                 AS income_from_other
              FROM (-- переведенные без реанимации
                     SELECT
                       -- Person.id AS Person_id
                       -- , Person.lastName AS Person_lastName
                       --  , Person.firstName AS Person_firstName
                       --  , Person.patrName AS Person_patrName
                       --  , Client.id AS Client_id
                       --    ,FirstMoving.id AS actionToOtherOrg
                       -- ,a2.id
                       --   , concat_ws(' ', Client.lastName
                       --   , substr(Client.firstName, 1, 1)
                       --   , substr(Client.patrName, 1, 1)) AS 'ФИО'
                       --  , Client.birthDate AS Client_birthDate
                       --  , Event.id AS Event_id
                       --  , Event.externalId AS externalId
                       --  , Event.client_id AS Event_client_id
                       --  , Event.setDate AS Event_setDate
                       --   , Event.execPerson_id AS Event_execPerson_id
                       MovingTransfer.id        AS income_from_other
                       --  , MovingTransfer.event_id AS MovingTransfer_event_id
                       ,
                       MovingTransfer.begDate   AS begDate
                       --  , MovingTransfer.endDate AS MovingTransfer_endDate
                       --   , MovingTransfer.flatCode AS MovingTransfer_flatCode
                       --   , MovingTransfer.is_resuscitation AS MovingTransfer_is_resuscitation
                       ,
                       TransferStayOrgStruct.id AS effective_os
                     --   , TransferStayOrgStruct.shortName AS 'Переведен ИЗ отделения'
                     --   , TransferFromOrgStruct.shortName AS 'в отделение'
                     --   , TransferFromOrgStruct.id AS effective_os
                     -- ==========================================================
                     FROM
                       Event
                       INNER JOIN Client
                         ON
                           Client.id = Event.client_id
                       INNER JOIN EventType
                         ON
                           EventType.id = Event.eventType_id
                       INNER JOIN rbRequestType
                         ON
                           rbRequestType.id = EventType.requestType_id
                       LEFT OUTER JOIN Person
                         ON
                           Event.execPerson_id = Person.id
                       INNER JOIN vEventMovings AS MovingTransfer
                         ON
                           MovingTransfer.event_id = Event.id
                           AND MovingTransfer.begDate >= TIMESTAMP(:beg_date)
                           AND MovingTransfer.begDate < (TIMESTAMP(:end_date) - INTERVAL 1 SECOND)
                       LEFT OUTER JOIN vEventMovings AS MovingTransferPrev
                         ON
                           MovingTransferPrev.id = (
                             SELECT Action.id AS action_id
                             FROM
                               Action
                               INNER JOIN ActionType
                                 ON
                                   ActionType.id = Action.actionType_id
                             WHERE
                               Action.event_id = Event.id
                               AND Action.deleted = 0
                               AND ActionType.flatCode = 'moving'
                               AND Action.begDate < MovingTransfer.begDate
                             ORDER BY
                               Action.begDate DESC
                             LIMIT
                               1
                           )
                       LEFT OUTER JOIN Action AS FirstMoving
                         ON
                           FirstMoving.id = (
                             SELECT FirstMoving.id AS action_id
                             FROM
                               Action AS FirstMoving
                               INNER JOIN ActionType
                                 ON
                                   ActionType.id = FirstMoving.actionType_id
                             WHERE
                               FirstMoving.event_id = Event.id
                               AND ActionType.flatCode = 'moving'
                               AND FirstMoving.deleted = 0
                             ORDER BY
                               FirstMoving.begDate
                             LIMIT
                               1
                           )
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_From_TransferMoving
                         ON
                           AP_OS_From_TransferMoving.action_id = MovingTransfer.id
                           AND AP_OS_From_TransferMoving.code = 'orgStructReceived'
                       LEFT OUTER JOIN OrgStructure AS TransferFromOrgStruct
                         ON
                           TransferFromOrgStruct.id = AP_OS_From_TransferMoving.value
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_Stay_TransferMoving
                         ON
                           AP_OS_Stay_TransferMoving.action_id = MovingTransfer.id
                           AND AP_OS_Stay_TransferMoving.code = 'orgStructStay'
                       LEFT OUTER JOIN OrgStructure AS TransferStayOrgStruct
                         ON
                           TransferStayOrgStruct.id = AP_OS_Stay_TransferMoving.value
                       LEFT OUTER JOIN v_ActionProperty_OrgStructure AS AP_OS_Stay_TransferPrevMoving
                         ON
                           AP_OS_Stay_TransferPrevMoving.action_id = MovingTransferPrev.id
                           AND AP_OS_Stay_TransferPrevMoving.code = 'orgStructStay'
                       LEFT OUTER JOIN OrgStructure AS TransferPrevStayOrgStruct
                         ON
                           TransferPrevStayOrgStruct.id = AP_OS_Stay_TransferPrevMoving.value
                     -- ========================================================
                     WHERE
                       Event.deleted = 0
                       AND rbRequestType.code IN ('hospital', 'stationary')
                       /* AND rbRequestType.code IN(
                         'clinic',
                         'hospital',
                         'stationary'
                       ) */
                       AND (
                         Event.execDate IS NULL
                         OR Event.execDate >= TIMESTAMP(:beg_date)
                       )
                       AND TransferStayOrgStruct.id = :org_str

                       /* AND(
                         TransferFromOrgStruct.id = 17
                         OR TransferStayOrgStruct.id = 17
                       ) */
                       AND MovingTransfer.id != FirstMoving.id
                       AND TransferFromOrgStruct.id != TransferStayOrgStruct.id
                       AND NOT MovingTransfer.is_resuscitation
                     -- =========================================================
                     ORDER BY
                       MovingTransfer.is_resuscitation
                       , TransferStayOrgStruct.shortName
                       , MovingTransfer.begDate
                     DESC
                   ) AS _inner1
              GROUP BY _inner1.effective_os,
                getHospitalDayByDatetime(_inner1.begDate, FALSE)

            ) AS income1 ON income1.os_id = _os_.id
                            AND _dates.Date = income1.hosp_date


-- =====================================================
WHERE _os_.id = :org_str
GROUP BY _dates.Date





select *
from Event where client_id = 231224 and deleted = 0 order by id desc ;



select distinct at.name, a.*
from Action a
join ActionType at on a.actionType_id = at.id
where a.event_id = 20427951 order by a.id desc ;


SELECT
	concat_ws(' ', Client.lastName, substr(Client.firstName, 1, 1), substr(Client.patrName, 1, 1)) AS 'ФИО'
	, timestampdiff(YEAR, Client.birthDate, Event.setDate) AS 'ДР'
	, date(Event.setDate) as 'Госпитализирован'
	, Event.externalId as '№ИБ'
	, OrgStructure.shortName as 'Отделение'
	, rbFinance.name as 'Финансирование'
	, case
		when getClientRegAddressLocalityType(Client.id) = 1 then 'Город'
		when getClientRegAddressLocalityType(Client.id) = 2 then 'Село'
		else 'Не указано'
	end	AS 'Житель'
	, if(Client.sex = 1, 'М', 'Ж') AS 'Пол'
	, CASE
		WHEN c.name = 'Российская Федерация' THEN r.name
		ELSE c.name
	END AS 'Регион'
FROM  Event
INNER JOIN EventType ON EventType.id = Event.eventType_id
INNER JOIN rbFinance ON rbFinance.id = EventType.finance_id
INNER JOIN rbRequestType ON rbRequestType.id = EventType.requestType_id
INNER JOIN Client ON Client.id = Event.client_id
LEFT OUTER JOIN ClientDocument cd ON cd.id = (
	SELECT max(id)
	FROM ClientDocument
	WHERE client_id = Client.id AND deleted = 0
)
LEFT OUTER JOIN rbCountry c ON cd.country_id = c.id
LEFT OUTER JOIN rbRegion r ON cd.region_id = r.id
LEFT JOIN Action ON (Action.event_id = Event.id AND Action.deleted = 0 AND Action.actionType_id = 112)
LEFT JOIN ActionProperty ON (ActionProperty.action_id = Action.id AND if(Action.id IS NULL OR (ActionProperty.type_id = 1608), 1, 0))
LEFT JOIN ActionProperty_OrgStructure ON ActionProperty_OrgStructure.id = ActionProperty.id
LEFT JOIN OrgStructure ON OrgStructure.id = ActionProperty_OrgStructure.value
WHERE
  Event.deleted = 0
  AND rbRequestType.code = 'hospital'
  AND ((Event.setDate) BETWEEN DATE(:Date1) + interval 6 hour AND DATE(:Date2) - interval 1 day  + interval 6 hour)
ORDER BY
  OrgStructure.name
, date(Event.setDate)


select DATE(:Date1) + interval 6 hour, DATE(:Date2) - interval 1 day + interval 6 hour