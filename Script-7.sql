select * from ProgVer pv ;






INSERT LOW_PRIORITY INTO rbPropram(name)
SELECT 'Telephone Directory';
INSERT LOW_PRIORITY INTO ProgVer(deleted, relevant, Program, `Date start`, `Date end`, hach, Version, `network path`, `local path`, Timer)
SELECT deleted, relevant, 'Telephone Directory', `Date start`, `Date end`, hach, Version, `network path`, `local path`, Timer from ProgVer order by id desc limit 1


select * from rbApplicationGroup rag ;

INSERT LOW_PRIORITY INTO rbApplicationGroup(deleted, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, GroupName)
SELECT 0,NOW(),NULL,NOW(),NULL,'Администратор телефонного справочника' 