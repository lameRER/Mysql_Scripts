CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `application`.`vLogger_V2` AS
select
    `ll`.`pc_name` AS `pc_name`,
    `ll`.`start_date` AS `start_date`,
    `ll`.`end_date` AS `end_date`,
    `p`.`login` AS `Login`,
    concat(`p`.`lastName`, ' ', left(`p`.`firstName`, 1), '.', left(`p`.`patrName`, 1), '.') AS `ÔÈÎ`,
    `os`.`name` AS `Îòäåëåíèå`,
    `ll`.`revision` AS `revision`,
    `ll`.`project` AS `project`
from
    ((`logger`.`Login` `ll`
join `s11`.`Person` `p` on
    (`ll`.`person_id` = `p`.`id`))
join `s11`.`OrgStructure` `os` on
    (`os`.`id` = `p`.`orgStructure_id`))
where
    `ll`.`start_date` >= curdate() - interval 3 month
order by
    cast(`ll`.`start_date` as date) desc,
    cast(`ll`.`start_date` as time) desc
limit 10000