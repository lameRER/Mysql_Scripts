select * from rbPrintTemplate rpt order by rpt.id DESC 

select * from EventType et;


select * from Event e where e.client_id = 962290;


select t.person_id, t.client_id, t.lnDate, t.* from TempInvalidELN t where t.`number` REGEXP '641$';

select * from TempInvalidELN_Period tiep where tiep.master_id = 16;


select * from TempInvalid ti where ti.`number` REGEXP '041$';
select t.closed, t.client_id, t.* from TempInvalidELN t where t.client_id = 730748 and t.deleted = 0

select * from TempInvalidELN tie where tie.`number` = '910063019082';


select * from TempInvalidELN tie where tie.prev_id is not null

select * from rbTempInvalidELN_Result

select * from TempInvalid;

select * from rbEpicrisisProperty rep ;

select * from TempInvalidDuplicate;

select * from rbtemp;



SELECT tie.number, tie.begDate,tie.endDate, tie.lnDate, tie.lpu_name, tie.lpu_ogrn, tie.lastName, tie.firstName, tie.patrName, tie.SNILS, tie.employer, CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) as vPerson, tie.state FROM Event e
    JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
    left join Person p2 on tie.person_id = p2.id
    WHERE e.id = 33832673 AND e.deleted =0 AND tie.hospital_dt1 >= date(e.setDate) and date(e.execDate) <= tie.hospital_dt2 ORDER BY e.createDatetime DESC LIMIT
    1


SELECT tie.number, e.setDate, e.execDate, CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) as vPerson FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
left join Person p2 on tie.person_id = p2.id 
WHERE e.id = 33832673 AND e.deleted =0 AND tie.hospital_dt1 >= date(e.setDate) and date(e.execDate) <= tie.hospital_dt2 ORDER BY e.createDatetime DESC LIMIT 1