select a.* from ACTION a, actiontype a2
where a.actionType_id = a2.id and a.deleted = 0 and a2.deleted = 0 and a2.flatCode = 'leaved' and a.begDate != a.endDate 
order by a.id desc 


select * from actiontype a where a.flatCode != '';