select * from rbPrintTemplate rpt where rpt.name REGEXP '^карта'

select * from EventType et;


select * from Event e where e.client_id = 962290;


select * from TempInvalidELN where `number` = '910062457692';

select * from rbTempInvalidELN_Result


select * from rbEpicrisisProperty rep ;

select * from TempInvalidDuplicate;



SELECT tie.number, tie.begDate,tie.endDate, tie.lnDate, tie.lpu_name, tie.lpu_ogrn, tie.lastName, tie.firstName, tie.patrName, tie.SNILS, tie.employer, CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) as vPerson, tie.state FROM Event e
    JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
    left join Person p2 on tie.person_id = p2.id
    WHERE e.id = 33832673 AND e.deleted =0 AND tie.hospital_dt1 >= date(e.setDate) and date(e.execDate) <= tie.hospital_dt2 ORDER BY e.createDatetime DESC LIMIT
    1


SELECT tie.number, e.setDate, e.execDate, CONCAT_WS(' ', p2.lastName, p2.firstName, p2.patrName) as vPerson FROM Event e
JOIN TempInvalidELN tie ON e.client_id = tie.client_id AND tie.deleted = 0
left join Person p2 on tie.person_id = p2.id 
WHERE e.id = 33832673 AND e.deleted =0 AND tie.hospital_dt1 >= date(e.setDate) and date(e.execDate) <= tie.hospital_dt2 ORDER BY e.createDatetime DESC LIMIT 1