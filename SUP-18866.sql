insert into s12.rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, hideParam, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, documentType_id, isEditableInWeb, pageOrientation)
values  (now(), NULL, now(), null, '145-17746F', 'Первичный осмотр дежурного врача', '145-17746F', '', '<!--Начальная дата разработки 06.06.2021 г.-->
<!--Версия 0.0.0.1, дата 00.000005.0000 г.-->
<!--Разработка: Солтанов Александр Назимович-->
<!--Контекст печати: 145-17746F -->
<!-- Задача: SUP-17746 -->
<!-- 27 ддд -->

<html>
<head>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{setMargins(5)}


</head>
<body style="font-size: 12pt">
    <table width="100%" align="center">
        <tr>
            <td width="100%" align="center">
                <b>
                    Первичный осмотр дежурного врача
                </b>
            </td>
        </tr>

        <tr>
            <td width="100%">
                <b>ФИО</b> {client.fullName}
                <br>
                <b>Дата рождения</b> {client.birthDate}  <b>возраст</b> {client.age}
            </td>
        </tr>
<!--
        <tr>
            <td>
                    {for: prop in action}
                            {if: prop.value}
                                {prop.name}- <u>{prop.typeName}</u> - <b>{prop.value.__class__}</b> -
                                <br>
                            {end:}
                    {end:}
            </td>
        </tr>
-->
        <tr>
            <td width="100%">
                <table width="100%" cellspacing="0" cellpadding="0" border="1">
                    {for: prop in action}
                        {if: prop.name in (u''ЖАЛОБЫ'',u''АНАМНЕЗ ЗАБОЛЕВАНИЯ'',u''АНАМНЕЗ ЖИЗНИ'') and prop.value}
                            <tr>
                                <td width="35%">
                                    <b>{prop.name}</b>
                                </td>
                                <td width="65%">
                                    {prop.value :n}
                                </td>
                            </tr>
                        {elif: prop.name in (u''Аллергологический анамнез'', u''Перенесенные заболевания, операции, травмы (со слов пациента)'', u''Эпидемиологический анамнез'', u''Вредные привычки'', u''Страховой анамнез'', u''Семейно-половой анамнез: для женщин Данная вкладка появляется ТОЛЬКО если на истории стоит (пол – женский)'') and prop.typeName == ''Action'' and prop.value}
                            {:checkValue = 0}
                            {:needCountProp2 = 0}
                            {if: len(prop) > 0}
                                {for: item in prop}
                                    {for: prop2 in item}
                                        {if: prop2.value}
                                            {:checkValue = 1}
                                            {:needCountProp2 = needCountProp2 + 1}
                                        {end:}
                                    {end:}
                                {end:}
                            {end:}
                            {if: checkValue == 1}
                                <tr>
                                    <td width="35%">
                                        <b>{prop.name}</b>
                                    </td>
                                {if: len(prop) > 0}
                                <td width="65%">
                                    {:CountProp2 = 0}
                                    {for: item in prop}
                                        {for: prop2 in item}
                                            {if: prop2.value and prop2.typeName != ''Action''}
                                                {:CountProp2 = CountProp2 + 1}
                                                <b>{prop2.name}</b> - {prop2.value :n}
                                                {if: CountProp2 != needCountProp2}
                                                    <br>
                                                {end:}
                                            {elif: prop2.value and prop2.typeName == ''Action''}
                                                <tr>
                                                    <td width="35%">
                                                        {prop2.name}
                                                    </td>
                                                    <td width="65%">
                                                        {for: item2 in prop2}
                                                            {for: prop3 in item2}
                                                                {if: prop3.value}
                                                                   <b>{prop3.name}</b> - {prop3.value}
                                                                {end:}
                                                            {end:}
                                                        {end:}
                                                    </td>
                                                </tr>
                                            {end:}
                                        {end:}
                                    {end:}
                                </td>
                                </tr>
                                {end:}
                            {end:}
                        {elif: prop.name in (u''ДАННЫЕ ОБЪЕКТИВНОГО ОБСЛЕДОВАНИЯ:'', u''Кожный покров, Видимые слизистые, Периферические лимфатические узлы'', u''Органы дыхания'', u''Сердечно-сосудистая система'', u''Нервная система'', u''Регламент передачи в РЕГИЗ пациентов с острым нарушением мозгового кровообращения (ОНМК)'', u''Система органов пищеварения'', u''Status localis'') and prop.typeName == ''Action'' and prop.value}
                            {:checkValue = 0}
                            {if: len(prop) > 0}
                                {for: item in prop}
                                    {for: prop2 in item}
                                        {if: prop2.value}
                                            {:checkValue = 1}
                                        {end:}
                                    {end:}
                                {end:}
                            {end:}
                            {if: checkValue == 1}
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>{prop.name}</b>
                                    </td>
                                </tr>
                                {if: len(prop) > 0}
                                    {for: item in prop}
                                        {for: prop2 in item}
                                            {if: prop2.value and prop2.typeName != ''Action''}
                                               <tr>
                                                    <td width="35%">
                                                        <b>{prop2.name}</b>
                                                    </td>
                                                    <td width="65%">
                                                        {prop2.value :n}
                                                    </td>
                                                </tr>
                                            {elif: prop2.value != ''[u'''']'' and prop2.value and prop2.typeName == ''Action''}
                                                {:checkDoublePropValue = 0}
                                                {:needCountProp3 = 0}
                                                {:CountProp3 = 0}
                                                    {for: item2 in prop2}
                                                        {for: prop3 in item2}
                                                            {if: prop3.value}
                                                                    {:checkDoublePropValue = 1}
                                                                    {:needCountProp3 = needCountProp3 + 1}
                                                            {end:}
                                                        {end:}
                                                    {end:}
                                                {if: checkDoublePropValue == 1}
                                                <tr>
                                                    <td width="35%">
                                                        <b>{prop2.name}</b>
                                                    </td>
                                                    <td width="65%">
                                                        {for: item2 in prop2}
                                                            {for: prop3 in item2}
                                                                {if: prop3.value}
                                                                    {:CountProp3 = CountProp3 + 1}
                                                                    <b>{prop3.name}</b> - {prop3.value}
                                                                    {if: CountProp3  != needCountProp3}
                                                                        <br>
                                                                    {end:}
                                                                {end:}
                                                            {end:}
                                                        {end:}
                                                    </td>
                                                </tr>
                                                {end:}
                                            {end:}
                                        {end:}
                                    {end:}
                                {end:}
                            {end:}
                        {end:}
                    {end:}
                </table>
            </td>
        </tr>
    </table>
</body>
</html>



<!--


                </table>
            </td>
        </tr>

<tr>
    <td>
        ___________________________________________________________
    </td>
</tr>

        <tr>
            <td width="100%">
                {for: prop in action} <i><u></u></i>
                    {if: prop.typeName == ''Action'' and prop.value} <i><u></u></i>
                        {for: action2 in prop} <i><u></u></i>
                            {for: prop2 in action2}
                              <div align="left"><b>{prop2.name} - {prop2.value :n}</b></div>
                            {end:}
                        {end:}
                    {end:}
                {end:}
                <br>
            </td>
        </tr>
    </table>

    ___________________________________________________
    TEST
-->

', 0, 0, 0, 2, null, 0, 0, '', null, 0, 'P');





select rbPrintTemplate.*
from rbPrintTemplate
join rbPrintTemplate za on za.id = (select id from rbPrintTemplate order by id desc limit 1)
where rbPrintTemplate.context =
(select context
from ActionType where name = 'Первичный осмотр дежурного врача' and deleted =0 and code = '145-17746F')




select *
from rbPrintTemplate where context =
(select context
from ActionType where name = 'Назначение НСПВ');


select *
from ActionPropertyType where actionType_id =
(select id
from ActionType where name = 'Назначение НСПВ')



select distinct apt.name, rt.*
from ActionPropertyType apt,
     ActionType at,
     rbPrintTemplate rt
where apt.typeName = 'Action' and apt.deleted =0
and apt.actionType_id = at.id and at.deleted = 0
and rt.context = at.context and rt.deleted = 0;


{for: prop2 in action}
	{if: prop2.name == u"Этикетки:"}
		{for: a in prop2.value}
			{a}
		{end:}
	{end:}
{end:}