select * from rbPrintTemplate rpt where rpt.name REGEXP  'COVID';


select apt.* from ActionType at2, ActionPropertyType apt 
where at2.context = '1193-26179' and apt.actionType_id = at2.id