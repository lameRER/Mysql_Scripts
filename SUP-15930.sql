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
where ret.code = 'код 3' -- and resrep.id_rbEpicrisisSections = 14
group by res.id, rep.id
order by  retres.idx, resrep.idx;

select * from rbEpicrisisTemplates ret ;


INSERT into rbEpicrisisTemplates (name, code, id_orgStructure, printTemplate, `type`, isVisible, actionType_id, editableTime, canCopyOrgStr)
select 
'Выписной эпикриз(Терапевтический)' ret.name, ret.code, ret.id_orgStructure, ret.printTemplate, ret.`type`, ret.isVisible, ret.actionType_id, ret.editableTime, ret.canCopyOrgStr 
from rbEpicrisisTemplates ret 
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'Код 2'
GROUP by ret.id 

set @returnName = 'Состояние при поступлении';
set @returnDesc = 'Неврологический';

INSERT into rbEpicrisisSections (name, description)
select @returnName, @returnDesc


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue)
select name, 'Неврологический' description, `type`, defaultValue from rbEpicrisisProperty where id = 13
union
select name, 'Неврологический' description, `type`, defaultValue from rbEpicrisisProperty where id = 14
union
select name, 'Неврологический' description, `type`, defaultValue from rbEpicrisisProperty where id = 73

set @countt = 0;
INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select res.id, rep.id, ROW_NUMBER() over(order by rep.id) idx from (select * from rbEpicrisisProperty rep order by rep.id desc limit 3)rep, rbEpicrisisSections res
where res.name = @returnName and res.description = @returnDesc
 order by rep.id
 
 select * from rbEpicrisisTemplates_rbEpicrisisSections retres ;
 
 UPDATE rbEpicrisisTemplates_rbEpicrisisSections 
 set id_rbEpicrisisSections = (select res.id from rbEpicrisisSections res where res.name = @returnName and res.description = @returnDesc )
 where id_rbEpicrisisTemplates = 5 and id_rbEpicrisisSections = 5

