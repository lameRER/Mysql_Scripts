select id, code
from ActionType where context =
(select context
from rbPrintTemplate where name regexp 'наряд' and id = 223);


select id, context, `default`
from rbPrintTemplate where id = 223;