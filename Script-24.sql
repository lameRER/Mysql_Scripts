

select * from 
-- update
ActionPropertyType apt 
-- set apt.typeName = 'Раздел'
where apt.deleted = 0 and apt.valueDomain = '''' and apt.typeName = 'String';