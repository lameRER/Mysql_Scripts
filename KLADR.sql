USE kladr

set @return =  '3035000003003900';

#region MyRegion

/*

(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)

INSERT kladr (NAME, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, STATUS)
  VALUES ('$1', '$2', '$3', '$4', '$5', '$6', '$7', '$8');

(.+)(.*$)

UPDATE 
kladr k
set k.CODE = REGEXP_REPLACE(k.code, '(.+).$', '\\\11')
WHERE k.CODE = '$1$2';

UPDATE 
street s
set s.CODE = REGEXP_REPLACE(s.code, '(.+).$', '\\\11')
WHERE s.CODE = '$1$2';

(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)\s+(.*)

INSERT LOW_PRIORITY street (NAME, SOCR, CODE, `INDEX`, GNINMB, UNO, OCATD, infis)
  VALUES ('$1', '$2', '$3', '$4', '$5', '$6', '$7', '*');

*?
#endregion

SELECT * FROM KLADR k WHERE k.CODE = REPLACE(@return, ' ', '');

SELECT * FROM STREET s WHERE s.CODE REGEXP REPLACE(CONCAT(@return /*,'.+00$'), ' ', '') ORDER BY s.NAME;

*/




 USE s11vm
 
 SELECT k.NAME, s.NAME, a.* FROM addresshouse a 
 JOIN kladr.kladr k ON a.KLADRCode = k.CODE
 JOIN kladr.street s ON a.KLADRStreetCode = s.CODE
 WHERE  a.KLADRCode = @return OR a.KLADRStreetCode REGEXP @return 
 ;
   


