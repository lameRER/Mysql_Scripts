insert into person (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, federalCode, regionalCode, lastName, firstName, patrName, post_id, speciality_id, org_id, orgStructure_id, office, office2, tariffCategory_id, finance_id, retireDate, ambPlan, ambPlan2, ambNorm, homPlan, homPlan2, homNorm, expPlan, expNorm, login, password, userProfile_id, retired, birthDate, birthPlace, sex, SNILS, INN, availableForExternal, accessToDateSchedule, depthDaysSchedule, lastAccessibleTimelineDate, timelineAccessibleDays, canSeeDays, academicDegree, timelinePeriod, preparing, requirements, addComment, commentText, maritalStatus, contactNumber, regType, regBegDate, regEndDate, isReservist, employmentType, occupationType, citizenship_id, isDefaultInHB, typeTimeLinePerson, isInvestigator, syncGUID, qaLevel, signature_cert, signature_key, cashier_code, doctorRoomAccessDenied, availableForScoreboard, ecp_password, qualification, mse_speciality_id, disableSignDoc)
select * from
(select now() createDatetime, null createPerson_id, now() modifyDatetime, null modifyPerson_id, 
p.deleted, p.code, p.federalCode, p.regionalCode, 'Виста' lastName, p.firstName, p.patrName, p.post_id, p.speciality_id, p.org_id, p.orgStructure_id, p.office, p.office2, p.tariffCategory_id, p.finance_id, p.retireDate, p.ambPlan, p.ambPlan2, p.ambNorm, p.homPlan, p.homPlan2, p.homNorm, p.expPlan, p.expNorm, 'виста' login, md5('1987') password, p.userProfile_id, p.retired, p.birthDate, p.birthPlace, p.sex, p.SNILS, p.INN, p.availableForExternal, p.accessToDateSchedule, p.depthDaysSchedule, p.lastAccessibleTimelineDate, p.timelineAccessibleDays, p.canSeeDays, p.academicDegree, p.timelinePeriod, p.preparing, p.requirements, p.addComment, p.commentText, p.maritalStatus, p.contactNumber, p.regType, p.regBegDate, p.regEndDate, p.isReservist, p.employmentType, p.occupationType, p.citizenship_id, p.isDefaultInHB, p.typeTimeLinePerson, p.isInvestigator, p.syncGUID, p.qaLevel, p.signature_cert, p.signature_key, p.cashier_code, p.doctorRoomAccessDenied, p.availableForScoreboard, p.ecp_password, p.qualification, p.mse_speciality_id, p.disableSignDoc from person p where p.userProfile_id = 1 limit 1) as tmp
where not exists (select * from person p2 where p2.login = tmp.login)


insert into person_userprofile (person_id, userProfile_id, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id)
select * from 
(select (select p2.id from person p2 where p2.id = last_insert_id()) person_id, 1 userProfile_id, now() createDatetime, null createPerson_id, now() modifyDatetime, null modifyPerson_id from person_userprofile pu limit 1) as tmp
where not exists (select * from person_userprofile pu2 where pu2.person_id = tmp.person_id)








select p.org_id from person p ;