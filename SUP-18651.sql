select count(Organisation.id) as counts, Organisation.*
from Organisation where netrica_Code regexp  '^780' and deleted = 0 group by netrica_Code having counts>1;


select *
from Organisation where netrica_Code in('78006','78008','78010');


3320 => 24726
3321 => 7890
24728 => 3307



SELECT
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 's11' AND
  REFERENCED_TABLE_NAME = 'Organisation' AND
  REFERENCED_COLUMN_NAME = 'id';



set @orgOld = 3320;
set @orgNew = 24726;

set @orgOld = 3321;
set @orgNew = 7890;

set @orgOld = 24728;
set @orgNew = 3307;

# select * from
update
    ClientPolicy
set insurer_id = @orgNew
where insurer_id = @orgOld and deleted = 0;


# select * from
update
Organisation
set deleted = 1
where id = @orgOld and deleted = 0;


select *
from ClientPolicy where id = 272506;


select *
from Organisation where id =3320;


select * from Action where org_id = @orgOld;

select * from ActionProperty_Organisation where value = @orgOld;

select * from ActionType where defaultOrg_id = @orgOld;

select * from Contract_Contingent where insurer_id = @orgOld;

select * from Contract_Tariff where attachLPU_id = @orgOld;

select * from Event where outgoingOrg_id = @orgOld;

select * from Event where relegateOrg_id = @orgOld;

select * from EventType_Action where defaultOrg_id = @orgOld;

select * from Event_LocalContract where org_id = @orgOld;

select * from Event_OutgoingReferral where org_id = @orgOld;

select * from ForeignHospitalization where org_id = @orgOld;

select * from Organisation_PolicySerial where organisation_id = @orgOld;

select * from PaymentScheme where org_id = @orgOld;

select * from Person where org_id = @orgOld;

select * from Person_Education where org_id = @orgOld;

select * from PoliclinicReferrals where organisation_id = @orgOld;

select * from Referral where relegateOrgTo_id = @orgOld;

select * from Referral where relegateOrg_id = @orgOld;

select * from ZNOInfo where referredTo = @orgOld;

select * from ZNOInfo where referredFrom = @orgOld;

select * from rbAssignedContracts where org_id = @orgOld;


select *
from ActionType where defaultOrg_id = @orgOld;






SELECT
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 's11' AND
  REFERENCED_TABLE_NAME = 'ActionType';
