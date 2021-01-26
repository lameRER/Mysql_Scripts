select * from Client c ;
select * from ClientAddress ca ;
select * from ClientAttach ca ;
select * from OrgStructure_Address osa ;


select count(*),
-- if(ca2.freeInput='', CONCAT_WS(' ', k.NAME,s.NAME,ah.`number`, ah.corpus, a.flat, ca2.address_id), ca2.freeInput),
from Client c 
join ClientAttach ca on ca.client_id = c.id and ca.LPU_id = 6821 and ca.deleted  = 0
join ClientAddress ca2 on ca2.client_id = c.id and ca2.deleted = 0 and ca2.`type` = 1
left join Address a on a.id = ca2.address_id and a.deleted  = 0
left join AddressHouse ah on ah.id = a.house_id and ah.deleted = 0
left join kladr.KLADR k on k.CODE = ah.KLADRCode 
left join kladr.STREET s on s.CODE = ah.KLADRStreetCode 
left join OrgStructure_Address osa on osa.house_id = ah.id 
left join Organisation o on o.id = osa.master_id 


sf
/*select if(ca.freeInput='',CONCAT_WS(' ',CONCAT('г. ',k.NAME), CONCAT('ул. ',s.NAME), CONCAT('дом ',ah.`number`,','), concat('корп ',ah.corpus,','), concat('кв ',a.flat)),ca.freeInput) from Event e 
join Client c on c.id = e.client_id
join ClientAddress ca on c.id = ca.client_id and `type` = 1 and ca.deleted = 0
left join Address a on a.id = ca.address_id and a.deleted = 0
left join AddressHouse ah on ah.id = a.house_id and ah.deleted = 0
left join kladr.KLADR k on k.CODE = ah.KLADRCode 
left join kladr.STREET s on s.CODE = ah.KLADRStreetCode 
WHERE e.id=%s;*/