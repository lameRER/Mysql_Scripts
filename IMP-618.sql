insert into ptd7.Person(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, federalCode, regionalCode, lastName, firstName, patrName, post_id, speciality_id, org_id, orgStructure_id, office, office2, tariffCategory_id, finance_id, retireDate, ambPlan, ambPlan2, ambNorm, homPlan, homPlan2, homNorm, expPlan, expNorm, login, password, userProfile_id, retired, birthDate, birthPlace, sex, SNILS, INN, availableForExternal, lastAccessibleTimelineDate, timelineAccessibleDays, canSeeDays, academicDegree, typeTimeLinePerson, addComment, commentText, maritalStatus, contactNumber, regType, regBegDate, regEndDate, isReservist, employmentType, occupationType, citizenship_id, isDefaultInHB, isInvestigator, syncGUID, qaLevel, signature_cert, signature_key, ecp_password, grkmGUID, token, disableSignDoc, mse_speciality_id, llo_login, llo_password, llo_code, isVk, doctorRoomAccessDenied, consultDepartment_id)
select *
from 
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       NULL modifyPerson_id,
       0 deleted,
       code,
       federalCode,
       regionalCode,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', 1) lastName,
       substring_index(substring_index(tp.`Ф.И.О. сотрудника`, ' ', -2), ' ', 1) firstName,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', -1) patrName,
       (select id from ptd7.rbPost where name = tp.Должность limit 1) post_id,
       (select id from s11.rbSpeciality where name = tp.Специальность limit 1) speciality_id,
       org_id,
       (select id from ptd7.OrgStructure where name = tp.Отделение limit 1) orgStructure_id,
       office,
       office2,
       tariffCategory_id,
       finance_id,
       retireDate,
       ambPlan,
       ambPlan2,
       ambNorm,
       homPlan,
       homPlan2,
       homNorm,
       expPlan,
       expNorm,
       '' login,
       '' password,
       userProfile_id,
       retired,
       birthDate,
       birthPlace,
       sex,
       case when length(tp.Снилс) = 9 then concat('00', tp.Снилс)
           when length(tp.Снилс) = 10 then concat('0', tp.Снилс)
           when tp.Снилс is null then ''
           else tp.Снилс
           end SNILS,
       INN,
       availableForExternal,
       lastAccessibleTimelineDate,
       timelineAccessibleDays,
       canSeeDays,
       academicDegree,
       typeTimeLinePerson,
       addComment,
       commentText,
       maritalStatus,
       contactNumber,
       regType,
       regBegDate,
       regEndDate,
       isReservist,
       employmentType,
       occupationType,
       citizenship_id,
       isDefaultInHB,
       isInvestigator,
       syncGUID,
       qaLevel,
       signature_cert,
       signature_key,
       ecp_password,
       grkmGUID,
       token,
       disableSignDoc,
       mse_speciality_id,
       llo_login,
       llo_password,
       llo_code,
       isVk,
       doctorRoomAccessDenied,
       consultDepartment_id
from ptd7.Person p, ptd7.temp_person1 tp where p.id = (select id from ptd7.Person order by id desc limit 1)) as tmp
where not exists(select * from ptd7.Person where tmp.lastName = lastName and tmp.firstName = firstName and tmp.patrName = patrName);



select *
from
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       NULL modifyPerson_id,
       0 deleted,
       code,
       federalCode,
       regionalCode,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', 1) lastName,
       substring_index(substring_index(tp.`Ф.И.О. сотрудника`, ' ', -2), ' ', 1) firstName,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', -1) patrName,
       (select id from ptd7.rbPost where name = tp.Должность limit 1) post_id,
       (select id from s11.rbSpeciality where name = tp.Специальность limit 1) speciality_id,
       org_id,
       (select id from ptd7.OrgStructure where name = tp.Отделение limit 1) orgStructure_id,
       office,
       office2,
       tariffCategory_id,
       finance_id,
       retireDate,
       ambPlan,
       ambPlan2,
       ambNorm,
       homPlan,
       homPlan2,
       homNorm,
       expPlan,
       expNorm,
       '' login,
       '' password,
       userProfile_id,
       retired,
       birthDate,
       birthPlace,
       sex,
       case when length(tp.Снилс) = 9 then concat('00', tp.Снилс)
           when length(tp.Снилс) = 10 then concat('0', tp.Снилс)
           when tp.Снилс is null then ''
           else tp.Снилс
           end SNILS,
       INN,
       availableForExternal,
       lastAccessibleTimelineDate,
       timelineAccessibleDays,
       canSeeDays,
       academicDegree,
       typeTimeLinePerson,
       addComment,
       commentText,
       maritalStatus,
       contactNumber,
       regType,
       regBegDate,
       regEndDate,
       isReservist,
       employmentType,
       occupationType,
       citizenship_id,
       isDefaultInHB,
       isInvestigator,
       syncGUID,
       qaLevel,
       signature_cert,
       signature_key,
       ecp_password,
       grkmGUID,
       token,
       disableSignDoc,
       mse_speciality_id,
       llo_login,
       llo_password,
       llo_code,
       isVk,
       doctorRoomAccessDenied,
       consultDepartment_id
from ptd7.Person p, ptd7.temp_person1 tp where p.id = (select id from ptd7.Person order by id desc limit 1)) as tmp
where not  exists(select * from ptd7.Person where tmp.lastName = lastName and tmp.firstName = firstName and tmp.patrName = patrName and tmp.SNILS = SNILS);
k

select SUBSTRING_INDEX(`Ф.И.О. сотрудника`, ' ', 1)
from ptd7.temp_person;


select *
from ptd7.temp_person;


create temporary table translit(
    rus varchar(1),
    eng varchar(3)
) default charset utf8;

insert into translit(rus, eng) values('А','A'),('Б','B'),('В','V'),('Щ','Sch'),('Я','Ya');


select * from ptd7.Person where lastName = 'Абдулова'