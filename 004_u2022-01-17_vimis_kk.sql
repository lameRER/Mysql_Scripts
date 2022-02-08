-- Mon Jan 17 15:53:45 2022
-- generated by svn post-commit hook (by atronah)
START TRANSACTION;
INSERT INTO `DatabaseUpdateInfo` 
(`id`, `revision`, `user`, `execDatetime`, `updateDate`, `issueNumber`, `note`, `completed`, `updateNumber`) 
VALUES 
(NULL, 48464, CURRENT_USER, CURRENT_TIMESTAMP, '2022-01-17', '', '', 0, '2022-004');

-- nameTail: vimis_kk
-- DEV_VM-3295: vimis kk

ALTER TABLE EventType ADD COLUMN visit_circumstances varchar(10) COMMENT 'Обстоятельства посещения {1.2.643.5.1.13.13.11.1052}';
ALTER TABLE Organisation ADD COLUMN medOrgCode varchar(10) COMMENT 'Код медицинской организации {1.2.643.5.1.13.13.11.1461}';
ALTER TABLE rbPost ADD COLUMN role_code varchar(10) COMMENT 'Роль {1.2.643.5.1.13.13.99.2.368}';
ALTER TABLE rbDispanser ADD COLUMN dispanser_circumstances varchar(10) COMMENT 'Обстоятельства взятия на диспансерный учет {1.2.643.5.1.13.13.99.2.140}';


create table if not exists rbZNOClinicalGroups
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbZNOClinicalGroups_pk
        primary key (id)
)
    comment 'РР. Клинические группы больных злокачественными новообразованиями {1.2.643.5.1.13.13.99.2.146}';

INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (1, '2', 'IIа');
INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (2, '3', 'II');
INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (3, '4', 'III');
INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (4, '5', 'IV');
INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (5, '6', 'Ia');
INSERT INTO rbZNOClinicalGroups (id, code, name) VALUES (6, '7', 'Iб');

ALTER TABLE rbMedicalAidKind ADD COLUMN typeMedCare varchar(10) COMMENT 'Виды медицинской помощи {1.2.643.5.1.13.13.11.1034}';

ALTER TABLE ZNOInfo ADD COLUMN clinical_group int COMMENT 'Клиническая группа {1.2.643.5.1.13.13.99.2.146}';

create table if not exists rbDecisionOUZ
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbDecisionOUZ_pk
        primary key (id)
)
    comment 'ВИМИС. Принятое решение ОУЗ в рамках направления на ВМП {1.2.643.5.1.13.13.99.2.580}';

INSERT INTO rbDecisionOUZ (id, code, name) VALUES (7, '1', 'Наличие медицинских показаний для оказания ВМП');
INSERT INTO rbDecisionOUZ (id, code, name) VALUES (8, '2', 'Отсутствие медицинских показаний для оказания ВМП');
INSERT INTO rbDecisionOUZ (id, code, name) VALUES (9, '3', 'Необходимость проведения дополнительного обследования');


create table if not exists rbTumorState
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbTumorState_pk
        primary key (id)
)
    comment 'ВИМИС. Состояние опухолевого процесса {1.2.643.5.1.13.13.99.2.583}';


INSERT INTO rbTumorState (id, code, name) VALUES (1, '1', 'Без рецидива и метастазов');
INSERT INTO rbTumorState (id, code, name) VALUES (2, '2', 'Локальная опухоль');
INSERT INTO rbTumorState (id, code, name) VALUES (3, '3', 'Органный рецидив');
INSERT INTO rbTumorState (id, code, name) VALUES (4, '4', 'Внеорганный рецидив');
INSERT INTO rbTumorState (id, code, name) VALUES (5, '5', 'Региональные метастазы');
INSERT INTO rbTumorState (id, code, name) VALUES (6, '6', 'Единичные отдаленные метастазы');
INSERT INTO rbTumorState (id, code, name) VALUES (7, '7', 'Множественные отдаленные метастазы');
INSERT INTO rbTumorState (id, code, name) VALUES (8, '8', 'Ремиссия системного заболевания');
INSERT INTO rbTumorState (id, code, name) VALUES (9, '9', 'Прогрессирование системного заболевания');
INSERT INTO rbTumorState (id, code, name) VALUES (10, '10', 'Выявлена новая первичная опухоль');
INSERT INTO rbTumorState (id, code, name) VALUES (11, '11', 'Нет сведений');

ALTER TABLE ZNOInfo ADD COLUMN tumor_state int COMMENT 'Состояние опухолевого процесса {rbTumorState}';

create table if not exists rbPregnantResult
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbPregnantResult_pk
        primary key (id)
)
    comment 'Исходы беременности {1.2.643.5.1.13.13.99.2.279}';

INSERT INTO rbPregnantResult (id, code, name) VALUES (1, '1', 'Рождение ребенка');
INSERT INTO rbPregnantResult (id, code, name) VALUES (2, '8', 'Живорождение');
INSERT INTO rbPregnantResult (id, code, name) VALUES (3, '7', 'Мертворождение');
INSERT INTO rbPregnantResult (id, code, name) VALUES (4, '9', 'Антенатальная гибель');
INSERT INTO rbPregnantResult (id, code, name) VALUES (5, '10', 'Интранатальная гибель');
INSERT INTO rbPregnantResult (id, code, name) VALUES (6, '11', 'Прерывание беременности');
INSERT INTO rbPregnantResult (id, code, name) VALUES (7, '12', 'Самопроизвольное прерывание беременности');
INSERT INTO rbPregnantResult (id, code, name) VALUES (8, '5', 'Выкидыш ранний');
INSERT INTO rbPregnantResult (id, code, name) VALUES (9, '6', 'Выкидыш поздний');
INSERT INTO rbPregnantResult (id, code, name) VALUES (10, '13', 'Искусственное прерывание беременности');
INSERT INTO rbPregnantResult (id, code, name) VALUES (11, '14', 'Медицинское прерывание беременности');
INSERT INTO rbPregnantResult (id, code, name) VALUES (12, '3', 'Легальный аборт');
INSERT INTO rbPregnantResult (id, code, name) VALUES (13, '2', 'Прерывание беременности по медицинским показаниям');
INSERT INTO rbPregnantResult (id, code, name) VALUES (14, '15', 'Прерывание беременности по социальным показаниям');
INSERT INTO rbPregnantResult (id, code, name) VALUES (15, '4', 'Криминальный аборт');


create table if not exists rbChildSerialNumber
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbChildSerialNumber_pk
        primary key (id)
)
    comment 'Классификатор порядкового номера ребенка у беременной {1.2.643.5.1.13.13.99.2.493}';

INSERT INTO rbChildSerialNumber (id, code, name) VALUES (1, '1', '1-й ребёнок');
INSERT INTO rbChildSerialNumber (id, code, name) VALUES (2, '2', '2-й ребёнок');
INSERT INTO rbChildSerialNumber (id, code, name) VALUES (3, '3', '3-й ребёнок');
INSERT INTO rbChildSerialNumber (id, code, name) VALUES (4, '5', 'Одноплодие');


create table if not exists rbBirthPlace
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbBirthPlace_pk
        primary key (id)
)
    comment 'Тип места рождения ребёнка {1.2.643.5.1.13.13.99.2.30}';


INSERT INTO rbBirthPlace (id, code, name) VALUES (1, '1', 'В стационаре');
INSERT INTO rbBirthPlace (id, code, name) VALUES (2, '2', 'Дома');
INSERT INTO rbBirthPlace (id, code, name) VALUES (3, '3', 'В другом месте');
INSERT INTO rbBirthPlace (id, code, name) VALUES (4, '4', 'Неизвестно');

create table if not exists rbNewbornState
(
    id   int auto_increment,
    code varchar(16)  null,
    name varchar(128) null,
    constraint rbNewbornState_pk
        primary key (id)
)
    comment 'Классификатор состояний новорожденного {1.2.643.5.1.13.13.99.2.459}';


INSERT INTO rbNewbornState (id, code, name) VALUES (1, '1', 'Доношенный');
INSERT INTO rbNewbornState (id, code, name) VALUES (2, '2', 'Недоношенный');
INSERT INTO rbNewbornState (id, code, name) VALUES (3, '3', 'Мертворожденный');

-- generated by svn post-commit hook (by atronah)
UPDATE `DatabaseUpdateInfo`
	SET completed = 1 
WHERE 
	`revision` = 48464 AND `updateDate` = '2022-01-17' AND `issueNumber` = '';
COMMIT;