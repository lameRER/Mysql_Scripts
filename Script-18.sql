select * from rbEpicrisisProperty rep where name REGEXP 'мед' order by id desc




select dds.status, api.value, min(dds.takeDatetime) `Начало`, max(dds.takeDatetime) `Окончание`, sum(dds.takeDose) `Доза`, rsn.mnn `МНН`
from DrugDestinationSchedule dds
join Action a on a.id = dds.action_id and a.deleted = 0 -- and a.event_id = %s
join rbStockNomenclature rsn on rsn.id = dds.nomenclature_id and rsn.deleted = 0
join ActionProperty ap on ap.action_id = a.id and ap.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'Статус' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP 'drug_theraphy|drug_theraphy_complex' and at2.deleted = 0))
join ActionProperty ap2 on ap2.action_id = a.id and ap2.type_id in (SELECT apt.id from ActionPropertyType apt where apt.deleted = 0 and apt.name REGEXP 'код' and apt.actionType_id in (select at2.id from ActionType at2 where at2.flatCode REGEXP 'drug_theraphy|drug_theraphy_complex' and at2.deleted = 0))
join ActionProperty_Integer api on ap.id = api.id  and (api.value = 2 or api.value = 1)
join ActionProperty_Integer api2 on ap2.id = api2.id and api2.value = dds.nomenclature_id
WHERE dds.deleted = 0 
GROUP by a.id order by dds.id desc