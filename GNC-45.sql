select * from ActionType at2 where at2.group_id  = 6987 and at2.title REGEXP '������ ������' and at2.deleted = 0; 

SELECT * FROM gnc.Person limit 5



select * from rbPrintTemplate rpt where rpt.name REGEXP '������ �������������� ���������: ������ ��������� �� ����';



select * from rbPrintTemplate rpt where rpt.jasper_template_uri is not null;

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_SluzhbaInformirovaniya';


select * from `_log_rbSpecialVariablesPreferences` lrsvp where name = 'SpecialVar_SluzhbaInformirovaniya';

select * from rbPrintTemplateMeta rptm ;


select * from ActionType at2 where at2.name REGEXP '��������';

select * from ActionType where group_id  = 6987 and title REGEXP '�������' and deleted = 0; 


select * from ActionType where group_id = 6958 and deleted = 0;

select * from ActionType where class = 1 and group_id is NULL and name REGEXP '���';


select * from ActionType at2 where at2.group_id = 6987 and at2.deleted = 0;

select at3.name, at2.* from ActionType at2 
join ActionType at3 on at3.id = at2.group_id and at3.deleted = 0
where /*at2.group_id = 6958 and*/ at2.class = 1 and at2.name REGEXP '�����������';



SELECT 
CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `���`, 
-- min(Date(e.setDate)),
-- max(Date(e.setDate)),
-- count(DISTINCT case when a.id is not null then a.id
-- when a1.id is not null then a1.id end)
if(at2.name regexp '^���', Count(DISTINCT a.id), NULL) `��� (�����)`,
e.id,
COUNT(DISTINCT a.id),
COUNT(DISTINCT e.client_id) `����� ���������`,
'' `����� � ��`,
count(if(at2.name = '��� ��������� ����� � ��� ��������', a.id, NULL)) `�������� ����`,
count(if(at2.name = '��� ��������� ����� � ������������ ����������� ���������', a.id, NULL)) `�������� ���� � �/� �����.`,
count(if(at2.name = '��� ������� ��������� ����� (��-�����������)', a.id, NULL)) `��-�����������`,
'' `��-����������`,
count(if(at2.name = '��� �����', a.id, NULL)) `������`,
count(if(at2.name = '��� ����� � ������������ �����������������', a.id, NULL)) `������ � �/� �����.`,
'' `���`,
'' `��� � �.�`,
count(if(at2.name regexp '^��� ������ ������ ���$|^��� ������ ������ A05\.01\.002$', a.id, NULL)) `������ ����� `,
count(if(at2.name regexp '^��� ������ ������ ����������������� A05\.01\.002\.001$', a.id, NULL)) `������ ����� � �/� �����.`,
'' `�����������`,
'' `����������� � �.�`,
'' `������� �������`,
'' `������� ������� � �.�`,
'' `����� ���`,
'' `����� ��� � �/� �����.`,
''`����������� (�; ��. �/�)`,
'' `����������� � �/� �����`,
'' `������� ����`,
'' `������� ���� � �/� �����`,
'' `�������� ������`,
'' `�������� ������ � �/� �����`,
'' `�������� ������`,
'' `������������� ������ � ��.`,
'' `������������� �������`,
'' `������������� ������� � �/� �����`,
'' `��������� �����`,
'' `������� �������`,
'' `����������� ������������`,
'' `����� ���� � ��.`,
'' `����� ���� � ��. � �.�`,
'' `��� ����`,
'' `���. ����������`,
'' `���`,
'' `���`,
'' `�������`,
'' `������������`
-- e.execPerson_id, e.* 
FROM Event e 
join Event e2 on e.id = e2.id
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
join Action a on a.event_id = e2.id and a.deleted = 0 -- and a.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "^��� ��������� ����� � ��� ��������$|^��� ��������� ����� � ������������ ����������� ���������$|^��� ������� ��������� ����� \\(��-�����������\\)$")
left join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and 
at2.name REGEXP "^��� ��������� ����� � ��� ��������$|^��� ��������� ����� � ������������ ����������� ���������$|^��� ������� ��������� ����� \\(��-�����������\\)$|^��� �����$|^��� ����� � ������������ �����������������$|^��� ������ ������ ���$|^��� ������ ������ A05\.01\.002$|^��� ������ ������ ����������������� A05\.01\.002\.001$"
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId ;





(select at2.name, at2.title from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "������")


(select at2.* from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "^���")




SELECT 
CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `���`, 
min(Date(e.setDate)),
max(Date(e.setDate)),
-- count(DISTINCT case when a.id is not null then a.id
-- when a1.id is not null then a1.id end)
count(DISTINCT a.id) `��� (�����)`,
COUNT(DISTINCT e.client_id) `����� ���������`,
'' `����� � ��`,
count(DISTINCT a1.id) `�������� ����`,
count(DISTINCT a2.id) `�������� ���� � �/� �����.`,
count(DISTINCT a3.id) `��-�����������`,
'' `��-����������`,
'' `������`,
'' `������ � �/� �����.`,
'' `���`,
'' `��� � �.�`,
'' `������ ����� `,
'' `������ ����� � �/� �����.`,
'' `�����������`,
'' `����������� � �.�`,
'' `������� �������`,
'' `������� ������� � �.�`,
'' `����� ���`,
'' `����� ��� � �/� �����.`,
''`����������� (�; ��. �/�)`,
'' `����������� � �/� �����`,
'' `������� ����`,
'' `������� ���� � �/� �����`,
'' `�������� ������`,
'' `�������� ������ � �/� �����`,
'' `�������� ������`,
'' `������������� ������ � ��.`,
'' `������������� �������`,
'' `������������� ������� � �/� �����`,
'' `��������� �����`,
'' `������� �������`,
'' `����������� ������������`,
'' `����� ���� � ��.`,
'' `����� ���� � ��. � �.�`,
'' `��� ����`,
'' `���. ����������`,
'' `���`,
'' `���`,
'' `�������`,
'' `������������`
-- e.execPerson_id, e.* 
FROM Event e 
join Event e2 on e.client_id = e2.client_id
join Event e3 on e.client_id = e3.client_id
join Event e4 on e.client_id = e4.client_id
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
left join Action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "^���")
left join Action a1 on a1.event_id = e2.id and a1.deleted = 0 and a1.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ��������� ����� � ��� ��������")
left join Action a2 on a2.event_id = e3.id and a2.deleted = 0 and a2.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ��������� ����� � ������������ ����������� ���������")
left join Action a3 on a3.event_id = e4.id and a3.deleted = 0 and a3.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ������� ��������� ����� (��-�����������)")
where 
e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and 
e2.deleted = 0 and e2.setDate BETWEEN :Date1 and :Date2 and e2.execPerson_id = :PersonId and 
e3.deleted = 0 and e3.setDate BETWEEN :Date1 and :Date2 and e3.execPerson_id = :PersonId


select at2.* from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "��� ��������� ����� � ������������ ����������� ���������";
select at2.* from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "��� ������� ��������� ����� \\(��-�����������\\)%";


select 
-- Count(DISTINCT e.client_id),
-- Count(DISTINCT a.id)
e.id ,e2.id, a.id, a1.id,
count(DISTINCT case when a.id is not null then a.id
when a1.id is not null then a1.id end)
from Event e 
join Event e2 on e2.client_id = e.client_id 
left join Action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "�������")
left join Action a1 on a1.event_id = e2.id and a1.deleted = 0 and a1.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "������ ������")
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and e2.deleted = 0 and e2.setDate BETWEEN :Date1 and :Date2 and e2.execPerson_id = :PersonId


select e.id, e.createDatetime, e.createPerson_id, e.modifyDatetime, e.modifyPerson_id, e.deleted, e.externalId, e.eventType_id, e.org_id,  e.client_id, e.contract_id, e.prevEventDate, e.setDate, e.setPerson_id, e.execDate, e.execPerson_id, e.isPrimary, e.`order`, e.result_id, e.nextEventDate, e.payStatus, e.typeAsset_id, e.note, e.curator_id, e.assistant_id, e.pregnancyWeek, e.MES_id, e.mesSpecification_id, e.rbAcheResult_id, e.version, e.privilege, e.urgent, e.orgStructure_id, e.uuid_id, e.lpu_transfer, e.localContract_id, e.uuid, e.warrantyLetter_id, e.CC_OrgStructure_id, e.limitations_lifted from Event e 
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and execPerson_id = :PersonId
GROUP by e.client_id 




select 
-- e.id, e.createDatetime, at2.name, at3.name  \
Count(e.client_id),
COUNT(a.actionType_id),
a.actionType_id, at2.name, e.* 
from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a1.event_id = e.id and a1.deleted = 0
left join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "�������|������ ������"
-- left join ActionType at3 on at3.id = a1.actionType_id and at3.deleted = 0 and at3.group_id  = 6987
where -- at2.id is not null and at3.id is not null and 
-- at2.title REGEXP '�������' and at3.title REGEXP '������ ������' and 
at2.id is not null 
-- and e.externalId = '2002'
-- where e.execPerson_id = 2269
GROUP by a.actionType_id, e.client_id 








select 
COUNT(DISTINCT ClientC.client_id),
COUNT(DISTINCT golov.a_count)
from 
(select COUNT(e.client_id) as client_id from Event e where e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and e.deleted = 0 group by e.client_id) as ClientC,
(select COUNT(a.id) as a_count from Event e join Action a on a.event_id = e.id and a.deleted = 0 join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "�������" where e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and e.deleted = 0 group by e.client_id) as golov


-- EXPLAIN 
select * 
from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id = 6987 and at2.name REGEXP "�������|������ ������"
where e.setDate BETWEEN :Date1 and :Date2 and execPerson_id = :PersonId 







-- EXPLAIN 
select 
GROUP_CONCAT(DISTINCT a1.id separator '\n'),
COUNT(DISTINCT e2.client_id),
-- COUNT(DISTINCT a.id),
COUNT(DISTINCT a1.id)
-- a1.id
-- *
from Event e 
join Event e2 on e.client_id = e2.client_id and e2.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId
join Action a on a.event_id = e.id and a.deleted = 0
join Action a1 on a1.event_id = e2.id and a1.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "�������"
join ActionType at3 on at3.id = a1.actionType_id and at3.deleted = 0 and at3.group_id  = 6987 and at3.name REGEXP "������ ������"
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId ;




select GROUP_CONCAT(DISTINCT a.id separator '\n'), count(DISTINCT a.id), at2.name from Event e 
join Action a on a.event_id = e.id and a.deleted = 0
join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "������ ������"
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId 




select 
COUNT(DISTINCT e.client_id)
-- COUNT(DISTINCT a.id) 
-- a.id
from Event e 
join Action a ON a.event_id = e.id and a.deleted = 0
join ActionType at3 on at3.id = a.actionType_id and at3.deleted = 0 and at3.group_id  = 6987 and at3.name REGEXP "������ ������"




select 
if(a.id is null, 'null', a.id),
case when a.id is not null then a.id else "null" end,
a.id 
from Event e 
left join `Action` a ON a.event_id = e.id







