USE s11


   SET @return = 0;
set @returnname = 'Жалобы';
SET @returnGroupId = 13386;
set @returncode = (SELECT t.code FROM rbThesaurus t WHERE id = @returnGroupId);

INSERT rbThesaurus (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code, name, template)
  VALUES (
NOW(), 1, NOW(), 1, 
@returnGroupId,
CONCAT(@returncode,'-', @return:= @return+1), @returnname, -- CONCAT('%s: ',
@returnname)
-- );
;

SELECT * FROM rbThesaurus t WHERE t.id = LAST_INSERT_ID();
SELECT * FROM rbThesaurus t WHERE t.group_id= @returnGroupId ORDER BY t.code ;



SELECT * FROM ActionType at WHERE at.id IN(11411,11412,11413,11414,11415);
SELECT * FROM rbThesaurus t WHERE t.name REGEXP 'лфк'

