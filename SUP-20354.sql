select *
from rbEpicrisisProperty where defaultValue regexp 'call';
select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisProperty = 83;

select *
from Event where externalId = '36563';

select @test;
set @test = NULL;

select id into @test
from ActionType at1 where at1.id = 22228 or at1.id in (select id from ActionType where group_id = @test);

select id into @test
from ActionType at1 where at1.id = 22228 or at1.id in (select id from ActionType where group_id = @test);

select @test;

select id from ActionType where group_id = 22228
select *
from ActionPropertyType where actionType_id = 22208;

select COALESCE((select name from ActionType where id = 45675675789756797),(select name from ActionType where id = 20000),3,4,5,6,8,7,9,12) as Value;


select coalesce(at2.name, at1.name), coalesce(at2.group_id, at1.group_id)
from ActionType at1
join ActionType at2 on at2.group_id = at1.id
left join ActionPropertyType apt on apt.actionType_id = at1.id
where at1.group_id = 22228 and apt.id is null;

drop temporary table temp_name;
create temporary table temp_name
select at1.name
from ActionType at1
left join ActionPropertyType apt on apt.actionType_id = at1.id
where at1.group_id = 22228 and apt.id is null and at1.deleted = 0
union
select at1.name
from ActionType at1
         left join ActionPropertyType apt on apt.actionType_id = at1.id
where at1.group_id = 26227 and apt.id is null and at1.deleted = 0;


select *
from temp_name;

insert into rbEpicrisisProperty(name, description, type, defaultValue, valueDomain, printAsTable, isCopy)
select
       temp_name.name name,
       description,
       type,
       regexp_replace('call procEpicrisisDiagnostic(%s, "\'test\'", "\'Epicrisis\'")', 'test', temp_name.name) as defaultValue,
       valueDomain,
       printAsTable,
       isCopy
from rbEpicrisisProperty, temp_name where rbEpicrisisProperty.id = 83;

insert into rbEpicrisisSections_rbEpicrisisProperty(id_rbEpicrisisSections, id_rbEpicrisisProperty, idx, htmlTemplate, orgStruct, isRequired, isEditable, isOld)
select
       id_rbEpicrisisSections,
       rbEpicrisisProperty.id id_rbEpicrisisProperty,
       row_number() over ()-1 idx,
       htmlTemplate,
       orgStruct,
       isRequired,
       isEditable,
       0 isOld
from rbEpicrisisSections_rbEpicrisisProperty, rbEpicrisisProperty, temp_name where rbEpicrisisSections_rbEpicrisisProperty.id = 93 and temp_name.name = rbEpicrisisProperty.name;


select *
from rbEpicrisisSections_rbEpicrisisProperty where id_rbEpicrisisSections = 13;

select *
from rbEpicrisisProperty order by id desc ;


call procEpicrisisDiagnostic(33895358, "'Эндоскопия'", "'Epicrisis'")


select *
from ActionType where group_id = 22228;