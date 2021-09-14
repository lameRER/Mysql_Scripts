select *
from Person where deleted = 0;


select name
from OrgStructure where deleted = 0;
select name
from rbPost;

select name
from rbSpeciality group by name;


select *
from temp_person;


insert into Person(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, federalCode, regionalCode, lastName, firstName, patrName, post_id,
                   speciality_id, org_id, orgStructure_id, office, office2, ambPlan, ambPlan2, ambNorm, homNorm, homPlan, homPlan2, expPlan, expNorm, login, password,
                   retired, birthDate, birthPlace, sex, SNILS, INN, academicDegree, typeTimeLinePerson)
select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       0 deleted,
       '' code,
       '' federalCode,
       '' regionalCode,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', 1) lastName,
       substring_index(substring_index(tp.`Ф.И.О. сотрудника`, ' ', 2), ' ', -1) firstName,
       substring_index(tp.`Ф.И.О. сотрудника`, ' ', -1) patrName,
       rp.id post_id,
       rs.id speciality_id,
       org_id,
       o.id orgStructure_id,
       '' office,
       '' office2,
       0 ambPlan,
       0 ambPlan2,
       0 ambNorm,
       0 homNorm,
       0 homPlan,
       0 homPlan2,
       0 expPlan,
       0 expNorm,
       '' login,
       '' password,
       0 retired,
       curdate() birthDate,
       '' birthPlace,
       0 sex,
       ifnull(tp.Снилс, ''),
       '' INN,
       0 academicDegree,
       0 typeTimeLinePerson
from temp_person tp
left join Person p on p.id = 1
left join OrgStructure o on o.name = tp.Отделение
left join rbPost rp on rp.name = tp.Должность
left join rbSpeciality rs on rs.name = tp.Специальность
# where rs.id is null and tp.Специальность is not null
group by tp.`Ф.И.О. сотрудника`, tp.Отделение, tp.Должность, tp.Специальность
;