Select * From medialog.COMPLICATIONS4 c;


set @return = 190;
Select * From medialog.COMPLICATIONS4 c where c.COMPLICATIONS4_ID = @return or c.PARENT = @return;

select * from rbThesaurus rt where rt.code REGEXP '^35-0';




select * from ActionType at2 where at2.name REGEXP 'Протокол операции|выписной эпикриз' and at2.deleted = 0;

select * from ActionPropertyType apt where apt.actionType_id = 13723;




