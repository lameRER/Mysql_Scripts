select * from rbPost rp -- where rp.netrica_Code-- = 'UK23AMLFL7';



ALTER TABLE s11.rbSpeciality MODIFY COLUMN name varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Ќаименование';



select * from rbSpeciality rs ;


select * from temp_OrgStructure tos ;


select * from temp_rbSpeciality trs where trs.version = '1.6';


UPDATE 
-- select trs.version, rs.* from 
rbSpeciality rs 
join temp_rbSpeciality trs on rs.name = trs.speciality  and trs.version = '1.6'
set rs.netrica_Code = trs.NSI_ID 
where rs.netrica_Code is null


INSERT into rbSpeciality (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, OKSOName, OKSOCode, federalCode, service_id, provinceService_id, otherService_id, sex, age, mkbFilter, regionalCode, shortName, versSpec, syncGUID, netrica_Code, fundingService_id, shouldFillOncologyForm90, queueShareMode, kind, EGISZ_code)
select 
NOW() createDatetime, NULL createPerson_id, NOW() modifyDatetime, null modifyPerson_id, 
trs.NSI_ID code, trs.speciality name, '' OKSOName, '' OKSOCode, trs.NSI_ID federalCode, NULL service_id, NULL provinceService_id, NULL otherService_id, 0 sex, '' age, '' mkbFilter, trs.NSI_ID regionalCode, NULL shortName, '' versSpec, NULL syncGUID, trs.NSI_ID netrica_Code, null fundingService_id, 0 shouldFillOncologyForm90, 0 queueShareMode, 0 kind, '' EGISZ_code from temp_rbSpeciality trs 
left join rbSpeciality rs on rs.name = trs.speciality 
where rs.id is NULL and trs.version = '1.6'



select * from rbSocStatusType rsst ;



select * from rbSocStatusClass rssc ;



select * from rbSocStatusClassTypeAssoc rsscta where rss;



-- select trp.version, rp.*, trp.* from 
update
rbPost rp 
 join temp_rbPost trp on trim(rp.name) = trim(trp.work_position) and trp.version = '4.2' and rp.netrica_Code is null and trp.date_end is null
set rp.netrica_Code = trp.NSI_ID


INSERT into rbPost(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, flatCode, name, regionalCode, federalCode, `key`, high, syncGUID, netrica_Code, EGISZ_code, code_30)
select 
NOW() createDatetime, NULL reatePerson_id, NOW() modifyDatetime, NULL modifyPerson_id, 
trp.NSI_ID code, '' flatCode, trp.work_position name, trp.NSI_ID regionalCode, trp.NSI_ID federalCode, '' `key`, '' high, null syncGUID, trp.NSI_ID netrica_Code, '' EGISZ_code, null code_30 from temp_rbPost trp 
left join rbPost rp on rp.name = trp.work_position 
where rp.id is null and trp.version = '4.2' 
GROUP by trp.id 



select * from rbPost rp -- where rp.name REGEXP '^начальник';




select * from rbPost rp where rp.netrica_Code is null;

select * from temp_rbPost rp ;

SELECT id, code, name, version, ref_id, NSI_ID, parent_id, REGEXP_REPLACE(work_position, '(.*),.*', '\\1') as test, work_position, med, date_end, form_30, need_cert, educ, zs, show_staff_list, federal_code from temp_rbPost where work_position REGEXP 'ботанического сада';
