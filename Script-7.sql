select * from ProgVer pv ;






INSERT LOW_PRIORITY INTO rbPropram(name)
SELECT 'Telephone Directory';

INSERT LOW_PRIORITY INTO ProgVer(deleted, relevant, Program, `Date start`, `Date end`, hach, Version, `network path`, `local path`, Timer)
SELECT deleted, relevant, 'Vista-Logger', `Date start`, `Date end`, hach, Version, `network path`, `local path`, Timer from ProgVer order by id desc limit 1;

alter table rbApplicationGroup 
modify column GroupName varchar(50);

INSERT LOW_PRIORITY INTO rbApplicationGroup(deleted, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, GroupName)
SELECT 0,NOW(),NULL,NOW(),NULL,'Администратор телефонного справочника'; 

INSERT LOW_PRIORITY INTO ApplicationUserRigth(deleted, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, `Group`, Right_code, Prog_name)
SELECT 0,NOW(),NULL,NOW(),NULL,12,'start', 'Telephone Directory'  

select * from ApplicationUserGroup;

INSERT LOW_PRIORITY INTO ApplicationUserGroup(deleted, createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, Group_id, person_id)
SELECT 0,NOW(),NULL,NOW(),NULL,12,970  ;



CREATE TABLE application.user_Person (
	id INT(2) primary key auto_increment NOT NULL,
	deleted INT(1) DEFAULT 0 NULL,
	person_id INT(10) NOT NULL,
	foreign key (person_id) references s11.Person (id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

INSERT LOW_PRIORITY INTO user_Person(deleted,person_id)
SELECT 0,970




select * from vLogger_V2 vlv ;








SELECT lv.pc_name, lv.start_date, lv.end_date, lv.Login, lv.ФИО, lv.revision FROM vLogger_V2 lv 
WHERE lv.revision IS NOT NULL AND lv.start_date >= DATE_SUB(CURDATE(),INTERVAL 1 MONTH) AND lv.revision !=  'DEVELOPMENT'



SELECT * FROM  vLogger_V2 limit 100







