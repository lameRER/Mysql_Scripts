SET @return = 1915
;


SELECT
  s1.code AS rbservice,
  ats.id AS at_service,
  at.name AS at,
  sg.name AS mrbServiceGroup,
  s.id AS mrbService_id,
  s.code AS mrbService_code,
  ms.necessity AS MES_service_value,
  ms.averageQnt AS MES_service_value2,
  s.name AS mrbService_name,
  ms.id AS MES_service_id,
  ms.groupCode AS MES_service_code,
  mm1.medicamentCode AS MES_medicament,
  mm.mkb AS MES_mkb_mkb,
  m.code AS MES_mkb_code
FROM mes.MES m
  LEFT JOIN MES_mkb mm ON mm.master_id = m.id AND mm.deleted = 0
  LEFT JOIN MES_medicament mm1 ON mm1.master_id = m.id AND mm1.deleted = 0
  LEFT JOIN MES_service ms ON m.id = ms.master_id AND ms.deleted = 0
  LEFT JOIN mrbService s ON ms.service_id = s.id AND s.deleted = 0
  LEFT JOIN mrbServiceGroup sg ON s.group_id = sg.id AND sg.deleted = 0
  LEFT JOIN pnd8.ActionType at ON at.code = s.code AND at.deleted = 0
  LEFT JOIN pnd8.ActionType_Service ats ON at.id = ats.master_id
  LEFT JOIN pnd8.rbService s1 ON ats.service_id = s1.id
WHERE m.id = @return
-- GROUP BY MES_mkb_mkb
GROUP BY MES_service_id
ORDER BY mrbServiceGroup, mrbService_code;



/*

SET @mes_serv_id = 72274;
SET @mes_serv_value = 0.25;
SET @mes_serv_value2 = 2;

UPDATE MES_service ms 
SET ms.deleted = 1
WHERE ms.id = @mes_serv_id;

INSERT MES_service (deleted, master_id, service_id, groupCode, averageQnt, necessity, binding, begDate, endDate, selectionGroup, age)
 (SELECT 
         0,
         ms.master_id,
         ms.service_id,
         ms.groupCode,
         @mes_serv_value2,
         @mes_serv_value,
         ms.binding,
         NULL,
         NULL,
         ms.selectionGroup,
         ms.age FROM MES_service ms WHERE ms.id = @mes_serv_id limit 1);




 

*/

-- SELECT m.name, s.code, s.name, ms.* FROM  MES_service ms
-- JOIN mrbService s ON s.id = ms.service_id 
-- JOIN MES m ON ms.master_id = m.id
--   WHERE ms.master_id = 1911
--  ;



-- INSERT mrbService (deleted, begDate, endDate, group_id, code, name, doctorWTU, paramedicalWTU)
--   VALUES (0, '2000-01-01', '2200-01-01', 12, 'B01.035.002', 'Прием (осмотр, консультация) врача-психиатра повторный', 0, 0);

-- INSERT MES_service (deleted, master_id, service_id, groupCode, averageQnt, necessity, binding, begDate, endDate, selectionGroup, age)
--   VALUES (0, 1911, 180, 0, 1, 1, 0, CURDATE(), CURDATE(), 0, '');



-- SELECT * FROM mrbService s;


-- SELECT * FROM mrbServiceGroup sg;

-- 
--   INSERT mrbServiceGroup (deleted, code, name)
--    VALUES (0, '7', 'Прием (осмотр, консультация) и наблюдение врача-специалиста');

-- INSERT LOW_PRIORITY INTO mrbService (deleted, begDate, endDate, group_id, code, name, doctorWTU, paramedicalWTU)
--   VALUES ( 0, CURDATE(), CURDATE(), 0, '', '', 0, 0);

-- SELECT * FROM MES m;


-- SELECT * FROM mrbService s WHERE s.code IN ('A13.29.009')

;

SELECT
  mm.*
FROM mes m
  JOIN MES_medicament mm
    ON mm.master_id = m.id
WHERE m.id = @return;

-- 
-- use pnd8
-- SELECT * FROM  ActionType at WHERE at.code IN (SELECT code FROM  mes.MES_service)
-- ;
-- SELECT at.* FROM  ActionType at INNER JOIN s11.ActionType_Service ats ON at.id = ats.master_id INNER JOIN s11.rbService s ON ats.service_id = s.id WHERE at.code IN (SELECT code FROM  mes.mrbService);

/*

 INSERT LOW_PRIORITY INTO pnd8.rbService (createDatetime,
 createPerson_id,
 modifyDatetime,
 modifyPerson_id,
 group_id,
 code,
 name,
 eisLegacy,
 nomenclatureLegacy,
 license,
 infis,
 begDate,
 endDate,
 medicalAidProfile_id,
 medicalAidKind_id,
 medicalAidType_id,
 adultUetDoctor,
 adultUetAverageMedWorker,
 childUetDoctor,
 childUetAverageMedWorker,
 qualityLevel,
 superviseComplexityFactor,
 dopService_id,
 category_id,
 caseCast_id,
 Fed_code)

SELECT * FROM(SELECT NOW() AS createDatetime,
       NULL AS createPerson_id,
       NOW() AS modifyDatetime,
       NULL AS modifyPerson_id,
       NULL AS group_id,
       s.code,
       s.name,
       0 AS  eisLegacy,
       0 AS nomenclatureLegacy,
       0 AS license,
       '' AS infis,
       s.begDate,
       s.endDate, 
       NULL AS medicalAidProfile_id,
       NULL AS medicalAidKind_id,
       NULL AS medicalAidType_id,
       0 AS adultUetDoctor,
       0 AS adultUetAverageMedWorker,
       0 AS childUetDoctor,
       0 AS childUetAverageMedWorker,
       0 AS qualityLevel,
       0 AS superviseComplexityFactor,
       NULL AS dopService_id,
       1 AS category_id,
       NULL AS caseCast_id, 
       NULL AS Fed_code FROM MES m
JOIN mes.MES_service ms ON m.id = ms.master_id AND ms.deleted = 0
JOIN mes.mrbService s ON ms.service_id = s.id AND s.deleted = 0
JOIN mes.mrbServiceGroup sg ON s.group_id = sg.id AND sg.deleted = 0
WHERE m.id = @return GROUP BY s.code ORDER BY s.code) AS tmp
WHERE NOT EXISTS (
    SELECT name FROM pnd8.rbService s1 WHERE s1.code = tmp.code
);
SELECT * FROM pnd8.rbService s1 WHERE s1.id ORDER BY s1.id DESC LIMIT 7;
*/



/*

SELECT * FROM pnd8.ActionType at ORDER BY at.id DESC LIMIT 1;



 INSERT pnd8.ActionType (createDatetime,  createPerson_id, modifyDatetime,  modifyPerson_id, class, group_id,  code,  name,  title, showInForm, quotaType_id, defaultExecPerson_id, defaultSetPerson_id, defaultOrg_id, nomenclativeService_id, prescribedType_id, shedule_id, counter_id, lis_code)

SELECT
  *
FROM (SELECT
    NOW() AS createDatetime,
    NULL AS createPerson_id,
    NOW() AS modifyDatetime,
    NULL AS modifyPerson_id,
    3 AS class,
    140 AS group_id,
    s.code AS code,
    s.name AS name,
    s.name AS title,
    1 AS showInForm,
    NULL AS quotaType_id,
    NULL AS defaultExecPerson_id,
    NULL AS defaultSetPerson_id,
    NULL AS defaultOrg_id,
    (SELECT s1.id FROM pnd8.rbService s1 WHERE s1.code = s.code LIMIT 1 ) AS nomenclativeService_id,
    NULL AS prescribedType_id,
    NULL AS shedule_id,
    NULL AS counter_id,
    NULL AS lis_code
  FROM mes.MES m JOIN mes.MES_service ms ON m.id = ms.master_id AND ms.deleted = 0
    JOIN mes.mrbService s ON ms.service_id = s.id AND s.deleted = 0
    JOIN mes.mrbServiceGroup sg ON s.group_id = sg.id AND sg.deleted = 0
    WHERE m.id = @return GROUP BY s.code ORDER BY s.code) AS tmp
WHERE NOT EXISTS (SELECT * FROM pnd8.ActionType at WHERE at.code = tmp.code);



-- SELECT * FROM(SELECT at.* , s.id AS `nome` FROM pnd8.ActionType at 
-- JOIN pnd8.rbService s ON at.code = s.code WHERE at.group_id = 140) AS tmp
-- WHERE NOT EXISTS (SELECT * FROM pnd8.ActionType at WHERE at.nomenclativeService_id  IS not NULL AND at.code = tmp.code AND at.group_id = 140);



SELECT * FROM pnd8.ActionType at WHERE at.code = 'A04.23.002' ORDER BY at.id DESC LIMIT 10;

*/

-- SELECT * FROM pnd8.ActionType at
-- JOIN pnd8.rbService s on at.code = s.code
-- WHERE at.nomenclativeService_id IS NULL


/*

 INSERT pnd8.ActionType_Service (master_id, idx, finance_id, service_id)
SELECT * FROM(SELECT 
at.id AS at,
99,
NULL,
s2.id AS ser
 FROM mes.MES m
JOIN mes.MES_service ms ON m.id = ms.master_id AND ms.deleted = 0
JOIN mes.mrbService s ON ms.service_id = s.id AND s.deleted = 0
JOIN mes.mrbServiceGroup sg ON s.group_id = sg.id AND sg.deleted = 0
JOIN pnd8.ActionType at ON at.code = s.code AND at.deleted = 0
JOIN pnd8.rbService s2 ON s.code = s2.code AND at.deleted = 0
WHERE m.id = @return GROUP BY s.code ORDER BY s.code) AS tmp
WHERE NOT EXISTS (SELECT * FROM pnd8.ActionType_Service ats WHERE ats.master_id = tmp.at AND ats.service_id = tmp.ser);



SELECT * FROM pnd8.ActionType_Service ats ORDER BY id DESC LIMIT 29

*/
;

-- SELECT * FROM pnd8.ActionType at WHERE at.id =29647



-- INSERT LOW_PRIORITY INTO mrbService(deleted, begDate, endDate, group_id, code, name, doctorWTU, paramedicalWTU)
--   VALUES (0, CURDATE(), CURDATE(), 0, '', '', 0, 0)
-- WHERE NOT EXISTS (SELECT * FROM mes.mrbService s WHERE s.code = tmp.code AND s.group_id = tmp.group_id);

SELECT * FROM mes.mrbServiceGroup sg;
-- INSERT mrbService (deleted, begDate, endDate, group_id, code, name, doctorWTU, paramedicalWTU)
--   VALUES (0, CURDATE(), CURDATE(), 0, '', '', 0, 0);
-- INSERT MES_service (deleted, master_id, service_id, groupCode, averageQnt, necessity, binding, begDate, endDate, selectionGroup, age)
--   VALUES (0, 1915, (SELECT s.id FROM mes.mrbService s WHERE s.id = LAST_INSERT_ID()), 0, $4, $3, 0, NULL, NULL, 0, '');


SELECT * FROM MES_service ms ORDER BY ms.id DESC LIMIT 2;
SELECT * FROM mrbService s ORDER BY s.id DESC LIMIT 2;


-- CREATE TEMPORARY TABLE temp_mrbService
-- (SELECT * FROM mrbService s LIMIT 0)





SELECT * FROM temp_mrbService;

SELECT * FROM mrbService s WHERE s.code = 'A25.23.001';


SELECT * FROM mrbService s ORDER BY s.id DESC LIMIT 45;


SELECT * FROM MES_service s ORDER BY s.id DESC LIMIT 45



