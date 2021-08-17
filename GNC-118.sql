select *
from rbPrintTemplate where context =
(select context
from ActionType where name = 'Дневниковый осмотр (стационар)')