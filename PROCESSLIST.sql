
USE information_schema

SELECT * FROM PROCESSLIST p WHERE p.COMMAND NOT IN ('sleep') AND p.INFO IS NOT NULL ORDER BY p.TIME DESC 

;

--  UNLOCK TABLES