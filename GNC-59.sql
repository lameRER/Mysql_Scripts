select * from rbPrintTemplate rpt where rpt.name REGEXP 'Амбулаторный прием';

select * from rbPrintTemplateMeta where template_id = 5506;





select id, shortName 
from OrgStructure  WHERE id IN (17,
19,
20,
21,
22,
23,
24,
26,
77,
83,
87,
96,
98,
100,
102,
112,
114,180,181,142,186,163)
  order by shortName;