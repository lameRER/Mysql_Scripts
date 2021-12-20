set @group_id = 1;
set @name = 'жалобы';

drop temporary table if exists temp_name;
create temporary table if not exists temp_name(
    select 'Ощущение сердцебиения' as name union
    select 'одышки' as name union
    select 'тяжести в груди' as name union
    select 'нарушение сна' as name union
    select 'сонливости' as name union
    select 'слабости' as name
);

insert into rbThesaurus(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code, name, template)
select *
from
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       @group_id group_id,
       (select concat_ws('-', code, concat('0',(select count(id) from rbThesaurus where group_id = @group_id)+1)) from rbThesaurus where id = @group_id) code,
       @name name,
       @name template
from rbThesaurus where id = @group_id) as tmp
where not exists(select * from rbThesaurus where tmp.group_id = group_id and tmp.name = name and tmp.code = code);


set @num = 0;
insert into rbThesaurus(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code, name, template)
select *
from
(select
       now() createDatetime,
       null createPerson_id,
       now() modifyDatetime,
       null modifyPerson_id,
       (select max(id) from rbThesaurus where name = @name) group_id,
       (select concat_ws('-', (select code from rbThesaurus where id = (select max(id) from rbThesaurus where name = @name)), concat('0', @num:=@num+1 + (select count(id) from rbThesaurus where r.group_id = (select max(id) from rbThesaurus where name = @name))))) code,
       tn.name name,
       tn.name template
from rbThesaurus r, temp_name tn
where id = @group_id) as tmp
where not exists(select * from rbThesaurus where tmp.group_id = group_id and tmp.name = name and tmp.code = code);

select *
from rbThesaurus where group_id =
(select id
from rbThesaurus where id = 7933);


select name, row_number() over () +1
from temp_name;