set @context = 'action_lab_trfu_immuno';

select *
from gnc.rbPrintTemplate where context = @context;


select *
from gnc.ActionType where context = @context and deleted = 0;


select *
from ActionType where code = 'A12.06.034.001';



select *
from Action
where actionType_id in (select id from ActionType where context = @context)
order by id desc ;



select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_CheckCoagulogramOMS';

select *
from rbSpecialVariablesPreferences where name = 'SpecialVar_Biomaterial';



SELECT
  SUM(CASE WHEN apt.id IN (3922356,
      3922367,
      3922376,
      3922346,
      3922364) THEN 1 ELSE 0 END) AS 'Агрегации тромбоцитов',
  SUM(CASE WHEN apt.id IN (3922372,
      3922362,
      3922357,
      3922417,
      3922351,
      3922373,
      3922369,
      3922374,
      3922363) THEN 1 ELSE 0 END) AS 'Факторы'
FROM Action a
  INNER JOIN ActionProperty ap
    ON ap.action_id = a.id
  INNER JOIN ActionPropertyType apt
    ON ap.type_id = apt.id
WHERE apt.id IN (3922356,
      3922367,
      3922376,
      3922346,
      3922364,
      3922372,
      3922362,
      3922357,
      3922417,
      3922351,
      3922373,
      3922369,
      3922374,
      3922363)
AND ap.isAssigned = 1
AND ap.deleted = 0
AND a.id = :ActionID



SELECT
  tt.id,
  tt.code,
  tt.name,
  tt.group_id,
  tt.sex,
  ttt.name `Пробирка`
FROM Action_TakenTissueJournal attj
  INNER JOIN TakenTissueJournal ttj
    ON ttj.id = attj.takenTissueJournal_id
  INNER JOIN rbTissueType tt
    ON tt.id = ttj.tissueType_id
  LEFT OUTER JOIN rbTestTubeType ttt
    ON ttj.testTubeType_id = ttt.id
WHERE attj.action_id = :ActionId
