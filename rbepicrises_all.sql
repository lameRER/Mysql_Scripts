select GROUP_CONCAT(CONCAT('"', ret.name, '",') separator '\n'), GROUP_CONCAT(CONCAT_WS(' ',ret.code, ret.name, 'retres.id:', retres.id, 'retres.idx:',retres.idx,'resper.idx:',resrep.idx, 'repdel:', resrep.isOld) separator '\n'), res.name, res.description, rep.* from rbEpicrisisTemplates ret
join rbEpicrisisTemplates_rbEpicrisisSections retres on retres.id_rbEpicrisisTemplates = ret.id 
join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id 
join rbEpicrisisSections_rbEpicrisisProperty resrep on resrep.id_rbEpicrisisSections = res.id 
join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id 
where ret.name REGEXP 'реяр'
group by rep.id
order by ret.id, retres.idx, resrep.idx;
