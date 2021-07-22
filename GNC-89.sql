
insert into rbSpeciality(code, name, OKSOName, OKSOCode, service_id, sex, age, age_bu, age_bc, age_eu, age_ec, mkbFilter, regionalCode)
select
       '' code,
       'нефролог/гематолог' name,
       'нефролог/гематолог' OKSOName,
       '' OKSOCode,
       null service_id,
       0 sex,
       0 age,
       null age_bu,
       null age_bc,
       null age_eu,
       null age_ec,
       0 mkbFilter,
       0 regionalCode
from rbSpeciality where name = 'нефролог';


select *
from rbSpeciality;


124

select *
from Person where lastName='Пурло';



update Person
set speciality_id = 124
where id = 1313

