select f.name, count(a.id)
from Action a
         join Event e on e.id = a.event_id and e.deleted = 0
         join EventType et on et.id = e.eventType_id and et.deleted = 0
         join rbFinance f on f.id = et.finance_id
join Service s on s.action_id = a.id and s.event_id = e.id and s.deleted = 0
where a.actionType_id in
      (select id
       from ActionType
       where name in ('SARS-CoV-2 IgG', 'SARS-CoV-2 IgG (ПАЦИЕНТЫ|ДОНОРЫ - 1-Й ЭТАЖ)'))
  and a.deleted = 0
and a.begDate between :Date1 and :Date2
group by f.id;

insert into rbSpecialVariablesPreferences(name, arguments, query)
select 'SpecialVar_SARS-CoV-2' name, arguments, 'select f.name, count(a.id)
from Action a
         join Event e on e.id = a.event_id and e.deleted = 0
         join EventType et on et.id = e.eventType_id and et.deleted = 0
         join rbFinance f on f.id = et.finance_id
where a.actionType_id in
      (select id
       from ActionType
       where name in (''SARS-CoV-2 IgG'', ''SARS-CoV-2 IgG (ПАЦИЕНТЫ|ДОНОРЫ - 1-Й ЭТАЖ)''))
  and a.deleted = 0
and a.begDate between :Date1 and :Date2
group by f.id;' query
from rbSpecialVariablesPreferences
where id = 1112;

select *
from rbSpecialVariablesPreferences where id = 1112;



insert into rbPrintTemplate(code, name, context, fileName, `default`, dpdAgreement, render, templateText, deleted, jasper_template_uri, formats, default_format, active)
select
       code,
       'SARS-CoV-2 IgG' name,
       'free' context,
       fileName,
       `default`,
       dpdAgreement,
       render,
       templateText,
       deleted,
       jasper_template_uri,
       formats,
       default_format,
       active
from rbPrintTemplate where templateText regexp 'SpecialVar_surge';

insert into rbPrintTemplateMeta(template_id, type, name, title, description, arguments, defaultValue, query)
select
       (select id from rbPrintTemplate where id = LAST_INSERT_ID()) template_id,
       type,
       name,
       title,
       description,
       arguments,
       defaultValue,
       query
from rbPrintTemplateMeta where template_id = 3672;


select *
from rbPrintTemplate where id = 34444;


select *
from rbSpecialVariablesPreferences order by id desc ;

select *
from Contract_PriceList;

select *
from EventType;