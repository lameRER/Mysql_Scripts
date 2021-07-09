select *
from actiontype group by defaultPersonInEvent;



select *
from actiontype where  defaultPersonInEvent = 2 and class = 0;

select *
from actiontype where name regexp '^1.*';



select * from person where login = 'админ'