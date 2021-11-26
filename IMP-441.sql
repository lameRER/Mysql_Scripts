select *
from
(SELECT apd.value                                                                                         as `CurData`,
        aps2.value                                                                                        as `Position`,
       aps1.value                                                                                         as `note`,
       IF(EXISTS(SELECT LEFT(diagnos_string, 130)
                 FROM Diagnostic
                          JOIN Diagnosis ON Diagnostic.diagnosis_id = Diagnosis.id
                 WHERE event_id = e.id
                   AND Diagnostic.diagnosisType_id = 18
                   AND Diagnostic.deleted = 0
                 ORDER BY Diagnostic.id DESC
                 LIMIT 1), (SELECT LEFT(diagnos_string, 130)
                            FROM Diagnostic
                                     JOIN Diagnosis ON Diagnostic.diagnosis_id = Diagnosis.id
                            WHERE event_id = e.id
                              AND Diagnostic.diagnosisType_id = 18
                              AND Diagnostic.deleted = 0
                            ORDER BY Diagnostic.id DESC
                            LIMIT 1), (SELECT LEFT(aps.value, 130)
                                       FROM Action
                                                JOIN ActionType ON Action.actionType_id = ActionType.id AND ActionType.code IN ('145-124-1_1', 'osm_vrach_kar_1') AND ActionType.deleted = 0
                                                JOIN ActionProperty ap ON Action.id = ap.action_id
                                                JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name = 'Диагноз'
                                                JOIN ActionProperty_String aps ON ap.id = aps.id
                                       WHERE event_id = e.id
                                         AND Action.deleted = 0
                                         AND status = 2
                                       ORDER BY Action.id desc
                                       limit 1))                                                          as `diag`,
       CONCAT_WS(' ', api.value, 'смена')                                                                 AS smena,
       CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))       AS `surgeon`,
       CONCAT(p1.lastName, ' ', CONCAT(LEFT(p1.firstName, 1), '.'), CONCAT(LEFT(p1.patrName, 1), '.'))    AS `ass`,
       CONCAT(p2.lastName, ' ', CONCAT(LEFT(p2.firstName, 1), '.'), CONCAT(LEFT(p2.patrName, 1), '.'))    AS `anest`,
       CONCAT(p3.lastName, ' ', CONCAT(LEFT(p3.firstName, 1), '.'), CONCAT(LEFT(p3.patrName, 1), '.'))    AS `anessist`,
       CONCAT(p4.lastName, ' ', CONCAT(LEFT(p4.firstName, 1), '.'), CONCAT(LEFT(p4.patrName, 1), '.'))    AS `surgsist`,
       CONCAT(plv.lastName, ' ', CONCAT(LEFT(plv.firstName, 1), '.'), CONCAT(LEFT(plv.patrName, 1), '.')) AS `dr`,
       os1.code                                                                                           AS otdelenie,
       oshb.name                                                                                          AS nomerkojki,
       os.name                                                                                            AS nomeroperacionn,
       aps.value                                                                                          AS naimenovanieoperacii,
       CONCAT(c.lastName, ' ', CONCAT(LEFT(c.firstName, 1), '.'), CONCAT(LEFT(c.patrName, 1), '.'))       AS `ClientFIO`,
       (SELECT CONCAT_WS(' ', SPRAV_BLOOD_GROUP.NAME, SPRAV_BLOOD_RH.NAME, SPRAV_BLOOD_Fenotip.NAME)
        FROM Action
                 JOIN ActionType at ON Action.actionType_id = at.id AND at.code = 'analysis_blood_group_rf'
                 LEFT JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted = 0 AND apt.name = 'Группа крови'
                 LEFT JOIN ActionPropertyType apt1 ON at.id = apt1.actionType_id AND apt1.deleted = 0 AND apt1.name = 'Резус фактор'
                 LEFT JOIN ActionPropertyType apt2 ON at.id = apt2.actionType_id AND apt2.deleted = 0 AND apt2.name = 'Фенотип'
                 LEFT JOIN ActionProperty ap ON Action.id = ap.action_id AND ap.type_id = apt.id AND ap.deleted = 0
                 LEFT JOIN ActionProperty ap1 ON Action.id = ap1.action_id AND ap1.type_id = apt1.id AND ap1.deleted = 0
                 LEFT JOIN ActionProperty ap2 ON Action.id = ap2.action_id AND ap2.type_id = apt2.id AND ap2.deleted = 0
                 LEFT JOIN ActionProperty_Reference apr ON ap.id = apr.id
                 LEFT JOIN ActionProperty_Reference apr1 ON ap1.id = apr1.id
                 LEFT JOIN ActionProperty_Reference apr2 ON ap2.id = apr2.id
                 LEFT JOIN SPRAV_BLOOD_GROUP ON apr.value = SPRAV_BLOOD_GROUP.id
                 LEFT JOIN SPRAV_BLOOD_RH ON apr1.value = SPRAV_BLOOD_RH.id
                 LEFT JOIN SPRAV_BLOOD_Fenotip ON apr2.value = SPRAV_BLOOD_Fenotip.id
        WHERE event_id = e.id
          AND status = 2
        ORDER BY Action.id DESC
        LIMIT 1)                                                                                          AS groupblood,
       age(c.birthDate, CURTIME())                                                                        AS age,
       ca.weight                                                                                          AS weight,
       ca.height                                                                                          AS growth,
       c1.grouping                                                                                        AS kontract,
       (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
        FROM ActionProperty
                 JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Ассистент 2'
                 JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                 JOIN Person p ON app.value = p.id
        WHERE action_id = a.id
        ORDER BY ActionProperty.id DESC
        LIMIT 1)                                                                                          AS `ass2`,
       (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
        FROM ActionProperty
                 JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Перфузиолог'
                 JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                 JOIN Person p ON app.value = p.id
        WHERE action_id = a.id
        ORDER BY ActionProperty.id DESC
        LIMIT 1)                                                                                          AS `perfuziolog`,
       (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
        FROM ActionProperty
                 JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Анестезиологическая сестра 2'
                 JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                 JOIN Person p ON app.value = p.id
        WHERE action_id = a.id
        ORDER BY ActionProperty.id DESC
        LIMIT 1)                                                                                          AS `surgsist2`,
       (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
        FROM ActionProperty
                 JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Санитарка'
                 JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                 JOIN Person p ON app.value = p.id
        WHERE action_id = a.id
        ORDER BY ActionProperty.id DESC
        LIMIT 1)                                                                                          AS `sanitar`,
       IF(EXISTS(SELECT *
                 FROM Action
                          JOIN ActionType at ON Action.actionType_id = at.id AND at.name = 'Титульный лист'
                 WHERE event_id = e.id
                   and Action.deleted = 0),
          (SELECT GROUP_CONCAT(apt.shortName)
           FROM Action
                    JOIN ActionType at ON Action.actionType_id = at.id AND at.name = 'Титульный лист'
                    JOIN ActionProperty ap ON Action.id = ap.action_id AND ap.deleted = 0
                    JOIN ActionPropertyType apt ON ap.type_id = apt.id
                    JOIN ActionProperty_String aps ON ap.id = aps.id
           WHERE event_id = e.id
             and Action.deleted = 0
             AND aps.value IN ('Положительный')), 'нет отметок о вич и геп')                              AS `gepatity`
FROM Event e
         JOIN Client c ON e.client_id = c.id AND c.deleted = 0
         left join ClientAnthropometric ca on ca.client_id = c.id and ca.id = (select max(ca1.id) from ClientAnthropometric ca1 where ca1.client_id = c.id order by ca.id desc limit 1)
         JOIN Action a ON e.id = a.event_id AND a.deleted = 0
         JOIN Action a1 ON e.id = a1.event_id AND a1.deleted = 0 AND a1.status != 2
         JOIN ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.serviceType = 4
         JOIN ActionType at1 ON a1.actionType_id = at1.id AND at1.deleted = 0 AND at1.flatCode = 'moving'
         JOIN Person plv ON e.execPerson_id = plv.id
         LEFT JOIN Contract c1 ON c1.id = e.contract_id
         LEFT JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted = 0 AND apt.name = 'Операционная'
         LEFT JOIN ActionPropertyType apt1 ON at.id = apt1.actionType_id AND apt1.deleted = 0 AND apt1.name = 'Хирург'
         LEFT JOIN ActionPropertyType apt2 ON at.id = apt2.actionType_id AND apt2.deleted = 0 AND apt2.name = 'Ассистент'
         LEFT JOIN ActionPropertyType apt3 ON at.id = apt3.actionType_id AND apt3.deleted = 0 AND apt3.name = 'смена'
         LEFT JOIN ActionPropertyType apt4 ON at.id = apt4.actionType_id AND apt4.deleted = 0 AND apt4.name = 'Анестезиолог'
         LEFT JOIN ActionPropertyType apt5 ON at.id = apt5.actionType_id AND apt5.deleted = 0 AND apt5.name = 'Анестезиологическая сестра'
         LEFT JOIN ActionPropertyType apt6 ON at.id = apt6.actionType_id AND apt6.deleted = 0 AND apt6.name = 'Операционная сестра'
         LEFT JOIN ActionPropertyType apt7 ON at1.id = apt7.actionType_id AND apt7.deleted = 0 AND apt7.name = 'койка'
         LEFT JOIN ActionPropertyType apt8 ON at1.id = apt8.actionType_id AND apt8.deleted = 0 AND apt8.name = 'Отделение пребывания'
         LEFT JOIN ActionPropertyType apt9 ON at.id = apt9.actionType_id AND apt9.deleted = 0 AND apt9.name = 'Наименование операции'
         LEFT JOIN ActionPropertyType apt10 ON at.id = apt10.actionType_id AND apt10.deleted = 0 AND apt10.name = 'Примечание'
         LEFT JOIN ActionPropertyType apt11 ON at.id = apt11.actionType_id AND apt11.deleted = 0 AND apt11.name = 'Планируемая дата'
         LEFT JOIN ActionPropertyType apt12 ON at.id = apt12.actionType_id AND apt12.deleted = 0 AND apt12.name = 'Положение на операционном столе'
         LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id AND ap.deleted = 0
         LEFT JOIN ActionProperty ap1 ON a.id = ap1.action_id AND apt1.id = ap1.type_id AND ap1.deleted = 0
         LEFT JOIN ActionProperty ap2 ON a.id = ap2.action_id AND apt2.id = ap2.type_id AND ap2.deleted = 0
         LEFT JOIN ActionProperty ap3 ON a.id = ap3.action_id AND apt3.id = ap3.type_id AND ap3.deleted = 0
         LEFT JOIN ActionProperty ap4 ON a.id = ap4.action_id AND apt4.id = ap4.type_id AND ap4.deleted = 0
         LEFT JOIN ActionProperty ap5 ON a.id = ap5.action_id AND apt5.id = ap5.type_id AND ap5.deleted = 0
         LEFT JOIN ActionProperty ap6 ON a.id = ap6.action_id AND apt6.id = ap6.type_id AND ap6.deleted = 0
         LEFT JOIN ActionProperty ap7 ON a1.id = ap7.action_id AND apt7.id = ap7.type_id AND ap7.deleted = 0
         LEFT JOIN ActionProperty ap8 ON a1.id = ap8.action_id AND apt8.id = ap8.type_id AND ap8.deleted = 0
         LEFT JOIN ActionProperty ap9 ON a.id = ap9.action_id AND apt9.id = ap9.type_id AND ap9.deleted = 0
         LEFT JOIN ActionProperty ap10 ON a.id = ap10.action_id AND apt10.id = ap10.type_id AND ap10.deleted = 0
         LEFT JOIN ActionProperty ap11 ON a.id = ap11.action_id AND apt11.id = ap11.type_id AND ap11.deleted = 0
         LEFT JOIN ActionProperty ap12 ON a.id = ap12.action_id AND apt12.id = ap12.type_id AND ap12.deleted = 0
         LEFT JOIN ActionProperty_OrgStructure apr ON ap.id = apr.id
         LEFT JOIN ActionProperty_Integer api ON ap3.id = api.id
         LEFT JOIN ActionProperty_Person apr1 ON apr1.id = ap1.id
         LEFT JOIN ActionProperty_Person apr2 ON apr2.id = ap2.id
         LEFT JOIN ActionProperty_Person apr3 ON apr3.id = ap4.id
         LEFT JOIN ActionProperty_Person apr4 ON apr4.id = ap5.id
         LEFT JOIN ActionProperty_Person apr5 ON apr5.id = ap6.id
         LEFT JOIN ActionProperty_HospitalBed aphb ON ap7.id = aphb.id
         LEFT JOIN ActionProperty_OrgStructure apos ON ap8.id = apos.id
         LEFT JOIN ActionProperty_String aps ON aps.id = ap9.id
         LEFT JOIN ActionProperty_String aps1 ON aps1.id = ap10.id
         LEFT JOIN ActionProperty_String aps2 ON aps2.id = ap12.id
         LEFT JOIN ActionProperty_Date apd ON apd.id = ap11.id
         LEFT JOIN OrgStructure os ON apr.value = os.id AND os.deleted = 0
         LEFT JOIN Person p ON apr1.value = p.id AND p.deleted = 0
         LEFT JOIN Person p1 ON apr2.value = p1.id AND p1.deleted = 0
         LEFT JOIN Person p2 ON apr3.value = p2.id AND p2.deleted = 0
         LEFT JOIN Person p3 ON apr4.value = p3.id AND p3.deleted = 0
         LEFT JOIN Person p4 ON apr5.value = p4.id AND p4.deleted = 0
         LEFT JOIN OrgStructure_HospitalBed oshb ON aphb.value = oshb.id
         LEFT JOIN OrgStructure os1 ON apos.value = os1.id
WHERE e.eventType_id = 129
GROUP by a.id
ORDER BY apd.value, nomeroperacionn, smena) as tmp
where tmp.CurData is  not null and tmp.CurData between '2020-11-15' and '2021-11-15'

select *
from EventType;


select id, `default`
from rbPrintTemplate where id = 1286;




    SELECT apd.value                                                                                         as `DateOper`,
            aps2.value                                                                                        as `Position`,
           aps1.value                                                                                         as `note`,
           IF(EXISTS(SELECT LEFT(diagnos_string, 130)
                     FROM Diagnostic
                              JOIN Diagnosis ON Diagnostic.diagnosis_id = Diagnosis.id
                     WHERE event_id = e.id
                       AND Diagnostic.diagnosisType_id = 18
                       AND Diagnostic.deleted = 0
                     ORDER BY Diagnostic.id DESC
                     LIMIT 1), (SELECT LEFT(diagnos_string, 130)
                                FROM Diagnostic
                                         JOIN Diagnosis ON Diagnostic.diagnosis_id = Diagnosis.id
                                WHERE event_id = e.id
                                  AND Diagnostic.diagnosisType_id = 18
                                  AND Diagnostic.deleted = 0
                                ORDER BY Diagnostic.id DESC
                                LIMIT 1), (SELECT LEFT(aps.value, 130)
                                           FROM Action
                                                    JOIN ActionType ON Action.actionType_id = ActionType.id AND ActionType.code IN ('145-124-1_1', 'osm_vrach_kar_1') AND ActionType.deleted = 0
                                                    JOIN ActionProperty ap ON Action.id = ap.action_id
                                                    JOIN ActionPropertyType apt ON ap.type_id = apt.id AND apt.name = 'Диагноз'
                                                    JOIN ActionProperty_String aps ON ap.id = aps.id
                                           WHERE event_id = e.id
                                             AND Action.deleted = 0
                                             AND status = 2
                                           ORDER BY Action.id desc
                                           limit 1))                                                          as `diag`,
           CONCAT_WS(' ', api.value, 'смена')                                                                 AS smena,
           CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))       AS `surgeon`,
           CONCAT(p1.lastName, ' ', CONCAT(LEFT(p1.firstName, 1), '.'), CONCAT(LEFT(p1.patrName, 1), '.'))    AS `ass`,
           CONCAT(p2.lastName, ' ', CONCAT(LEFT(p2.firstName, 1), '.'), CONCAT(LEFT(p2.patrName, 1), '.'))    AS `anest`,
           CONCAT(p3.lastName, ' ', CONCAT(LEFT(p3.firstName, 1), '.'), CONCAT(LEFT(p3.patrName, 1), '.'))    AS `anessist`,
           CONCAT(p4.lastName, ' ', CONCAT(LEFT(p4.firstName, 1), '.'), CONCAT(LEFT(p4.patrName, 1), '.'))    AS `surgsist`,
           CONCAT(plv.lastName, ' ', CONCAT(LEFT(plv.firstName, 1), '.'), CONCAT(LEFT(plv.patrName, 1), '.')) AS `dr`,
           os1.code                                                                                           AS otdelenie,
           oshb.name                                                                                          AS nomerkojki,
           os.name                                                                                            AS nomeroperacionn,
           aps.value                                                                                          AS naimenovanieoperacii,
           CONCAT(c.lastName, ' ', CONCAT(LEFT(c.firstName, 1), '.'), CONCAT(LEFT(c.patrName, 1), '.'))       AS `ClientFIO`,
           (SELECT CONCAT_WS(' ', SPRAV_BLOOD_GROUP.NAME, SPRAV_BLOOD_RH.NAME, SPRAV_BLOOD_Fenotip.NAME)
            FROM Action
                     JOIN ActionType at ON Action.actionType_id = at.id AND at.code = 'analysis_blood_group_rf'
                     LEFT JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted = 0 AND apt.name = 'Группа крови'
                     LEFT JOIN ActionPropertyType apt1 ON at.id = apt1.actionType_id AND apt1.deleted = 0 AND apt1.name = 'Резус фактор'
                     LEFT JOIN ActionPropertyType apt2 ON at.id = apt2.actionType_id AND apt2.deleted = 0 AND apt2.name = 'Фенотип'
                     LEFT JOIN ActionProperty ap ON Action.id = ap.action_id AND ap.type_id = apt.id AND ap.deleted = 0
                     LEFT JOIN ActionProperty ap1 ON Action.id = ap1.action_id AND ap1.type_id = apt1.id AND ap1.deleted = 0
                     LEFT JOIN ActionProperty ap2 ON Action.id = ap2.action_id AND ap2.type_id = apt2.id AND ap2.deleted = 0
                     LEFT JOIN ActionProperty_Reference apr ON ap.id = apr.id
                     LEFT JOIN ActionProperty_Reference apr1 ON ap1.id = apr1.id
                     LEFT JOIN ActionProperty_Reference apr2 ON ap2.id = apr2.id
                     LEFT JOIN SPRAV_BLOOD_GROUP ON apr.value = SPRAV_BLOOD_GROUP.id
                     LEFT JOIN SPRAV_BLOOD_RH ON apr1.value = SPRAV_BLOOD_RH.id
                     LEFT JOIN SPRAV_BLOOD_Fenotip ON apr2.value = SPRAV_BLOOD_Fenotip.id
            WHERE event_id = e.id
              AND status = 2
            ORDER BY Action.id DESC
            LIMIT 1)                                                                                          AS groupblood,
           age(c.birthDate, CURTIME())                                                                        AS age,
           ca.weight                                                                                          AS weight,
           ca.height                                                                                          AS growth,
           c1.grouping                                                                                        AS kontract,
           (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
            FROM ActionProperty
                     JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Ассистент 2'
                     JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                     JOIN Person p ON app.value = p.id
            WHERE action_id = a.id
            ORDER BY ActionProperty.id DESC
            LIMIT 1)                                                                                          AS `ass2`,
           (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
            FROM ActionProperty
                     JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Перфузиолог'
                     JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                     JOIN Person p ON app.value = p.id
            WHERE action_id = a.id
            ORDER BY ActionProperty.id DESC
            LIMIT 1)                                                                                          AS `perfuziolog`,
           (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
            FROM ActionProperty
                     JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Анестезиологическая сестра 2'
                     JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                     JOIN Person p ON app.value = p.id
            WHERE action_id = a.id
            ORDER BY ActionProperty.id DESC
            LIMIT 1)                                                                                          AS `surgsist2`,
           (SELECT CONCAT(p.lastName, ' ', CONCAT(LEFT(p.firstName, 1), '.'), CONCAT(LEFT(p.patrName, 1), '.'))
            FROM ActionProperty
                     JOIN ActionPropertyType apt ON ActionProperty.type_id = apt.id AND apt.name = 'Санитарка'
                     JOIN ActionProperty_Person app ON ActionProperty.id = app.id
                     JOIN Person p ON app.value = p.id
            WHERE action_id = a.id
            ORDER BY ActionProperty.id DESC
            LIMIT 1)                                                                                          AS `sanitar`,
           IF(EXISTS(SELECT *
                     FROM Action
                              JOIN ActionType at ON Action.actionType_id = at.id AND at.name = 'Титульный лист'
                     WHERE event_id = e.id
                       and Action.deleted = 0),
              (SELECT GROUP_CONCAT(apt.shortName)
               FROM Action
                        JOIN ActionType at ON Action.actionType_id = at.id AND at.name = 'Титульный лист'
                        JOIN ActionProperty ap ON Action.id = ap.action_id AND ap.deleted = 0
                        JOIN ActionPropertyType apt ON ap.type_id = apt.id
                        JOIN ActionProperty_String aps ON ap.id = aps.id
               WHERE event_id = e.id
                 and Action.deleted = 0
                 AND aps.value IN ('Положительный')), 'нет отметок о вич и геп')                              AS `gepatity`
    FROM Event e
             JOIN Client c ON e.client_id = c.id AND c.deleted = 0
             left join ClientAnthropometric ca on ca.client_id = c.id and ca.id = (select max(ca1.id) from ClientAnthropometric ca1 where ca1.client_id = c.id order by ca.id desc limit 1)
             JOIN Action a ON e.id = a.event_id AND a.deleted = 0
             JOIN Action a1 ON e.id = a1.event_id AND a1.deleted = 0 AND a1.status != 2
             JOIN ActionType at ON a.actionType_id = at.id AND at.deleted = 0 AND at.serviceType = 4
             JOIN ActionType at1 ON a1.actionType_id = at1.id AND at1.deleted = 0 AND at1.flatCode = 'moving'
             JOIN Person plv ON e.execPerson_id = plv.id
             LEFT JOIN Contract c1 ON c1.id = e.contract_id
             LEFT JOIN ActionPropertyType apt ON at.id = apt.actionType_id AND apt.deleted = 0 AND apt.name = 'Операционная'
             LEFT JOIN ActionPropertyType apt1 ON at.id = apt1.actionType_id AND apt1.deleted = 0 AND apt1.name = 'Хирург'
             LEFT JOIN ActionPropertyType apt2 ON at.id = apt2.actionType_id AND apt2.deleted = 0 AND apt2.name = 'Ассистент'
             LEFT JOIN ActionPropertyType apt3 ON at.id = apt3.actionType_id AND apt3.deleted = 0 AND apt3.name = 'смена'
             LEFT JOIN ActionPropertyType apt4 ON at.id = apt4.actionType_id AND apt4.deleted = 0 AND apt4.name = 'Анестезиолог'
             LEFT JOIN ActionPropertyType apt5 ON at.id = apt5.actionType_id AND apt5.deleted = 0 AND apt5.name = 'Анестезиологическая сестра'
             LEFT JOIN ActionPropertyType apt6 ON at.id = apt6.actionType_id AND apt6.deleted = 0 AND apt6.name = 'Операционная сестра'
             LEFT JOIN ActionPropertyType apt7 ON at1.id = apt7.actionType_id AND apt7.deleted = 0 AND apt7.name = 'койка'
             LEFT JOIN ActionPropertyType apt8 ON at1.id = apt8.actionType_id AND apt8.deleted = 0 AND apt8.name = 'Отделение пребывания'
             LEFT JOIN ActionPropertyType apt9 ON at.id = apt9.actionType_id AND apt9.deleted = 0 AND apt9.name = 'Наименование операции'
             LEFT JOIN ActionPropertyType apt10 ON at.id = apt10.actionType_id AND apt10.deleted = 0 AND apt10.name = 'Примечание'
             LEFT JOIN ActionPropertyType apt11 ON at.id = apt11.actionType_id AND apt11.deleted = 0 AND apt11.name = 'Планируемая дата'
             LEFT JOIN ActionPropertyType apt12 ON at.id = apt12.actionType_id AND apt12.deleted = 0 AND apt12.name = 'Положение на операционном столе'
             LEFT JOIN ActionProperty ap ON a.id = ap.action_id AND apt.id = ap.type_id AND ap.deleted = 0
             LEFT JOIN ActionProperty ap1 ON a.id = ap1.action_id AND apt1.id = ap1.type_id AND ap1.deleted = 0
             LEFT JOIN ActionProperty ap2 ON a.id = ap2.action_id AND apt2.id = ap2.type_id AND ap2.deleted = 0
             LEFT JOIN ActionProperty ap3 ON a.id = ap3.action_id AND apt3.id = ap3.type_id AND ap3.deleted = 0
             LEFT JOIN ActionProperty ap4 ON a.id = ap4.action_id AND apt4.id = ap4.type_id AND ap4.deleted = 0
             LEFT JOIN ActionProperty ap5 ON a.id = ap5.action_id AND apt5.id = ap5.type_id AND ap5.deleted = 0
             LEFT JOIN ActionProperty ap6 ON a.id = ap6.action_id AND apt6.id = ap6.type_id AND ap6.deleted = 0
             LEFT JOIN ActionProperty ap7 ON a1.id = ap7.action_id AND apt7.id = ap7.type_id AND ap7.deleted = 0
             LEFT JOIN ActionProperty ap8 ON a1.id = ap8.action_id AND apt8.id = ap8.type_id AND ap8.deleted = 0
             LEFT JOIN ActionProperty ap9 ON a.id = ap9.action_id AND apt9.id = ap9.type_id AND ap9.deleted = 0
             LEFT JOIN ActionProperty ap10 ON a.id = ap10.action_id AND apt10.id = ap10.type_id AND ap10.deleted = 0
             LEFT JOIN ActionProperty ap11 ON a.id = ap11.action_id AND apt11.id = ap11.type_id AND ap11.deleted = 0
             LEFT JOIN ActionProperty ap12 ON a.id = ap12.action_id AND apt12.id = ap12.type_id AND ap12.deleted = 0
             LEFT JOIN ActionProperty_OrgStructure apr ON ap.id = apr.id
             LEFT JOIN ActionProperty_Integer api ON ap3.id = api.id
             LEFT JOIN ActionProperty_Person apr1 ON apr1.id = ap1.id
             LEFT JOIN ActionProperty_Person apr2 ON apr2.id = ap2.id
             LEFT JOIN ActionProperty_Person apr3 ON apr3.id = ap4.id
             LEFT JOIN ActionProperty_Person apr4 ON apr4.id = ap5.id
             LEFT JOIN ActionProperty_Person apr5 ON apr5.id = ap6.id
             LEFT JOIN ActionProperty_HospitalBed aphb ON ap7.id = aphb.id
             LEFT JOIN ActionProperty_OrgStructure apos ON ap8.id = apos.id
             LEFT JOIN ActionProperty_String aps ON aps.id = ap9.id
             LEFT JOIN ActionProperty_String aps1 ON aps1.id = ap10.id
             LEFT JOIN ActionProperty_String aps2 ON aps2.id = ap12.id
             LEFT JOIN ActionProperty_Date apd ON apd.id = ap11.id
             LEFT JOIN OrgStructure os ON apr.value = os.id AND os.deleted = 0
             LEFT JOIN Person p ON apr1.value = p.id AND p.deleted = 0
             LEFT JOIN Person p1 ON apr2.value = p1.id AND p1.deleted = 0
             LEFT JOIN Person p2 ON apr3.value = p2.id AND p2.deleted = 0
             LEFT JOIN Person p3 ON apr4.value = p3.id AND p3.deleted = 0
             LEFT JOIN Person p4 ON apr5.value = p4.id AND p4.deleted = 0
             LEFT JOIN OrgStructure_HospitalBed oshb ON aphb.value = oshb.id
             LEFT JOIN OrgStructure os1 ON apos.value = os1.id
    WHERE e.eventType_id = 129 and apd.value between STR_TO_DATE('15.11.2021', '%d.%m.%Y') and STR_TO_DATE('15.11.2021', '%d.%m.%Y')
    GROUP by a.id
    ORDER BY DateOper, nomeroperacionn, smena