select a.* from Action a, actiontype a2
where a.actionType_id = a2.id and a.deleted = 0 and a2.deleted = 0 and a2.flatCode = 'leaved' and a.begDate >= '2021-04-12 08:00' and a.begDate <= '2021-04-12 09:00'
order by a.endDate desc 


select * from actiontype a where a.flatCode != '';



select * from action a where a.begDate = '2021-04-12' and a.deleted = 0


select * from ;