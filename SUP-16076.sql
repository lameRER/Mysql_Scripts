select * from ActionType  where group_id = 14285 order by name


select * from rbPrintTemplate rpt where rpt.context = (select at2.context from ActionType at2 where at2.id = 43361)


select * from ActionType at2 where at2.name REGEXP 'ОНМК';