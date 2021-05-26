INSERT INTO s12.rbPrintTemplate
(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, `type`, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, pageOrientation)
VALUES('2021-05-25 12:24:39', NULL, '2021-05-25 12:24:39', NULL, 'SUP-16164', '*Опер блок план', 'token', '
', '<html>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{: setLeftMargin(15)}
{: setTopMargin(10)}
{: setBottomMargin(10)}
{: setRightMargin(10)}
{: from PyQt4 import QtGui }
{: from library.Utils import forceString }
{: db = QtGui.qApp.db }
{:dActions = dialogs.dialString(u"")}
{:dDate = dialogs.dialDate(u"")}
{: refList = db.getRecordList(stmt=u"""
select
date(a.plannedEndDate) as dates,
CONCAT_WS('' '', c.lastName, c.firstName, c.patrName) as FIO,
d3.MKB as Diagnosis,
a.specifiedName as Operation,
os.name as OperatingRoom,
'''' as Anestes,
'''' as OperBrig,
'''' as GrBlood
from Event e
join Client c on c.id = e.client_id and c.deleted = 0
left join Diagnostic d2 on d2.event_id = e.id and d2.deleted = 0 and d2.id = (select max(d.id) from Diagnostic d where
d.event_id = e.id)
left join Diagnosis d3 on d3.id = d2.diagnosis_id and d3.deleted = 0
join rbDiagnosisType rdt on d2.diagnosisType_id = rdt.id
join `Action` a on a.event_id = e.id and a.deleted = 0 and a.status != 3 and a.specifiedName != ''''
left join JsonData jd on jd.id REGEXP a.id
left join OrgStructure os on os.id = REGEXP_REPLACE(STRINGDECODE(urldecoder(jd.json)), ''.*"table":.?"(\\\\d+)".*'', ''\\\\1'')
WHERE e.eventType_id = 94 and e.deleted = 0 (""" + dActions.getVar() +""") ORDER by os.name, a.plannedEndDatein;""" ) }
<div>
    <h3 align=''center''> План операций на {dDate.getVar().date.toString(u"dd.MM.yyyy")}</h3>
</div>
<div>
    {: number = 1}
    {: test = ''''}
    {for: ref in refList }
    {: dates = forceString(ref.value(''dates'')) }
    {: FIO = forceString(ref.value(''FIO'')) }
    {: Diagnosis = forceString(ref.value(''Diagnosis'')) }
    {: Operation = forceString(ref.value(''Operation'')) }
    {: OperatingRoom = forceString(ref.value(''OperatingRoom'')) }
    {: Anestes = forceString(ref.value(''Anestes'')) }
    {: OperBrig = forceString(ref.value(''OperBrig'')) }
    {: GrBlood = forceString(ref.value(''GrBlood'')) }
    {: dr = forceString(ref.value(''dr'')) }
    {if: test != nomeroperacionn}
    <h3 align=''center''> {nomeroperacionn}</h3>
    {: test = nomeroperacionn}
    {end:}
    <table border=1 width="100%" cellpadding="1" cellspacing="0">
        <tr>
            <td>№</td>
            <td>ФИО</td>
            <td></td>
            <td>ДИАГНОЗ</td>
            <td>ОПЕРАЦИЯ</td>
            <td>АНЕСТЕЗИЯ</td>
            <td>ОПЕР. БРИГАДА</td>
            <td>ГР. КРОВИ</td>
        </tr>
    </table>

    {: number = number+1}
    {end:}
</div>


</html>', 0, 0, 0, 0, NULL, 0, 0, '', NULL, 1, 'P');


select * from rbPrintTemplate rpt order by id DESC ;
