select * from Action order by id desc

select *
from JsonData;

select ActionPropertyType.customSelect, ActionPropertyType.*
from ActionPropertyType where actionType_id in
(select id
from ActionType where flatCode = 'oper_protocol') and name regexp 'код' and deleted = 0 order by idx, name;

# SQL="""
select d2.MKB from Event e
join Diagnostic d on d.event_id = e.id and d.deleted = 0
join Diagnosis d2 on d2.id = d.diagnosis_id and d.deleted = 0
join rbDiagnosisType rdt on rdt.id = d.diagnosisType_id and rdt.name REGEXP 'клинический|заключительный'
where e.client_id =
order by d.createDatetime DESC limit 1;
# """

select *
from ActionPropertyType where actionType_id = 25596;

select *
from Action where id = 104648;
select *
from ActionProperty where action_id = 104648 and type_id in (SELECT apt.id FROM ActionPropertyType apt WHERE apt.deleted = 0 AND apt.name = 'Ассистент2');


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



select *
from ActionPropertyType where name = 'Ассистент 2';