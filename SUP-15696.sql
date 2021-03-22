select count(rep.id) num,
-- GROUP_CONCAT(CONCAT_WS(' ', ret.id_orgStructure , ret.code, ret.name,'retres.idx:',retres.idx,'resper.idx:',resrep.idx) separator '\n') ret, 
-- GROUP_CONCAT(CONCAT_WS(' ', retres.id, resrep.id, res.id, res.name, res.description)separator '\n') res, 
ret.* from rbEpicrisisTemplates ret
left join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
left join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
left join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
left join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'код 2'
group by res.id, rep.id
order by  retres.idx, resrep.idx;


set @ret = 1;
INSERT into rbEpicrisisTemplates_rbEpicrisisSections (id_rbEpicrisisTemplates, id_rbEpicrisisSections, idx)
select ret.id id_rbEpicrisisTemplates, res.id id_rbEpicrisisSections, @ret:=@ret+1 idx from rbEpicrisisTemplates ret, rbEpicrisisSections res
where ret.code = 'код 2'


select * from rbEpicrisisSections res ;


select rep.* from rbEpicrisisProperty rep, rbEpicrisisSections_rbEpicrisisProperty resrep
where id_rbEpicrisisSections = 1 and resrep.id_rbEpicrisisProperty = rep.id 
ORDER by resrep.idx;


INSERT into rbEpicrisisProperty (name, description, `type`, defaultValue, valueDomain, printAsTable, isCopy)
select 'Адрес проживания' name, rep.description, rep.`type`, rep.defaultValue, rep.valueDomain, rep.printAsTable, rep.isCopy from rbEpicrisisProperty rep where rep.id = 5

INSERT into rbEpicrisisSections_rbEpicrisisProperty (id_rbEpicrisisSections, id_rbEpicrisisProperty, idx)
select 1 id_rbEpicrisisSections, rep.id id_rbEpicrisisProperty, (select max(resrep.idx) from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = (select res.id from rbEpicrisisSections res where res.id = 1))+1 idx from rbEpicrisisProperty rep where rep.name = 'Адрес проживания';


select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 1 order by resrep.idx;


select * from rbEpicrisisTemplates_rbEpicrisisSections retres 
where retres.id_rbEpicrisisTemplates = 4



select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 1 ORDER by resrep.idx ;

select * from rbEpicrisisSections_rbEpicrisisProperty resrep where resrep.id_rbEpicrisisSections = 11 ORDER by resrep.idx ;

select * from rbEpicrisisSections res where id = 11;


select * from rbEpicrisisTemplates_rbEpicrisisSections  where id_rbEpicrisisTemplates  = 4 ORDER by idx ;

