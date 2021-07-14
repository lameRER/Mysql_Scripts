select distinct ret.*
from rbEpicrisisTemplates ret
join rbEpicrisisTemplates_rbEpicrisisSections retres on ret.id = retres.id_rbEpicrisisTemplates
join rbEpicrisisSections res on retres.id_rbEpicrisisSections = res.id
join rbEpicrisisSections_rbEpicrisisProperty resrep on res.id = resrep.id_rbEpicrisisSections
join rbEpicrisisProperty rep on resrep.id_rbEpicrisisProperty = rep.id
where ret.code = 'Код 3';


INSERT INTO s11.rbEpicrisisTemplates (name, code, id_orgStructure, printTemplate, type, isVisible, actionType_id, editableTime, canCopyOrgStr)
VALUES ('Выписной эпикриз(Неврологический)', 'Код 3', ' 12, 13, 14, 15, 16, 17, 18, 19,  20, 28,', '<div style="font-size:14pt; text-align:center;">
<b>САНКТ-ПЕТЕРБУРГСКОЕ ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ <br>
УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ «ГОРОДСКАЯ БОЛЬНИЦА №15»</b></div>', null, 1, null, 0, ' 12, 13, 14, 15, 16, 17, 18, 19,  20, 28,');

select *
from rbEpicrisisTemplates;