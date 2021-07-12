SELECT ClassID, someSubQueryTable.id
FROM (Select id, getMKBClassID(DiagID) as ClassID from MKB_Tree as MKB2) AS someSubQueryTable
WHERE (someSubQueryTable.id = 21788)
ORDER BY someSubQueryTable.id DESC;



select id, DiagID
from MKB_Tree;