select * from rbEpicrisisProperty rep where rep.name REGEXP 'Адрес';

select c.* from Client c where c.SNILS = '15792354803';

select * from Client c where c.id = 59451;
select * from Event e where e.client_id = 595631;

SELECT 
  CONCAT_WS(' ', CONCAT_WS(' ', if(k.parent = '', '', CONCAT_WS(' ', k3.NAME, CONCAT(k3.SOCR, ','), k2.NAME, CONCAT(k2.SOCR, ','))), k.NAME, CONCAT(k.SOCR, ',')), if(ca.district_id is null, '', CONCAT(rd.name,', ')),  CONCAT_WS(' ', s.NAME, CONCAT(s.SOCR,',')), if(ah.`number` = '', '', CONCAT('д.', ah.number)),IF(ah.corpus LIKE '','',CONCAT(', корпус ',ah.corpus)),IF(a.flat LIKE '','',CONCAT(', кв ',a.flat)))
  FROM ClientAddress ca
  INNER JOIN Address a ON ca.address_id=a.id
  INNER JOIN AddressHouse ah ON a.house_id=ah.id
  left JOIN kladr.STREET s ON s.CODE=ah.KLADRStreetCode
  JOIN kladr.KLADR k ON k.CODE=ah.KLADRCode
  join kladr.KLADR k2 on k2.CODE REGEXP CONCAT('^',k.parent) and RIGHT(k2.CODE,2)= '00' and LEFT(k.parent,3)= k2.parent 
  join kladr.KLADR k3 on k3.CODE REGEXP CONCAT('^',k2.parent) and RIGHT(k3.CODE,2)= '00' and k3.parent = ''
  INNER JOIN Event e ON ca.client_id=e.client_id
  left join rbDistrict rd on ca.district_id = rd.id 
WHERE
  (
  ca.id = getClientRegAddressId(ca.client_id) OR
  ca.id = getClientLocAddressId(ca.client_id)
  )
  AND 
  e.id= %s
  ORDER BY ca.type ASC
  LIMIT 1
  
  
  select * from ClientAddress ca where ca.client_id = 59451 and ca.deleted = 0;
  
 
 select * from kladr.KLADR k where CODE = '0503800000600';
 
select * from kladr.KLADR k where k.NAME = 'Дагестан' or k.NAME = 'хивский' or k.CODE = '0503800000600';

select * from kladr.KLADR k where k.NAME REGEXP 'хивский';




SELECT CODE, CONCAT(NAME, \' \', SOCR) AS NAMEEX FROM %s WHERE CODE LIKE \'%s%%\' AND RIGHT(CODE,2)=\'00\' ORDER BY NAME, SOCR, CODE' % (tblSTREET, prefix)

select * from kladr

where k.CODE = '0503800000600';

select if(k.parent = '', '', CONCAT(k3.NAME, k2.NAME)), k.NAME  from kladr.KLADR k 
join kladr.KLADR k2 on k2.CODE REGEXP CONCAT('^',k.parent) and RIGHT(k2.CODE,2)= '00' and LEFT(k.parent,3)= k2.parent 
join kladr.KLADR k3 on k3.CODE REGEXP CONCAT('^',k2.parent) and RIGHT(k3.CODE,2)= '00' and k3.parent = ''
where k.CODE = '7800000000000';



select s.*, k2.CODE, CONCAT_WS(' ', k2.NAME, k2.SOCR), s.CODE, CONCAT_WS(' ', s.NAME, s.SOCR) from kladr.KLADR k 
join KLADR k2 on k2.CODE REGEXP CONCAT('^',k.GNINMB) and RIGHT(k2.CODE,2)= '00' and k2.NAME REGEXP 'Павловск'
join kladr.STREET s on s.CODE REGEXP CONCAT('^',k.GNINMB) and RIGHT(s.CODE,2)='00' and LEFT(s.CODE, 8) = LEFT(k2.CODE, 8)
where k.CODE = '7800000000000';