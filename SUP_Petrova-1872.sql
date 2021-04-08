select * from rbEpicrisisProperty rep where rep.name REGEXP 'Адрес';

select c.* from Client c where c.SNILS = '15792354803';

select * from Client c where c.id = 594511;
select * from Event e where e.client_id = 594511;

SELECT 
  CONCAT_WS(' ', CONCAT_WS(' ', k.NAME, CONCAT(k.SOCR, ',')), if(ca.district_id is null, '', CONCAT(rd.name,', ')),  CONCAT_WS(' ', s.NAME, CONCAT(s.SOCR,',')), if(ah.`number` = '', '', CONCAT('д.', ah.number)),IF(ah.corpus LIKE '','',CONCAT(', корпус ',ah.corpus)),IF(a.flat LIKE '','',CONCAT(', кв ',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  left JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  left JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on ca.district_id = rd.id 
WHERE
  (
  ca.id = getClientRegAddressId(ca.client_id) OR
  ca.id = getClientLocAddressId(ca.client_id)
  )
  AND 
  e.id= 4448555
  ORDER BY ca.type ASC
  LIMIT 1
  
  