SELECT 
CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `���`, 
min(Date(e.setDate)),
max(Date(e.setDate)),
Count(if(at2.name regexp
'^���', a.id, NULL)) `��� (�����)`,
COUNT(DISTINCT e.client_id) `����� ���������`,
count(if(at2.name regexp '��������', a.id, NULL)) `����� � ��`,
count(if(at2.name = '��� ��������� ����� � ��� ��������', a.id, NULL)) `�������� ����`,
count(if(at2.name = '��� ��������� ����� � ������������ ����������� ���������', a.id, NULL)) `�������� ���� � �/� �����.`,
count(if(at2.name = '��� ������� ��������� ����� (��-�����������)', a.id, NULL)) `��-�����������`,
'' `��-����������`,
count(if(at2.name = '��� �����', a.id, NULL)) `������`,
count(if(at2.name = '��� ����� � ������������ �����������������', a.id, NULL)) `������ � �/� �����.`,
'' `���`,
'' `��� � �.�`,
count(if(at2.name regexp '^��� ������ ������ ���$|^��� ������ ������ A05\.01\.002$', a.id, NULL)) `������ ����� `,
count(if(at2.name regexp '^��� ������ ������ �����������������', a.id, NULL)) `������ ����� � �/� �����.`,
count(if(at2.name regexp '��� �����������$', a.id, NULL)) `�����������`,
count(if(at2.name = '��� ����������� � ������������ ����������� ���������', a.id, NULL)) `����������� � �.�`,
count(if(at2.name = '��� ������� �������', a.id, NULL)) `������� �������`,
count(if(at2.name = '��� ������� ������� � ������������ �����������������', a.id, NULL)) `������� ������� � �.�`,
count(if(at2.name = '��� ������� ������ ����', a.id, NULL)) `����� ���`,
count(if(at2.name = '��� ������� ������ ���� � ������������ �����������������', a.id, NULL)) `����� ��� � �/� �����.`,
count(if(at2.name regexp '������������$', a.id, NULL)) `����������� (�; ��. �/�)`,
count(if(at2.name regexp '������������ � �����������������', a.id, NULL)) `����������� � �/� �����`,
count(if(at2.name = '��� �������� ����� � ��� ��������', a.id, NULL)) `������� ����`,
count(if(at2.name = '��� �������� ����� � ��� �������� � ������������ ����������� ���������', a.id, NULL)) `������� ���� � �/� �����`,
count(if(at2.name = '��� ��������� �������', a.id, NULL)) `�������� ������`,
count(if(at2.name = '��� ��������� ������� � ������������ ����������� ���������', a.id, NULL)) `�������� ������ � �/� �����`,
count(if(at2.name = '��� ��������� �������', a.id, NULL)) `�������� ������`,
'' `������������� ������ � ��.`,
count(if(at2.name = '��� ������������� ��������', a.id, NULL)) `������������� �������`,
count(if(at2.name = '��� ������������� �������� � ������������ ����������� ���������', a.id, NULL)) `������������� ������� � �/� �����`,
count(if(at2.name = '��� ������������� ��������+��������� ������ (�������� ������������ ��� ������� ����)', a.id, NULL)) `��������� �����`,
'' `������� �������`,
count(if(at2.name = '��� ������������ ������������', a.id, NULL)) `����������� ������������`,
count(if(at2.name = '��� ������ ����', a.id, NULL)) `����� ���� � ��.`,
count(if(at2.name = '��� ������ ���� c �����������������', a.id, NULL)) `����� ���� � ��. � �.�`,
'' `��� ����`,
'' `���. ����������`,
'' `���`,
'' `���`,
'' `�������`,
'' `������������`
FROM Event e 
join Event e2 on e.id = e2.id
join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
join Action a on a.event_id = e2.id and a.deleted = 0 and a.status = 2
left join ActionType at2 on at2.id = a.actionType_id and at2.deleted = 0 and at2.group_id  = 6987 and 
at2.name REGEXP "^��� ��������� ����� � ��� ��������$|^��� ��������� ����� � ������������ ����������� ���������$|^��� ������� ��������� ����� \\(��-�����������\\)$|^��� �����$|^��� ����� � ������������ �����������������$|^��� ������ ������ ���$|^��� ������ ������ A05\.01\.002$|^��� ������ ������ �����������������|^��� �����������$$|^��� ����������� � ������������ ����������� ���������$|^��� ������� �������$|^��� ������� ������� � ������������ �����������������$|^��� ������� ������ ����$|^��� ������� ������ ���� � ������������ �����������������$|������������$|������������ � �����������������|^��� �������� ����� � ��� ��������$|^��� �������� ����� � ��� �������� � ������������ ����������� ���������$|^��� ��������� �������$|^��� ��������� ������� � ������������ ����������� ���������$|^��� ��������� �������$|^��� ������������� ��������$|^��� ������������� �������� � ������������ ����������� ���������$|^��� ������������� ��������\\+��������� ������ \\(�������� ������������ ��� ������� ����\\)$|^��� ������������ ������������$|^��� ������ ����$|^��� ������ ���� c �����������������$"
where e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :Person_id limit 1;


-- ����������	������	����������
select * from Person p where id = 1407;


select * from rbSpecialVariablesPreferences rsvp where rsvp.name = 'SpecialVar_OtchetRentgenologam';

select * from rbPrintTemplateMeta rptm  order by id desc;


select * from rbPrintTemplate rpt where id = 34372;



select * from rbSpecialVariablesPreferences rsvp where arguments REGEXP 'person' order by id desc;

select * from rbPrintTemplate rpt where templateText REGEXP 'SpecialVar_039u02Vra';

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_ListNablyudeniyDoc';


select * from rbPrintTemplate rpt where id = 29354;


select * from rbPrintTemplateMeta rptm where template_id = 29354;



select * from rbPrintTemplate rpt where id = 34370;


select * from rbPrintTemplateMeta rptm where template_id = 34370 order by id desc;

select * from rbSpecialVariablesPreferences rsvp where name = 'SpecialVar_Temp_List';

-- SELECT 
-- CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) `���`, 
-- min(Date(e.setDate)),
-- max(Date(e.setDate)),
-- -- count(DISTINCT case when a.id is not null then a.id
-- -- when a1.id is not null then a1.id end)
-- count(DISTINCT a.id) `��� (�����)`,
-- COUNT(DISTINCT e.client_id) `����� ���������`,
-- '' `����� � ��`,
-- count(DISTINCT a1.id) `�������� ����`,
-- count(DISTINCT a2.id) `�������� ���� � �/� �����.`,
-- count(DISTINCT a3.id) `��-�����������`,
-- '' `��-����������`,
-- '' `������`,
-- '' `������ � �/� �����.`,
-- '' `���`,
-- '' `��� � �.�`,
-- '' `������ ����� `,
-- '' `������ ����� � �/� �����.`,
-- '' `�����������`,
-- '' `����������� � �.�`,
-- '' `������� �������`,
-- '' `������� ������� � �.�`,
-- '' `����� ���`,
-- '' `����� ��� � �/� �����.`,
-- ''`����������� (�; ��. �/�)`,
-- '' `����������� � �/� �����`,
-- '' `������� ����`,
-- '' `������� ���� � �/� �����`,
-- '' `�������� ������`,
-- '' `�������� ������ � �/� �����`,
-- '' `�������� ������`,
-- '' `������������� ������ � ��.`,
-- '' `������������� �������`,
-- '' `������������� ������� � �/� �����`,
-- '' `��������� �����`,
-- '' `������� �������`,
-- '' `����������� ������������`,
-- '' `����� ���� � ��.`,
-- '' `����� ���� � ��. � �.�`,
-- '' `��� ����`,
-- '' `���. ����������`,
-- '' `���`,
-- '' `���`,
-- '' `�������`,
-- '' `������������`
-- -- e.execPerson_id, e.* 
-- FROM Event e 
-- join Event e2 on e.client_id = e2.client_id
-- join Event e3 on e.client_id = e3.client_id
-- join Event e4 on e.client_id = e4.client_id
-- join Person p2 on p2.id = e.execPerson_id and p2.deleted = 0
-- left join Action a on a.event_id = e.id and a.deleted = 0 and a.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name REGEXP "^���")
-- left join Action a1 on a1.event_id = e2.id and a1.deleted = 0 and a1.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ��������� ����� � ��� ��������")
-- left join Action a2 on a2.event_id = e3.id and a2.deleted = 0 and a2.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ��������� ����� � ������������ ����������� ���������")
-- left join Action a3 on a3.event_id = e4.id and a3.deleted = 0 and a3.actionType_id in (select at2.id from ActionType at2 where at2.deleted = 0 and at2.group_id  = 6987 and at2.name = "��� ������� ��������� ����� (��-�����������)")
-- where 
-- e.deleted = 0 and e.setDate BETWEEN :Date1 and :Date2 and e.execPerson_id = :PersonId and 
-- e2.deleted = 0 and e2.setDate BETWEEN :Date1 and :Date2 and e2.execPerson_id = :PersonId and 
-- e3.deleted = 0 and e3.setDate BETWEEN :Date1 and :Date2 and e3.execPerson_id = :PersonId



select * from rbPrintTemplate rpt where templateText REGEXP 'cell';