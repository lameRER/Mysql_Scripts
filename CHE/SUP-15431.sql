Select * From medialog.COMPLICATIONS4 c;


set @return = 190;
Select * From medialog.COMPLICATIONS4 c where c.COMPLICATIONS4_ID = @return or c.PARENT = @return;

select * from rbThesaurus rt where rt.code REGEXP '^35-0';




