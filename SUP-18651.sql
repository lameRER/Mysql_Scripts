select count(Organisation.id) as counts, Organisation.*
from Organisation where netrica_Code regexp  '^780' and deleted = 0 group by netrica_Code having counts>1;


select *
from Organisation where netrica_Code in('78006','78008','78010');




SELECT
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 's11' AND
  REFERENCED_TABLE_NAME = 'Organisation' AND
  REFERENCED_COLUMN_NAME = 'id';