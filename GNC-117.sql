select *
from rbPrintTemplate
where name = 'Договор (БЕЗ ПОЛЕЙ, МАСШТАБ - 100%, ДВУСТОРОННЯЯ ПЕЧАТЬ)'
or name = 'АКТ (на ТЕКУЩИЙ счёт)'
or name = 'АКТ (на ВСЕ счета)'
or name = 'Договор на оказание немедицинской услуги'



select *
from rbPrintTemplate where templateText regexp 'elif';