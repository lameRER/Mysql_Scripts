select *
from rbPrintTemplate where context =
(select context
from ActionType where name = 'Дневниковый осмотр (стационар)')


select *
from ActionType where context = 'dnevnik_stac';



select *
from rbPrintTemplate where templateText regexp 'curator';


select *
from Person;