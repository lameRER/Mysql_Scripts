-- Thu Dec 30 15:03:01 2021
-- generated by svn post-commit hook (by atronah)
START TRANSACTION;
INSERT INTO `DatabaseUpdateInfo` 
(`id`, `revision`, `user`, `execDatetime`, `updateDate`, `issueNumber`, `note`, `completed`, `updateNumber`) 
VALUES 
(NULL, 48386, CURRENT_USER, CURRENT_TIMESTAMP, '2021-12-30', '', '', 0, '2021-184');

-- nameTail: add_user_deleted
-- DEV_VM-3359: добавляем колонку в таблицу User колонку deleted

alter table User add column if not exists deleted tinyint(1)   default 0  not null comment 'Отметка удаления записи';

-- generated by svn post-commit hook (by atronah)
UPDATE `DatabaseUpdateInfo`
	SET completed = 1 
WHERE 
	`revision` = 48386 AND `updateDate` = '2021-12-30' AND `issueNumber` = '';
COMMIT;