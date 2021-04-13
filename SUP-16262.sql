-- select * from rbPrintTemplate rpt ;



 select tie.id, case when p2.id is not null then tie.`number` end as `выданного данным`, case when p2.id is null then tie.`number` end as `выданного другим`, 
 CONCAT_WS(' ', c2.lastName , c2.firstName, c2.patrName), 
 case when p2.id is null then tiep.doctor_name else CONCAT_WS(' ', p2.id, p2.lastName, p2.firstName, p2.patrName) end from TempInvalidELN tie 
join TempInvalidELN_Period tiep on tiep.master_id = tie.id
left join Client c2 on c2.id = tie.client_id 
left join Person p2 on p2.id = tie.person_id 
where tie.deleted = 0



select * from TempInvalid ti 
join TempInvalid_Period tip on tip.master_id = ti.id
where ti.deleted = 0