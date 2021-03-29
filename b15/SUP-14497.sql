select * from rbPrintTemplate rpt where rpt.context = (select at2.context from ActionType at2 where at2.id = 36149)


select * from ActionPropertyType apt where apt.deleted = 0 and apt.actionType_id = 36149 ORDER by apt.idx ;



select * from ActionPropertyType apt where typeName = 'Integer' and valueDomain != '';



select * from rbStockNomenclature;