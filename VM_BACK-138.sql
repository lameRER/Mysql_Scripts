
select table_name, constraint_name, status, owner
from all_constraints
where r_owner = :r_owner
and constraint_type = 'R'
and r_constraint_name in
 (
   select constraint_name from all_constraints
   where constraint_type in ('P', 'U')
   and table_name = :r_table_name
   and owner = :r_owner
 )
order by table_name, constraint_name;



select owner,constraint_name,constraint_type,table_name,r_owner,r_constraint_name
  from all_constraints
 where constraint_type='R'
   and r_constraint_name in (select constraint_name
                               from all_constraints
                              where constraint_type in ('P','U')
                                and table_name='D_PERSMEDCARD');


use s11;
SET foreign_key_checks = 0;
TRUNCATE Account;
TRUNCATE Account_Item;
TRUNCATE Action;
TRUNCATE ActionTemplate;
TRUNCATE Client;
TRUNCATE ClientAddress;
TRUNCATE ClientAllergy;
TRUNCATE ClientAnthropometric;
TRUNCATE ClientAttach;
TRUNCATE ClientCompulsoryTreatment;
TRUNCATE ClientContact;
TRUNCATE ClientDisability;
TRUNCATE ClientDispanserization;
TRUNCATE ClientDocument;
TRUNCATE ClientPolicy;
TRUNCATE ClientRelation;
TRUNCATE ClientRemark;
TRUNCATE ClientSocStatus;
TRUNCATE ClientWork;
TRUNCATE Diagnosis;
TRUNCATE Diagnostic;
TRUNCATE EQueueTicket;
TRUNCATE Event;
TRUNCATE Job_Ticket;
TRUNCATE OrgStructure;
TRUNCATE PersonAttach;
TRUNCATE Visit;
SET foreign_key_checks = 1;