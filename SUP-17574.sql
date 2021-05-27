insert into OrgStructure (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, organisation_id, code, name, parent_id, type, net_id, chief_id, headNurse_id, isArea, hasHospitalBeds, hasStocks, hasDayStationary, infisCode, infisInternalCode, infisDepTypeCode, availableForExternal, address, infisTariffCode, inheritEventTypes, inheritActionTypes, inheritGaps, bookkeeperCode, dayLimit, storageCode, salaryPercentage, attachCode, isVisibleInDR, tfomsCode, syncGUID, quota, miacCode, netrica_Code, idLPU_egisz, netrica_Code_UO, netrica_Code_IEMK, attachOperOrgStructure_id)
select
       now() createDatetime,
       NULL createPerson_id,
       now() modifyDatetime,
       NULL modifyPerson_id,
       deleted,
       organisation_id,
       'Рентген-урология 2-этаж' code,
       'Рентген-урология 2-этаж' name,
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
       availableForExternal,
       address,
       infisTariffCode,
       inheritEventTypes,
       inheritActionTypes,
       inheritGaps,
       bookkeeperCode,
       dayLimit,
       storageCode,
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
       netrica_Code_IEMK,
       attachOperOrgStructure_id
from OrgStructure where parent_id = 159 limit 1;



select *
from OrgStructure order by id desc;
# 212

insert into OrgStructure_Job (master_id, idx, jobType_id, begTime, endTime, quantity, lastAccessibleDate, isVisibleInDR, person_id)
select
       212 master_id,
       idx,
       jobType_id,
       '00:00:00' begTime,
       '23:59:00' endTime,
       150 quantity,
       lastAccessibleDate,
       isVisibleInDR,
       person_id
from OrgStructure_Job where master_id in (select id from OrgStructure where parent_id = 159) limit 1


select *
from OrgStructure_Job order by id desc ;