select *
from ptd23.orgstructure where deleted = 0;


select *
from ptd23.organisation where deleted = 0 and id = 21154
;

update ptd23.orgstructure
set deleted = 1
where id in
(select id
from ptd23.orgstructure where deleted = 0);


select *
from ptd23.orgstructure order by id desc ;


select *
from backup_ptd23.orgstructure where deleted= 0;

select *
from backup_ptd23.orgstructure where id = 198;


SET foreign_key_checks = 0;
SET foreign_key_checks = 1;


select *
from ptd23.orgstructure where deleted = 0;

update ptd23.orgstructure s
join backup_ptd23.orgstructure s1 on s.id = s1.id+21
set s.parent_id = s1.parent_id+21
where s.deleted = 0;


SELECT parent_id INTO vCurrParentId FROM OrgStructure os WHERE os.id = NAME_CONST('vCurrParentId',219);

select *
from ptd23.orgstructure;
select getOrgStructurePath(234);

select * from OrgStructure_Ancestors

select *
from ptd23.orgstructure where deleted = 0;

select *
from backup_ptd23.orgstructure where deleted = 0;





insert into ptd23.orgstructure(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, organisation_id, code, name, parent_id, type, net_id, chief_id, headNurse_id, isArea, hasHospitalBeds, hasStocks, hasDayStationary, infisCode, infisInternalCode, infisDepTypeCode, infisTariffCode, availableForExternal, address, inheritEventTypes, inheritActionTypes, inheritGaps, bookkeeperCode, dayLimit, storageCode, miacHead_id, salaryPercentage, attachCode, isVisibleInDR, tfomsCode, syncGUID, quota, miacCode, netrica_Code, idLPU_egisz, netrica_Code_UO, idxLocationCard, isVisibleInLocationCard, netrica_Code_IEMK)
select *
from
(select id+21 as id,
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       deleted,
       404207 organisation_id,
       code,
       name,
       parent_id+21 as parent_id,
       type,
       net_id,
       chief_id,
       headNurse_id,
       isArea,
       hasHospitalBeds,
       hasStocks,
       hasDayStationary,
       infisCode,
       infisInternalCode,
       infisDepTypeCode,
       infisTariffCode,
       availableForExternal,
       address,
       inheritEventTypes,
       inheritActionTypes,
       inheritGaps,
       bookkeeperCode,
       dayLimit,
       storageCode,
       miacHead_id,
       salaryPercentage,
       attachCode,
       isVisibleInDR,
       tfomsCode,
       syncGUID,
       quota,
       miacCode,
       netrica_Code,
       idLPU_egisz,
       netrica_Code_UO,
       idxLocationCard,
       isVisibleInLocationCard,
       netrica_Code_IEMK
from backup_ptd23.orgstructure where deleted = 0) as tmp
where not exists(select * from ptd23.orgstructure where tmp.id = id and tmp.deleted = tmp.deleted);
404207

select *
from ptd23.organisation order by id desc ;

insert into ptd23.orgstructure(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, organisation_id, code, name, parent_id, type, net_id, chief_id, headNurse_id, isArea, hasHospitalBeds, hasStocks, hasDayStationary, infisCode, infisInternalCode, infisDepTypeCode, infisTariffCode, availableForExternal, address, inheritEventTypes, inheritActionTypes, inheritGaps, bookkeeperCode, dayLimit, storageCode, miacHead_id, salaryPercentage, attachCode, isVisibleInDR, tfomsCode, syncGUID, quota, miacCode, netrica_Code, idLPU_egisz, netrica_Code_UO, idxLocationCard, isVisibleInLocationCard, netrica_Code_IEMK)
select id+21,
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       deleted,
       organisation_id,
       code,
       name,
       parent_id,
       type,
       net_id,
       chief_id,
       headNurse_id,
       isArea,
       hasHospitalBeds,
       hasStocks,
       hasDayStationary,
       infisCode,
       infisInternalCode,
       infisDepTypeCode,
       infisTariffCode,
       availableForExternal,
       address,
       inheritEventTypes,
       inheritActionTypes,
       inheritGaps,
       bookkeeperCode,
       dayLimit,
       storageCode,
       miacHead_id,
       salaryPercentage,
       attachCode,
       isVisibleInDR,
       tfomsCode,
       syncGUID,
       quota,
       miacCode,
       netrica_Code,
       idLPU_egisz,
       netrica_Code_UO,
       idxLocationCard,
       isVisibleInLocationCard,
       netrica_Code_IEMK
from ptd23.orgstructure where id = 222-21;

insert into ptd23.organisation(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, fullName, shortName, title, net_id, infisCode, obsoleteInfisCode, OKVED, INN, KPP, OGRN, OKATO, OKPF_code, OKPF_id,
                               OKFS_code, OKFS_id, OKPO, FSS, region, address, chief, phone, accountant, isInsurer, isCompulsoryInsurer, isVoluntaryInsurer, compulsoryServiceStop, voluntaryServiceStop, area, isHospital,
                               notes, head_id, miacCode, isMedical, isArmyOrg, canOmitPolicyNumber, netrica_Code, DATN, DATO, reestrNumber, isMSEBureau, mse_code, llo_code, llo_name, FOMSCode, EGISZ_code,
                               medOrgCode)
select
       createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       deleted,
       fullName,
       shortName,
       title,
       net_id,
       infisCode,
       obsoleteInfisCode,
       OKVED,
       INN,
       KPP,
       OGRN,
       OKATO,
       OKPF_code,
       OKPF_id,
       OKFS_code,
       OKFS_id,
       OKPO,
       FSS,
       region,
       address,
       chief,
       phone,
       accountant,
       isInsurer,
       isCompulsoryInsurer,
       isVoluntaryInsurer,
       compulsoryServiceStop,
       voluntaryServiceStop,
       area,
       isHospital,
       notes,
       head_id,
       miacCode,
       isMedical,
       isArmyOrg,
       canOmitPolicyNumber,
       netrica_Code,
       DATN,
       DATO,
       reestrNumber,
       isMSEBureau,
       mse_code,
       llo_code,
       llo_name,
       FOMSCode,
       EGISZ_code,
       medOrgCode
from backup_ptd23.organisation
where id = (select organisation_id from backup_ptd23.orgstructure order by id desc limit 1)


update
select id
from ptd23.person p where p.deleted = 0;


select *
from ptd23.orgstructure where name = 'Стационар';


select *
from ptd23.orgstructure where id = 222;

select * from ptd23.orgstructure where name = 'Лаборатория Новомышастовская'


select *
from backup_ptd23.orgstructure_hospitalbed;


select * from ptd23.orgstructure where id = 229;

select *
from backup_ptd23.orgstructure where id = 208;

insert into ptd23.orgstructure_hospitalbed(id, master_id, idx, code, name, isPermanent, type_id, profile_id, relief, schedule_id, begDate, endDate, sex, age, involution, begDateInvolute, endDateInvolute, ward, paidFlag, virtualBedFlag)
select *
from
(select oh.id,
       master_id+21 as master_id,
       idx,
       oh.code,
       oh.name,
       isPermanent,
       type_id,
       profile_id,
       relief,
       schedule_id,
       begDate,
       endDate,
       sex,
       age,
       involution,
       begDateInvolute,
       endDateInvolute,
       ward,
       paidFlag,
       virtualBedFlag
from backup_ptd23.orgstructure_hospitalbed oh, backup_ptd23.orgstructure o where o.id = oh.master_id and o.deleted = 0) as tmp
where not exists(select * from ptd23.orgstructure_hospitalbed where tmp.master_id = master_id and tmp.name = name);

select * from ptd23.orgstructure_hospitalbed;

select *
from ptd23.person where deleted = 0;

select * from backup_ptd23.orgstructure_hospitalbed;


select *
from ptd23.person;

select *
from backup_ptd23.person where deleted = 0;

select *
from ptd23.person where org_id = 404207;

insert into ptd23.person(id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, federalCode, regionalCode, lastName, firstName, patrName, post_id, speciality_id, org_id, orgStructure_id, office,
                         office2, tariffCategory_id, finance_id, retireDate, ambPlan, ambPlan2, ambNorm, homPlan, homPlan2, homNorm, expPlan, expNorm, login, password, userProfile_id, retired, birthDate, birthPlace, sex,
                         SNILS, INN, availableForExternal, lastAccessibleTimelineDate, timelineAccessibleDays, canSeeDays, academicDegree, typeTimeLinePerson, addComment, commentText, maritalStatus, contactNumber, regType,
                         regBegDate, regEndDate, isReservist, employmentType, occupationType, citizenship_id, isDefaultInHB, isInvestigator, syncGUID, qaLevel, signature_cert, signature_key, ecp_password, grkmGUID, token,
                         disableSignDoc, mse_speciality_id, llo_login, llo_password, llo_code, isVk, doctorRoomAccessDenied, consultDepartment_id)
select *
from
(
    select p.id+492 as id,
       p.createDatetime,
       p.createPerson_id,
       p.modifyDatetime,
       p.modifyPerson_id,
       p.deleted,
       p.code,
       federalCode,
       regionalCode,
       lastName,
       firstName,
       patrName,
       post_id,
       speciality_id,
       404207 org_id,
       orgStructure_id + 21,
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
       login,
       password,
       userProfile_id,
       retired,
       birthDate,
       birthPlace,
       sex,
       SNILS,
       INN,
       p.availableForExternal,
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
       p.syncGUID,
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
from backup_ptd23.person p,
     backup_ptd23.orgstructure o
where p.deleted = 0
  and o.deleted = 0
  and p.orgStructure_id = o.id
    ) as tmp
where not exists(select * from ptd23.person where tmp.id = id and tmp.deleted = deleted);

select *
from backup_ptd23.person where deleted = 0 order by id desc ;


insert into ptd23.person_userprofile(person_id, userProfile_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id)
select *
from
(select distinct p.id as person_id, p.userProfile_id, now() createDatetime, null createPerson_id, now() modifyDatetime, null modifyPerson_id
from ptd23.person p, ptd23.person_userprofile pu where p.userProfile_id is not null and p.deleted = 0) as tmp
where not exists(select * from ptd23.person_userprofile where tmp.person_id = person_id and tmp.userProfile_id = userProfile_id);


delete
from ptd23.person_userprofile;

select *
from ptd23.person_userprofile;

update ptd23.event
set deleted = 1
where deleted = 0;

select *
from ptd23.event where deleted = 0;


select p.*
from ptd23.person p
join backup_ptd23.person bp on bp.id = p.id
where bp.deleted = 0 and bp.deleted != p.deleted;


select *
from ptd23.person order by id desc ;

select *
from ptd23.person_userprofile where person_id = 2592;

select *
from ptd23.person_userprofile;