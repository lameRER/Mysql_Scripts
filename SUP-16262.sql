-- select * from rbPrintTemplate rpt ;



 select tie.id, case when p2.id is not null and tie.duplicate = 0 then tie.`number` end as `выданного данным(первый)`, case when p2.id is not null and tie.duplicate = 1 then tie.`number` end as `выданного данным(продолжен.)`, 
 case when p2.id is null and tie.duplicate = 0 then tie.`number` end as `выданного другим(первый)`, case when p2.id is null and tie.duplicate = 1 then tie.`number` end as `выданного другим(продолжен.)`, 
 case when tie.client_id is not null then CONCAT_WS(' ', c2.lastName , c2.firstName, c2.patrName) else CONCAT_WS(' ',tie.lastName, tie.firstName, tie.patrName) end as `Фамилия, имя, отчество больного`, 
 case when c2.id is not null then (YEAR(CURRENT_DATE) - YEAR(c2.birthDate))-(DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(c2.birthDate , '%m%d')) else (YEAR(CURRENT_DATE) - YEAR(tie.birthDate))-(DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(tie.birthDate , '%m%d')) end as `Возраст`,
 getClientRegAddress(c2.id) as `Адрес больного`,
 tie.employer as `Место работы`,
 case when p2.id is null then tiep.doctor_name else CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) end as `Фамилия врача`
 from TempInvalidELN tie 
join TempInvalidELN_Period tiep on tiep.master_id = tie.id
left join TempInvalidDuplicate tid on tid.tempInvalid_id = tie.id
left join Client c2 on c2.id = tie.client_id 
left join Person p2 on p2.id = tie.person_id 
where tie.deleted = 0


select * from TempInvalidELN tie  ;


select * from TempInvalid ti 
join TempInvalid_Period tip on tip.master_id = ti.id
where ti.deleted = 0