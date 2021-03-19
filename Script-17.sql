select * from rbPrintTemplate rpt where rpt.name REGEXP 'Служба информирования пациентов: список пациентов на дату';


SELECT Person.lastName Фамилия,
       Person.firstName Имя,
       Person.patrName AS Отчество,
       rbSpeciality.name AS Специальность ,
       OrgStructure.name AS Отделение ,
       ActionType.name AS Документ,
       COUNT(*) AS TOTAL
  FROM
  Person
INNER JOIN rbSpeciality 
  ON rbSpeciality.id = Person.speciality_id

  INNER JOIN OrgStructure 
  ON OrgStructure.id = Person.orgStructure_id

  INNER JOIN Action 
  ON Action.person_id = Person.id AND Person.orgStructure_id IN (17, 18, 19, 20, 21, 22, 23, 24, 25, 26) AND Person.speciality_id NOT IN (1, 66, 67) AND Action.deleted =0 AND ((Action.begDate >=:V1) AND (Action.begDate <=:V2))

  INNER JOIN ActionType 
  ON ActionType.id = Action.actionType_id

  INNER JOIN Event on Event.id=Action.event_id
 
 WHERE Event.client_id!=60

GROUP BY Person.lastName, ActionType.name 


select * from rbSpecialVariablesPreferences rsvp where name REGEXP 'SpecialVar_SluzhbaInformirovaniya'


select * from rbSpecialVariablesPreferences where name REGEXP 'SpecialVar_StoimostLecheniyaPacientMove';


insert into rbSpecialVariablesPreferences (name, arguments, query)
select 'SpecialVar_OtchetRentgenologam' name, '["Date1","Date2","personid"]' arguments, '' query from rbSpecialVariablesPreferences rsvp LIMIT 1;

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_OtchetRentgenologam';

SELECT '["da","da","da"]'


SELECT
      (SELECT
      os.shortName
    FROM ActionProperty ap
      INNER JOIN ActionProperty_OrgStructure apos
        ON ap.id = apos.id
    INNER JOIN OrgStructure os
    ON apos.value = os.id
    WHERE ap.action_id = a.id
    AND ap.type_id IN (7021)) Otdelenie,
  date (a.begDate) DateStart,
   date (a.endDate) DateEnd
FROM Action a
  INNER JOIN Event e
    ON a.event_id = e.id
  INNER JOIN Client c
    ON e.client_id = c.id
  INNER JOIN Person p
    ON a.person_id = p.id
  INNER JOIN ActionType at
    ON at.id = a.actionType_id
  INNER JOIN ActionProperty ap
    ON ap.action_id = a.id
  LEFT JOIN ActionProperty_String aps
    ON ap.id = aps.id
WHERE at.id IN (113)
AND e.setDate BETWEEN :Date1 AND :Date2 + INTERVAL 1 DAY - INTERVAL 1 SECOND
AND e.deleted = 0
AND ap.type_id IN (7021)
AND a.deleted = 0
AND ap.deleted = 0
AND c.id = :ClientId
GROUP BY a.id
ORDER BY date(DateStart) 












select CURDATE() 


SELECT z.ClientFIO,z.BirthDate,GROUP_CONCAT(DISTINCT z.ScheduleTime ORDER BY z.ScheduleTime SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.ExtID ORDER BY z.ExtID SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.OrgStr SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.PersonFIO SEPARATOR ', '), GROUP_CONCAT(z.Note SEPARATOR ' ') 
FROM (SELECT
  c.id AS 'ClientID',
  CONCAT(c.lastName,' ',c.firstName,' ',c.patrName) AS 'ClientFIO',
  c.birthDate AS 'BirthDate',
  CASE WHEN st.begTime is NOT NULL THEN TIME_FORMAT(st.begTime, '%H:%i') else 'Сверх плана' END AS 'ScheduleTime',
  NULL AS 'ExtID',
  os.shortName AS 'OrgStr',
  CASE WHEN p.id NOT IN (2153,2154,2314,2315,2316) THEN CONCAT(p.lastName,' ',p.firstName, ' ',p.patrName) END AS 'PersonFIO',
  sct.note `Note`
  FROM ScheduleClientTicket sct INNER JOIN ScheduleTicket st  ON sct.ticket_id = st.id AND sct.deleted = 0 AND st.deleted = 0 INNER JOIN Schedule s ON s.id = st.schedule_id AND s.deleted = 0 INNER JOIN Client c ON c.id = sct.client_id INNER JOIN Person p ON p.id = s.person_id LEFT JOIN OrgStructure os ON p.orgStructure_id = os.id LEFT JOIN ClientContact cc ON c.id=cc.client_id WHERE p.id != 3454 AND s.date = :Date1 GROUP BY st.id   
  UNION ALL
 SELECT
  Client.id 'ClientID',
  CONCAT_WS(' ', Client.lastName, Client.firstName, Client.patrName) 'ClientFIO',
  Client.birthDate 'BirthDate',
  NULL AS 'ScheduleTime', 
  Event.externalId AS 'ExtID',
  os1.shortName 'OrgStr',
  CONCAT(Person.lastName,' ',Person.firstName, ' ',Person.patrName) AS 'PersonFIO',
  '' `Note`
FROM Action INNER JOIN ActionProperty ON ActionProperty.action_id = Action.id INNER JOIN ActionProperty_HospitalBed ON ActionProperty_HospitalBed.id = ActionProperty.id INNER JOIN OrgStructure_HospitalBed ON OrgStructure_HospitalBed.id = ActionProperty_HospitalBed.value INNER JOIN Event ON Event.id = Action.event_id INNER JOIN Client ON Client.id = Event.client_id LEFT OUTER JOIN ClientDocument cd ON cd.id = (SELECT max(id) FROM ClientDocument
WHERE client_id = Client.id AND deleted = 0) LEFT JOIN Person ON Person.id = Event.execPerson_id LEFT JOIN (Action a8 INNER JOIN ActionProperty ap8 ON (ap8.action_id = a8.id AND a8.actionType_id = 113 AND a8.deleted = 0 AND ap8.type_id = 3963554) INNER JOIN ActionProperty_OrgStructure apos8 ON ap8.id = apos8.id) ON a8.event_id = Event.id LEFT JOIN OrgStructure os ON apos8.value = os.id LEFT JOIN OrgStructure os1 ON OrgStructure_HospitalBed.master_id = os1.id WHERE Action.ActionType_id = 113 AND Action.deleted = 0 AND Event.deleted = 0 AND Action.begDate <= STR_TO_DATE(:Date1, '%Y-%m-%d') AND (Action.endDate > STR_TO_DATE(:Date1, '%Y-%m-%d') OR Action.endDate IS NULL) AND OrgStructure_HospitalBed.master_id IN (20,
26,
130,
180,
181) AND Client.deleted = 0 GROUP BY Event.id ORDER BY ClientFIO) AS z GROUP BY z.ClientID ORDER BY z.ClientFIO



SELECT z.ClientFIO,z.BirthDate,GROUP_CONCAT(DISTINCT z.ScheduleTime ORDER BY z.ScheduleTime SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.ExtID ORDER BY z.ExtID SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.OrgStr SEPARATOR ', '),GROUP_CONCAT(DISTINCT z.PersonFIO SEPARATOR ', ') FROM (SELECT
  c.id AS 'ClientID',
  CONCAT(c.lastName,' ',c.firstName,' ',c.patrName) AS 'ClientFIO',
  c.birthDate AS 'BirthDate',
  CASE WHEN st.begTime is NOT NULL THEN TIME_FORMAT(st.begTime, '%H:%i') else 'Сверх плана' END AS 'ScheduleTime',
  NULL AS 'ExtID',
  os.shortName AS 'OrgStr',
  CASE WHEN p.id NOT IN (2153,2154,2314,2315,2316) THEN CONCAT(p.lastName,' ',p.firstName, ' ',p.patrName) END AS 'PersonFIO'
FROM ScheduleClientTicket sct
  INNER JOIN ScheduleTicket st
    ON sct.ticket_id = st.id
    AND sct.deleted = 0
    AND st.deleted = 0
  INNER JOIN Schedule s
    ON s.id = st.schedule_id
    AND s.deleted = 0
  INNER JOIN Client c
    ON c.id = sct.client_id
  INNER JOIN Person p
    ON p.id = s.person_id
    LEFT JOIN OrgStructure os ON p.orgStructure_id = os.id
  LEFT JOIN ClientContact cc ON c.id=cc.client_id
WHERE p.id != 3454
AND s.date = :Date1
 GROUP BY st.id
 UNION ALL
 SELECT
  Client.id 'ClientID',
  CONCAT_WS(' ', Client.lastName, Client.firstName, Client.patrName) 'ClientFIO',
  Client.birthDate 'BirthDate',
  NULL AS 'ScheduleTime', 
  Event.externalId AS 'ExtID',
  os1.shortName 'OrgStr',
  CONCAT(Person.lastName,' ',Person.firstName, ' ',Person.patrName) AS 'PersonFIO'
FROM Action
  INNER JOIN ActionProperty
    ON ActionProperty.action_id = Action.id
  INNER JOIN ActionProperty_HospitalBed
    ON ActionProperty_HospitalBed.id = ActionProperty.id
  INNER JOIN OrgStructure_HospitalBed
    ON OrgStructure_HospitalBed.id = ActionProperty_HospitalBed.value
  INNER JOIN Event
    ON Event.id = Action.event_id
  INNER JOIN Client
    ON Client.id = Event.client_id
  LEFT OUTER JOIN ClientDocument cd
ON cd.id = (
SELECT max(id)
FROM
  ClientDocument
WHERE
  client_id = Client.id
  AND deleted = 0
)
  LEFT JOIN Person
    ON Person.id = Event.execPerson_id
  LEFT JOIN (Action a8
    INNER JOIN ActionProperty ap8
      ON (ap8.action_id = a8.id
      AND a8.actionType_id = 113
      AND a8.deleted = 0
      AND ap8.type_id = 3963554)
    INNER JOIN ActionProperty_OrgStructure apos8
      ON ap8.id = apos8.id
  )
    ON a8.event_id = Event.id
  LEFT JOIN OrgStructure os
    ON apos8.value = os.id
  LEFT JOIN OrgStructure os1
    ON OrgStructure_HospitalBed.master_id = os1.id
WHERE Action.ActionType_id = 113
AND Action.deleted = 0
AND Event.deleted = 0
AND Action.begDate <= STR_TO_DATE(:Date1, '%Y-%m-%d')
AND (Action.endDate > STR_TO_DATE(:Date1, '%Y-%m-%d')
OR Action.endDate IS NULL)
AND OrgStructure_HospitalBed.master_id IN (20,
26,
130,
180,
181)
AND Client.deleted = 0
GROUP BY Event.id
  ORDER BY ClientFIO) AS z
GROUP BY z.ClientID
ORDER BY z.ClientFIO