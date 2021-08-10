select * from Action order by id desc

select *
from JsonData;

select ActionPropertyType.customSelect, ActionPropertyType.*
from ActionPropertyType where actionType_id in
(select id
from ActionType where flatCode = 'oper_protocol') and deleted = 0 order by idx, name;

%7B%22id%22%3A%2211033%22%2C%22epicriz%22%3A%7B%22fld_0%22%3A%22+%22%2C%22fld_1%22%3A%22I20.8+%5Cu0414%5Cu0440%5Cu0443%5Cu0433%5Cu0438%5Cu0435+%5Cu0444%5Cu043e%5Cu0440%5Cu043c%5Cu044b+%5Cu0441%5Cu0442%5Cu0435%5Cu043d%5Cu043e%5Cu043a%5Cu0430%5Cu0440%5Cu0434%5Cu0438%5Cu0438%22%2C%22fld_2%22%3A%22I01.1+%5Cu041e%5Cu0441%5Cu0442%5Cu0440%5Cu044b%5Cu0439+%5Cu0440%5Cu0435%5Cu0432%5Cu043c%5Cu0430%5Cu0442%5Cu0438%5Cu0447%5Cu0435%5Cu0441%5Cu043a%5Cu0438%5Cu0439+%5Cu044d%5Cu043d%5Cu0434%5Cu043e%5Cu043a%5Cu0430%5Cu0440%5Cu0434%5Cu0438%5Cu0442%22%2C%22fld_3%22%3A%22%22%2C%22fld_4%22%3A%22wefwefew%22%2C%22fld_5%22%3A%22%22%2C%22fld_6%22%3A%22%22%2C%22fld_7%22%3A%22%22%2C%22fld_8%22%3A%22%22%2C%22fld_9%22%3A%22%22%2C%22fld_10%22%3A%22%5Cu043f%5Cu043b%5Cu0430%5Cu043d%5Cu0438%5Cu0440%5Cu0443%5Cu0435%5Cu0442%5Cu0441%5Cu044f%22%7D%7D


select name
from OrgStructure where  id = 67;


# SQL="
SELECT p.id FROM Person p
WHERE p.id =
      (SELECT apr.value FROM ActionProperty_Person apr WHERE apr.id IN
(SELECT ap.id FROM ActionProperty ap WHERE ap.action_id IN
(SELECT a.id FROM Action a WHERE a.deleted = 0 AND a.id = (SELECT parent_id FROM Action a WHERE a.id = context.actionId )
AND a.actionType_id IN (SELECT at.id FROM ActionType at WHERE at.deleted = 0 AND at.serviceType = 4)) AND ap.type_id IN
(SELECT apt.id FROM ActionPropertyType apt WHERE apt.deleted = 0 AND apt.name = 'Ассистент2' )))
"




# SQL="
SELECT ifnull(p.id,'') FROM Person p WHERE p.id = (SELECT apr.value FROM ActionProperty_Person apr WHERE apr.id IN (SELECT ap.id FROM ActionProperty ap WHERE ap.action_id IN (SELECT a.id FROM Action a WHERE a.deleted = 0 AND a.id = (SELECT parent_id FROM Action a WHERE a.id = 104503 ) AND a.actionType_id IN (SELECT at.id FROM ActionType at WHERE at.deleted = 0 AND at.serviceType = 4)) AND ap.type_id IN (SELECT apt.id FROM ActionPropertyType apt WHERE apt.deleted = 0 AND apt.name = 'Ассистент2' )));
# "


SQL="SELECT CONCAT_WS(' ',p.lastName, p.firstName, p.patrName) FROM Person p WHERE p.id = (SELECT apr.value FROM ActionProperty_Person apr WHERE apr.id IN (SELECT ap.id FROM ActionProperty ap WHERE ap.action_id IN (SELECT a.id FROM Action a WHERE a.deleted = 0 AND a.id = (SELECT parent_id FROM Action a WHERE a.id = context.actionId ) AND a.actionType_id IN (SELECT at.id FROM ActionType at WHERE at.deleted = 0 AND at.serviceType = 4)) AND ap.type_id IN (SELECT apt.id FROM ActionPropertyType apt WHERE apt.deleted = 0 AND apt.name = 'Ассистент' )))"


SQL=""" SELECT id FROM OrgStructure
 WHERE id =
(SELECT apr.value FROM ActionProperty_OrgStructure apr WHERE apr.id IN (SELECT ap.id FROM ActionProperty ap WHERE ap.action_id IN
(SELECT a.id FROM Action a WHERE a.deleted = 0 AND a.id = (SELECT parent_id FROM Action a WHERE a.id = context.actionId ) AND a.actionType_id IN
(SELECT at.id FROM ActionType at WHERE at.deleted = 0 AND at.serviceType = 4)) AND ap.type_id IN (SELECT apt.id FROM ActionPropertyType apt WHERE apt.deleted = 0 AND apt.name = 'Операционная' )))"""

REFERENCE="oper_plan.operation"


select * from

select *
from ActionPropertyType where name = 'Операционная';


select *
from ActionPropertyType where actionType_id = 13723;

select *
from ActionPropertyType where id = 132381;

select *
from ActionType where id = 13723;


select at.name, a.*
from Action a, ActionType at
where (a.id in (104136,104135) or a.actionType_id = 25596 and a.deleted = 0) and a.event_id = 27944 and at.id = a.actionType_id;


select ActionPropertyType.formulaAlias, ActionPropertyType.*
from ActionPropertyType where actionType_id =
(select id
from ActionType where id in(23662));


select *
from ActionType where id in(23662)


select *
from ActionType where group_id = 21403 and class=  2;

select *
from ActionProperty  where action_id = 104003 and type_id = 185363;


select *
from ActionProperty_Reference where id = 442994;


select * from ActionPropertyType where actionType_id = 13723

select *
from ActionType where id = 25596;


select *
from ActionType where name regexp 'протокол операции';

select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where id =13723) and deleted = 0 order by idx ;


OrgStructure;name;parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные'),type=1


select name
from OrgStructure where parent_id = (SELECT os1.id FROM OrgStructure os1 WHERE os1.code = 'Операционные') and type;


select *
from ActionPropertyType where formulaAlias = 'operation' and actionType_id =
(select id
from ActionType where formulaAlias = 'oper_plan');


select *
from ActionType where ;