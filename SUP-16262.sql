select * from rbPrintTemplate rpt order by id DESC ;




 select tie.id, 
 case when tie.duplicate = 0 and tie.isImported = 0  then tie.`number` end as `выданного данным(первый)`, case when tie.duplicate = 1 and tie.isImported = 0 then tie.`number` end as `выданного данным(продолжен.)`, 
 case when tie.duplicate = 0 and tie.isImported = 1 then tie.`number` end as `выданного другим(первый)`, case when tie.duplicate = 1 and tie.isImported = 1  then tie.`number` end as `выданного другим(продолжен.)`, 
 case when tie.client_id is not null then CONCAT_WS(' ', c2.lastName , c2.firstName, c2.patrName) else CONCAT_WS(' ',tie.lastName, tie.firstName, tie.patrName) end as `Фамилия, имя, отчество больного`, 
 case when c2.id is not null then (YEAR(CURRENT_DATE) - YEAR(c2.birthDate))-(DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(c2.birthDate , '%m%d')) else tie.age end as `Возраст`,
 getClientRegAddress(c2.id) as `Адрес больного`,
 tie.employer as `Место работы и Выполняемая работа`,
 tie.diagnos as `Диагноз`,
 case when p2.id is null then tiep.doctor_name else CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) end as `Фамилия врача(выдавшего листок нетрудоспособности)`,
 CONCAT_WS(' ', p3.lastName, p3.firstName, p3.patrName) as `Фамилия врача(закончившего листок нетрудоспособности)`,
 tie.begDate as `Освоб. от работы(с какого числа)`,
 tie.endDate as `Освоб. от работы(по какое число)`,
 Date(tie.endDate)-Date(tie.begDate)+1 as `Всего календарных дней освобождения от работы`
 from TempInvalidELN tie 
join TempInvalidELN_Period tiep on tiep.master_id = tie.id and tiep.id = (select tiep.id from TempInvalidELN_Period tiep2 where tiep2.master_id = tie.id ORDER by id limit 1)
left join TempInvalidDuplicate tid on tid.tempInvalid_id = tie.id and tid.deleted = 0
left join Client c2 on c2.id = tie.client_id and c2.deleted = 0
left join Person p2 on p2.id = tiep.doctor and p2.deleted = 0
left join Person p3 on p3.id = tie.person_id and p3.deleted = 0
where tie.deleted = 0


select * from TempInvalidELN tie  ;

select * from TempInvalidELN_Period tiep  ;


select * from TempInvalid ti 
join TempInvalid_Period tip on tip.master_id = ti.id
where ti.deleted = 0