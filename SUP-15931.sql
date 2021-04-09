select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret,
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res,
-- ret.*
-- retres.*
resrep.*
-- res.*
-- rep.*
from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'код 4' -- and resrep.id_rbEpicrisisSections = 14
group by res.id, rep.id
order by  retres.idx, resrep.idx;

select * from rbEpicrisisTemplates ret ;


INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx, isEditable, htmlTemplate, isRequired)
select 
6 id_rbEpicrisisTemplates, retres.id_rbEpicrisisSections, retres.idx, retres.isEditable, retres.htmlTemplate, retres.isRequired 
from rbEpicrisisTemplates ret 
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'Код 2'
GROUP by retres.id 

set @returnName = 'Состояние при поступлении';
set @returnDesc = 'Хирургический';

INSERT into rbEpicrisisSections (name, description)
select @returnName, @returnDesc


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue)
select name, 'Хирургический' description, `type`, defaultValue from rbEpicrisisProperty where id = 13
union
select name, 'Хирургический' description, `type`, defaultValue from rbEpicrisisProperty where id = 14
union
select name, 'Хирургический' description, `type`, defaultValue from rbEpicrisisProperty where id = 73

set @countt = 0;
INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select res.id, rep.id, ROW_NUMBER() over(order by rep.id) idx from (select * from rbEpicrisisProperty rep order by rep.id desc limit 3)rep, rbEpicrisisSections res
where res.name = @returnName and res.description = @returnDesc
 order by rep.id
 
 select * from rbEpicrisisTemplates_rbEpicrisisSections retres ;
 
-- select REGEXP_REPLACE(name, '(.*):$', '\\1') from 
update rbEpicrisisProperty 
set name = REGEXP_REPLACE(name, '(.*):$', '\\1')
where name REGEXP ':$' order by id desc;


 UPDATE rbEpicrisisTemplates_rbEpicrisisSections 
 set id_rbEpicrisisSections = (select res.id from rbEpicrisisSections res where res.name = @returnName and res.description = @returnDesc )
 where id_rbEpicrisisTemplates = 6 and id_rbEpicrisisSections = 5

