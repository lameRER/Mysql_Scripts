

START TRANSACTION;
 set @return1 = '23035000050004600';
 set @return2 = '23035001000024400';
SET @type = 0;

USE s11vm



#region MyRegion


/*



-- Client: $1
 INSERT LOW_PRIORITY INTO addresshouse (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, KLADRCode, KLADRStreetCode, number, corpus, litera)

(SELECT
       NOW(),
       1,
       NOW(),
       1,
       a1.deleted,
       a1.KLADRCode,
       @return2,
       a1.number,
       a1.corpus,
       a1.litera FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id
JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = @return1
WHERE c.type = @type AND c.client_id = $1 LIMIT 1);



 INSERT LOW_PRIORITY INTO address (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, house_id, flat, regBegDate, regEndDate)
  (SELECT 
          NOW(),
          1,
          NOW(),
          1,
          a.deleted,
          (SELECT LAST_INSERT_ID()),
          a.flat,
          a.regBegDate,
          a.regEndDate FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id
JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = @return1
WHERE c.type = @type AND c.client_id = $1 LIMIT 1);



update clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id
JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = @return1
SET c.deleted = 1
WHERE c.type = @type AND c.client_id = $1;


 INSERT LOW_PRIORITY INTO clientaddress (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, client_id, type, address_id, freeInput, district_id, isVillager)
  (SELECT 
          NOW(),
          1,
          NOW(),
          1,
          0,
          $1,
          c.type,
          (SELECT LAST_INSERT_ID()),
          c.freeInput,
          c.district_id,
          c.isVillager FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id
JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = @return1
WHERE c.type = @type AND c.client_id = $1 LIMIT 1);

*/
#endregion



COMMIT;


SELECT COUNT(c.address_id),  c.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return2
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode 
WHERE c.type = @type AND c.deleted = 0 GROUP BY c.address_id ORDER BY c.createDatetime DESC-- AND c.client_id = $1

;
SELECT  c.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return2
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = '23035000003005300'
WHERE c.type = @type AND c.deleted = 0 AND a.deleted = 0 AND a1.deleted = 0 and c.createPerson_id = 1 ORDER BY c.createDatetime DESC-- AND c.client_id = $1
;



SELECT  a.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return2
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode 
WHERE c.type = @type AND c.deleted = 0 AND a.deleted = 0  ORDER BY c.createDatetime DESC-- AND c.client_id = $1
;
SELECT  a1.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return2
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode 
WHERE c.type = @type AND c.deleted = 0 AND a1.deleted = 0  ORDER BY c.createDatetime DESC-- AND c.client_id = $1
;

SELECT c.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return1
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode AND s.CODE = '23035000003003900'
WHERE c.type = @type AND c.deleted=0;

SELECT  a.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return1
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode 
WHERE c.type = @type AND c.deleted = 0 AND a.deleted = 0  ORDER BY c.createDatetime DESC-- AND c.client_id = $1
;
SELECT  a1.* FROM clientaddress c
JOIN address a ON c.address_id = a.id
JOIN addresshouse a1 ON a.house_id = a1.id AND a1.KLADRStreetCode = @return1
-- JOIN kladr.kladr k ON k.CODE = a1.KLADRCode
-- JOIN kladr.street s ON s.CODE = a1.KLADRStreetCode 
WHERE c.type = @type AND c.deleted = 0 AND a1.deleted = 0  ORDER BY c.createDatetime DESC-- AND c.client_id = $1