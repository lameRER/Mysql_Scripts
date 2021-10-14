select *
from rbPrintTemplate where context =
(select context
from EventType where id in (
    select eta.eventType_id
from EventType_Action eta, EventType et
where et.name in ('Периодический осмотр (ПРОФЫ)')
and eta.eventType_id = et.id))
;



insert into s11.rbPrintTemplate (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context, fileName, `default`, dpdAgreement, type, banUnkeptDate, counter_id, deleted, isPatientAgreed, groupName, hideParam, documentType_id, isEditableInWeb, chkProfiles, chkPersons)
values  ('2015-04-14 11:26:34', 200, '2018-03-07 16:35:56', 371, 'основная', 'Амбулаторная карта+ Анализы Периодический осмотр', 'f131pe', '', '<!--Начальная дата разработки 00/00/0000 г.-->
<!--Версия 0.0.0.2, дата 29.05.2021 г.-->
<!--Разработка: Солтанов Алекснадр Назимович-->
<!--Контекст печати: f131pe -->
<!-- Задача: SUP-17123 -->
<!-- 35 ддд -->

<html>
<head>{:setPageSize(''A5'') }{:setOrientation(''L'')}{:setLeftMargin(10.0) }{:setTopMargin(7.0) }{:setRightMargin(10.0) }{:setBottomMargin(2.0) }
</head>
<body style=" font-family:''Courier New''; font-size:8pt; font-weight:400; font-style:normal;">


<table width=100% border=0>
<tr>
<td>
<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=50% valign=top>
</td>
<td width=40%></td>
<td valign=top>Приложение №1<br>к приказу Министерства здравоохранения<br>Российской Федерации<br>от 15 декабря 2014 г. № 834н</font></td>
</tr>
</table>
<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=50% valign=top>Наименование медицинской организации</font>
</td>
<td width=30%></td>
<td rowspan="3" valign=top>Код формы по ОКУД__________________<br>Код организациипо ОКПО________________</font></td>
</tr>
</table>

<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=60% valign=top><font style="font-size: 8pt">{currentOrganisation.fullName}
<br>{currentOrganisation.address}</font><br>
<font style="font-size: 16pt">{client.identification}{if: event.externalId}№ списка {event.externalId}{end:}</font></td>
<td width=10%></td>
<td align=center>Медицинская документация<br>Учетная форма № 025/у<br>Утверждена приказом Минздрава России<br>от 15 декабря 2014 г. № 834н</font></td>
</tr>

</table>
<p align=center><strong><font style="font-size: 10pt"> МЕДИЦИНСКАЯ КАРТА<br>ПАЦИЕНТА, ПОЛУЧАЮЩЕГО МЕДИЦИНСКУЮ ПОМОЩЬ<br>АМБУЛАТОРНЫХ УСЛОВИЯХ № </font><font style="font-size: 14pt"> {client.id}</strong></font></p>

<table width=100% border=0>
<tr>
<td >1. Дата заполнения медицинской карты: <font style="font-size: 8pt"> </font/></td>
</tr>
<tr>
<td>2. ФИО <font style="font-size: 20pt"><strong> {client.fullName}</font></strong></td>
</tr>
<tr>
<td>3.  Пол: {client.sex}      4. Дата рождения: <font style="font-size: 14pt"><b>{client.birthDate}</b></font></td>
</tr>
<tr>
<td>5. Место регистрации: {client.regAddress}</td>
</tr>
<tr>
<td>6. Место работы, должность: <font style="font-size: 16pt"><b>{client.work.shortName} {client.work.post}  {client.work.note}</b></font></td>
</tr>
<tr>
<td>7. Полис ОМС: серия <font style="font-size: 14pt">{client.policy.serial}</font> № <font style="font-size: 14pt">{client.policy.number}</font> 8. СНИЛС <font style="font-size: 14pt"> {client.SNILS}</font></td>
</tr>
<tr>
<td>9. Наименование страховой медицинской организации <font style="font-size: 14pt"> {client.policy.insurer} </font/></td>
</tr>
<tr>
<td>10. Код категории льготы_____________  11. Документ <font style="font-size: 14pt"> {client.document.type}</font>: серия <font style="font-size: 14pt"> {client.document.serial}</font> № <font style="font-size: 14pt"> {client.document.number}</font/></td>
</tr>
<tr>
<td><b>12. Заболевания, по поводу которых осуществляется диспансерное наблюдение:</b></td>
</tr>

<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center><b>Дата начала диспансерного наблюдения</b></td>
<td width=20% align=center><b>Дата прекращения диспансерного наблюдения</b></td>
<td width=30% align=center><b>Диагноз</b></td>
<td width=10% align=center><b>Код по МКБ-10</b></td>
<td width=20% align=center><b>Врач</b></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

</table>

</table>



<!--2-->


<div style="page-break-after: always"></div>
<table width=100% border=0>
<tr>
<td>13. Семейное положение: состоит в зарегистрированном браке - 1, не состоит в браке - 2, неизвестно - 3</td>
</tr>
<tr>
<td>14. Образование: профессиональное: высшее - 1, среднее - 2; общее: среднее - 3, основное - 4, начальное - 5; неизвестно - 6. </td>
</tr>
<tr>
<td>15. Занятость: работает - 1, проходит военную службу и приравненную к ней службу - 2; пенсионер(ка) - 4, не работает - 5, прочие - 6. </td>
</tr>
<tr>
<td>16. Инвалидность (первичная, повторная, группа, дата)</td>
</tr>
<tr>
<td>17. Изменение места работы</td>
</tr>
<tr>
<td>18. Изменение места регистрации</td>
</tr>
<tr>
<td>19. Лист записи заключительных (уточненных) диагнозов:</td>
</tr>
<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center>
<b>Дата (число, месяц, год)</b>
</td>
<td width=40% align=center>
<b>Заключительные (уточненные) диагнозы</b>
</td>
<td width=20% align=center>
<b>Установленные впервые или повторно (+/-)</b>
</td>
<td width=20% align=center>
<b>Врач</b>
</td>
</tr>

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
<tr>
<td><b>21. Группа крови _________   22. Rh-фактор _______  23. Аллергические реакции____________________</b></td>
</tr>
<hr>
</table>




<!--3-->

<table width=100%>
<div style="page-break-after: always"></div>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr><td width=100%><b>Вид медицинского осмотра: {if: event.eventType.code == u''106''} </b> предварительный / <big>ПЕРИОДИЧЕСКИЙ</big>{elif: event.eventType.code == u''107''} </b> <big>ПРЕДВАРИТЕЛЬНЫЙ</big> / периодический{end:} <sub>(нужное подчеркнуть)</sub></td></tr>
<tr><td><b>Место работы:</td></tr>
    <tr><td>Предприятие  <font style="font-size: 16pt"><b>{client.work.shortName}</b></font></td></tr>
    <tr><td>Структурное подразделение (цех,участок,отдел и т.п.): <font style="font-size: 16pt"><b>{client.work.note}</b></font></td></tr>
    <tr><td><b>Профессия и/или должность</b> <font style="font-size: 16pt"><b>{client.work.post}</b></font></td></tr>

<tr><td><b>Наименование производственных факторов, вида работ</b> c указанием пунктов </td></tr>
<tr><td>(согласно пр. МЗРФ №29 от 28.01.2021):</td></tr>
    <tr><td><b><u><font style="font-size: 14pt">Приложение</font></u></b> {if:client.work.factors}  {for: i, factor in enumerate(client.work.factors)} {if: u''old'' not in factor.code} <font style="font-size: 14pt"><b> п.: {factor.code} </b></font> {end:} {end:}  {else:} {end:}

    <br>{if:client.work.hurts}  {for: i, hurt in enumerate(client.work.hurts)} {if: u''old'' not in hurt.code}<font style="font-size: 14pt"><b> п.: {hurt.code} </b></font>  {end:} {end:}  {else:} {end:}
</td></tr>
<tr><td width=58%><b>Стаж работы по специальности:{for: i in range(88)}_{end:}</b></td></tr>
    <tr><td width=20%><b>Профмаршрут:{for: i in range(104)}_{end:}</b></td>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
</table>

<!--4-->

<table width=100%>
<div style="page-break-after: always"></div>
<tr><br><br><br><br><br>
<td>
<table STYLE="font-family: Arial; font-size: 10pt; color: black">
<tr>
<td>
<b>РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ И ИНСТРУМЕНТАЛЬНЫХ ИССЛЕДОВАНИЙ</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr>
<td>
<b>ФЛГ №</b>{for: i in range(15)}_{end:}<b> Дата:</b> &laquo;{for: i in range(10)}_{end:}&raquo;&laquo;{for: i in range(10)}_{end:}&raquo;20{for: i in range(10)}_{end:}<b>г.</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td>
<b>Заключение:</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
{for: i in range(6)}
<tr>
<td>
{for: i in range(116)}_{end:}
</td>
</tr>
{end:}
</table>
<table width=100% STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr>
<td>
<b>ЭКГ №</b>{for: i in range(15)}_{end:} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Дата:</b> &laquo;{for: i in range(10)}_{end:}&raquo;&laquo;{for: i in range(10)}_{end:}&raquo;<b>20</b>{for: i in range(10)}_{end:}<b>г.</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td width=10%>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td>
</td>
</tr>
<tr>
<td>
<b>P</b>{for: i in range(9)}_{end:}
</td>
</tr>
<tr>
<td>
<b>PQ</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>QRS</b>{for: i in range(7)}_{end:}
</td>
</tr>
<tr>
<td>
<b>QT</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>RR</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>ЧСС</b>{for: i in range(7)}_{end:}
</td>
</tr>
</table>
</td>
<td width=90% STYLE="font-family: Arial; font-size: 8pt; color: black">
<table>
<tr>
<td>
<b>Заключение:</b>{for: i in range(92)}_{end:}
</td>
</tr>
{for: i in range(8)}
<tr>
<td>
{for: i in range(104)}_{end:}
</td>
</tr>
{end:}
</td>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

<!--5-->

<table width=100% border=0>
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 10pt; color: black"><b align=center>РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ И ИНСТРУМЕНТАЛЬНЫХ ИССЛЕДОВАНИЙ</b><br></td></tr>
{for: x in range(24)}<tr><td STYLE="font-family: Arial; font-size: 8pt; color: black">{for: i in range(118)}_{end:}</td></tr>{end:}
</table>

<!--6-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><b>ЗАКЛЮЧЕНИЯ ВРАЧЕЙ-СПЕЦИАЛИСТОВ</b></u></td></tr>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ТЕРАПЕВТ</b></u></td></tr>
<tr><td>Жалобы{for: i in range(111)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Перенесенные заболевания, вредные привычки{for: i in range(77)}_{end:}</td></tr>
<tr><td><b>Объекивно:</b> состояние{for: i in range(98)}_{end:}</td></tr>
<tr><td>Кожные покровы: обычной окраски, бледные, цианотичные, сухие, влажные, высыпания{for: i in range(42)}_{end:}</td></tr>
<tr><td>Периферич. лимфоузлы: не пальпируются, увеличины{for: i in range(72)}_{end:}</td></tr>
<tr><td>Пульс______уд. в мин.,удовл.качеств,ритмичный,аритмичный {for: i in range(64)}_{end:}</td></tr>
<tr><td>АД______/_____мм рт.ст.,(АД обычное______/_____мм рт. ст, АД max______/_____мм рт.ст)</td></tr>
<tr><td>границы сердца: (не) изменены____________, тоны сердца:ясные, чистые, приглушены,акцент II тона на</td></tr>
<tr><td>аорте, легочной артерии, наличие шума{for: i in range(84)}_{end:}</td></tr>
<tr><td>Дыхание: ЧД____ в мин.,везикулярное, жесткое, ослабленное, хрипы сухие, жужжащие, свистящие,влажные,</td></tr>
<tr><td>______локализация {for: i in range(101)}_{end:}</td></tr>
<tr><td>Живот: обычной формы, участвует в акте дыхания+/-, (без)болезненный при пальпации в эпигастрии, в </td></tr>
<tr><td>мезогастрии, в гипогастрии (справа, слева, по средней линии), в правом подреберье</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Печень:(не) пальпируется, выступает из-под края реберной дуги на____см, край эластичный,плотный, бугристый,</td></tr>
<tr><td>округлый, (без)болезненный{for: i in range(76)}_{end:}</td></tr>
<tr><td>Селезёнка: (не) пальпируется_________,с-м поколачивания по пояснице: +/-, мочеточниковые точки-</td></tr>
<tr><td>(без)болезненные, видимые отеки:____________;Физиологические отправления (со слов):{for: i in range(40)}_{end:}</td></tr>
<tr><td>Диагноз:{for: i in range(111)}_{end:}</td></tr>
<tr><td>  {for: i in range(118)}_{end:}</td></tr>
<tr><td>Заключение:{for: i in range(107)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</table>


<!--7-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>НЕВРОЛОГ</b></u></td></tr>
<tr><td>Жалобы{for: i in range(111)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Черепно-мозговые нервы: {for: i in range(95)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Сухожильные рефлексы: {for: i in range(96)}_{end:}</td></tr>
<tr><td>Патологические рефлексы: {for: i in range(94)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Координационные пробы - норма, интенция, промахивание{for: i in range(67)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>В позе Ромберга - устойчив, покачивание{for: i in range(82)}_{end:}</td></tr>
<tr><td>Тремор-отсутствие,умеренный,выраженный{for: i in range(79)}_{end:}</td></tr>
<tr><td>Кисти рук: кожный рисунок-не изменён, сглажен, ажурный{for: i in range(63)}_{end:}</td></tr>
<tr><td>Цвет кожи-нормальный,цианотичный{for: i in range(75)}_{end:}</td></tr>
<tr><td>Влажность-умеренная, выражения{for: i in range(84)}_{end:}</td></tr>
<tr><td>Симптом "белго пятна"-отрицательный, слабо положительный, положительный.</td></tr>
<tr><td>Скрытый гипергидроз-есть, нет{for: i in range(89)}_{end:}</td></tr>
<tr><td>Двигательные расстройства{for: i in range(92)}_{end:}</td></tr>
<tr><td>Чувствительные растройства-отсутствуют, дистальная гипестезия концевых, средних, основных фаланг</td></tr>
<tr><td>Диагноз:{for: i in range(111)}_{end:}</td></tr>
<tr><td> {for: i in range(118)}_{end:}</td></tr>
<tr><td>Заключение:{for: i in range(107)}_{end:}</td></tr>
{for: x in range(2)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</table>


<!--8-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ХИРУРГ</b></u></td></tr>
<tr><td>Жалобы{for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Динамометрия: правая рука___________________, левая рука___________________</td></tr>
<tr><td>Объективно:{for: i in range(107)}_{end:}</td></tr>
{for: x in range(6)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}
<tr><td>Онкоосмотр:{for: i in range(107)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Диагноз:</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Заключение:{for: i in range(107)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>

</table>

<!-- 9th page -->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ОТОРИНОЛАРИНГОЛОГ</b></u></td></tr>
<tr><td>Жалобы{for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Объективно:</td></tr>
<tr><td>Нос:{for: i in range(114)}_{end:}</td></tr>
<tr><td>Зев:{for: i in range(114)}_{end:}</td></tr>
<tr><td>Гортань:{for: i in range(110)}_{end:}</td></tr>
<tr><td>Ухо:{for: i in range(114)}_{end:}</td></tr>
<tr><td>Барабанная перепонка:{for: i in range(97)}_{end:}</td></tr>
<tr><td>АД:{for: i in range(115)}_{end:}</td></tr>
<tr><td>AS:{for: i in range(115)}_{end:}</td></tr>
<tr><td>Острота слуха АД: ш.р._______________________ р.р._____________________________</td></tr>
<tr><td>Острота слуха AS: ш.р._______________________ р.р._____________________________</td></tr>
<tr><td>Исследование вестибулярного аппарата:{for: i in range(81)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Аудиометрия(по показаниям):</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Диагноз:{for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Заключение:</b>{for: i in range(106)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</table>

<!-- 10th page -->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ОФТАЛЬМОЛОГ</b></u></td></tr>
<tr><td>Жалобы {for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Объективно:{for: i in range(107)}_{end:}</td></tr>
<tr><td>Острота зрения OD{for: i in range(101)}_{end:}</td></tr>
<tr><td>Острота зрения OS{for: i in range(101)}_{end:}</td></tr>
<tr><td>ВГД__________ OD{for: i in range(101)}_{end:}</td></tr>
<tr><td><p align=right> OS{for: i in range(102)}_{end:}</p></td></tr>
<tr><td>Цветоощущение:{for: i in range(103)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Поля зрения:{for: i in range(106)}_{end:}</td></tr><br>
<tr><td><div align=center>OD {for: i in range(55)}&nbsp;{end:}OS</div></td></tr>
<tr><td>Глазное дно:{for: i in range(107)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Диагноз:{for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Заключение:</b>{for: i in range(106)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</table>

<!-- 11th page -->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ДЕРМАТОЛОГ</b></u></td></tr>
<tr><td>Жалобы {for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез:</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Объективно:</td></tr>
{for: i in range(10)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}
<tr><td>Диагноз:</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Заключение:</b>{for: i in range(106)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</tr>
</table>

<!-- 12th page -->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ГИНЕКОЛОГ</b></u></td></tr>
<tr><td>Жалобы {for: i in range(111)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Анамнез: {for: i in range(110)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>Объективно:</td></tr>
{for: i in range(10)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}
<tr><td>Диагноз:</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Заключение:</b>{for: i in range(106)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
</table>

<!--13-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
    <div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>ПСИХИАТР-НАРКОЛОГ</u></b></tr></td>
<tr><td align=left>Жалобы {for: i in range(111)}_{end:}</tr></td>
<tr><td>{for: i in range(2)}{for: i in range(118)}_{end:}{end:}</td></tr>
<tr><td align=left>Анимез:{for: i in range(110)}_{end:}</tr></td>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
        <tr><td><p align=left><u><b>Объективно:</b></u></p></tr></td>
        <tr><td><p>Ориентирован правильно. Настроение ровное. галлюцинаторно-бредовые переживания отсутствуют.
Память, интеллект в норме. Без признаков алкогольной и наркотической интоксикации,зависимости.</p>
        <tr><td>{for: i in range(4)}{for: i in range(118)}_{end:}{end:}</td></tr>
<tr><td>Диагноз:</td></tr>
        <tr><td>{for: i in range(118)}_{end:}</td></tr>
        <tr><td>{for: i in range(118)}_{end:}</td></tr>

        <tr><td><b>Заключение:<i> Медицинских психиатрических и наркологических противопоказаний для работы</i></b><br>
        по пр.№302н прил.1п.п.{for: i in range(97)}_{end:},<br>
        прил.2п.п.{for: i in range(100)}_{end:} <b><i>не имеет.</i></b>
<tr><td><b>Нуждается в направлении на ВК для решения вопроса о профпригодности да/нет</b> <font style="font-size: 4pt">(нужное подчеркнуть)</font></td></tr>
<tr><td>Дата:_________20___г.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Подпись и личная печать врача_____________</td></tr>
        </table>



<!--15-->

<table width=100% border=0>
<div style="page-break-after: always"></div>
<tr><td align=left STYLE="font-family: Arial; font-size: 9pt; color: black"><b><u>ДОПОЛНИТЕЛЬНЫЕ КОНСУЛЬТАЦИИ ВРАЧЕЙ-СПЕЦИАЛИСТОВ</u></b></td></tr><br>
{for: x in range(24)}<tr><td STYLE="font-family: Arial; font-size: 8pt; color: black">{for: i in range(118)}_{end:}</td></tr>{end:}
</table>

<!--16-->

<table align=center width=100% border="0">
<div style="page-break-after: always"></div>
<tr><td align=center STYLE="font-family: Arial; font-size: 9pt; color: black"><u><b>СВЕДЕНИЯ О ПРИНАДЛЕЖНОСТИ К ДИСПАНСЕРНОЙ ГРУППЕ</b></u></td></tr>
<tr><td align=center>(таблица подлежит обязательному заполнению врачами, участвующими в проведении</td></tr>
<tr><td align=center><b>периодического</b> медицинского осмотра)</td></tr>
</table>
<table align=center width=100% border=1 cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr><th width=30%><b>Наименование специалиста врача</b></th><th><b>Дата осмотра</b></th><th><b>Диагноз по МКБ-10</b></th><th><b>Группа здоровья</b></th><th><b>Подпись и печать врача</b></th></tr>
<tr><td align=center><b>Терапевт</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>ЛОР</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>Офтальмолог</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>Хирург</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>Невролог</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>Дерматолог</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td align=center><b>Гинеколог</b><br></td><td></td><td></td><td></td><td></td></tr>
<tr><td>&nbsp;<br></td><td></td><td></td><td></td><td></td></tr>
</table>
<br>
<br>
<table align=center width=100% border="0" STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr><td><b>I группа</b> - практически здоров;</td></tr>
<tr><td><b>II группа</b> - риск развития заболевания, нуждается в проведении профилактических мероприятий;</td></tr>
<tr><td><b>III группа</b> - нуждается в дополнительном обследовании для уточнения(установления) диагноза(впервые</td></tr>
<tr><td>установленное хроническое заболевание) или лечения в амбулаторных условиях;</td></tr>
<tr><td><b>IV группа</b> - нуждается в дополнительном обследовании и лечении в стационарных условиях;</td></tr>
<tr><td><b>V группа</b> - имеет показания для оказания высокотехнологичной медицинской помощи.</td></tr>
</table>

<!--17-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black" align=center><b>ЗАКЛЮЧЕНИЕ</b></td></tr>
<tr><td STYLE="font-family: Arial; font-size:9pt; color: black" align=center><b>ПО РЕЗУЛЬТАТАМ ПРЕДВАРИТЕЛЬНОГО / <big> ПЕРИОДИЧЕСКОГО </big> МЕДИЦИНСКОГО ОСМОТРА</b></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><u><b>Заключение:</b></u> Согласно результатам проведённого медицинского осмотра:</td></tr>
<tr><td><b>не выявлены медицинские противопоказания</b> к работе в соответствии с пр. МЗРФ от 28.01.2021 № 29н<br>пр.</td></tr>
{for: x in range(6)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}<br>
<tr><td align=left><b>Рекомендации:</b></td></tr>
<tr><td>Нуждается в дообследовании{for: i in range(92)}_{end:}</tr></td>
<tr><td>Нуждается в консультации специалиста{for: i in range(83)}_{end:}</tr></td>
<tr><td>Нуждается в «Д» наблюдении{for: i in range(81)}_{end:}</tr></td>
<tr><td>Нуждается в амбулаторном лечении{for: i in range(87)}_{end:}</tr></td>
<tr><td>Нуждается в стационарном лечении{for: i in range(87)}_{end:}</tr></td>
<tr><td>Нуждается в СКЛ{for: i in range(103)}_{end:}</tr></td>
<tr><td>Нуждается в направлении на МСЭ{for: i in range(88)}_{end:}</tr></td>
<tr><td>Нуждается в обследовании в центре профпатологии{for: i in range(73)}_{end:}</tr></td>
<br>
<tr><td>Председатель врачебной комиссии:{for: i in range(43)}&nbsp;{end:}_________________________  <font size=1>(подпись)</font><br></tr></td>
<tr><td><p align=left>М.П.{for: i in range(85)}&nbsp;{end:}<font size=1>Дата выдачи:  «_____»  «___________»  20___г.</font><br></td></tr>
</table>


<!--18-->

<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after : always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black" align=center><b>ЗАКЛЮЧЕНИЕ</b></td></tr>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black" align=center><b>ПО РЕЗУЛЬТАТАМ  ПРЕДВАРИТЕЛЬНОГО / <big> ПЕРИОДИЧЕСКОГО </big>  МЕДИЦИНСКОГО ОСМОТРА</b></td></tr>
<tr><td><p align=left>Заключение (ВК№_________, от «____»  «_____»  20____г.):</p></td></tr>
{for: x in range(12)}<tr><td>{for: i in range(118)}_{end:}</td></tr>{end:}
<tr><td align=left>Рекомендации:</td></tr>
<tr><td>Нуждается в дообследовании{for: i in range(92)}_{end:}</tr></td>
<tr><td>Нуждается в консультации специалиста{for: i in range(83)}_{end:}</tr></td>
<tr><td>Нуждается в «Д» наблюдении{for: i in range(81)}_{end:}</tr></td>
<tr><td>Нуждается в амбулаторном лечении{for: i in range(87)}_{end:}</tr></td>
<tr><td>Нуждается в стационарном лечении{for: i in range(87)}_{end:}</tr></td>
<tr><td>Нуждается в СКЛ{for: i in range(103)}_{end:}</tr></td>
<tr><td>Нуждается в направлении на МСЭ{for: i in range(88)}_{end:}</tr></td>
<tr><td>Нуждается в обследовании в центре профпатологии{for: i in range(73)}_{end:}<br></tr></td>
<tr><td>Председатель врачебной комиссии:{for: i in range(43)}&nbsp;{end:}_________________________  <font size=1>(подпись)</font><br></tr></td>
<tr><td><p align=left>М.П.{for: i in range(85)}&nbsp;{end:}<font size=1>Дата выдачи: «_____»  «___________»  20___г.</font><br></td></tr>
</table>

<table width=100% border=0>
<div style="page-break-after: always"></div>
</table>






<!--Анализы-->
<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>

<table  BORDER = 0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
  <TR>
    <TD WIDTH="40%">
<table width=100% align=right VALIGN="top" border=0>
<tr>
<td>
<table width=100% align=right border=0>
<tr>
<td width=40%>
</td>
<td width=60%><font style="font-size: 14pt">каб. <b>205, 8:30-11:00</b></font></td>
</tr>
</table>
<br>
<table>
<tr>
<td width=30%>
</td>
<td width=70% align=center>АО "Балтийский завод"</td>
</tr>
<tr>
<td width=40% align=center>
</td>
<td width=60% align=center>&laquo;Медико-санитарная часть №3&raquo; </td>
</tr>
</table>
<table>
<tr>
<td width=60% align=center>
</td>
<td width=40% align=center>Анализ №_______
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Ф.И.О. <font style="font-size: 14pt"><b>{client.fullName}</b></font>
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Возраст:{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Место работы <font style="font-size: 14pt"><b>{client.work}</b></font>
</td>
</tr>
</table>

<table width=100%>
<tr>
<td align=center>
<b>Результаты исследования</b>
</td>
</tr>
</table>
<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center>
№
</td>
<td width=40% align=center>
<b>Показатель</b>
</td>
<td width=40% align=center>
<b>Значения</b>
</td>
</tr>



<tr>
<td width=20% align=center>
1
</td>
<td width=40% align=center>
Холестерин <br>
</td>
<td width=40%>
</td>
</tr>

<tr>
<td width=20% align=center>
2
</td>
<td width=40% align=center>
Глюкоза <br>
</td>
<td width=40%>
</td>
</tr>


{for: action in event.actions}{if: action.code == u''14029''}
<tr>
<td width=20% align=center>
3
</td>
<td width=40% align=center>АЛТ
<br>
</td>
<td width=40%>
</td>
</tr>

<tr>
<td width=20% align=center>
4
</td>
<td width=40% align=center>АСТ
<br>
</td>
<td width=40%>
</td>
</tr>
{end:}{end:}

{for: action in event.actions}{if: action.code == u''14030''}
<tr>
<td width=20% align=center>
5
</td>
<td width=40% align=center>Билирубин
<br>
</td>
<td width=40%>
</td>
</tr>

{end:}{end:}
</table>
<table>

<tr>
<td>
Исследование проводил:
</td>
<td align=left>
{for:i in range(20)}_{end:}
</td>
</tr>
</table>
<table>
<tr>
<td width=20%>
&laquo;_________&raquo;
</td>
<td width=30%>
&laquo;{for:i in range(15)}_{end:}&raquo;
</td>
<td width=20%>
20{for:i in range(10)}_{end:}г.
</td>
</tr>
</table>
</td>
</tr>
</table>

</TD>
<TD WIDTH="10%"></TD>
<TD WIDTH="40%">
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 7pt; color: black" BORDER = 0>
<TR><TD align="left" STYLE="font-family: Arial; font-size: 12pt; color: black">кабинет <b>102, 8:30-11:00</b></TD></TR>
<TR><TD align="center"   STYLE="font-family: Arial; font-size: 11pt; color: black"><B> Медико-Санитарная Часть № 3</B></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 10pt; color: black"><b>АНАЛИЗ МОЧИ №</b><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">Ф.И.О.  <font style="font-size: 14pt"><b>{client.fullName}</b></font><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">возраст   <b>{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}</b><HR></TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">место работы <font style="font-size: 14pt"><b> {client.work}</b></font><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">цвет_______________________прозрачность____________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">удельн.вес_________________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">реакция_____________________осадок_________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">белок_____________________г/л  глюкоза________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">кетоновые тела_______________уробилиноиды___________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">желчные кислоты____________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">лейкоциты__________________эритроциты______________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">цилиндры гиалиновые________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">зернистые_____________________восковидные__________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">цилиндроиды________________________________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">эпителий плоский___________________точечный_________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">слизь_____________________бактерии__________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">соль_______________________________________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">{for: action in event.actions}{if: action.code == u''14568''}АЛК или КП_________________________________________________{end:}{end:}</TD></TR><BR/>
<tr><td>Дата______________    {for: i in range(15)}&nbsp;{end:}  Подпись___________</td></tr>
</TD></table>
</TR>

</table>
</table>
<!--Анализы-->

<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
<table  BORDER = 0 WIDTH="100%" cellpadding="20" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
{: flag = False}
{: i = 0}
{for: action in event.actions}{if: u''Прием'' not in action.name and action.code in (''14210'', ''14215'', ''14216'', ''14217'', ''14218'', ''14219'', ''14220'', ''14238'', ''14254'', ''14260'', ''14261'', ''14265'', ''14272'', ''14273'', ''14274'', ''14275'', ''14276'', ''14277'')}
{: i += 1}
{if: flag == False}
<TR>
{end:}
<TD WIDTH="50%" align = center>
    <table width=100% cellspacing=0 border=0>
        <tr>
            <td align=center><b> «МСЧ №3» </b><br>
        Косая линия дом 5, тел/факс 322-10-78<br>
        каб. {action._action.getType().office}<br>
            </td>
        </tr>
        <tr>
            <td align=center>  <u>Направление на исследование</u><br></td>
        </tr>
        <tr>
            <td align=left> Ф.И.О.пациента<br><font style="font-size: 14pt"> <b>{client.fullName}</b> </font></td>
        </tr>
        <tr>
            <td align=left> Место работы <font style="font-size: 14pt"><b>{client.work}</b></font><br></td>
        </tr>
        <tr>
            <td align=center><font style="font-size: 14pt"><b>{action.name}</b></font></td>
        </tr>
        <tr>
            <td  align=center> &nbsp; </td>
        </tr>
        <tr>
            <td  align=left> Дата <u></u> </td>
        </tr>
        <tr>
            <td  align=left> Врач _______ </td>
        </tr>
    </table>
</TD>
{if: flag == True}
    </TR>
    {: flag = False}
{else:}
    {: flag = True}
{end:}
{if: i == 6}
    </TABLE>
    <p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
    <TABLE>
{end:}
{end:}{end:}
</table>
</body>
</html>
', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2015-04-14 11:27:36', 200, '2018-03-07 16:11:47', 371, 'основная2', 'Анализ крови и флюшка', 'f131pe', '', '<!--Начальная дата разработки 00/00/0000 г.-->
<!--Версия 0.0.0.2, дата 29.05.2021 г.-->
<!--Разработка: Солтанов Алекснадр Назимович-->
<!--Контекст печати: f131pe -->
<!-- Задача: SUP-17123 -->
<!-- 35 ддд -->


<html>
<head>
{ setPageSize(''A5'') }
{ setOrientation(''P'') }
{ setLeftMargin(10.0) }
{ setTopMargin(2.0) }
{ setRightMargin(10.0) }
{ setBottomMargin(2.0) }

</head>



<body style="font-family: ''MS Shell Dlg 2''; font-size: 9pt; font-weight: 400; font-style: normal;">

<nobr><span style="white-space: pre"><strong><font style="font-size: 14pt"> кабинет <b>206, 8:30-11:00</b></font></strong></span></nobr>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;font-size: 7pt; " width="100%">
<tr>
    <td width="90%" align="left">
    <nobr><span style="white-space: pre">     МИНЗДРАВ РФ</span></nobr>
    </td>
    <td width="10%" align="left">
    <nobr><font size="70%">Код формы по ОКУД ________</font></nobr>
    </td>
</tr>
<tr>
    <td width="90%" align="left"></td>
    <td width="10%" align="left">
    <font size="70%"><nobr>Код формы по ОКПО <u>{currentOrganisation.OKPO}</u></nobr></font>
    </td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;font-size: 7pt;" width="100%">
<tr>
    <td width="90%" align="left">
        <font size="70%"><nobr> Наименование учреждения</nobr></font>
    </td>
    <td width="10%" align="center">
        <font size="70%"><nobr>Медицинская документация<br>Форма № 224/у</nobr></font>
    </td>
</tr>
<tr>
    <td align="left">
        <font size="70%"><nobr> Лаборатория</nobr></font>
    </td>
    <td align="center">
        <font size="70%"><nobr>Утверждена Минздравом СССР<br>04.10.80 № 1030</nobr></font>
    </td>
</tr>
</table>

<center>
    <nobr><strong>АНАЛИЗ КРОВИ №</strong></nobr><br>
    <nobr><u> «_____»  «___________»  20___г.</u></nobr><br>
    <nobr><font style="font-size: 4pt">Дата взятия биоматериала</font></nobr>
</center>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
<tr>
    <td colspan="2"><nobr>Ф.И.О. <font style="font-size: 14pt"><b>{client.fullName}</b></font></nobr></td>
</tr>
<tr>
    <td colspan="2"><nobr>Возраст <u>{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}</u></nobr></td>
</tr>
<tr>
    <td colspan="2"><nobr>Учреждение <font style="font-size: 14pt"><b>{client.work}</b></font></nobr></td>
</tr>
<tr>
    <td width="40%">Участок ____________________</td>
    <td> Медицинская карта № ____________________</td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" border="1" style="border-style: solid;" width="100%">
<tr>
    <td align="left"   width="30%" rowspan="2" colspan="2"></td>
    <td align="center" width="15%" rowspan="2">Результат</td>
    <td align="center" width="55%" colspan="4">Норма</td>
</tr>
<tr>
    <td align="center" colspan="2" width="30%"><nobr>Единицы СИ</nobr></td>
    <td align="center" colspan="2" width="30%"><nobr>Един., подлеж. замене</nobr></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td>Гемоглобин</td>
        <td><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    <td align="left"></td>
    <td align="center" width="20%"><font size="30%">130,0-160,0<br>120,0-140,0</font></td>
    <td align="center"><font size="30%">г/л</font></td>
    <td align="center"><font size="30%">13,0-16,0<br>12,0-14,0</font></td>
    <td align="center" width="20%"><font size="30%">г%</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td>Эритроциты</td>
        <td><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    </td>
    <td align="left"></td>
    <td align="center"><font size="30%">4,0-5,0<br>3,9-4,7</font></td>
    <td align="center"><font size="30%">.10 12/л</font></td>
    <td align="center"><font size="30%">4,0-5,0<br>3,9-4,7</font></td>
    <td align="center"><font size="30%">млн<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Цветовой показатель</td>
    <td align="left"></td>
    <td align="center"><font size="30%">0,85-1,05</font></td>
    <td align="center"></td>
    <td align="center"><font size="30%">0,85-1,05</font></td>
    <td align="center"></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <font size="70%"><nobr>Среднее содержание<br>гемоглобина в 1 эритроците</nobr></font>
    </td>
    <td align="left"></td>
    <td align="center"><font size="30%">30-35</font></td>
    <td align="center"><font size="30%">пг</font></td>
    <td align="center"><font size="30%">30-35</font></td>
    <td align="center"><font size="30%">пг</font></td>
</tr>
{: flag = True}
{for: action in event.actions} {if: action.code == u''14204'' and flag == True}
<tr>
    <td align="left" colspan="2"> <b>Ретикулоциты</b></td>
    <td align="left"></td>
    <td align="center"><font size="30%">2-10</font></td>
    <td align="center"><font size="30%">‰</font></td>
    <td align="center"><font size="30%">2-10</font></td>
    <td align="center"><font size="30%"><‰</font></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14204'' or action.code == u''14222'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Тромбоциты</b></td>
    <td align="left"></td>
    <td align="center"><font size="30%">180,0-320,0</font></td>
    <td align="center"><font size="30%">.10 9/л</font></td>
    <td align="center"><font size="30%">180,0-320,0</font></td>
    <td align="center"><font size="30%">тыс.<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
{:flag = False}
{end:}{end:}
<tr>
    <td align="left" colspan="2">Лейкоциты</td>
    <td align="left"></td>
    <td align="center"><font size="30%">4,0-9,0</font></td>
    <td align="center"><font size="30%">.10 9/л</font></td>
    <td align="center"><font size="30%">4,0-9,0</font></td>
    <td align="center"><font size="30%">тыс.<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
{: flag = True}
{for: action in event.actions} {if: action.code == u''14205'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Метгемоглобин</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14213'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Карбоксигемоглобин</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14559'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>ВСК</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}

<tr>
    <td align="center" rowspan="4" width="5%">Ней<br>тро<br>филы</td>
    <td align="left" width="25%">Миелоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" >Метамиелоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left">Палочкоядерные</td>
    <td align="center"></td>
    <td align="center"><font size="30%">1-6<br>0,040-0,300</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">1-6<br>40-300</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left">Сегментоядерные</td>
    <td align="center"></td>
    <td align="center"><font size="30%">47-72<br>2,000-5,500</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">47-72<br>2000-5500</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Эозинофилы</td>
    <td align="center"></td>
    <td align="center"><font size="30%">0,5-5<br>0,020-0,300</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">0,5-5<br>20-300</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Базофилы</td>
    <td align="center"></td>
    <td align="center"><font size="30%">0-1<br>0-0,065</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">0-1<br>0-65</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Лимфоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">19-37<br>1,200-3,000</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">19-37<br>1200-3000</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Моноциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">3-11<br>0,090-0,600</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">3-11<br>90-600</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <font size="30%"><nobr>Плазматические клетки</nob></font>
    </td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td align="left">
        <font size="30%"><nobr>Скорость (реакция)<br>оседания эритроцитов</nobr></font>
        </td>
        <td align="left"><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    </td>
    <td align="center"></td>
    <td align="center"><font size="30%">2-10<br>2-15</font>
    </td>
    <td align="center"><font size="30%">мм/ч</font>
    </td>
    <td align="center"><font size="30%">2-10<br>2-15</font>
    </td>
    <td align="center"><font size="30%">мм/ч</font>
    </td>
</tr>
</table>


<!-- Флюшка -->

<div style="page-break-after:always;"></div>
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 10pt; color: black" BORDER =0>
<br><br><tr><td align=center> АO  Балтийский завод</td></tr>
<tr><td align=center> Медико-санитарная часть №3</td></tr>
<tr><td align=center> <big><b> НАПРАВЛЕНИЕ В ФЛЮОРОКАБИНЕТ</b></big></td></tr>
<tr><td align=center><b><font style="font-size: 14pt">
{:office = ''''}
{for: action in event.actions}
    {if: action.code in (u''14023'')}
        {:office = action._action.getType().office}
    {end:}
{end:}
Кабинет
{if: office}
    {office}
{else:}
    Кабинет 105 ,  9:30 - 11:00
{end:}<br>
</td></tr>
<tr><td> ФИО <font style="font-size: 14pt"><b><i>{client.fullName}</i></b></font><hr></td></tr>
<tr><td> Дата рождения  <i> {client.birthDate} </i><hr></td></tr>
<tr><td> Адрес регистрации  <i> {client.regAddress} </i><hr></td></tr>
<tr><td> Адрес проживания  <i> {client.locAddress} </i><hr></td></tr>
<tr><td> Телефон  <i> {client.phones}</i> <hr></td></tr>
<tr><td> Место работы   <font style="font-size: 14pt"><b><i>{client.work.shortName} </i></b></font><hr></td></tr>

</table>


</body>
</html>', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2015-04-14 11:27:52', 200, '2018-11-16 13:00:55', 252, 'основная3', 'Паспорт здоровья', 'f131pe', '', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><<head>
</head>
<body>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{setLeftMargin(20)} {setTopMargin(10)} {setBottomMargin(10)} {setRightMargin(10)}





<table style="font-family: Arial; font-size: 8pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "0">
<body>
<tr><td align=left> АО "Балтийский завод" </td></tr>
<tr><td align=left> "МЕДИКО-САНИТАРНАЯ ЧАСТЬ №3" </td></tr>
<tr><td align=left> 199026, г. Санкт-Петербург, В. О. Косая линия, дом 3, копр. 3, литер А </td></tr>
<tr><td align=left>Код по ОГРН: 1117847498670 </td></tr>
<tr><td align=left> </td></tr>
</tbody>
</table>


<table style="font-family: Arial; font-size: 10pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "0">
<body>
<tr><td align=center>ПАСПОРТ ЗДОРОВЬЯ РАБОТНИКА1 №______________ <br></td></tr>
<tr><td align=center>дата оформления: {currentDate}<br></td></tr>
<tr><td align=left>1. Фамилия &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b> {client.lastName}</b><hr> </td></tr>
<tr><td align=left> Имя &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>{client.firstName}</b> &nbsp; &nbsp; &nbsp;Отчество &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>{client.patrName}</b> <hr></td></tr>
<tr><td align=left>2. Пол &nbsp; &nbsp; &nbsp;<b>{client.sex}</b> &nbsp; &nbsp; &nbsp; 3. Дата рождения &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>{client.birthDate}</b> &nbsp; &nbsp; &nbsp; <hr></td></tr>
<tr><td align=left>4. Паспорт: серия <b> &nbsp; &nbsp; {client.document.serial}</b> &nbsp; &nbsp;номер &nbsp; &nbsp;<b>{client.document.number}</b> &nbsp; &nbsp; дата выдачи: {client.document.date}<hr></td></tr>
<tr><td align=left>кем выдан: &nbsp; &nbsp; {client.document.origin}<br></td></tr>
<hr>
<tr><td align=left>5. Адрес регистрации по месту жительства (пребывания):<br><b>{client.regAddress} </b><hr></td></tr>
<tr><td align=left> телефон &nbsp; &nbsp;<b>{client.phones} </b><hr></td></tr>
<tr><td align=left>6. Номер страхового полиса ОМС <b>{client.policy} </b><hr></td></tr>
<tr><td align=left>7. Место работы (наименования работадателя) <b>{client.work.shortName}</b> <hr></td></tr>
<tr><td align=left>7.1 Форма собственности и вид экономической деятельности работодателя по ОКВЭД <br></td></tr>
<hr>
<tr><td align=left> 7.2 Наименование структурного подразделения работодателя (при наличии)<br></td></tr>
<hr>
<tr><td align=left>8. Наименование должности (профессии) или вида работы <b> {client.work.post}</b></td></tr>
<hr>
<tr><td align=left>9. Условия труда (в настоящее время):</td></tr>
</tbody>
</table>
<br>


<table style="font-family: Arial; font-size: 8pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "1">
<body>
<tr><td align=center> Наименование вредного производственого фактора или вида работы (пункт приказа № 302н)</td><td align=center>Класс и подкласс условий труда при работе с вредным производственным фактором и видом работы </td><td align=center>Стаж работы с вредным производственным фактором и видом работы </td></tr>

{if:client.work.factors} {for: i, factor in enumerate(client.work.factors)}

</td></tr>
<tr>
<td align=left><font style="font-size: 10pt"><b>пр.1 п.{factor.code}</b></font></td>
<td align=center> </td>
<td align=center> </td>
</tr> {end:} {else:} {end:}


{if:client.work.hurts} {for: i, hurt in enumerate(client.work.hurts)}{if: u''old'' not in hurt.code}
</td></tr>
<tr>
<td align=left><font style="font-size: 10pt"><b>пр.2 п.{hurt.code}</b></font></td>
<td align=center> </td>
<td align=center> </td>
</tr>{end:}{end:}{else:}{ end:}
</tbody>
</table>
<br>
</body></html>
<div style="page-break-after: always"></div>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Документ без названия</title>
</head>
</head>
<body>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{setLeftMargin(20)} {setTopMargin(10)} {setBottomMargin(10)} {setRightMargin(10)}

<table style="font-family: Arial; font-size: 10pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "0">
<body>/периодического
<tr><td align=left>11. Заключение врачей специалистов, принимавших участие в проведении предварительного/периодического медицинского осмотра работника: </td></tr>
</tbody>
</table>

<table style="font-family: Arial; font-size: 8pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "1">
<body>
<tr><td align=center; width="20%">Наименование специальности врача</td><td align=center; width="20%">Дата осмотра </td><td align=center; width="60%">Заключение</td></tr>
<tr><td align=center>ТЕРАПЕВТ</td><td align=center> </td><td align=left>Годен (на) </td></tr>
<tr><td align=center>НЕВРОЛОГ</td><td align=center> </td><td align=left> Годен (на) </td></tr>
<tr><td align=center>ХИРУРГ</td><td align=center> </td><td align=left> Годен (на) </td></tr>
<tr><td align=center>ЛОР</td><td align=center> </td><td align=left> Годен (на) </td></tr>
<tr><td align=center>ОФТАЛЬМОЛОГ</td><td align=center> </td><td align=left> Годен (на) </td></tr>
<tr><td align=center>ДЕРМАТОВЕНЕРОЛОГ</td><td align=center> </td><td align=left>Годен (на) </td></tr>
<tr><td align=center>ГИНЕКОЛОГ</td><td align=center> </td><td align=left>Годен (на) </td></tr>
<tr><td align=center>ПСИХИАТР-НАРКОЛОГ</td><td align=center> </td><td align=left> Медицинских психиатрических и наркологических проитвопоказаний для работы_____________ не имеет </td></tr>
<tr><td align=center>СТОМАТОЛОГ</td><td align=center> </td><td align=left> </td></tr>
</tbody>
</table>
<br>
<table style="font-family: Arial; font-size: 10pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "0">
<body>
<tr><td align=left>12. Результаты лабороторных и инструметальных исследваний: </td></tr>
</tbody>
</table>
<table style="font-family: Arial; font-size: 8pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "1">
<body>
<tr>
<td align=center width="25%">Наименование исследования</td>
<td align=center width="15%">Дата проведения </td>
<td align=center width="60%">Результат исследования</td>
</tr>


<tr>
<td align=left>1. ФЛГ №_______ <br><br>
Rg №_________</td>
<td align=center></td>
<td align=center></td>
</tr>

<tr>
<td align=left>2. ЭКГ №________<br><br><br></td>
<td align=center></td>
<td align=center></td>
</tr>

<tr>
<td align=left>3. Анализ крови</td>
<td align=center></td>
<td align=left>
<ul>
<li>Глюкоза</li>
<li>Гемоглобин</li>
<li>Холестерин</li>
<li>Эритроциты</li>
<li>Цветовой показатель</li>
<li>Тромбоциты</li>
<li>Ретикулоциты</li>
<li>Лейкоциты</li>
<li>Палочкоядерные</li>
<li>Сегментноядерные</li>
<li>Эозинофилы</li>
<li>Лимфоциты</li>
<li>Моноциты</li>
<li>Скорость (реакции) оседания эритроцитов</li>
<li>АЛТ</li>
<li>АСТ</li>
<li>Билирубин</li>
</ul>
</td>
</tr>

<tr>
<td align=left>4.Анализ мочи</td>
<td align=center></td>
<td align=left>
<ul type="square">
<li>Цвет</li>
<li>Прозрачность</li>
<li>Относительная плотность</li>
<li>Реакция</li>
<li>Белок </li>
<li>Глюкоза</li>
<li>Кетоновые тела</li>
<li>Уробилиноиды</li>
<li>Эпителий плоский</li>
<li>Лейкоциты</li>
<li>Эритроциты</li>
<li>Слизь</li>
<li>Соли</li>
<li>Бактерии</li>
</ul>
</td>
</tr>

<tr>
<td align=left>5. Спирометрия (ФВД)<br></td>
<td align=center></td>
<td align=center></td>
</tr>

<tr>
<td align=left>6. УЗИ<br></td>
<td align=center></td>
<td align=center></td>
</tr>

<tr>
<td align=left>7. Мазки (флора и атипичные клетки)<br></td>
<td align=center></td>
<td align=center></td>
</tr>

<tr>
<td align=left>8.Паллестезиометрия (ВТ)<br></td>
<td align=center></td>
<td align=center></td>
</tr>

</tbody>
</table>


<table width=100% border=0 STYLE="font-family: Arial; font-size: 8pt; color: black">
<div style="page-break-after: always"></div>
<tr><td STYLE="font-family: Arial; font-size: 9pt; color: black" align=center><b>ЗАКЛЮЧЕНИЕ</b></td></tr>
<tr><td STYLE="font-family: Arial; font-size:9pt; color: black" align=center><b>ПО РЕЗУЛЬТАТАМ ПРЕДВАРИТЕЛЬНОГО / ПЕРИОДИЧЕСКОГО МЕДИЦИНСКОГО ОСМОТРА</b></td></tr>
<tr><td>&nbsp;</td></tr>
<td align=justify BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 16; color: black"><big><u><b>Заключение:</b></u> Согласно результатам проведенного медицинского осмотра:<br/>
<b>не выявлены медицинские противопоказания</b> к работе в соответствии с пр. МЗСР РФ от 12.04.2011 № 302н
пр.
<tr>
<td>
{if:client.work.factors}
<b><u>Приложение №1 п.:</u></b>
{for: i, factor in enumerate(client.work.factors)}
<b>{factor.code};&nbsp;</b>
{end:}
{else:}
{end:}
<br/>
{if:client.work.hurts}
<b><u>Приложение №2 п.:</u></b>
{for: i, hurt in enumerate(client.work.hurts)}{if: u''old'' not in hurt.code} <b>{hurt.code};&nbsp;</b>{end:}
{end:}
{else:}
{end:}
</td>
</tr>
</td><br/><br/>
Рекомендации:<br/>
Нуждается в дообследовании ______________________________________________________________________<br/>
Нуждается в консультации специалиста ______________________________________________________________<br/>
Нуждается в «Д» наблюдении ______________________________________________________________________<br/>
Нуждается в амбулаторном лечении _________________________________________________________________<br/>
Нуждается в стационарном лечении _________________________________________________________________<br/>
Нуждается в СКЛ _______________________________________________________________________________<br/>
Нуждается в направлении на МСЭ __________________________________________________________________<br/>
Нуждается в обследовании в центре профпатологии _____________________________________________________<br/>
<br/>
<tr><td>Председатель врачебной комиссии:{for: i in range(43)}&nbsp;{end:}_________________________ <font size=1>(подпись)</font><br></tr></td>
<tr><td><p align=left>М.П.{for: i in range(85)}&nbsp;{end:}<font size=1>Дата выдачи: «_____» «___________» 20___г.</font><br></td></tr>
</table>


<table style="font-family: Arial; font-size: 10pt; color: black;" border="0"; margin:15; cellpadding="0"; cellspacing="0"; width="100%"; border = "0">
<body>
<tr><td align=left></td><td align=center>(подпись) </td><td align=center>(Ф.И.О.) </td></tr>
<tr><td align=left>М.П.</td><td align=left> </td><td align=left> </td></tr>

</tbody>
</table>



</body></html>


', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2016-01-12 14:46:26', 200, '2021-05-31 14:01:18', 371, '02', 'Маршрутный лист', 'f131pe', '', '<!--Начальная дата разработки 00.00.0000 г.-->
<!--Версия 0.0.0.3, дата 31.05.2021  г.-->
<!--Разработка: Солтанов Александр Назимович-->
<!--Контекст печати: f131pe -->
<!--Задача: SUP-17123 -->
<!--34 ддд -->

<HTML><BODY>
{:setPageSize(''A5'')}
{:setOrientation(''L'')}
{:setLeftMargin(2)}
{:setTopMargin(2)}
{:setBottomMargin(2)}
{:setRightMargin(60)}
<table cellpadding=0 cellspacing=0 border=0 width=100%><tr><td >
<H3><left>МАРШРУТНЫЙ ЛИСТ</center></H3>


<TABLE  WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="0"  cellspacing=0 STYLE="font-family: Arial; font-size: 10pt; color: black">
  <TR>
  <TH WIDTH="60%"> Наименование Каб.</TH>
  </TR>
  <TR><TD> Прием терапевта <b>309/320, 8:30 - 12:00</b></TD></TR>
  <TR><TD> Прием невролога <b>312/310, 9:00 - 12:00</b></TD></TR>
  {if: event.eventType.code == u''107''} <TR><TD>Прием психиатра-нарколога <b>209 09:00 - 12:00</b></TD></TR>{end:}
  {if: event.eventType.code == u''106''} <TR><TD>Прием психиатра <b>209 09:00 - 12:00</b></TD></TR>{end:}
{: flag = 0}

  {for: i, action in enumerate(event.actions) }

    {if: action.code in (u''14001'',u''14002'',u''14003'',u''14004'',u''14005'',u''14006'',u''14007'',u''14008'',u''14009'',u''14011'',u''14012'',u''14013'',u''14014'',u''14015'',u''14018'',u''14020'',u''14023'',u''14028'',u''14031'',u''14033'',u''14034'',u''14558'',u''14561'',u''14562'',u''14563'',u''14564'',u''14565'',u''14566'',u''14567'',u''52001_1'',u''14226'') or (action.group.code == u''*01_1'' and u''Прием'' in action.name and action.code != u''14301'') or action.code in (u''14214'',  u''14227'', u''14202'') and action.code not in (u''14022'', u''14201'')}
      <TR>
      <TD > {action.name} <b>{action._action.getType().office} </b></TD>
      </TR>
    {end:}
    {if: action.code == ''14211''}
      <TR>
      <TD > {action.name} <b>{action._action.getType().office} </b></TD>
      </TR>
    {end:}

    {if: action.code == u''14015_1''}
      {: flag = 1}
    {end:}

  {end:}

    {if: client.sex == u''Ж''}<TR> <TD > УЗИ малого таза <b>322, 327/324</b></TD></TR>{end:}
  {if: flag == 0}
    <TR>
      <TD > ЭКГ <b> 314, 9:30 - 12:30</b></TD>
    </TR>
  {end:}

  {for: i, action in enumerate(event.actions) }

    {if: action.code in (u''14022'', u''14201'')}
      <TR>
      <TD > {action.name} <b>{action._action.getType().office} </b></TD>
      </TR>
    {end:}

  {end:}

  <TR> <TD> Рентген грудной клетки в 2-х проекциях <b>105, 9:30 - 11:00</b></TD></TR>
  <TR> <TD> Клинический анализ крови <b>206, 8:30-11:00</b></TD></TR>
  <TR> <TD> Анализ мочи общий <b>102, 8:30-11:00</b></TD></TR>
  <TR>
      <TD> Биохимический анализ крови <b>205 каб, 8:30-11:00</b></TD>
    </TR>

{: age = client.age}
{:num = [''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''0'']}
{:ageInt = ''''}

{for: symbol in age}
  {if: symbol in num}
    {:ageInt = ageInt + symbol}
  {end:}
{end:}

{:ageInt = int(ageInt)}


    {if: client.sex == ''Ж''}
    <TR>
      <TD>Гинеколог <b>каб 326,  09:00-11:30</b></TD>
    </TR>
    {if: ageInt > 39}
    <tr>
      <td>
        УЗИ молочных желез <b>каб 322 или 327/324</b>
      </td>
    </tr>
    {end:}
    {end:}

</TABLE>


</td>
</tr>
</table>

</BODY></HTML>', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2016-01-21 15:18:44', 200, '2020-11-02 13:33:14', 408, 'основная2_1', 'Анализ крови и флюшка 2', 'f131pe', '', '<!--Начальная дата разработки 00/00/0000 г.-->
<!--Версия 0.0.0.2, дата 29.05.2021 г.-->
<!--Разработка: Солтанов Алекснадр Назимович-->
<!--Контекст печати: f131pe -->
<!-- Задача: SUP-17123 -->
<!-- 35 ддд -->

<html>
<head>
{ setPageSize(''A5'') }
{ setOrientation(''P'') }
{ setLeftMargin(10.0) }
{ setTopMargin(2.0) }
{ setRightMargin(10.0) }
{ setBottomMargin(2.0) }

</head>



<body style="font-family: ''MS Shell Dlg 2''; font-size: 9pt; font-weight: 400; font-style: normal;">

<nobr><span style="white-space: pre"><strong><font style="font-size: 14pt"> кабинет <b> 206, 8:30-11:00</b> </font></strong></span></nobr>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;font-size: 7pt; " width="100%">
<tr>
    <td width="90%" align="left">
    <nobr><span style="white-space: pre">     МИНЗДРАВ РФ</span></nobr>
    </td>
    <td width="10%" align="left">
    <nobr><font size="70%">Код формы по ОКУД ________</font></nobr>
    </td>
</tr>
<tr>
    <td width="90%" align="left"></td>
    <td width="10%" align="left">
    <font size="70%"><nobr>Код формы по ОКПО <u>{currentOrganisation.OKPO}</u></nobr></font>
    </td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;font-size: 7pt;" width="100%">
<tr>
    <td width="90%" align="left">
        <font size="70%"><nobr> Наименование учреждения</nobr></font>
    </td>
    <td width="10%" align="center">
        <font size="70%"><nobr>Медицинская документация<br>Форма № 224/у</nobr></font>
    </td>
</tr>
<tr>
    <td align="left">
        <font size="70%"><nobr> Лаборатория</nobr></font>
    </td>
    <td align="center">
        <font size="70%"><nobr>Утверждена Минздравом СССР<br>04.10.80 № 1030</nobr></font>
    </td>
</tr>
</table>

<center>
    <nobr><strong>АНАЛИЗ КРОВИ №</strong></nobr><br>
    <nobr><u> «_____»  «___________»  20___г.</u></nobr><br>
    <nobr><font style="font-size: 4pt">Дата взятия биоматериала</font></nobr>
</center>

<table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
<tr>
    <td colspan="2"><nobr>Ф.И.О. <font style="font-size: 14pt"><b>{client.fullName}</b></font></nobr></td>
</tr>
<tr>
    <td colspan="2"><nobr>Возраст <u>{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}</u></nobr></td>
</tr>
<tr>
    <td colspan="2"><nobr>Учреждение <font style="font-size: 14pt"><b>{client.work}</b></font></nobr></td>
</tr>
<tr>
    <td width="40%">Участок ____________________</td>
    <td> Медицинская карта № ____________________</td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" border="1" style="border-style: solid;" width="100%">
<tr>
    <td align="left"   width="30%" rowspan="2" colspan="2"></td>
    <td align="center" width="15%" rowspan="2">Результат</td>
    <td align="center" width="55%" colspan="4">Норма</td>
</tr>
<tr>
    <td align="center" colspan="2" width="30%"><nobr>Единицы СИ</nobr></td>
    <td align="center" colspan="2" width="30%"><nobr>Един., подлеж. замене</nobr></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td>Гемоглобин</td>
        <td><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    <td align="left"></td>
    <td align="center" width="20%"><font size="30%">130,0-160,0<br>120,0-140,0</font></td>
    <td align="center"><font size="30%">г/л</font></td>
    <td align="center"><font size="30%">13,0-16,0<br>12,0-14,0</font></td>
    <td align="center" width="20%"><font size="30%">г%</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td>Эритроциты</td>
        <td><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    </td>
    <td align="left"></td>
    <td align="center"><font size="30%">4,0-5,0<br>3,9-4,7</font></td>
    <td align="center"><font size="30%">.10 12/л</font></td>
    <td align="center"><font size="30%">4,0-5,0<br>3,9-4,7</font></td>
    <td align="center"><font size="30%">млн<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Цветовой показатель</td>
    <td align="left"></td>
    <td align="center"><font size="30%">0,85-1,05</font></td>
    <td align="center"></td>
    <td align="center"><font size="30%">0,85-1,05</font></td>
    <td align="center"></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <font size="70%"><nobr>Среднее содержание<br>гемоглобина в 1 эритроците</nobr></font>
    </td>
    <td align="left"></td>
    <td align="center"><font size="30%">30-35</font></td>
    <td align="center"><font size="30%">пг</font></td>
    <td align="center"><font size="30%">30-35</font></td>
    <td align="center"><font size="30%">пг</font></td>
</tr>
{: flag = True}
{for: action in event.actions} {if: action.code == u''14204'' and flag == True}
<tr>
    <td align="left" colspan="2"> <b>Ретикулоциты</b></td>
    <td align="left"></td>
    <td align="center"><font size="30%">2-10</font></td>
    <td align="center"><font size="30%">‰</font></td>
    <td align="center"><font size="30%">2-10</font></td>
    <td align="center"><font size="30%"><‰</font></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14204'' or action.code == u''14222'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Тромбоциты</b></td>
    <td align="left"></td>
    <td align="center"><font size="30%">180,0-320,0</font></td>
    <td align="center"><font size="30%">.10 9/л</font></td>
    <td align="center"><font size="30%">180,0-320,0</font></td>
    <td align="center"><font size="30%">тыс.<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
{:flag = False}
{end:}{end:}
<tr>
    <td align="left" colspan="2">Лейкоциты</td>
    <td align="left"></td>
    <td align="center"><font size="30%">4,0-9,0</font></td>
    <td align="center"><font size="30%">.10 9/л</font></td>
    <td align="center"><font size="30%">4,0-9,0</font></td>
    <td align="center"><font size="30%">тыс.<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
{: flag = True}
{for: action in event.actions} {if: action.code == u''14205'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Метгемоглобин</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14213'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>Карбоксигемоглобин</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}
{: flag = True}
{for: action in event.actions} {if: action.code == u''14559'' and flag == True}
<tr>
    <td align="left" colspan="2"><b>ВСК</b></td>
    <td align="left"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center"></td>
</tr>
{:flag = False}
{end:}{end:}

<tr>
    <td align="center" rowspan="4" width="5%">Ней<br>тро<br>филы</td>
    <td align="left" width="25%">Миелоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" >Метамиелоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left">Палочкоядерные</td>
    <td align="center"></td>
    <td align="center"><font size="30%">1-6<br>0,040-0,300</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">1-6<br>40-300</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left">Сегментоядерные</td>
    <td align="center"></td>
    <td align="center"><font size="30%">47-72<br>2,000-5,500</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">47-72<br>2000-5500</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Эозинофилы</td>
    <td align="center"></td>
    <td align="center"><font size="30%">0,5-5<br>0,020-0,300</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">0,5-5<br>20-300</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Базофилы</td>
    <td align="center"></td>
    <td align="center"><font size="30%">0-1<br>0-0,065</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">0-1<br>0-65</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Лимфоциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">19-37<br>1,200-3,000</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">19-37<br>1200-3000</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">Моноциты</td>
    <td align="center"></td>
    <td align="center"><font size="30%">3-11<br>0,090-0,600</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">3-11<br>90-600</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <font size="30%"><nobr>Плазматические клетки</nob></font>
    </td>
    <td align="center"></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>.10 9./л</font></td>
    <td align="center"><font size="30%">.<br>.</font></td>
    <td align="center"><font size="30%">%<br>в 1 мм<sup>3</sup>(мкл)</font></td>
</tr>
<tr>
    <td align="left" colspan="2">
    <table cellpadding="0" cellspacing="0" border="0" style="border-style: dotted;" width="100%">
    <tr>
        <td align="left">
        <font size="30%"><nobr>Скорость (реакция)<br>оседания эритроцитов</nobr></font>
        </td>
        <td align="left"><font size="30%">М<br>Ж</font></td>
    </tr>
    </table>
    </td>
    <td align="center"></td>
    <td align="center"><font size="30%">2-10<br>2-15</font>
    </td>
    <td align="center"><font size="30%">мм/ч</font>
    </td>
    <td align="center"><font size="30%">2-10<br>2-15</font>
    </td>
    <td align="center"><font size="30%">мм/ч</font>
    </td>
</tr>
</table>


<!-- Флюшка -->

<div style="page-break-after:always;"></div>
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 10pt; color: black" BORDER =0>
<br><br><tr><td align=center> АO  Балтийский завод</td></tr>
<tr><td align=center> Медико-санитарная часть №3</td></tr>
<tr><td align=center> <big><b> НАПРАВЛЕНИЕ В ФЛЮОРОКАБИНЕТ</b></big></td></tr>
<tr><td align=center><b><font style="font-size: 14pt">
{:office = ''''}
{for: action in event.actions}
  {if: action.code in (u''14023'')}
    {:office = action._action.getType().office}
  {end:}
{end:}
Кабинет
{if: office}
  {office}
{else:}
  Кабинет 105 ,  9:30 - 11:00
{end:}
<br>
</td></tr>
<tr><td> ФИО <font style="font-size: 14pt"><b><i>{client.fullName}</i></b></font><hr></td></tr>
<tr><td> Дата рождения  <i> {client.birthDate} </i><hr></td></tr>
<tr><td> Адрес регистрации  <i> {client.regAddress} </i><hr></td></tr>
<tr><td> Адрес проживания  <i> {client.locAddress} </i><hr></td></tr>
<tr><td> Телефон  <i> {client.phones}</i> <hr></td></tr>
<tr><td> Место работы   <font style="font-size: 14pt"><b><i>{client.work.shortName} </i></b></font><hr></td></tr>

</table>

</body>
</html>', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2016-01-21 15:40:06', 200, '2018-03-20 16:36:46', 371, 'основная_1', 'Амбулаторная карта+ Анализы Периодический осмотр 2', 'f131pe', '', '<html>
<head>{:setPageSize(''A5'') }{:setOrientation(''L'')}{:setLeftMargin(10.0) }{:setTopMargin(7.0) }{:setRightMargin(10.0) }{:setBottomMargin(2.0) }
</head>
<body style=" font-family:''Courier New''; font-size:8pt; font-weight:400; font-style:normal;">


<table width=100% border=0>
<tr>
<td>
<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=50% valign=top>
</td>
<td width=40%></td>
<td valign=top>Приложение №1<br>к приказу Министерства здравоохранения<br>Российской Федерации<br>от 15 декабря 2014 г. № 834н</font></td>
</tr>
</table>
<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=50% valign=top>Наименование медицинской организации</font>
</td>
<td width=30%></td>
<td rowspan="3" valign=top>Код формы по ОКУД__________________<br>Код организациипо ОКПО________________</font></td>
</tr>
</table>

<table width=100% border=0 STYLE="font-family: Arial; font-size: 6pt; color: black">
<tr>
<td width=60% valign=top><font style="font-size: 8pt"><b>{currentOrganisation.fullName}
<br>{currentOrganisation.address}/199026</font> <b> КОД по ОГРН:{currentOrganisation.OGRN}</b><br>
<font style="font-size: 16pt">{client.identification}{if: event.externalId}№ списка {event.externalId}{end:}</font></td>
<td width=10%></td>
<td align=center>Медицинская документация<br>Учетная форма № 025/у<br>Утверждена приказом Минздрава России<br>от 15 декабря 2014 г. № 834н</font></td>
</tr>

</table>
<p align=center><strong><font style="font-size: 10pt"> МЕДИЦИНСКАЯ КАРТА<br>ПАЦИЕНТА, ПОЛУЧАЮЩЕГО МЕДИЦИНСКУЮ ПОМОЩЬ<br>АМБУЛАТОРНЫХ УСЛОВИЯХ № </font><font style="font-size: 14pt"> {client.id}</strong></font></p>

<table width=100% border=0>
<tr>
<td >1. Дата заполнения медицинской карты: <font style="font-size: 8pt"> </font/></td>
</tr>
<tr>
<td>2. ФИО <font style="font-size: 20pt"><strong> {client.fullName}</font></strong></td>
</tr>
<tr>
<td>3.  Пол: {client.sex}      4. Дата рождения: <font style="font-size: 14pt"><b>{client.birthDate}</b></font></td>
</tr>
<tr>
<td>5. Место регистрации: {client.regAddress}</td>
</tr>
<tr>
<td>6. Место работы, должность: <font style="font-size: 16pt"><b>{client.work.shortName} {client.work.post}  {client.work.note}</b></font></td>
</tr>
<tr>
<td>7. Полис ОМС: серия <font style="font-size: 14pt">{client.policy.serial}</font> № <font style="font-size: 14pt">{client.policy.number}</font> 8. СНИЛС <font style="font-size: 14pt"> {client.SNILS}</font></td>
</tr>
<tr>
<td>9. Наименование страховой медицинской организации <font style="font-size: 14pt"> {client.policy.insurer} </font/></td>
</tr>
<tr>
<td>10. Код категории льготы_____________  11. Документ <font style="font-size: 14pt"> {client.document.type}</font>: серия <font style="font-size: 14pt"> {client.document.serial}</font> № <font style="font-size: 14pt"> {client.document.number}</font/></td>
</tr>
<tr>
<td><b>12. Заболевания, по поводу которых осуществляется диспансерное наблюдение:</b></td>
</tr>

<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center><b>Дата начала диспансерного наблюдения</b></td>
<td width=20% align=center><b>Дата прекращения диспансерного наблюдения</b></td>
<td width=30% align=center><b>Диагноз</b></td>
<td width=10% align=center><b>Код по МКБ-10</b></td>
<td width=20% align=center><b>Врач</b></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

</table>

</table>


<!--2-->


<div style="page-break-after: always"></div>
<table width=100% border=0>
<tr>
<td>13. Семейное положение: состоит в зарегистрированном браке - 1, не состоит в браке - 2, неизвестно - 3</td>
</tr>
<tr>
<td>14. Образование: профессиональное: высшее - 1, среднее - 2; общее: среднее - 3, основное - 4, начальное - 5; неизвестно - 6. </td>
</tr>
<tr>
<td>15. Занятость: работает - 1, проходит военную службу и приравненную к ней службу - 2; пенсионер(ка) - 4, не работает - 5, прочие - 6. </td>
</tr>
<tr>
<td>16. Инвалидность (первичная, повторная, группа, дата)</td>
</tr>
<tr>
<td>17. Изменение места работы</td>
</tr>
<tr>
<td>18. Изменение места регистрации</td>
</tr>
<tr>
<td>19. Лист записи заключительных (уточненных) диагнозов:</td>
</tr>
<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center>
<b>Дата (число, месяц, год)</b>
</td>
<td width=40% align=center>
<b>Заключительные (уточненные) диагнозы</b>
</td>
<td width=20% align=center>
<b>Установленные впервые или повторно (+/-)</b>
</td>
<td width=20% align=center>
<b>Врач</b>
</td>
</tr>

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
<tr>
<td><b>21. Группа крови _________   22. Rh-фактор _______  23. Аллергические реакции____________________</b></td>
</tr>
<hr>
</table>



<!--3-->

<table width=100%>
<div style="page-break-after: always"></div>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr><td width=100%><b>Вид медицинского осмотра: </b> {if: event.eventType.code == u''106''} предварительный / <big>ПЕРИОДИЧЕСКИЙ</big>{elif: event.eventType.code == u''107''} <big>ПРЕДВАРИТЕЛЬНЫЙ</big> / периодический{end:</sub></td></tr>
<tr><td><b>Место работы:</td></tr>
    <tr><td>Предприятие  <font style="font-size: 16pt"><b>{client.work.shortName}</b></font></td></tr>
    <tr><td>Структурное подразделение (цех,участок,отдел и т.п.): <font style="font-size: 16pt"><b>{client.work.note}</b></font></td></tr>
    <tr><td><b>Профессия и/или должность</b> <font style="font-size: 16pt"><b>{client.work.post}</b></font></td></tr>

<tr><td><b>Наименование производственных факторов, вида работ</b> c указанием пунктов </td></tr>
<tr><td>(согласно пр. МЗРФ №29 от 28.01.2021):</td></tr>
    <tr><td><b><u><font style="font-size: 14pt">Приложение</font></u></b> {if:client.work.factors}  {for: i, factor in enumerate(client.work.factors)} <font style="font-size: 14pt"><b> п.: {factor.code} </b></font>  {end:}  {else:} {end:}<br>
    {if:client.work.hurts}  {for: i, hurt in enumerate(client.work.hurts)} {if: u''old'' not in hurt.code}<font style="font-size: 14pt"><b> п.: {hurt.code} </b></font>  {end:} {end:}  {else:} {end:}
</td></tr>
<tr><td width=58%><b>Стаж работы по специальности:{for: i in range(88)}_{end:}</b></td></tr>
    <tr><td width=20%><b>Профмаршрут:{for: i in range(104)}_{end:}</b></td>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
<tr><td>{for: i in range(118)}_{end:}</td></tr>
</table>

<!--4-->

<table width=100%>
<div style="page-break-after: always"></div>
<tr><br><br><br><br><br>
<td>
<table STYLE="font-family: Arial; font-size: 10pt; color: black">
<tr>
<td>
<b>РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ И ИНСТРУМЕНТАЛЬНЫХ ИССЛЕДОВАНИЙ</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr>
<td>
<b>ФЛГ №</b>{for: i in range(15)}_{end:}<b> Дата:</b> &laquo;{for: i in range(10)}_{end:}&raquo;&laquo;{for: i in range(10)}_{end:}&raquo;20{for: i in range(10)}_{end:}<b>г.</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td>
<b>Заключение:</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
{for: i in range(6)}
<tr>
<td>
{for: i in range(116)}_{end:}
</td>
</tr>
{end:}
</table>
<table width=100% STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr>
<td>
<b>ЭКГ №</b>{for: i in range(15)}_{end:} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Дата:</b> &laquo;{for: i in range(10)}_{end:}&raquo;&laquo;{for: i in range(10)}_{end:}&raquo;<b>20</b>{for: i in range(10)}_{end:}<b>г.</b>
</td>
</tr>
</table>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td width=10%>
<table width=100% STYLE="font-family: Arial; font-size: 8pt; color: black">
<tr>
<td>
</td>
</tr>
<tr>
<td>
<b>P</b>{for: i in range(9)}_{end:}
</td>
</tr>
<tr>
<td>
<b>PQ</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>QRS</b>{for: i in range(7)}_{end:}
</td>
</tr>
<tr>
<td>
<b>QT</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>RR</b>{for: i in range(8)}_{end:}
</td>
</tr>
<tr>
<td>
<b>ЧСС</b>{for: i in range(7)}_{end:}
</td>
</tr>
</table>
</td>
<td width=90% STYLE="font-family: Arial; font-size: 8pt; color: black">
<table>
<tr>
<td>
<b>Заключение:</b>{for: i in range(92)}_{end:}
</td>
</tr>
{for: i in range(8)}
<tr>
<td>
{for: i in range(104)}_{end:}
</td>
</tr>
{end:}
</td>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>


<!--Согласие-->

{if: event.eventType.code == u''106''}
<div style="page-break-after: always"></div>
<table width=100% align=left STYLE="font-family: Arial; font-size: 9pt; color: black">
<tr>
<td>
<table width=100% align=center>
<tr>
<td align=right>ПРИЛОЖЕНИЕ №2
</td>
</tr>
<tr>
<td align=right>Форма
</td>
</tr>
</table>
<table width=100% align=center>
<tr>
<TD align=center width=100%>ИНФОРМИРОВАННОЕ ДОБРОВОЛЬНОЕ СОГЛАСИЕ НА ВИДЫ<BR> МЕДИЦИНСКИХ ВМЕШАТЕЛЬСТВ, ВКЛЮЧЕННЫЕ В ПЕРЕЧЕНЬ<BR>ОПРЕДЕЛЕННЫХ ВИДОВ МЕДИЦИНСКИХ ВМЕШАТЕЛЬСТВ,НА КОТОРЫЕ<BR>
ГРАЖДАНЕ ДАЮТ ИНФОРМИРОВАННОЕ ДОБРОВОЛЬНОЕ СОГЛАСИЕ ПРИ<BR>ВЫБОРЕ ВРАЧА И МЕДИЦИНСКОЙ ОРГАНИЗАЦИИ ДЛЯ ПОЛУЧЕНИЯ<BR>ПЕРВИЧНОЙ МЕДИКО-САНИТАРНОЙ ПОМОЩИ<br>
</TD>
</tr>
<tr>
<td align=justify width=100%>Я, <font style="font-size: 16pt">{client.fullName}</font></td>
</tr>
<tr>
<TD  width=100%><sub>                   (Ф.И.О. гражданина)<sub></TD>
</tr>
<tr>
<TD align=left width=100%>{client.birthDate}  года рождения.</TD>
</tr>
<tr>
<TD align=left width=100%>зарегистрированный по адресу ......................................................................................................................</TD>
</tr>
<tr>
<TD align=left width=100%>........................................................................................................................................................................</TD>
</tr>
<tr>
<TD align=center width=100%><sub>(адрес места жительства гражданина либо законного представителя)</sub></TD>
</tr>
</table>

<table width=100% align=center >
<tr>
<td width=100% align=justify>
Даю информированное добровольное согласие на виды медицинских вмешательств, включенные в ПЕРЕЧЕНЬ ОПРЕДЕЛЕННЫХ ВИДОВ
МЕДИЦИНСКИХ ВМЕШАТЕЛЬСТВ, НА КОТОРЫЕ ГРАЖДАНЕ ДАЮТ ИНФОРМИРОВАННОЕ ДОБРОВОЛЬНОЕ СОГЛАСИЕ ПРИ ВЫБОРЕ ВРАЧА И
МЕДЕЦИНСКОЙ ОРГАНИЗАЦИИ ДЛЯ ПОЛУЧЕНИЯ ПЕРВИЧНОЙ МЕДИКО-САНИТАРНОЙ ПОМОЩИ, утвержденный приказом Министерства здравоохранения и социального развития Российской Федерации от 23 апреля 2012
года №390н (зарегистрирован Министерством юстиций Российской Федерации
5 мая 2012года №24082) (далее - Перечень), для получения первичной медико-
санитарной помощи/ получения первичной медико-санитарной помощи лицом,
законным представителем которого я являюсь(ненужное зачеркнуть) в
</td>
</tr>
<tr>
<td align=center><i><b>АО "БАЛТИЙСКИЙ ЗАВОД"</b></i></td>
</tr>
<tr>
<td width=100% align=center ><sub>(полное наименование медицинской организации)</sub></td>
</tr>
<tr>
<td>Медицинским работником..............................................................................................................................</td>
</tr>
<tr>
<td>........................................................................................................................................................................</td>
</tr>
<tr>
<td width=100% align=center ><sub>(должность Ф.И.О. медицинского работника)</sub></td>
</tr>
<tr>
<td width=100% align=justify>
В доступной для меня форме мне изъяснены цели, методы оказания медицинской
помощи, связанный с ними риск,возможные варианты медицинских вмешательств,
их последствия, в том числе вероятность развития осложнения, а так же
предпологаемые результаты оказания медицинской помощи.Мне разъяснено, что я
имею право отказаться от одного или нескольких видов медицинских
вмешательств, включенных в Перечень или потребовать его(их) прекращения, за
исключением случаев, предусмотренных частью 9 статьи 20 Федерального закона
от 21 ноября 2011года №323-Ф3 &laquo;Об основах охраны здоровья граждан Российской
Федерации&raquo; (Собрание законодательства Российской федерации, 2011, №48,
cт.6724,2012 №26,cт. 3442,3446).
&nbsp;&nbsp;&nbsp;Cведения о выбранных мною лицах, которым в соответствии с пунктом 5 части 3
cтатьи 19 Федерального закона от 21 ноября 2011 года №323 ФЗ &laquo;Об основах
охраны здоровья граждан Российской Федерации&raquo; может быть передана
информация о состоянии моего здоровья или состоянии лица, законным
представителем которого я являюсь (ненужное зачеркнуть).
</td>
</tr>
</table><br>
<table width=100% align=left border=0>
<tr>
<td width=40% colspan=2>.................................................................................................................................</td>
</tr>
<tr>
<td width=40% align=center colspan=2><sub>(Ф.И.О. гражданина, контактный телефон)</sub></td>
</tr>
<tr>
<td width=40% colspan=2>.................................................................................................................................</td>
</tr>
<tr>
<td width=40% align=left colspan=2><sub>(подпись)</sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<sub>(Ф.И.О. гражданина или законного представителя)</sub></td>
</tr>
<tr>
<td width=40% colspan=2>.................................................................................................................................</td>
</tr>
<tr>
<td width=40% align=left colspan=2><sub>(подпись)</sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<sub>(Ф.И.О. медицинского работника)</sub></td>
</tr><br>
<tr>
<td width=40% colspan=2> </td>
</tr>
<tr>
<td width=40% colspan=2><sub>               (дата оформления)</sub></td>
</tr>
</table>
</td>
</tr>
<table>
{end:}

<!--Анализы-->
<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>

<table  BORDER = 0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
  <TR>
    <TD WIDTH="40%">
<table width=100% align=right VALIGN="top" border=0>
<tr>
<td>
<table width=100% align=right border=0>
<tr>
<td width=40%>
</td>
<td width=60%><font style="font-size: 14pt">каб. <b>205, 8:30-11:00</b></font></td>
</tr>
</table>
<br>
<table>
<tr>
<td width=30%>
</td>
<td width=70% align=center>АО "Балтийский завод"</td>
</tr>
<tr>
<td width=40% align=center>
</td>
<td width=60% align=center>&laquo;Медико-санитарная часть №3&raquo; </td>
</tr>
</table>
<table>
<tr>
<td width=60% align=center>
</td>
<td width=40% align=center>Анализ №_______
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Ф.И.О. <font style="font-size: 14pt"><b>{client.fullName}</b></font>
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Возраст:{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}
</td>
</tr>
</table>
<table>
<tr>
<td align=left>Место работы <font style="font-size: 14pt"><b>{client.work}</b></font>
</td>
</tr>
</table>

<table width=100%>
<tr>
<td align=center>
<b>Результаты исследования</b>
</td>
</tr>
</table>
<table width=100% border=1 cellpadding=0 cellspacing=0>
<tr>
<td width=20% align=center>
№
</td>
<td width=40% align=center>
<b>Показатель</b>
</td>
<td width=40% align=center>
<b>Значения</b>
</td>
</tr>



<tr>
<td width=20% align=center>
1
</td>
<td width=40% align=center>
Холестерин <br>
</td>
<td width=40%>
</td>
</tr>

<tr>
<td width=20% align=center>
2
</td>
<td width=40% align=center>
Глюкоза <br>
</td>
<td width=40%>
</td>
</tr>


{for: action in event.actions}{if: action.code == u''14029''}
<tr>
<td width=20% align=center>
3
</td>
<td width=40% align=center>АЛТ
<br>
</td>
<td width=40%>
</td>
</tr>

<tr>
<td width=20% align=center>
4
</td>
<td width=40% align=center>АСТ
<br>
</td>
<td width=40%>
</td>
</tr>
{end:}{end:}

{for: action in event.actions}{if: action.code == u''14030''}
<tr>
<td width=20% align=center>
5
</td>
<td width=40% align=center>Билирубин
<br>
</td>
<td width=40%>
</td>
</tr>

{end:}{end:}
</table>
<table>

<tr>
<td>
Исследование проводил:
</td>
<td align=left>
{for:i in range(20)}_{end:}
</td>
</tr>
</table>
<table>
<tr>
<td width=20%>
&laquo;_________&raquo;
</td>
<td width=30%>
&laquo;{for:i in range(15)}_{end:}&raquo;
</td>
<td width=20%>
20{for:i in range(10)}_{end:}г.
</td>
</tr>
</table>
</td>
</tr>
</table>

</TD>
<TD WIDTH="10%"></TD>
<TD WIDTH="40%">
<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 7pt; color: black" BORDER = 0>
<TR><TD align="left" STYLE="font-family: Arial; font-size: 12pt; color: black">кабинет <b>102, 8:30-11:00</b></TD></TR>
<TR><TD align="center"   STYLE="font-family: Arial; font-size: 11pt; color: black"><B> Медико-Санитарная Часть № 3</B></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 10pt; color: black"><b>АНАЛИЗ МОЧИ №</b><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">Ф.И.О.  <font style="font-size: 14pt"><b>{client.fullName}</b></font><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">возраст   <b>{if: client.birthDate and len(client.age.split()) <= 2} {client.age}{else:}{end:}</b><HR></TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">место работы <font style="font-size: 14pt"><b> {client.work}</b></font><HR></TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">цвет_______________________прозрачность____________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">удельн.вес_________________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">реакция_____________________осадок_________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">белок_____________________г/л  глюкоза________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">кетоновые тела_______________уробилиноиды___________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">желчные кислоты____________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">лейкоциты__________________эритроциты______________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">цилиндры гиалиновые________________________________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">зернистые_____________________восковидные__________________</TD></TR>
<TR><TD align="left"   STYLE="font-family: Arial; font-size: 8pt; color: black">цилиндроиды________________________________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">эпителий плоский___________________точечный_________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">слизь_____________________бактерии__________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">соль_______________________________________________________</TD></TR>
<TR><TD align="left"  STYLE="font-family: Arial; font-size: 8pt; color: black">{for: action in event.actions}{if: action.code == u''14568''}АЛК или КП_________________________________________________{end:}{end:}</TD></TR><BR/>
<tr><td>Дата______________    {for: i in range(15)}&nbsp;{end:}  Подпись___________</td></tr>
</TD></table>
</TR>

</table>

</table>
{for: action in event.actions}{if: action.code == u''14032'' or action.code == u''14035''}
<!--Анализы-->
<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>

<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
<table  BORDER = 0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
  <TR>
    <TD WIDTH="40%">{for: action in event.actions}{if: action.code == u''14032''}
<table width=100% cellspacing=0 border=0>
<tr>
    <td align=center><b> «МСЧ №3» </b>
<br/>
    Косая линия дом 5, тел/факс 322-10-78<br>
каб.  {action._action.getType().office}
    </td>
</tr><br>
<tr>
    <td align=center>  <u>Направление на исследование</u></td>
</tr><br>
<tr>
    <td align=left> Ф.И.О.пациента<br><font style="font-size: 14pt"><b> {client.fullName}</b> </font></td>
</tr>
<tr>
<td align=left> Место работы <font style="font-size: 14pt"><b>{client.work}</b></font>
</td>
</tr><br>

<tr>
    <td align=center><font style="font-size: 14pt"><b>Определение суммарных антител <br> к Treponema pallidum /Сифилис/</b></font></td>
</tr><br>
<tr>
    <td  align=center> не обнаружены </td>
</tr><br>
<tr>
    <td  align=center> обнаружены </td>
</tr>
<tr>
    <td  align=center> &nbsp; </td>
</tr>
<tr>
    <td  align=left> Дата <u></u> </td>
</tr>
<tr>
    <td  align=left> Врач _______ </td>
</tr>

</table>{end:}{end:}
    </TD>
    <TD WIDTH="10%"></TD>

<TD WIDTH="40%">
 {for: action in event.actions}{if: action.code == u''14035''}
<table width=100% cellspacing=0 border=0>
<tr>
    <td align=center><b> «МСЧ №3» </b>
<br/>
    Косая линия дом 5, тел/факс 322-10-78<br>
каб. {action._action.getType().office}
                   </td>
</tr><br>
<tr>
    <td align=center>  <u>Направление на исследование</u></td>
</tr><br>
<tr>
    <td align=left> Ф.И.О.пациента<br><font style="font-size: 14pt"> <b>{client.fullName}</b> </font></td>
</tr>
<tr>
<td align=left> Место работы <font style="font-size: 14pt"><b>{client.work}</b></font>
</td>
</tr><br>
<tr>
    <td align=center><font style="font-size: 14pt"><b>{action.name}</b></font></td>
</tr>

<tr>
    <td  align=center> &nbsp; </td>
</tr>
<tr>
    <td  align=left> Дата <u></u> </td>
</tr>
<tr>
    <td  align=left> Врач _______ </td>
</tr>

</table>{end:}{end:}
</TD>

</TR>
</table>{end:}{end:}
<!--Анализы-->
<p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
<table  BORDER = 0 WIDTH="100%" cellpadding="20" cellspacing="0" STYLE="font-family: Arial; font-size: 9pt; color: black">
{: flag = False}
{: i = 0}
{for: action in event.actions}{if: u''Прием'' not in action.name and action.code in (''14210'', ''14215'', ''14216'', ''14217'', ''14218'', ''14219'', ''14220'', ''14238'', ''14254'', ''14260'', ''14261'', ''14265'', ''14272'', ''14273'', ''14274'', ''14275'', ''14276'', ''14277'')}

{: i += 1}
{if: flag == False}
<TR>
{end:}
<TD WIDTH="50%" align = center>
    <table width=100% cellspacing=0 border=0>
        <tr>
            <td align=center><b> «МСЧ №3» </b><br>
        Косая линия дом 5, тел/факс 322-10-78<br>
        каб. {action._action.getType().office}<br>
            </td>
        </tr>
        <tr>
            <td align=center>  <u>Направление на исследование</u><br></td>
        </tr>
        <tr>
            <td align=left> Ф.И.О.пациента<br><font style="font-size: 14pt"> <b>{client.fullName}</b> </font></td>
        </tr>
        <tr>
            <td align=left> Место работы <font style="font-size: 14pt"><b>{client.work}</b></font><br></td>
        </tr>
        <tr>
            <td align=center><font style="font-size: 14pt"><b>{action.name}</b></font></td>
        </tr>
        <tr>
            <td  align=center> &nbsp; </td>
        </tr>
        <tr>
            <td  align=left> Дата <u></u> </td>
        </tr>
        <tr>
            <td  align=left> Врач _______ </td>
        </tr>
    </table>
</TD>
{if: flag == True}
    </TR>
    {: flag = False}
{else:}
    {: flag = True}
{end:}
{if: i == 6}
    </TABLE>
    <p style="page-break-after: always"><font color=#FFFFFF>.</font></p>
    <TABLE>
{end:}
{end:}{end:}
</table>
</TD>
</body>
</html>
', 1, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2016-10-13 12:49:55', 200, '2018-10-29 13:05:51', 252, '99', 'Заключение', 'f131pe', '', '<html>
<head>
{ setPageSize(''A5'') }
{ setOrientation(''L'') }
{ setLeftMargin(10.0) }
{ setTopMargin(10.0) }
{ setRightMargin(10.0) }
{ setBottomMargin(15.0) }
</head>

<body align=left BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 11pt; color: black">
<table>
<tr>
<td STYLE="font-family: Georgia, Arial; font-size: 7pt; color: black">"МЕДИКО-САНИТАРНАЯ ЧАСТЬ №3"
</td>
<tr>
<td STYLE="font-family: Georgia, Arial; font-size: 7pt; color: black">АО "БАЛТИЙСКИЙ ЗАВОД"
</td>
<tr>
<td STYLE="font-family: Georgia, Arial; font-size: 7pt; color: black">199026, г.Санкт-Петербург, В.О. Косая линия д.3, корп.2, литер А
</td>
<tr>
<td STYLE="font-family: Georgia, Arial; font-size: 7pt; color: black">Код по ОГРН:{currentOrganisation.OGRN}
</td>
<br/>

<tr>
<td BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 11pt; color: black" align=center><b><big>ЗАКЛЮЧЕНИЕ</big><br/>ПО РЕЗУЛЬТАТАМ ПРЕДВАРИТЕЛЬНОГО / ПЕРИОДИЧЕСКОГО МЕДИЦИНСКОГО ОСМОТРА</b>
</td>
</tr>
<tr >
<td>
Ф.И.О.&nbsp;<b>{client.fullName}</b>
</td>
</tr>
<tr>
<td>
Дата рождения:&nbsp;<b>{client.birthDate}</b> &nbsp;&nbsp;
Пол:&nbsp;{client.sex}
</td>
</tr>
<tr>
<td>
Организация (предприятие)&nbsp;<b>{client.work.shortName}</b>
</td>
</tr>
<tr>
<td>
Профессия (должность)&nbsp;<b>{client.work.post}</b>
</td>
</tr>
<tr>
<td>
Вредные производственные факторы или виды работы в соответствии с пр. МЗСР РФ от 12.04.2011 №302н:
</td>
</tr>
<tr>
<td>
{if:client.work.factors}
<b><u>Приложение №1 п.:</u></b>
{for: i, factor in enumerate(client.work.factors)}
<b>{factor.code};&nbsp;</b>
{end:}
{else:}
{end:}
<br/>
{if:client.work.hurts}
<b><u>Приложение №2 п.:</u></b>
{for: i, hurt in enumerate(client.work.hurts)} {if: u''old'' in hurt.code}<b>{hurt.code};&nbsp;</b>{end:}
{end:}
{else:}
{end:}
</td>
</tr>
<p>


<td align=justify BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 16; color: black"><big><u><b>Заключение</big></u></b> Согласно результатам проведенного медицинского осмотра: <u> <b> не выявлены медицинские противопоказания </b> </u> к работе с вышеуказанными вредными и/или опасными веществами и производственными факторами, к вышеуказанным видам работ.
</td>
</tr>
<tr>
<td BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 11pt; color: black">
<b> Председатель врачебной комиссии:<b /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
____________________ <b>Т.В. Кузнецова<b />
</td>
</tr>
<br/>
<tr>
<td BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman, Arial; font-size: 11pt; color: black">
М.П.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Дата выдачи: "____" "_______________" 20__г.
</td>
</tr>
</table>
</body>
</html> ', 0, 0, 0, null, 0, 0, '', 0, null, 1, 0, 0),
        ('2020-02-14 13:17:14', 371, '2021-04-09 10:16:48', 371, 'основная3_1', 'Паспорт здоровья (Новый)', 'f131pe', '', '<!--Начальная дата разработки 11.02.2020 г.-->
<!--Версия 0.0.0.6, дата 30.03.2020 г.-->
<!--Разработка: Солтанов Алекснадр Назимович-->
<!--Контекст печати: f131p -->
<!--Задача: SUP-8100 -->

<HTML><BODY>
{setPageSize(''A4'')}
{setOrientation(''P'')}
{setLeftMargin(25)}
{setTopMargin(10)}
{setBottomMargin(20)}
{setRightMargin(15)}

<body style="font-size: 10pt">

    <p><b>АО «Балтийский завод»<br>
Медико-санитарная часть № 3<br>
Адрес: г. Санкт-Петербург, <br>
Косая линия, д. 3, корп. 2, литер А<br>
Код по ОГРН: 1027800509000</b></p>

<p align="center"><b>ВЫПИСКА<br>
из медицинской карты пациента, получающего <br>
медицинскую помощь в амбулаторных условиях № {event.externalId}</b></p>

<p><b>{event.setDate.toString(''dd.MM.yyyy'')}</b>
    <br>1. Ф.И.О.: {client.fullName}
<br>2. Пол {if: client.sex == u''М''} <b>М</b> Ж {else: } М <b>Ж</b>{end:}  3. Дата рождения <b> {client.birthDate}</b>
<br>4. {client.document.documentType}: серия <b>{client.document.serial}</b> номер <b>{client.document.number}</b> кем выдан: {if: client.document.origin}<b> {client.document.origin} </b>{else:} ____________________________________________ {end:}
<br>5. Адрес регистрации по месту жительства (пребывания) {client.regAddress}
<br>6. СНИЛС: {client.SNILS}
<br>7. Наименование работодателя: <b>{:b = 0} {if: client.work.shortName} {client.work.shortName} {: b = 1} {end:} {if: b == 0 and client.work.freeInput} {client.work.freeInput} {:b = 1} {end:} </b>{if: b == 0} _____________________________________________ {end:}
<br>8. Наименование структурного подразделения  работодателя (при наличии) _______________________________________________________________________________________
<br>9. Наименование должности (профессии) или вида работы:  {:b = 0} {if: b == 0 and client.work.post}<b> {client.work.post}</b> {:b = 1} {end:} {if: b == 0} _____________________________________________ {end:}
<br>10. Наименование вредного производственного фактора(-ов) и (или) вида работы в соответствии с пр. МЗРФ от 28.01.2021 №29н: {:b = 0}  {for: i, factor in enumerate(client.work.factors)} <b>пр.1 п.{factor.code}</b>{end:} ; {for: i, hurt in enumerate(client.work.hurts)} {if: u''old'' not in hurt.code}<b>пр.2 п.{hurt.code}</b>{end:} {end:}
<br>11. Наименование медицинской организации, к которой прикреплен работник для постоянного наблюдения: _______________________________________________________________________________________
<br>12. Заключения врачей-специалистов, принимавших участие в проведении предварительного / периодического медицинского осмотра работника:
</p>
<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td align="center" width="25%">Наименование специальности врача</td>
        <td align="center" width="7%">Дата осмотра</td>
        <td align="center" width="48%">Заключение</td>
        <td align="center" width="20%">Группа здоровья</td>
    </tr>
<!--    {for: action in event.actions}
        {if: action.class_ == 0 and action.deleted == 0 and action.name != u''ВЫПИСКА из медицинской карты пациента''}
    <tr>
        <td align="center">{action.name}</td>
        <td align="center">{action.endDate.toString(''dd.MM.yyyy'')}</td>
        <td align="center">&nbsp;&nbsp;&nbsp;</td>
        <td align="center">&nbsp;&nbsp;&nbsp;</td>
    </tr>
        {end:}
    {end:}
-->
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ТЕРАПЕВТ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>НЕВРОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ЛОР &nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ОФТАЛЬМОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ДЕРМАТОВЕНЕРОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ГИНЕКОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ПСИХИАТР-НАРКОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Медицинских психиатрических и наркологических проитвопоказаний для работы_____________ не имеет</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>СТОМАТОЛОГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>ХИРУРГ&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td>Годен(на)&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
        <td align="center">&nbsp;&nbsp;<br>&nbsp;</td>
    </tr>


</table>
<p>13. Результаты лабораторных и инструментальных исследований:</p>
<table width="100%" cellspacing="0" cellpadding="0" border="1">
    <tr>
        <td width="30%">Наименование исследования</td>
        <td width="7%" align="center">Дата проведения</td>
        <td width="63%">Результат исследования</td>
    </tr>
<!--    {for: action in event.actions}
        {if: action.class_ == 1 and action.deleted == 0 and action.name != u''ВЫПИСКА из медицинской карты пациента''}
    <tr>
        <td align="center">{action.name}</td>
        <td align="center">{action.endDate.toString(''dd.MM.yyyy'')}</td>
        <td> {for: prop in action} {if: prop.value and prop.name !=u''Номерок''} <b>{prop.name}:</b> {prop.value} {end:}{end:}</td>
    </tr>
        {end:}
    {end:}
-->
    <tr>
        <td align="center">

<br>1. ФЛГ №_______
<br>
<br>
Rg №_________
</td>
        <td align="center"></td>
        <td> </td>
    </tr>

    <tr>
        <td align="center">
<br><br>
     2. ЭКГ №________<br><br>
       </td>
        <td align="center"></td>
        <td> </td>
    </tr>

    <tr>
        <td align="center">
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
    3. Анализ крови  </td>
        <td align="center"></td>
        <td>•   Глюкоза
<br>•   Гемоглобин
<br>•   Холестерин
<br>•   Эритроциты
<br>•   Цветовой показатель
<br>•   Тромбоциты
<br>•   Ретикулоциты
<br>•   Лейкоциты
<br>•   Палочкоядерные
<br>•   Сегментноядерные
<br>•   Эозинофилы
<br>•   Базофилы
<br>•   Лимфоциты
<br>•   Моноциты
<br>•   Скорость (реакции) оседания эритроцитов
<br>•   АЛТ
<br>•   АСТ
<br>•   Билирубин
<br>•   ВСК
 </td>
    </tr>

    <tr>
        <td align="center">
<br>
<br>
<br>
<br>
<br>
<br>
<br>





           4.Анализ мочи  </td>
        <td align="center"></td>
        <td>•   Цвет
<br>•   Прозрачность
<br>•   Относительная плотность
<br>•   Реакция
<br>•   Белок
<br>•   Глюкоза
<br>•   Кетоновые тела
<br>•   Желчные кислоты
<br>•   Уробилиноиды
<br>•   Эпителий плоский
<br>•   Лейкоциты
<br>•   Эритроциты
<br>•   Слизь
<br>•   Соли
<br>•   Бактерии
 </td>
    </tr>

    <tr>
        <td align="center">
         5. Спирометрия (ФВД)
            <br>
          </td>
        <td align="center"></td>
        <td> </td>
    </tr>

    <tr>
        <td align="center">
            <br>
            <br>
            <br>
             6. УЗИ
            <br>
            <br>
            <br>
         </td>
        <td align="center"></td>
        <td> </td>
    </tr>

    <tr>
        <td align="center">
            <br>
            <br>
            <br>
            <br>
            7. Мазки (флора и    атипичные клетки)
            <br>
            <br>
            <br>
            <br>
        </td>
        <td align="center"></td>
        <td> </td>
    </tr>

    <tr>
        <td align="center">
      8.Паллестезиометрия (ВТ)</td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">9. Вес тела (в кг)<br>
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">10. Рост (в см)<br>
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">11. Окружность талии (в см)<br>
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">12. ИМТ
<br>(индекс массы тела)
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">13.Относительный сердечно сосудистый риск
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">14. Абсолютный сердечно сосудистый риск
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>
    <tr>
        <td align="center">
     </td>
        <td align="center"></td>
        <td> </td>
    </tr>

</table>
<p><b>14. Заключение по результатам  предварительного  / периодического медицинского осмотра (выделить нужный вариант, ненужный зачеркнуть)<br></b>

<br><br>    o   <b>медицинские противопоказания к работе <u>НЕ ВЫЯВЛЕНЫ</u></b>

<br>    o   <b>ВК №

______________
 от
______________: </b>

<br><br><b>1)<b><u>выявлены</u> (постоянные / временные) медицинские противопоказания к работе<br></-b></b></b>

_______________________________________________________________________________________ _______________________________________________________________________________________
<br>

в соответствии с  пр. МЗРФ от 28.01.2021 № 29н пр. <br>
_______________________________________________________________________________________
_______________________________________________________________________________________

<br>

<br><b>2) <U>не выявлены</U> медицинские противопоказания к работе </b>в соответствии с  пр. МЗРФ от 28.01.2021 № 29н пр.
_______________________________________________________________________________________
_______________________________________________________________________________________

<br><br><b>Группа здоровья: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; II  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; III</b>

<br><br>Рекомендации:
<br><br>Нуждается в дообследовании _______________________________________________________________
<br><br>Нуждается в консультации специалиста _____________________________________________________
<br><br>Нуждается в «Д» наблюдении ____________________________________________________________
<br><br>Нуждается в амбулаторном лечении ________________________________________________________
<br><br>Нуждается в стационарном лечении ________________________________________________________
<br><br>Нуждается в СКЛ _______________________________________________________________________
<br><br>Нуждается в направлении на МСЭ __________________________________________________________
<br><br>Нуждается в обследовании в центре профпатологии ____________________________________________
<br><br>Иное __________________________________________________________________________________
    _______________________________________________________________________________________
</p>
<p align="center">Дата выдачи заключения: {event.execDate.toString(''dd.MM.yyyy'')}</p>
<p><b>Председатель врачебной комиссии: __________________________________ / Т.В.Кузнецова</b></p>
<p align="right"> М.П.</p>
</BODY>
</HTML>

', 0, 0, 0, null, 0, 0, '', 0, null, 0, 0, 0),
        (NOW(), null, NOW(), null, '10639', 'Заключение Новое', 'f131pe', '', '<HTML><BODY>
{ setPageSize(''A5'') }
{ setOrientation(''L'') }
{ setLeftMargin(10.0) }
{ setTopMargin(10.0) }
{ setRightMargin(10.0) }
{ setBottomMargin(15.0) }

<TABLE BORDER=0 WIDTH="100%" cellpadding="0" cellspacing="0" STYLE="font-family: Times New Roman; font-size: 11pt; color: black">

    <tr>

        <td align="left"><FONT size = -1>
                            <b>АО «БАЛТИЙСКИЙ ЗАВОД»<br>
                            Медико-санитарная часть №3<br></b>
                            199026, г. Санкт-Петербург, В.О. Косая линия, д. 3, корп. 2, литер А<br>
                            <b>Код по ОГРН: 1027800509000</b><br>
                        </FONT>
        </td>
    </tr>

    <tr>

        <td align="center">
                        <FONT size = +1>

                            <b>ЗАКЛЮЧЕНИЕ
                            ПО  РЕЗУЛЬТАТАМ  ПРЕДВАРИТЕЛЬНОГО / ПЕРИОДИЧЕСКОГО  МЕДИЦИНСКОГО ОСМОТРА</b>

                        </FONT>
        </td>
    </tr>

<br>

    <tr>
        <td align="left">Дата выдачи заключения: «_____» «___________»  20___ г.</td>
    </tr>

    <tr>
        <td align="left">Ф.И.О. <b>{client.fullName}</b></td>
    </tr>

    <tr>
        <td align="left">Дата рождения: <b>{client.birthDate}</b> Пол: <b>{client.sex}</b></td>
    </tr>

    <tr>
        <td align="left">Наименование работодателя: <b>{client.work.shortName}</b></td>
    </tr>

    <tr>
        <td align="left">Наименование структурного подразделения работодателя: <b>{client.work.shortName}</b></td>
    </tr>

    <tr>
        <td align="left">Должность (профессия) или вид работы: <b>{client.work.post}</b></td>
    </tr>

    <tr>
        <td align="left">Наименование вредного производственного фактора(-ов) и  (или) вида работы в соответствии с  пр. МЗРФ от 28.01.2021 № 29н: </td>
    </tr>

    <tr>
        <td align="left">
                            {if: client.work.factors}
                            <b><u>Приложение:</u></b>
                            {for: i, factor in enumerate(client.work.factors)}
                            <b>{factor.code};&nbsp;</b>
                            {end:}
                            {else:}
                            {end:}
                            <br/>
                            {if: client.work.hurts}
                            {for: i, hurt in enumerate(client.work.hurts)} {if: u''old'' not in hurt.code}<b>{hurt.code};&nbsp;</b>{end:}
                            {end:}
                            {else:}
                            {end:}
        </td>
    </tr>

    <tr>
        <td align="left"><b>Результаты предварительного/периодического осмотра:  медицинские противопоказания к работе <u>не выявлены.</u></b></td>
    </tr>

    <tr>
        <td align="left"><b>Группа здоровья:&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;II&nbsp;&nbsp;&nbsp;IIIа&nbsp;&nbsp;&nbsp;IIIб&nbsp;&nbsp;(подчеркнуть)</b></td>
    </tr>

    <tr>
        <td align="left"><b>Председатель врачебной комиссии:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __________________________ Т.В.Кузнецова</b></td>
    </tr>

<br>

    <tr>
        <td align="right"><b>М.П.</b></td>
    </tr>

</TABLE>
</BODY>', 0, 0, 0, null, 0, 0, null, 0, null, 1, 0, 0);

select/*bigin*/ deleted, class, group_id, code, name, title, flatCode, sex, age, office, showInForm, genTimetable,
quotaType_id, context, amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate,
defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES, nomenclativeService_id,
isPreferable, prescribedType_id, shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant,
propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible, serviceType,
actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id, isCustomSum,
recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked,
filledLock, refferalType_id, defaultBeginDate, showAPOrg, filterPosts, filterSpecialities, isIgnoreEventExecDate,
advancePaymentRequired, checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias from ActionType where id in(
	select EventType_Action.actionType_id from EventType_Action, rbHurtType where EventType_Action.hurtType regexp
	rbHurtType.code group by EventType_Action.id);/*end*/


select *
from EventType where id in
(select EventType_Action.eventType_id
from EventType_Action, rbHurtType where EventType_Action.hurtType regexp rbHurtType.code group by EventType_Action.id)
and deleted = 0;

select EventType_Action.*
from EventType_Action, rbHurtType where EventType_Action.hurtType regexp rbHurtType.code group by EventType_Action.id


select *
from EventType_Action where eventType_id = 140 and hurtType regexp '2.3';

select *
from EventType where name = 'Периодические осмотры для взрослых(для маркетологов)';

select *
from rbService order by id desc  limit 1;


insert into ActionType_Service(master_id, finance_id, service_id)
select *
from
(select at1.id as master_id, NULL, s.id as service_id
from ActionType at1, rbService s where at1.group_id = 84914 and s.name = at1.name and s.code = at1.code) as tmp
where not exists(select * from ActionType_Service where service_id = tmp.service_id and master_id = tmp.master_id);

# insert into rbPrintTemplate(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name, context,
                            fileName, `default`, counter_id, groupName, documentType_id)

delete
from rbPrintTemplate
where id in(2778, 2779)

select at1.context
from ActionType at1, rbService s where at1.group_id = 84914 and s.name = at1.name and s.code = at1.code;

select *
from ActionType_Service where service_id = 79366;

select *
from EventType;

select *
from rbTariffCategory;


insert into Contract_Tariff(deleted, master_id, eventType_id, tariffType, service_id, tariffCategory_id, begDate, endDate, sex, age, attachType_id, attachLPU_id, unit_id, amount, uet, price, frag1Start, frag1Sum, frag1Price, frag2Start, frag2Sum, frag2Price, limitationExceedMode, limitation, priceEx, limitation2ExceedMode, limitation2, priceEx2, MKB, federalPrice, federalLimitation, speciality_id, vat, createPerson_id, createDatetime, modifyPerson_id, modifyDatetime, caseCast_id)
select
       0 deleted,
       3228 master_id,
       140 eventType_id,
       tariffType,
       s.id service_id,
       tariffCategory_id,
       ct.begDate,
       ct.endDate,
       ct.sex,
       ct.age,
       attachType_id,
       attachLPU_id,
       unit_id,
       ct.amount,
       uet,
       1.00 price,
       frag1Start,
       frag1Sum,
       frag1Price,
       frag2Start,
       frag2Sum,
       frag2Price,
       limitationExceedMode,
       limitation,
       priceEx,
       limitation2ExceedMode,
       limitation2,
       priceEx2,
       MKB,
       federalPrice,
       federalLimitation,
       speciality_id,
       vat,
       ct.createPerson_id,
       ct.createDatetime,
       ct.modifyPerson_id,
       ct.modifyDatetime,
       ct.caseCast_id
from ActionType at1, rbService s, Contract_Tariff ct where at1.group_id = 84914 and s.name = at1.name and s.code = at1.code and ct.id = (select id from Contract_Tariff order by id desc limit 1)


select *
from Contract_Tariff where master_id = 3228;

select *
from rbUserRight where name regexp 'планиров';

select *
from rbFinance;

insert into rbService(createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, group_id, code,
                      name, eisLegacy, license, infis, begDate, endDate, medicalAidProfile_id, medicalAidKind_id,
                      medicalAidType_id, dopService_id, category_id, caseCast_id, Fed_code, type, budget_id)
select *
from
(select
       now() createDatetime,
       NULL createPerson_id,
       NOW() modifyDatetime,
       NULL modifyPerson_id,
       NULL group_id,
       at1.code code,
       at1.name name,
       eisLegacy,
       license,
       infis,
       '2021-01-01' begDate,
       '2200-12-31' endDate,
       medicalAidProfile_id,
       medicalAidKind_id,
       medicalAidType_id,
       dopService_id,
       category_id,
       caseCast_id,
       Fed_code,
       type,
       budget_id
from ActionType at1, rbService s where at1.group_id = 84914
and s.id = (select id from rbService order by id desc limit 1)) as tmp
where not exists(select * from rbService where tmp.name = name and tmp.code = code);

select *
from ActionType where group_id = 84914;

drop temporary table temp_eventType
create temporary table temp_eventType
    (
        select 3 as eventType_id, 68 as idx, 'Мазки на гонорею при поступлении на работу' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 67 as idx, 'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 66 as idx, 'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;24;25;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 65 as idx, 'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 64 as idx, 'Исследование крови на сифилис' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 63 as idx, 'Поля зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 62 as idx, 'Острота зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 61 as idx, 'Определение группы крови и резус-фактора as name, исследование крови на ВИЧ as speciality_id, сифилис as tissueType_id, вирусные гепатиты B и C (при предварительном осмотре)' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory19.1;19.2;19.3;21', '', null, 0 union
        select 3 as eventType_id, 60 as idx, 'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 59 as idx, 'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 58 as idx, 'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 selectingGroup, 0 actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 57 as idx, 'Определение группы крови и резус-фактора при предварительном осмотре' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '20' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 56 as idx, 'Ректороманоскопия (1 раз в 5 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 55 as idx, 'Ортопантомография ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 54 as idx, 'Ортопантомография (1 раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 53 as idx, 'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 52 as idx, 'Ультразвуковая допплерография транскраниальная артерий методом мониторирования' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 51 as idx, 'Исследование уровня фибриногена as name, протромбинового индекса as speciality_id, триглицеридов as tissueType_id, мочевой кислоты as sex, общего белка as age, калия as selectingGroup, натрия as actuality, железа as expose, щелочной фосфатазы в крови' as payable, null as hurtType, null as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory', 1, 0, 1, 0, '19.2', '', null, 0 union
        select 3 as eventType_id, 50 as idx, 'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 49 as idx, 'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 48 as idx, 'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 47 as idx, 'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 46 as idx, 'Ортостатическая проба (при предварительном медицинском осмотре)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 45 as idx, 'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 1 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 44 as idx, 'Ультразвуковые исследования печени as name, желчного пузыря as speciality_id, поджелудочной железы as tissueType_id, селезенки as sex, почек (один раз в 3 года);' as age, null as selectingGroup, null as actuality, 0 as expose, '' as payable, 1 as hurtType, 0 as hurtFactorType, 1 as defaultOrg_id, 0 as isCompulsory, '19.1;19.2;19.3;21', '', null, 0 union
        select 3 as eventType_id, 43 as idx, 'Эзофагогастродуоденоскопия (1 раз в 3 года)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 42 as idx, 'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 41 as idx, 'Эхокардиография (при предварительном медицинском осмотре и по показаниям)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 40 as idx, 'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 39 as idx, 'Исследование уровня холестерина в крови (до достижения возраста 40 лет)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '-40г' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 38 as idx, 'Мочевина' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 37 as idx, 'Креатинин' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 36 as idx, 'Определение группы крови и резус-фактора as name, исследование крови на ВИЧ as speciality_id, сифилис as tissueType_id, вирусные гепатиты B и C (при предварительном осмотре)' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory19.1;19.2;19.3;21;2.4.2', '', null, 0 union
        select 3 as eventType_id, 35 as idx, 'Электроэнцефалография' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '18.2;19.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 34 as idx, 'Исследование цветоощущения по полихроматическим таблицам' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '18.1;18.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 33 as idx, 'Эзофагогастродуоденоскопия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '11;11.1;11.2;11.3;11.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 32 as idx, 'Измерение внутриглазного давления' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '10' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 31 as idx, 'Непрямая ларингоскопия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 30 as idx, 'Исследование цветоощущения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 29 as idx, 'Рефрактометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.1;4.3.1;4.3.2;5.1;5.2.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 28 as idx, 'Исследование аккомодации' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 27 as idx, 'Определение бинокулярного зрения' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '5.2.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 26 as idx, 'Исследование функции вестибулярного аппарата' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.3.1;4.3.2;4.4;4.5;4.6;4.10;6;6.1;6.2;7;8;9;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;19.1;19.2;19.3;20;21;22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 25 as idx, 'Паллестезиметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.3.1;4.3.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 24 as idx, 'УЗИ органов брюшной полости и щитовидной железы' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 23 as idx, 'Офтальмоскопия глазного дна' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 22 as idx, 'Рефрактометрия (или скиаскопия)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1;4.3.1;4.3.2;5.1;5.2.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 21 as idx, 'Психофизиологическое исследование' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 20 as idx, 'Тромбоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.14;1.14.1;1.15;1.27;1.27.1;1.27.2;4.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 19 as idx, 'аланинаминотрансфераза (АЛТ)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 18 as idx, 'аспартатаминотрансфераза (АСТ)' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 17 as idx, 'ВИЧ' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.3;2.4.2;19.1;20;21;19.2;19.3' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 16 as idx, 'Анализ крови на HBs-Ag as name, анти-HBc-Ig (суммарные) as speciality_id, анти-HCV-Ig (суммарные) as tissueType_id, определение уровня щелочной фосфатазы as sex, билирубина as age,' as selectingGroup, null as actuality, null as expose, 0 as payable, '' as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, 1 as isCompulsory, 0, '2.4.2', '', null, 0 union
        select 3 as eventType_id, 15 as idx, 'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 14 as idx, 'Для работы с препаратами крови определение в крови HBsAg as name, a-HBCOR as speciality_id, IgM as tissueType_id, A-HCV-IgG' as sex, null as age, null as selectingGroup, 0 as actuality, '' as expose, 1 as payable, 0 as hurtType, 1 as hurtFactorType, 0 as defaultOrg_id, ' as isCompulsory2.3', '', null, 0 union
        select 3 as eventType_id, 13 as idx, 'Периметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.52.6;6.1;6.2;7;8;9;10;12;13;14;15;16;17;18.1;18.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 12 as idx, 'карбоксигемоглобин в крови' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.39' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 11 as idx, 'Ультразвуковое обследование органов малого таза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 10 as idx, 'УЗИ органов брюшной полости' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.50;1.36;1.36.1;1.36.2;1.36.3;2.4.2;11;11.1;11.2;11.3;11.4;1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 9 as idx, 'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.27;1.27.1;1.27.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 8 as idx, 'Тональная пороговая аудиометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.27;1.27.1;1.27.2;4.3.2;4.4;4.5;4.6;4.8;6;6.1;6.2;7;8;9;10;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;20;21;22;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 7 as idx, 'тромбоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.14;1.14.1;1.15;1.15.1;1.14;1.14.1;1.15;1.15.1;4.1;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 6 as idx, 'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.8.4.1;1.8.4.2;1.8.4;3.1.7' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 5 as idx, 'Визометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.16;1.19.1;1.19.2;1.19.3;1.23;1.24;1.27;1.27.1;1.27.2;1.30;1.30.1;1.31;1.36;1.36.1;1.36.2;1.36.3;1.37.1;1.37.1.1;1.38;1.39;1.40;1.40.1;1.40.2;1.43;1.43.1;1.43.2;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3.1;4.7;4.8;4.9;4.10;5.1;5.2.1;6.1;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18.1;18.2;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 4 as idx, 'метгемоглобин' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.10;1.21;1.1;1.37.1;1.37.1.1;1.38;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 3 as idx, 'ретикулоциты' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.6;1.10;1.14;1.14.1;1.15;1.15.1;1.17;1.20;1.21;1.27.2;1.30.1;1.34;1.34.1;1.34.2;1.37.1;1.39;4.1;1.15;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 2 as idx, 'Биомикроскопия глаза' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.15.1;1.16;1.19.1;1.19.2;1.19.3;1.23;1.24;1.27;1.27.1;1.27.2;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.30;1.30.1;1.31;1.36;1.36.1;1.36.2;1.36.3;1.37.1;1.37.1.1;1.38;1.39;1.40;1.40.1;1.40.2;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.7;1.47.8;1.47.9;1.48;1.49;1.49.1;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.50;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3.1;4.7;4.8;4.9;4.10;5.1;5.2.1;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;13;17;18.2' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 1 as idx, 'Пульсоксиметрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.12;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18.1;1.18.2;1.19.2;1.19.3;1.23;1.24;1.28;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.33;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.45;1.45.1;1.45.3;1.46;1.47;1.47.1;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 0 as idx, 'Спирометрия' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.12;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18.1;1.18.2;1.19.1;1.19.2;1.19.3;1.21;1.22;1.23;1.24;1.25;1.28;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.33;1.34.1;1.34;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.48;1.49;1.49.1;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.8;1.49.9;1.50;1.51.1;1.51.2;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.2;3.1.9.3;3.1.9.4;3.2;3.3;3.4;11;11.1;11.2;11.3;11.4;12;13;14;16;17;19.1;19.2;19.3;21' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 69 as idx, 'Прием дерматовенеролога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.4;1.5;1.5.1;1.6;1.7;1.7.2;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.18.1;1.18.2;1.18.3;1.19.1;1.19.2;1.19.3;1.21;1.22;1.24;1.25;1.26;1.29.5;1.31;1.32;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.4;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3;4.3.1;4.3.2;4.10;19.1;19.2;19.3;20;21;23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 70 as idx, 'Прием оториноларинголог' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.4;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14;1.14.1;1.14.2;1.15;1.15.1;1.16;1.17;1.18;1.18.1;1.18.2;1.18.3;1.19;1.19.1;1.19.2;1.19.3;1.21;1.22;1.23;1.24;1.25;1.26;1.27;1.27.1;1.27.2;1.28;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.31;1.33;1.34;1.34.1;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37.1.2;1.37.2;1.38;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4;4.3.1;4.3.2;4.4;4.5;4.6;4.7;4.8;4.10;5.2.2;6;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18;18.1;18.2;19;19.1;19.2;19.3;20;21;22;23;24;25;26;27;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 71 as idx, 'Прием офтальмолога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.1;1.2;1.3;1.5;1.5.1;1.6;1.7;1.7.1;1.7.2;1.8;1.8.1;1.8.1.1;1.8.1.2;1.8.2;1.8.2.1;1.8.2.2;1.8.3;1.8.3.1;1.8.3.2;1.8.4;1.8.4.1;1.8.4.2;1.9;1.10;1.11;1.13;1.14.1;1.14.2;1.15;1.15.1;1.16;1.19.1;1.19.2;1.19.3;1.24;1.27;1.27.1;1.27.2;1.29;1.29.1;1.29.2;1.29.3;1.29.4;1.29.5;1.30;1.30.1;1.31;1.32;1.34;1.34.1;1.34.2;1.35;1.36;1.36.1;1.36.2;1.36.3;1.37;1.37.1;1.37.1.1;1.37.1.2;1.37.2;1.38;1.39;1.40;1.40.1;1.40.2;1.41;1.42;1.43;1.43.1;1.43.2;1.44;1.45;1.45.1;1.45.2;1.45.3;1.46;1.47;1.47.1;1.47.2;1.47.3;1.47.4;1.47.5;1.47.6;1.47.7;1.47.8;1.47.9;1.47.10;1.47.11;1.47.12;1.47.13;1.47.14;1.47.15;1.47.16;1.48;1.49;1.49.1;1.49.2;1.49.3;1.49.4;1.49.5;1.49.6;1.49.7;1.49.8;1.49.9;1.49.10;1.49.11;1.49.12;1.49.13;1.49.14;1.50;1.51;1.51.1;1.51.2;1.52;1.52.1;1.52.2;1.52.3;1.52.4;1.52.5;1.52.6;1.52.7;1.53;1.53.1;1.53.2;2.1;2.2;2.3;2.4.1;2.4.2;2.4.3;2.4.4;2.4.5;3.1.1.;3.1.2;3.1.3;3.1.4;3.1.5;3.1.6;3.1.7;3.1.8;3.1.8.1;3.1.8.2;3.1.8.3;3.1.9;3.1.9.1;3.1.9.2;3.1.9.3;3.1.9.4;3.1.10;3.2;3.3;3.4;4.1;4.2;4.2.1;4.2.2;4.2.3;4.2.4;4.2.5;4.3;4.3.1;4.3.2;4.7;4.8;4.9;4.10;5.1;5.2.1;6;6.1;6.2;7;8;9;10;11;11.1;11.2;11.3;11.4;12;13;14;15;16;17;18;18.1;18.2;19;19.1;19.2;19.3;20;21;22' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 72 as idx, 'Прием хирурга' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.12;1.12;4.3.1;4.3.2;4.7;4.10;6;6.1;6.2;7;8;10;11;11.1;11.2;11.3;11.4;14;19;19.1;19.2;19.3;20;21;22;5.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 73 as idx, 'Прием стоматолога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '1.20;11;11.1;11.2;11.3;11.4;12;13;14;17;19.1;19.2;19.3;20;21;22;23;24;25;26;27' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 74 as idx, 'Прием инфекциониста' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '2.4.1' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 76 as idx, 'Прием врача по водолазной медициние' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 75 as idx, 'Прием уролога' as name, null as speciality_id, null as tissueType_id, 0 as sex, '' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '19.1;19.2;19.3;20;21;' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory union
        select 3 as eventType_id, 77 as idx, 'УЗИ молочных желез' as name, null as speciality_id, null as tissueType_id, 2 as sex, '40г' as age, 1 as selectingGroup, 0 as actuality, 1 as expose, 0 as payable, '11;11.1;11.2;11.3;11.4' as hurtType, '' as hurtFactorType, null as defaultOrg_id, 0 as isCompulsory
);


select *
from Contract_Specification order by id desc ;

insert into Contract_Specification(deleted, master_id, eventType_id)
select 0, 3227, 140

select *
from ClientWork_Hurt;

select *
from Contract;

select count(Action.id)
from Action where event_id =
(select id
from Event where client_id = 2475859 and deleted = 0);

# select *
# from
     update
         Event
     set deleted = 1
     where client_id = 2475859 and deleted = 0;

select *
from EventType where id = 140;
start transaction;
insert into EventType_Action(eventType_id, idx, actionType_id, speciality_id, tissueType_id, sex, age,
                             selectionGroup, actuality, expose, payable, hurtType, hurtFactorType, defaultOrg_id, isCompulsory)
select eventType_id,
       row_number() over () - 1 idx,
       actionType_id,
       speciality_id,
       tissueType_id,
       sex,
       age,
       selectingGroup,
       actuality,
       expose,
       payable,
       hurtType,
       hurtFactorType,
       defaultOrg_id,
       isCompulsory
from (select et.id  eventType_id,
             0      idx,
             at1.id actionType_id,
             tet.speciality_id,
             tet.tissueType_id,
             tet.sex,
             tet.age,
             tet.selectingGroup,
             tet.actuality,
             tet.expose,
             tet.payable,
             tet.hurtType,
             tet.hurtFactorType,
             tet.defaultOrg_id,
             tet.isCompulsory
      from EventType_Action eta,
           EventType et,
           temp_eventType tet,
           ActionType at1
      where eta.id = (select id from EventType_Action order by id desc limit 1)
        and et.id = 140
        and at1.deleted = 0
        and at1.group_id in (84915, 84914)
        and at1.name = tet.name) as tmp
;

commit ;

select *
from EventType_Action where eventType_id = 140;

select *
from temp_eventType;

select
       3 eventType_id,
       idx,
       at1.name,
       speciality_id,
       tissueType_id,
       EventType_Action.sex,
       EventType_Action.age,
       selectionGroup,
       actuality, expose,
       payable,
       hurtType,
       hurtFactorType,
       EventType_Action.defaultOrg_id,
       isCompulsory
from EventType_Action, rbHurtType, ActionType at1 where EventType_Action.hurtType regexp rbHurtType.code
and rbHurtType.code not regexp 'OLD'
and eventType_id =123 and at1.id = EventType_Action.actionType_id and at1.deleted = 0 group by EventType_Action.id
;

select *
from EventType_Action;

select name
from EventType where deleted = 0;
start transaction ;
insert into s11.EventType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, code, name, purpose_id, finance_id, scene_id, visitServiceModifier, visitServiceFilter, visitFinance, actionFinance, actionContract, period, singleInPeriod, isLong, dateInput, service_id, context, form, minDuration, maxDuration,
                           showStatusActionsInPlanner, showDiagnosticActionsInPlanner, showCureActionsInPlanner,
                           showMiscActionsInPlanner, limitStatusActionsInput, limitDiagnosticActionsInput,
                           limitCureActionsInput, limitMiscActionsInput, showTime, medicalAidKind_id, medicalAidType_id,
                           eventProfile_id, mesRequired, defaultMesSpecification_id, mesCodeMask, mesNameMask,
                           counter_id, isExternal, generateExternalIdOnSave, externalIdAsAccountNumber, counterType,
                           hasAssistant, hasCurator, hasVisitAssistant, canHavePayableActions, isRequiredCoordination,
                           isOrgStructurePriority, isTakenTissue, isSetContractNumFromCounter, sex, age,
                           isOnJobPayedFilter, permitAnyActionDate, prefix, showLittleStranger, exposeGrouped,
                           uniqueExternalId, uniqueExternalIdInThisYear, defaultOrder, inheritDiagnosis,
                           diagnosisSetDateVisible, isResetSetDate, isAvailInFastCreateMode, defaultEndTime,
                           caseCast_id, isCheck_KSG, weekdays, exposeConfirmation, needMesPerformPercent, showZNO,
                           goalFilter, setFilterStandard, inheritResult, eventKind_id, inheritCheckupResult,
                           payerAutoFilling, dispByMobileTeam, filterPosts, filterSpecialities,
                           compulsoryServiceStopIgnore, voluntaryServiceStopIgnore, inheritGoal, reqDN, reqHealthGroup,
                           isAddTreatmentToDeath, needReferal, referalDateActualityDays, eventGoal, result, MKB,
                           postfix, chk_ZNO, chkMKB_ZNO, chkReason_ZNO, chkstady_ZNO, chkstady_T_ZNO, chkstady_N_ZNO,
                           chkstady_M_ZNO, chkDate_ZNO, chkConsiliumData, isWithoutResponsiblePerson, isKSGCriterion,
                           isKslpShow, chk_SendInIEMK, isSeveralEvents, chkTransf, transfId,
                           availableForExternal, allowCopyDiagnosis)
values (now(), NULL, now(), NULL, 0, '106', 'Периодические осмотры для взрослых(для маркетологов)', 3, null, null, '', '', 1, 1, 0, 6, 0, 0, 0, null, 'f131pe', '131', 0,
        0, 0, 1, 1, 0, 0, 0, 0, 1, 0, null, null, null, 0, null, '', '', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0,
        '', 0, 0, '', 0, 0, 0, 0, 1, 0, 1, 0, 1, '00:00:00', null, 0, 5, 0, 0, 0, 0, 0, 1, null, 1, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, null, null, '', null, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0, 0);
rollback;
commit;

select *
from EventType where deleted = 0 order by id desc ;



start transaction;
insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                            code, name, title, flatCode, sex, age, office, showInForm,
                            genTimetable, quotaType_id, context, amount, amountEvaluation, defaultStatus,
                            defaultDirectionDate, defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id,
                            defaultSetPerson_id, defaultPersonInEvent, defaultPersonInEditor, defaultMKB,
                            defaultMorphology, isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                            nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination,
                            isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible,
                            propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id,
                            isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec,
                            isActiveGroup, lis_code, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg,
                            filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired,
                            checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, code_f14, code_f30, EGISZ_code)
values (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14004', 'Прием хирурга', 'Прием хирурга', '', 0, '', '220, 8.00-12:00',
        1, 0, null, '', 1, 0, 5, 1, 0, 3, 351, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, '', 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14005', 'Прием дерматовенеролога', 'Прием дерматовенеролога', '', 0, '',
        '313, 9:00-12:00', 1, 0, null, '', 0, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14006', 'Прием невролога', 'Прием невролога', '', 0, '',
        '312/310, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 319, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14007', 'Прием оториноларинголога', 'Прием оториноларинголога', '', 0,
        '', '217-221, 9:00 - 12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 205, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL,
        1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14008', 'Прием офтальмолога', 'Прием офтальмолога', '', 0, '',
        '212-210, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 218, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14019', 'Аудиометрия', 'Аудиометрия', '', 0, '', '', 1, 0, null, '', 1,
        0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 2, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14022', 'Спирометрия', 'Спирометрия', '', 0, '', '314, 9:30-12:30', 1, 0,
        null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1,
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14023', 'Ретнтгенография гр клетки в 2х проекциях',
        'Ретнтгенография гр клетки в 2х проекциях', '', 0, '', '105, 9.30-11.00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 260,
        null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
        null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14024', 'Биомикроскопия сред. глаза', 'Биомикроскопия сред. глаза', '',
        0, '', '210-212', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14025', 'Офтальмоскопия глазного дна', 'Офтальмоскопия глазного дна', '',
        0, '', '210-212', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14027', 'Исследование вестибулярного анализатора',
        'Исследование вестибулярного анализатора', '', 0, '', '', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5,
        0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1,
        0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14028', 'ФГДС', 'ФГДС', '', 0, '', '', 1, 0, null, '', 1, 0, 5, 1, 0, 3,
        null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14029', 'АЛТ АСТ', 'АЛТ АСТ', '', 0, '', '205, 9:00-11:00', 1, 0, null,
        '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14030', 'Билирубин', 'Билирубин', '', 0, '', '', 1, 0, null, '', 1, 0, 5,
        1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14031', 'Узи брюшной полости', 'Узи брюшной полости', '', 0, '',
        '322 или 327/324,', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 298, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14032', 'Исслед крови на сифилис', 'Исслед крови на сифилис', '', 0, '',
        '205, 8:30-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14033',
        'Исслед на носительство возб киш инфекций и серолог обслед на брюш тиф',
        'Исслед на носительство возб киш инфекций и серолог обслед на брюш тиф', '', 0, '', 'НЕТ', 1, 0, null, '', 1, 0,
        5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14034', 'Исслед на гельминтозы', 'Исслед на гельминтозы', '', 0, '',
        '102, 8:30-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null,
        null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14035', 'Мазок из зева и носа на наличие патогенного стафилококка',
        'Мазок из зева и носа на наличие патогенного стафилококка', '', 0, '', '217, 10:00-12:00', 1, 0, null, '', 1, 0,
        5, 1, 0, 3, 205, null, 3, 0, 5, 0, 0, null, 0, 0, 0, NULL, 1, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84914, '14558', 'Первичный прием стоматолога', 'Первичный прием стоматолога', '',
        0, '', '301, 10:00-11:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, 202, null, 3, 0, 0, 0, 0, null, 0, 0, 0, NULL, 1,
        null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', '');

insert into s11.ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                            code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id,
                            context, amount, amountEvaluation, defaultStatus, defaultDirectionDate,
                            defaultPlannedEndDate, defaultEndDate, defaultExecPerson_id, defaultSetPerson_id,
                            defaultPersonInEvent, defaultPersonInEditor, defaultMKB, defaultMorphology,
                            isMorphologyRequired, defaultOrg_id, showTime, maxOccursInEvent, isMES,
                            nomenclativeService_id, isPreferable, prescribedType_id, shedule_id, isRequiredCoordination,
                            isNomenclatureExpense, hasAssistant, propertyAssignedVisible, propertyUnitVisible,
                            propertyNormVisible, propertyEvaluationVisible, serviceType, actualAppointmentDuration,
                            isSubstituteEndDateToEvent, isPrinted, defaultMES, frequencyCount, frequencyPeriod,
                            frequencyPeriodType, isStrictFrequency, isFrequencyPeriodByCalendar, counter_id,
                            isCustomSum, recommendationExpirePeriod, recommendationControl, isExecRequiredForEventExec,
                            isActiveGroup, lis_code, locked, filledLock, refferalType_id, defaultBeginDate, showAPOrg,
                            filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired,
                            checkPersonSet, defaultIsUrgent, checkEnterNote, formulaAlias, code_f14, code_f30,
                            EGISZ_code)
values (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14201', 'Спирометрия', 'Спирометрия', '', 0, '', '314, 9:30-12:30', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14202', 'Пульсоксиметрия', 'Пульсоксиметрия', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 2, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14203', 'Биомикроскопия глаза', 'Биомикроскопия глаза', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14204', 'ретикулоциты', 'ретикулоциты', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14205', 'метгемоглобин', 'метгемоглобин', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14206', 'Визометрия', 'Визометрия', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14207',
        'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года',
        'Рентгенография длинных трубчатых костей (фтор и его соединения) 1 раз в 2 года', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14208', 'тромбоциты', 'тромбоциты', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14209', 'Тональная пороговая аудиометрия',
        'Тональная пороговая аудиометрия', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14210',
        'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче',
        'Исследование уровня дельта аминолевулиновой кислоты или копропорфирина в моче', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14211', 'УЗИ органов брюшной полости', 'УЗИ органов брюшной полости',
        '', 0, '', '322 или 327/324', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14212', 'Ультразвуковое обследование органов малого таза',
        'Ультразвуковое обследование органов малого таза', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null,
        0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null,
        0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14213', 'карбоксигемоглобин в крови', 'карбоксигемоглобин в крови', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14214', 'Периметрия', 'Периметрия', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14215',
        'Для работы с препаратами крови определение в крови HBsAg, a-HBCOR, IgM, A-HCV-IgG',
        'Для работы с препаратами крови определение в крови HBsAg, a-HBCOR, IgM, A-HCV-IgG', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14216',
        'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза',
        'Реакция агглютинации Хеддельсона крови при контакте с возбудителями бруцеллеза', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14217',
        'Анализ крови на HBs-Ag, анти-HBc-Ig (суммарные), анти-HCV-Ig (суммарные), определение уровня щелочной фосфатазы, билирубина,',
        'Анализ крови на HBs-Ag, анти-HBc-Ig (суммарные), анти-HCV-Ig (суммарные), определение уровня щелочной фосфатазы, билирубина,',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14218', 'ВИЧ', 'ВИЧ', '', 0, '', '205, 8:30-11:00', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14219', 'аспартатаминотрансфераза (АСТ)',
        'аспартатаминотрансфераза (АСТ)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14220', 'аланинаминотрансфераза (АЛТ)', 'аланинаминотрансфераза (АЛТ)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14222', 'Тромбоциты', 'Тромбоциты', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14223', 'Психофизиологическое исследование',
        'Психофизиологическое исследование', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14224', 'Рефрактометрия (или скиаскопия)',
        'Рефрактометрия (или скиаскопия)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14225', 'Офтальмоскопия глазного дна', 'Офтальмоскопия глазного дна',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14226', 'УЗИ органов брюшной полости и щитовидной железы',
        'УЗИ органов брюшной полости и щитовидной железы', '', 0, '', '322, 327/324', 1, 0, null, '', 1, 0, 0, 1, 0, 2,
        null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0,
        0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14227', 'Паллестезиметрия', 'Паллестезиметрия', '', 0, '',
        '(ВИБРОТЕСТ) 314, 9:30-12:30', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14228', 'Исследование функции вестибулярного аппарата',
        'Исследование функции вестибулярного аппарата', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0,
        0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0,
        0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14229', 'Определение бинокулярного зрения',
        'Определение бинокулярного зрения', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14230', 'Исследование аккомодации', 'Исследование аккомодации', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14231', 'Рефрактометрия', 'Рефрактометрия', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14232', 'Исследование цветоощущения', 'Исследование цветоощущения', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14233', 'Непрямая ларингоскопия', 'Непрямая ларингоскопия', '', 0, '',
        '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0,
        1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0,
        null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14234', 'Измерение внутриглазного давления',
        'Измерение внутриглазного давления', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14235', 'Эзофагогастродуоденоскопия', 'Эзофагогастродуоденоскопия', '',
        0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null,
        0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0,
        0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14236', 'Исследование цветоощущения по полихроматическим таблицам',
        'Исследование цветоощущения по полихроматическим таблицам', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2,
        null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0,
        0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14237', 'Электроэнцефалография', 'Электроэнцефалография', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14238',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14239', 'Креатинин', 'Креатинин', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14240', 'Мочевина', 'Мочевина', '', 0, '', '', 1, 0, null, '', 1, 0, 0,
        1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14241',
        'Исследование уровня холестерина в крови (до достижения возраста 40 лет)',
        'Исследование уровня холестерина в крови (до достижения возраста 40 лет)', '', 0, '', '', 1, 0, null, '', 1, 0,
        0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14242',
        'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям',
        'Рентгенография околоносовых пазух (при предварительном медицинском осмотре и по показаниям', '', 0, '', '', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14243',
        'Эхокардиография (при предварительном медицинском осмотре и по показаниям)',
        'Эхокардиография (при предварительном медицинском осмотре и по показаниям)', '', 0, '', '', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0,
        1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14244',
        'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)',
        'Велоэргометрия (до достижения возраста 40 лет один раз в два года, далее - ежегодно)', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14245', 'Эзофагогастродуоденоскопия (1 раз в 3 года)',
        'Эзофагогастродуоденоскопия (1 раз в 3 года)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0,
        0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0,
        0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14246',
        'Ультразвуковые исследования печени, желчного пузыря, поджелудочной железы, селезенки, почек (один раз в 3 года);',
        'Ультразвуковые исследования печени, желчного пузыря, поджелудочной железы, селезенки, почек (один раз в 3 года);',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14247',
        'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)',
        'Ультразвуковые исследования предстательной железы (по достижении возраста 40 лет - один раз в 3 года)', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14248',
        'Ортостатическая проба (при предварительном медицинском осмотре)',
        'Ортостатическая проба (при предварительном медицинском осмотре)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0,
        2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14249',
        'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)',
        'Исследование барофункции уха (при предварительном медицинском осмотре и по показаниям)', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14250',
        'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям',
        'Определение (исследование) устойчивости организма к декомпрессионному газообразованию (по показаниям', '', 0,
        '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0,
        0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0,
        0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14251',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре для работников, работающих на глубинах более 40 м) ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14252',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре для работников, выполняющих водолазные работы на глубинах более 40 метров или с применением для дыхания искусственных дыхательных ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14254',
        'Исследование уровня фибриногена, протромбинового индекса, триглицеридов, мочевой кислоты, общего белка, калия, натрия, железа, щелочной фосфатазы в крови',
        'Исследование уровня фибриногена, протромбинового индекса, триглицеридов, мочевой кислоты, общего белка, калия, натрия, железа, щелочной фосфатазы в крови',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14255',
        'Ультразвуковая допплерография транскраниальная артерий методом мониторирования',
        'Ультразвуковая допплерография транскраниальная артерий методом мониторирования', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14256',
        'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)',
        'Рентгенография шейно-дорсального и пояснично-крестцового отдела позвоночника (1 раз в 5 лет)', '', 0, '', '',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null,
        '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14257', 'Ортопантомография (1 раз в 3 года)',
        'Ортопантомография (1 раз в 3 года)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0,
        0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1,
        0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14258', 'Ортопантомография ', 'Ортопантомография ', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1,
        1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '',
        ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14259', 'Ректороманоскопия (1 раз в 5 лет)',
        'Ректороманоскопия (1 раз в 5 лет)', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14260',
        'Определение группы крови и резус-фактора при предварительном осмотре',
        'Определение группы крови и резус-фактора при предварительном осмотре', '', 0, '', '', 1, 0, null, '', 1, 0, 0,
        1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0,
        0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14261',
        'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.',
        'Определение в крови HBsAg,a-HBCOR, иммуноглобулин M, A-HCV, иммуноглобулин G, ВИЧ (при согласии работника) при предварительном медицинском осмотре, в дальнейшем по медицинским показаниям.',
        '', 0, '', '205, 8:30-11:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null,
        1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1,
        0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14262',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.',
        'Определение (исследование) устойчивости организма к токсическому действию кислорода (при предварительном медицинском осмотре) <5>.',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14264',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ',
        'Определение (исследование) устойчивости организма к наркотическому действию азота (при предварительном медицинском осмотре) ',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14265',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        'Определение группы крови и резус-фактора, исследование крови на ВИЧ, сифилис, вирусные гепатиты B и C (при предварительном осмотре)',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14270', 'Острота зрения', 'Острота зрения', '', 0, '', '', 1, 0, null,
        '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0,
        0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14271', 'Поля зрения', 'Поля зрения', '', 0, '', '', 1, 0, null, '', 1,
        0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0,
        1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14272', 'Исследование крови на сифилис',
        'Исследование крови на сифилис', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0,
        null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14273',
        'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям',
        'Исследования на носительство возбудителей кишечных инфекций и серологическое обследование на брюшной тиф при поступлении на работу и в дальнейшем - по эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14274',
        'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям',
        'Исследования на гельминтозы при поступлении на работу и в дальнейшем - не реже 1 раза в год либо по эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14275',
        'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям',
        'Мазок из зева и носа на наличие патогенного стафилококка при поступлении на работу, в дальнейшем - по медицинским и эпидпоказаниям',
        '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14276', 'Мазки на гонорею при поступлении на работу',
        'Мазки на гонорею при поступлении на работу', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0,
        0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0,
        0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14302', 'Прием дерматовенеролога', 'Прием дерматовенеролога', '', 0, '',
        '313, 9:00-12:00', 1, 0, null, '', 1, 0, 5, 1, 0, 3, null, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14303', 'Прием оториноларинголог', 'Прием оториноларинголог', '', 0, '',
        '217-221, 9:00-12:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, 365, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14304', 'Прием офтальмолога', 'Прием офтальмолога', '', 0, '',
        '212-210, 9:00-12:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1,
        null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0,
        0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14305', 'Прием хирурга', 'Прием хирурга', '', 0, '', '220, 8:00-12:00',
        1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 5, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14306', 'Прием стоматолога', 'Прием стоматолога', '', 0, '',
        '301, 10:00-11:00', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 5, 0, null, 0, 0, 0, null, 1, null,
        null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0,
        0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14307', 'Прием инфекциониста', 'Прием инфекциониста', '', 0, '', '', 1,
        0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1,
        1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '',
        '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14308', 'Прием уролога', 'Прием уролога', '', 0, '', '', 1, 0, null, '',
        1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, null, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0,
        0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14309', 'Прием врача по водолазной медициние',
        'Прием врача по водолазной медициние', '', 0, '', '', 1, 0, null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0,
        0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0,
        null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, 84915, '14278', 'УЗИ молочных желез', 'УЗИ молочных желез', '', 0, '', '', 1, 0,
        null, '', 1, 0, 0, 1, 0, 2, null, null, 0, 0, 0, 0, 0, null, 0, 0, 0, null, 1, null, null, 0, 0, 0, 1, 1, 1, 1,
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, '', 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, '', '', '', '');

rollback ;
commit ;


start transaction;
insert into ActionType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, deleted, class, group_id,
                        code, name, title, flatCode, sex, age, office, showInForm, genTimetable, quotaType_id, context,
                        amount, amountEvaluation, defaultStatus, defaultDirectionDate, defaultPlannedEndDate,
                        defaultEndDate, defaultExecPerson_id, defaultSetPerson_id, defaultPersonInEvent,
                        defaultPersonInEditor, defaultMKB, defaultMorphology, isMorphologyRequired, defaultOrg_id,
                        showTime, maxOccursInEvent, isMES, nomenclativeService_id, isPreferable, prescribedType_id,
                        shedule_id, isRequiredCoordination, isNomenclatureExpense, hasAssistant,
                        propertyAssignedVisible, propertyUnitVisible, propertyNormVisible, propertyEvaluationVisible,
                        serviceType, actualAppointmentDuration, isSubstituteEndDateToEvent, isPrinted, defaultMES,
                        frequencyCount, frequencyPeriod, frequencyPeriodType, isStrictFrequency,
                        isFrequencyPeriodByCalendar, counter_id, isCustomSum, recommendationExpirePeriod,
                        recommendationControl, isExecRequiredForEventExec, isActiveGroup, lis_code, locked, filledLock,
                        refferalType_id, defaultBeginDate, showAPOrg,
                        filterPosts, filterSpecialities, isIgnoreEventExecDate, advancePaymentRequired, checkPersonSet,
                        defaultIsUrgent, checkEnterNote, formulaAlias, EGISZ_code, code_f30, code_f14)
values (NOW(), NULL, NOW(), NULL, 0, 3, null, '*01', 'Проф.осмотры', '', '', 0, '', '', 1, 0, null, '', 0, 0, 2, 1, 0,
        3, NULL, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 0, null, null, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', ''),
       (NOW(), NULL, NOW(), NULL, 0, 3, null, '*01_1', 'Проф.осмотры(новые)', '', '', 0, '', '', 1, 0, null, '', 0, 0,
        2, 1, 0, 3, NULL, null, 3, 0, 5, 0, 0, null, 0, 0, 0, null, 0, null, null, 0, 0, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, 1, 0, null, 0, 0, null, 0, 1, 0, 0, 0, 0, 0, 0, 0, null, '', '', '');

commit ;

select *
from ActionType where group_id in
(select id
from ActionType
where id in (84915, 84914));

select *
from ActionType
where id in (84915, 84914);

select *
from ActionType order by id desc ;

select apt.id,
       apt.deleted,
       actionType_id,
       at1.name,
       idx,
       template_id,
       apt.name,
       shortName,
       descr,
       unit_id,
       typeName,
       valueDomain,
       defaultValue,
       isVector,
       norm,
       apt.sex,
       apt.age,
       penalty,
       penaltyUserProfile,
       penaltyDiagnosis,
       visibleInJobTicket,
       visibleInTableRedactor,
       isAssignable,
       test_id,
       defaultEvaluation,
       canChangeOnlyOwner,
       isActionNameSpecifier,
       laboratoryCalculator,
       inActionsSelectionTable,
       redactorSizeFactor,
       isFrozen,
       typeEditable,
       visibleInDR,
       userProfile_id,
       userProfileBehaviour,
       copyModifier,
       isVitalParam,
       vitalParamId,
       isODIIParam,
       customSelect,
       autoFieldUserProfile,
       apt.formulaAlias
from ActionType at1, ActionPropertyType apt
where at1.group_id in
(select id
from ActionType where id in(9268,11268))
and apt.actionType_id = at1.id
;


select *
from ActionType where group_id = 9268;

select *
from ActionPropertyType where actionType_id = 9205;

select *
from ActionType;

select *
from rbService;

select *
from rbHurtType;

select *
from rbHurtFactorType;

select *
from EventType_Action, rb where hurtFactorType regexp ;



#
select createDatetime,
       createPerson_id,
       modifyDatetime,
       modifyPerson_id,
       code,
       regexp_replace(code, '(.*)', 'OLD_\\1') name #
from update rbHurtFactorType set code = regexp_replace(code, '(.*)', 'OLD_\\1');

# select *
# from
update
rbHurtType
set code = regexp_replace(code, '(.*)', 'OLD_\\1');

select */*bigin*/
from rbHurtFactorType;
select *
from rbHurtType;
insert into s11.rbHurtFactorType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name)
values  (now(), NULL, now(), NULL, '0', 'Отсутствие фактора вредности');/*end*/

insert into s11.rbHurtType (createDatetime, createPerson_id, modifyDatetime, modifyPerson_id, code, name)
values  (now(), NULL, now(), NULL, '0', 'Отсутствие типа вредности'),
        (now(), NULL, now(), NULL, '*', '*'),
        (now(), null, now(), null, '1', ' 1 Химические факторы'),
        (now(), null, now(), null, '1.1', 'Азота неорганические соединения (в том числе азота оксиды (О), азота диоксид(О))'),
        (now(), null, now(), null, '1.2', 'Азотсодержащие органические соединения (в том числе амины, амиды, анилиды, гидразин и его производные, нитросоединения и прочие производные: NN-диметилацетамид(Р), NN-диметилформамид(Р), капролактам(АР) (гексагидро-2Н-азепин-2-он)'),
        (now(), null, now(), null, '1.3', 'Альдегиды алифатические (предельные и непредельные) и ароматические (формальдегид(АКРО), ацетальдегид, проп-2-ен-1-аль (акролеин), бензальдегид, бензол-1,2-дикарбальдегид (фталевый альдегид)'),
        (now(), null, now(), null, '1.4', 'Альдегиды и кетоны галогенопроизводные (хлорбензальдегид (4-хлорбензальдегид), фторацетон, хлорацетофенон)'),
        (now(), null, now(), null, '1.5', 'Алюминий и его соединения, в том числе:'),
        (now(), null, now(), null, '1.5.1', 'Алюмоплатиновые катализаторы(А)'),
        (now(), null, now(), null, '1.6', 'Бериллий и его соединения(АКР)'),
        (now(), null, now(), null, '1.7', 'Бор и его соединения, в том числе:'),
        (now(), null, now(), null, '1.7.1', 'Борная кислота, бор нитрид(Ф), бор трифторид(О), тетраБор карбид(Ф), тетраБор трисилицид(Ф)'),
        (now(), null, now(), null, '1.7.2', 'Бороводороды(О)'),
        (now(), null, now(), null, '1.8', 'Галогены, в том числе:'),
        (now(), null, now(), null, '1.8.1', 'Хлор(О):'),
        (now(), null, now(), null, '1.8.1.1', 'Хлора неорганические соединения (гидрохлорид(О), кислоты, оксиды)'),
        (now(), null, now(), null, '1.8.1.2', 'Хлорсодержащие органические соединения'),
        (now(), null, now(), null, '1.8.2', 'Бром(АО)'),
        (now(), null, now(), null, '1.8.2.1', 'Брома неорганические соединения (бром(АО))'),
        (now(), null, now(), null, '1.8.2.2', 'Бромсодержащие органические соединения (в том числе бромбензол, бромгексан, бромметан)'),
        (now(), null, now(), null, '1.8.3', 'Йод'),
        (now(), null, now(), null, '1.8.3.1', 'Йода неорганические соединения (йод, оксиды, кислоты и прочие)'),
        (now(), null, now(), null, '1.8.3.2', 'Йодсодержащие органические соединения (в том числе йодбензол, йодметилбензол)'),
        (now(), null, now(), null, '1.8.4', 'Фтор(О)'),
        (now(), null, now(), null, '1.8.4.1', 'Фтора неорганические соединения (в том числе фтор(О), гидрофторид(РО), аммоний фторид(Р), соединения металлов с фтором: барий дифторид(Р), калий фторид(Р), литий фторид(Р), натрий фторид(Р), криолит(Р), олово фторид(Р))'),
        (now(), null, now(), null, '1.8.4.2', 'Фторорганические соединения и фторхлорорганические соединения (в том числе дихлорфторметан, дихлорфторметилбензол, фторхлорэтан)'),
        (now(), null, now(), null, '1.9', 'Карбонилдихлорид (фосген)(О)'),
        (now(), null, now(), null, '1.10', 'Гидразин и его производные: фенилгидразин гидрохлорид, борингидразин, диметилгидразин (гептил)(К)'),
        (now(), null, now(), null, '1.11', 'Дибензодиоксины полихлорированные (ПХДД), дибензофураны полихлорированные, 2,3,4,7,8-пентахлордибензофуран, бифенилы полибромированные и полихлорированные(К), 2,3,7,8-тетрахлордибензо-пара-диоксин(К), 3,3,4,4,5-пентахлорбифенил (ПХБ-126)(К), диметилкарбамо'),
        (now(), null, now(), null, '1.12', 'Кадмий и его соединения(К), кадмий ртуть теллур (твердый раствор)(К), октадеканоат кадмия(К)'),
        (now(), null, now(), null, '1.13', 'Карбонилы металлов, в том числе железо пентакарбонил, кобальт гидридотетракарбонил(АО)'),
        (now(), null, now(), null, '1.14', 'Кетоны, в том числе:'),
        (now(), null, now(), null, '1.14.1', 'Кетоны алифатические, ароматические 1-фенилэтанон (ацетофенон), пентан-2-он (метилэтилкетон)'),
        (now(), null, now(), null, '1.14.2', 'Пропан-2-он(Р) (ацетон)'),
        (now(), null, now(), null, '1.15', 'Кислоты органические: метановая (муравьиная), этановая (уксусная), бутановая (масляная), пропионовая, 1-метилбутановая (изовалериановая), этадионовая кислота дигидрат (щавелевая), 4-метилпентановая (изокапроновая), проп-2-еновая (акриловая), бензойная и пр'),
        (now(), null, now(), null, '1.15.1', 'Бензол-1,3-дикарбоновая(А) (изофталевая) и бензол-1,4-дикарбоновая(А) (терефталевая) кислоты'),
        (now(), null, now(), null, '1.16', 'Кремния органические соединения(А) (силаны), в том числе трихлор(хлорметил) силан, фенилтрихлорсилан, трихлорсилан'),
        (now(), null, now(), null, '1.17', 'Марганец(Р) и его соединения, в том числе марганец карбонат гидрат(АР), марганец нитрат гексагидрат(АР), марганец сульфат пентагидрат(А), марганец трикарбонилциклопентадиен(Р)'),
        (now(), null, now(), null, '1.18', 'Медь, золото, серебро и их соединения, в том числе:'),
        (now(), null, now(), null, '1.18.1', 'Медь и ее соединения'),
        (now(), null, now(), null, '1.18.2', 'Золото(А) и его соединения'),
        (now(), null, now(), null, '1.18.3', 'Серебро(Р) и его соединения'),
        (now(), null, now(), null, '1.19', 'Металлы щелочные, щелочноземельные, редкоземельные и их соединения, в том числе:'),
        (now(), null, now(), null, '1.19.1', 'Натрий, калий, литий, рубидий, цезий, цезиевая соль хлорированного бисдикарбонил кобальта и прочие; кальций, магний, стронций, барий, магнид меди(Ф), магний додекаборид; лантан, иттрий, скандий, церий и их соединения'),
        (now(), null, now(), null, '1.19.2', 'Кобальт(А), молибден, вольфрам(Ф), тантал(Ф), ниобий(Ф) и их соединения'),
        (now(), null, now(), null, '1.19.3', 'Ванадий, европий, иттрий, оксид фосфат (люминофор Л-43 (ванадат иттрия фосфат)(Р)'),
        (now(), null, now(), null, '1.20', 'Ртуть(Р) и ее соединения: ртуть(Р); металлоорганические соединения (ртуть неорганические соединения и прочие); органические соединения ртути'),
        (now(), null, now(), null, '1.21', 'Мышьяк и его неорганические(КР) и органические соединения'),
        (now(), null, now(), null, '1.22', 'Никель и его соединения(АК), гептаникель гексасульфид(АК), никель тетракарбонил(АКО), никель хром гексагидрофосфат(АК), никеля соли(АК)'),
        (now(), null, now(), null, '1.23', 'Озон(О)'),
        (now(), null, now(), null, '1.24', 'Оксиды органические и перекиси: эпоксиэтан(КР) (этилена оксид), 1,2-эпоксипропан(К) (пропилена оксид), (хлорметил) оксиран(АК) (эпихлоргидрин)'),
        (now(), null, now(), null, '1.25', 'Олово и его соединения'),
        (now(), null, now(), null, '1.26', 'Платиновые металлы и их соединения: рутений, родий, палладий(А), диАммоний дихлорпалладий(А), осмий, иридий, платина, диАммоний гексахлорплатинат(А)'),
        (now(), null, now(), null, '1.27', 'Свинец, в том числе:'),
        (now(), null, now(), null, '1.27.1', 'Свинец и его неорганические соединения(РК)'),
        (now(), null, now(), null, '1.27.2', 'Свинца органические соединения: тетраэтилсвинец(О), 1,4-дигидрооксибензол свинец аддукт'),
        (now(), null, now(), null, '1.28', 'Селен, теллур и их соединения'),
        (now(), null, now(), null, '1.29', 'Серы соединения, в том числе:'),
        (now(), null, now(), null, '1.29.1', 'Серы оксиды, кислоты'),
        (now(), null, now(), null, '1.29.2', 'Дигидросульфид (сероводород)(О), дигидросульфид(О) (сероводород) смесь с углеводородами C1-5'),
        (now(), null, now(), null, '1.29.3', 'Углерод дисульфид(Р) (сероуглерод)'),
        (now(), null, now(), null, '1.29.4', 'Серусодержащие органические соединения: тиолы (меркаптаны), тиоамиды: метантиол (метилмеркаптан), этантиол (этилмеркаптан)'),
        (now(), null, now(), null, '1.29.5', 'Тетраметилтиопероксидикарбондиамид(А) (тиурам Д)'),
        (now(), null, now(), null, '1.30', 'Спирты, в том числе:'),
        (now(), null, now(), null, '1.30.1', 'Алифатические одно- и многоатомные, ароматические спирты и их производные: этанол, бутан-1-ол, бутан-2-ол, бутанол, метанол, пропан-1-ол, пропан-2-ол, 2-(Проп-2-енокси) этанол, 2-этоксиэтанол(Р), бензилкарбинол(Р), этан-1,2-диол (этиленгликоль), пропан-2-д'),
        (now(), null, now(), null, '1.31', 'Сурьма(Р) и ее соединения'),
        (now(), null, now(), null, '1.32', 'Таллий, индий, галлий и их соединения'),
        (now(), null, now(), null, '1.33', 'Титан(Ф), цирконий, гафний, германий и их соединения'),
        (now(), null, now(), null, '1.34', 'Углеводородов алифатических галогенопроизводные, в том числе:'),
        (now(), null, now(), null, '1.34.1', 'Дихлорметан(Р) (хлористый метилен), 1,2-дихлорэтан, тетрахлорметан (четыреххлористый углерод)(Р), трихлорметан (хлороформ), хлорметан(Р) (хлористый метил), бромэтан, трихлорэтан, трихлорэтен, 1 и 2-хлорбута-1,3-диен (хлоропрен)(Р), тетрафторэтен (перфториз'),
        (now(), null, now(), null, '1.34.2', 'Хлорэтен(КР) (винилхлорид)'),
        (now(), null, now(), null, '1.35', 'Углеводороды гетероциклические: фуран(А), фуран-2-альдегид(А) (фурфураль), пиридин и его соединения, пиперидины, тетрагидро-1,4-оксазин (морфолин) и другие'),
        (now(), null, now(), null, '1.36', 'Углеводороды алифатические предельные, непредельные, циклические, в том числе:'),
        (now(), null, now(), null, '1.36.1', 'Метан, этан, пропан, парафины, этилен, пропилен, ацетилен, циклогексан'),
        (now(), null, now(), null, '1.36.2', 'Бута-1,3-диен(КР) (1,3-бутадиен, дивинил)'),
        (now(), null, now(), null, '1.36.3', '1,7,7триметилбицикло [2,2,1]гептан-2-он (камфара)'),
        (now(), null, now(), null, '1.37', 'Углеводороды ароматические:'),
        (now(), null, now(), null, '1.37.1', 'Бензол(КР) и его производные: (толуол(Р) (метилбензол), ксилол(Р) (диметилбензол), стирол (этенилбензол) и прочие), гидроксибензол(Р) (фенол) и его производные, крезол в том числе:'),
        (now(), null, now(), null, '1.37.1.1', 'Амино- и нитросоединения ароматических углеводородов и их производные: аминобензол (анилин), м-, п-толуидин, N-метиламинобензол (метил-аланин), аминонитро-бензолы; нитрохлорбензолы, нитро-, аминофенолы, 2-метил-1,3,5-тринитробензол (тринитротолуол), диамин'),
        (now(), null, now(), null, '1.37.1.2', 'Галогенопроизводные ароматические углеводороды: хлорбензол, (хлорметил)бензол(А) (хлортолуол; бензилхлорид), бромбензол(А), трихлорбензол, трифтор-метилбензол, 1-гидрокси-2-хлорбензол, 1-гидрокси-4-хлорбензол, 1-гидрокси-2,4,6 трихлорбензол (хлорфенолы), 4'),
        (now(), null, now(), null, '1.37.2', 'Полициклические ароматические углеводороды и их производные (нафталин, нафтолы, бенз(а)пирен(КР), дибенз(a,h)антрацен(К), антрацен, бензантрон, бенз(а)антрацен(К), фенантрен, 4-гидрокси-3-(3оксо-1-фенилбу-2H-1-бензопиран(Р))'),
        (now(), null, now(), null, '1.38', 'Углеводородов алифатических амино- и нитросоединения и их производные (в том числе метиламин, этиленимин(АО), 1,6-диаминогексан (гексаметилендиамин)(А), циклогексиламин)'),
        (now(), null, now(), null, '1.39', 'Углерода оксид(РО)'),
        (now(), null, now(), null, '1.40', 'Фосфор и его соединения, в том числе:'),
        (now(), null, now(), null, '1.40.1', 'Фосфорсодержащие неорганические соединения (в том числе фосфин(О), фосфориллорид(О), фосфиды металлов, галогениды фосфора, фосфор пентаоксид)'),
        (now(), null, now(), null, '1.40.2', 'Фосфорсодержащие органические соединения - трикрезилфосфат(Р) и другие'),
        (now(), null, now(), null, '1.41', 'Хиноны и их производные (в том числе нафтохиноны, бензохиноны, гидрохиноны(А), антрахинон (антрацен-9,10-дион)'),
        (now(), null, now(), null, '1.42', 'Хром (VI) триоксид(КР), диХромтриоксид(А), хром трихлорид гексагидрат(А), хромовая кислота(АК) и ее соли, соединения хрома и сплавы'),
        (now(), null, now(), null, '1.43', 'Цианистые соединения, в том числе:'),
        (now(), null, now(), null, '1.43.1', 'Цианистоводородная кислота(О), ее соли, галоген- и другие производные (цианистый калий(О), хлорциан(О), цианамид и прочие - гидроцианида соли(О), бензилцианид(О)); нитрилы органических кислот: ацетонитрил, бензонитрил и другие'),
        (now(), null, now(), null, '1.43.2', 'Акрилонитрил(РА) (проп-2-енонитрил)'),
        (now(), null, now(), null, '1.44', 'Цинк и его соединения(А)'),
        (now(), null, now(), null, '1.45', 'Эфиры сложные кислот органических, в том числе:'),
        (now(), null, now(), null, '1.45.1', 'Эфиры сложные уксусной кислоты (в том числе этилацетат, бутилацетат, 2-метоксиэтилацетат(Р), 2-этоксиэтилацетат(Р))'),
        (now(), null, now(), null, '1.45.2', 'Эфиры сложные акриловой кислоты (в том числе метилакрилат (метилпроп-2-еноат), бутилакрилат(бутилпроп-2-еноат), метилметакрилат)'),
        (now(), null, now(), null, '1.45.3', 'Эфиры сложные фталевой и терефталевой кислот: дибутилбензол-1,2-дикарбонат (дибутилфталат), диметилбензол-1,2-дикарбонат (диметилтерефталат) и другие'),
        (now(), null, now(), null, '1.46', 'Красители и пигменты органические (в том числе азокрасители, бензидиновые(К), фталоцианиновые, хлортиазиновые, антрахиноновые, триарилметановые, тиоин-дигоидные, полиэфирные)'),
        (now(), null, now(), null, '1.47', 'Пестициды, инсектициды, гербициды, в том числе:'),
        (now(), null, now(), null, '1.47.1', 'Хлорорганические(А) (в том числе метоксихлор, гепта-хлор, хлоридан, дихлор, гексахлорбензол, гексахлорциклогексан (линдан), дикофол, 1,1,-(2,2,2 трихлорэтилиден) бис (4хлорбензол)(Р) (ДДТ)'),
        (now(), null, now(), null, '1.47.2', 'Фосфорорганические (в том числе метафос, метилэтил-тиофос, меркаптофос, карбофос, М-81, рогор, дифлос, хлорофос, глифосфат, гордона, валексон, диазинон, диметоат, малатион, паратионметил, хлорфенвинфос)'),
        (now(), null, now(), null, '1.47.3', 'Ртутьорганические (в том числе этилмеркурхлорид диметилртуть)'),
        (now(), null, now(), null, '1.47.4', 'Производные кислот карбаминовых: (в том числе каторана-вадекс, дихлоральмочевина, метурин, фенуроп, севин(А), манеб(А), дикрезил, ялан, эптам, карбатион(А), цинеб(А), карбофуран, карбосульфан, пиримикарб, тирам, манкоцеб, поликарбацин, десмедифам, фенмедиф'),
        (now(), null, now(), null, '1.47.5', 'Производные кислот алифатических хлорированных (в том числе хлоруксусной, трихлоруксусной)'),
        (now(), null, now(), null, '1.47.6', 'Производные кислоты хлорбензойной'),
        (now(), null, now(), null, '1.47.7', 'Производные кислоты хлороксиуксусной: 2,4-дихлорфеноксиуксусная кислота (2,4Д), аминная соль 2,4-дихлорфеноксиуксусной кислоты (2,4ДА), 4-хлор-2-метилфеноксиуксусная кислота (МСРА)'),
        (now(), null, now(), null, '1.47.8', 'Кислоты хлорфеноксимасляной производные'),
        (now(), null, now(), null, '1.47.9', 'Кислот карбоновых анилиды галоидозамещенные'),
        (now(), null, now(), null, '1.47.10', 'Производные мочевины и гуанидина'),
        (now(), null, now(), null, '1.47.11', 'Производные сим-тразинов: атразин, прометрин, тербутрин'),
        (now(), null, now(), null, '1.47.12', 'Гетероциклические соединения различных групп: зоокумарин(4-гидрокси-3-(3-оксо-1-фенилбу-2H-1-бензопиран-2-онтил), ратиндан (2-(Дифенилацетил)-1H-инден-1,3-(2H)-дион), морестан, пирамин (5-Амино-2-фенил-4-хлорпридазин 3(2H)-он), тиазон (3,5-Диметил-2H-1,3,5'),
        (now(), null, now(), null, '1.47.13', 'Хлорацетоанилиды (ацетохлор, алахлор, метазахлор, метолахлор)'),
        (now(), null, now(), null, '1.47.14', 'Пиретроиды (в том числе бифентрин, перметрин, фенвалерат, лямбдацыгалотрин, цыгалотрин, дельтаметрин)'),
        (now(), null, now(), null, '1.47.15', 'Производные сульфанил-мочевины (в том числе хлорсульфурон, римсульфурон, хлорсульфоксим, метмульфуронметил, трибунуронметил, тифенсульфурон-метил)'),
        (now(), null, now(), null, '1.47.16', 'Азолы (в том числе бромуконазол, ципраконазол, пропиконазол, тритиконазол, триадименол, прохлораз, имозалил)'),
        (now(), null, now(), null, '1.48', 'Синтетические моющие средства на основе анионных поверхностно активных веществ и их соединения (в том числе сульфанол, алкиламиды)(А)'),
        (now(), null, now(), null, '1.49', 'Синтетические полимерные материалы: смолы, лаки, клеи, пластмассы, пресспорошки, волокна, в том числе:'),
        (now(), null, now(), null, '1.49.1', 'Полиакрилаты: полиметакрилаты (оргстекло, плексиглаз), полиакрилонитрил, полиакриламид'),
        (now(), null, now(), null, '1.49.2', 'Поливинилхлорид(АФ) (ПВХ, винилпласты, перхлорвиниловая смола), производство и применение'),
        (now(), null, now(), null, '1.49.3', 'Полимер (1метилэтенил) бензола с этенилбензолом(Р)'),
        (now(), null, now(), null, '1.49.4', 'Полиолефины (полиэтилены, полипропилены(А) (горячая обработка)'),
        (now(), null, now(), null, '1.49.5', 'Полисилоксаны (производство)'),
        (now(), null, now(), null, '1.49.6', 'Полистиролы (производство)'),
        (now(), null, now(), null, '1.49.7', 'Полиуретаны(А) (пенополиуретан) (производство)'),
        (now(), null, now(), null, '1.49.8', 'Полиэфиры (лавсан) (производство)'),
        (now(), null, now(), null, '1.49.9', 'Угле- и органопластики'),
        (now(), null, now(), null, '1.49.10', 'Углеродные волокнистые материалы на основе гидратцеллюлозных волокон и углеродные волокнистые материалы на основе полиакрилонитрильных волокон'),
        (now(), null, now(), null, '1.49.11', 'Фенопласты(АФ) (фенольная смола, бакелитовый лак) (производство)'),
        (now(), null, now(), null, '1.49.12', 'Фторопласты (политетрафторэтилен(Ф), тефлон) (производство и термическая обработка)'),
        (now(), null, now(), null, '1.49.13', 'Фуран(А), фуран-2-альдегид(А), 2,5-фурандион(А)'),
        (now(), null, now(), null, '1.49.14', 'Эпоксидные полимеры(А) (эпоксидные смолы, компаунды, клеи) (производство и применение)'),
        (now(), null, now(), null, '1.50', 'Технические смеси углеводородов: нефти, бензины(Р), коксы(Ф), керосины, уайт-спирит(Р), мазуты, битумы, асфальты, каменноугольные и нефтяные смолы(К), пеки(К), возгоны каменноугольных смол и пеков(К), масла минеральные(К), (кроме высокоочищенных белых меди'),
        (now(), null, now(), null, '1.51', 'Агрохимикаты, в том числе'),
        (now(), null, now(), null, '1.51.1', 'Фосфорные удобрения (аммофос, нитрофоска)'),
        (now(), null, now(), null, '1.51.2', 'Азотные удобрения (нитрат аммония - аммиачная селитра, нитраты натрия, калия)'),
        (now(), null, now(), null, '1.52', 'Фармакологические средства, в том числе:'),
        (now(), null, now(), null, '1.52.1', 'Антибиотики(А) (производство и применение)'),
        (now(), null, now(), null, '1.52.2', 'Противоопухолевые препараты(АК) (производство и применение)'),
        (now(), null, now(), null, '1.52.3', 'Сульфаниламиды(А) (производство и применение)'),
        (now(), null, now(), null, '1.52.4', 'Гормоны (производство и применение)'),
        (now(), null, now(), null, '1.52.5', 'Витамины(А) (производство, применение)'),
        (now(), null, now(), null, '1.52.6', 'Наркотики, психотропные препараты (производство)'),
        (now(), null, now(), null, '1.52.7', 'Фармакологические средства, не вошедшие в подпункты 1.52.1 - 1.52.6 (производство)'),
        (now(), null, now(), null, '1.53', 'Ядохимикаты, в том числе:'),
        (now(), null, now(), null, '1.53.1', 'Гербициды'),
        (now(), null, now(), null, '1.53.2', 'Инсектициды'),
        (now(), null, now(), null, '2', '2. Биологические факторы'),
        (now(), null, now(), null, '2.1', 'Грибы продуценты(А), белково-витаминные концентраты (БВК), кормовые дрожжи(А), комбикорма(А)'),
        (now(), null, now(), null, '2.2', 'Ферментные препараты(А), биостимуляторы'),
        (now(), null, now(), null, '2.3', 'Аллергены для диагностики и лечения(А), компоненты и препараты крови, иммунобиологические препараты(А)'),
        (now(), null, now(), null, '2.4', 'Патогенные биологические агенты (ПБА) - патогенные для человека микроорганизмы - возбудители инфекционных заболеваний (бактерии, вирусы, хламидии, риккетсии, грибы, гельминты, членистоногие), включая генно-инженерно-модифицированные, яды биологического про'),
        (now(), null, now(), null, '2.4.1', 'Возбудители инфекционных заболеваний патогенные микроорганизмы I группы патогенности и возбудители особо опасных инфекций'),
        (now(), null, now(), null, '2.4.2', 'Возбудители инфекционных заболеваний патогенные микроорганизмы II группы патогенности, в т.ч. вирусы гепатитов ВК и СК, вирус иммунодефицита 1-го типа (ВИЧ-1К - СПИД)'),
        (now(), null, now(), null, '2.4.3', 'Возбудители инфекционных заболеваний патогенные микроорганизмы III и IV групп патогенности и возбудители паразитарных заболеваний (гельминты, членистоногие)'),
        (now(), null, now(), null, '2.4.4', 'Биологические токсины (микробного, растительного и животного происхождения)'),
        (now(), null, now(), null, '2.4.5', 'Условно-патогенные микроорганизмы - возбудители инфекционных заболеваний (в том числе аллергозов)'),
        (now(), null, now(), null, '3', '3. Аэрозоли преимущественно фиброгенного действия (АПФД) и пыли'),
        (now(), null, now(), null, '3.1', 'Аэрозоли преимущественно фиброгенного(Ф) и смешанного типа действия, включая:'),
        (now(), null, now(), null, '3.1.1.', 'Аэрозоли абразивные и абразивсодержащие (электрокорундов, карбида бора, альбора, карбида кремния), в том числе с примесью связующих (фенолформальдегидные смолы(АФ), эпоксидные смолы(АФ))'),
        (now(), null, now(), null, '3.1.2', 'Аэрозоли металлов (железо, алюминий, титан, вольфрам) и их сплавов (кремниемедистый, диАлюминий триоксид в смеси со сплавом никеля до 15%, феррохром: сплав хрома 65% с железом, диАлюминий триоксид с примесью кремний диоксида до 15% и диЖелезо триоксида до '),
        (now(), null, now(), null, '3.1.3', 'Кремний диоксид кристаллический а-кварц(К), а-кристобалит(К), а-тридимит(ФА)'),
        (now(), null, now(), null, '3.1.4', 'Кремнийсодержащие аэрозоли: - с содержанием кристаллического диоксида кремния(К) - с содержанием аморфного диоксида кремния в виде аэрозоля дезинтеграции и конденсации - кремний карбид, кремний нитрид, волокнистый карбид кремния(ФА)'),
        (now(), null, now(), null, '3.1.5', 'Огнеупорные материалы (шамотнографитовые огнеупоры), муллитовые (неволокнистые) огнеупоры, магнезиально-силикатные (форстеритовые) огнеупоры, муллито-кремнеземистые, не содержащие и содержащие до 5% Cr3+'),
        (now(), null, now(), null, '3.1.6', 'Руды полиметаллические и содержащие цветные и редкие металлы(А)'),
        (now(), null, now(), null, '3.1.7', 'Сварочные аэрозоли, представляющие сложную смесь АПФД (кремний диоксид аморфный в смеси с оксидами марганца в виде аэрозоля конденсации, дижелезо триоксид, титан диоксид, вольфрам, алюминий и его соединения) и химических веществ разной природы: аэрозоли ме'),
        (now(), null, now(), null, '3.1.8', 'Силикатсодержащие пыли, силикаты, алюмосиликаты, в том числе:'),
        (now(), null, now(), null, '3.1.8.1', 'Асбесты природные (хризотил(К), тремолит(К)), смешанные асбестопородные пыли(К), асбестоцемент(К), асбестобакелит(К), асбесто-резина(ФК)'),
        (now(), null, now(), null, '3.1.8.2', 'Глина, в т.ч. высокоглинистая огнеупорная, цемент, оливин, апатит, шамот коалиновый(ФА)'),
        (now(), null, now(), null, '3.1.8.3', 'Тальк, талькопородные пыли, цеолиты, бокситы, нефелиновые сиениты, дистенсиллиманиты, слюды (флагопит, мусковит), дуниты, известняки, бариты, инфузорная земля, туфы, пемзы, перлит, искусственные минеральные волокна (стекловолокно(ФА), стекловата(ФА), вата '),
        (now(), null, now(), null, '3.1.9', 'Углерода пыли, в том числе:'),
        (now(), null, now(), null, '3.1.9.1', 'Алмазы природные(Ф), искусственные(Ф), металлизированные(Ф)'),
        (now(), null, now(), null, '3.1.9.2', 'Антрацит(Ф) и другие ископаемые угли(Ф) и углеродные пыли(Ф)'),
        (now(), null, now(), null, '3.1.9.3', 'Коксы - каменноугольный(ФК), пековый(ФК), нефтяной(ФК), сланцевый(ФК)'),
        (now(), null, now(), null, '3.1.9.4', 'Сажи черные промышленные(ФК)'),
        (now(), null, now(), null, '3.1.10', 'Шлаки (шлак угольный молотый, строительные материалы на его основе: шлакоблоки, шлакозит; шлак, образующийся при выплавке низколегированных сталей (неволокнистая пыль)'),
        (now(), null, now(), null, '3.2', 'Пыли железорудных(ФК) и полиметаллических концентратов(ФК), металлургических агломератов(ФА)'),
        (now(), null, now(), null, '3.3', 'Сера(Ф)'),
        (now(), null, now(), null, '3.4', 'Пыль животного и растительного происхождения(АФ) (с примесью диоксида кремния(АФ), зерновая(АФ), лубяная(АФ), хлопчатобумажная(АФ), хлопковая(АФ), льняная(АФ), шерстяная(АФ), пуховая(АФ), натурального шелка хлопковая мука (по белку)(А), мучная(АФ), древесн'),
        (now(), null, now(), null, '4', 'Физические факторы'),
        (now(), null, now(), null, '4.1', 'Ионизирующие излучения(К), радиоактивные вещества(К)'),
        (now(), null, now(), null, '4.2', 'Неионизирующие излучения, в том числе:'),
        (now(), null, now(), null, '4.2.1', 'Электромагнитное излучение оптического диапазона (ультрафиолетовое излучение(К), лазерное излучение)'),
        (now(), null, now(), null, '4.2.2', 'Электромагнитное поле радиочастотного диапазона (10 кГц - 300 ГГц)'),
        (now(), null, now(), null, '4.2.3', 'Электрическое и магнитное поле промышленной частоты (50 Гц)'),
        (now(), null, now(), null, '4.2.4', 'Постоянное электрическое и магнитное поле'),
        (now(), null, now(), null, '4.2.5', 'Электромагнитное поле широкополосного спектра частот (5 Гц - 2 кГц, 2 кГц - 400 кГц)'),
        (now(), null, now(), null, '4.3', 'Вибрация:'),
        (now(), null, now(), null, '4.3.1', 'Локальная вибрация'),
        (now(), null, now(), null, '4.3.2', 'Общая вибрация (транспортная, транспортно-технологическая, технологическая)'),
        (now(), null, now(), null, '4.4', 'Шум'),
        (now(), null, now(), null, '4.5', 'Ультразвук воздушный, ультразвук контактный'),
        (now(), null, now(), null, '4.6', 'Инфразвук'),
        (now(), null, now(), null, '4.7', 'Параметры охлаждающего микроклимата (температура, влажность, скорость движения воздуха)'),
        (now(), null, now(), null, '4.8', 'Параметры нагревающего микроклимата (температура, индекс тепловой нагрузки среды, влажность, тепловое излучение)'),
        (now(), null, now(), null, '4.9', 'Освещенность рабочей поверхности'),
        (now(), null, now(), null, '4.10', 'Пониженное давление воздушной и (или) газовой сред и пониженное парциальное давление кислорода во вдыхаемом воздухе или искусственной дыхательной газовой смеси в случае, если указанное давление необходимо поддерживать в производственных зданиях, помещениях'),
        (now(), null, now(), null, '5', '5. Факторы трудового процесса'),
        (now(), null, now(), null, '5.1', 'Тяжесть трудового процесса Подъем, перемещение, удержание груза вручную Стереотипные рабочие движения Рабочее положение тела работника (длительное нахождение работника в положении "стоя", "сидя" без перерывов, "лежа", "на коленях", "на корточках", с наклон'),
        (now(), null, now(), null, '5.2', 'Напряженность трудового процесса (сенсорные нагрузки), в том числе:'),
        (now(), null, now(), null, '5.2.1', 'Работы с оптическими приборами (более 50% времени смены)'),
        (now(), null, now(), null, '5.2.2', 'Нагрузка на голосовой аппарат (суммарное количество часов, наговариваемое в неделю, более 20)'),
        (now(), null, now(), null, '6', 'Работы на высоте:'),
        (now(), null, now(), null, '6.1', 'Работы с высоким риском падения работника с высоты, а также работы на высоте без применения средств подмащивания, выполняемые на высоте 5 м и более; работы, выполняемые на площадках на расстоянии менее 2 м от неогражденных (при отсутствии защитных огражден'),
        (now(), null, now(), null, '6.2', 'Прочие работы, относящиеся в соответствии с законодательством по охране труда к работам на высоте'),
        (now(), null, now(), null, '7', 'Работа лифтера на лифтах скоростных (от 2,0 до 4,0 м/с) и высокоскоростных (свыше 4,0 м/с) при внутреннем сопровождении лифта'),
        (now(), null, now(), null, '8', 'Работы в качестве крановщика (машиниста крана, машинист крана автомобильного)'),
        (now(), null, now(), null, '9', 'Работы, связанные с техническим обслуживанием электроустановок напряжением 50 В и выше переменного тока и 75 В и выше постоянного тока, проведением в них оперативных переключений, выполнением строительных, монтажных, наладочных, ремонтных работ, испытанием'),
        (now(), null, now(), null, '10', 'Работы по валке, сплаву, транспортировке, первичной обработке, охране и восстановлению лесов'),
        (now(), null, now(), null, '11', 'Работы в особых географических регионах с местами проведения работ, транспортная доступность которых от медицинских учреждений, оказывающих специализированную медицинскую помощь в экстренной форме, превышает 60 минут, а именно:'),
        (now(), null, now(), null, '11.1', 'Работы в нефтяной и газовой промышленности, выполняемые в районах Крайнего Севера и приравненных к ним местностях, а также при морском бурении'),
        (now(), null, now(), null, '11.2', 'Работы на гидрометеорологических станциях, сооружениях связи'),
        (now(), null, now(), null, '11.3', 'Работы, не указанные в подпунктах 11.1, 11.2, выполняемые по срочным трудовым договорам в районах Крайнего Севера и приравненных к ним местностях (в отношении проведения предварительных медицинских осмотров для работников, приезжающих на работу в районы Кр'),
        (now(), null, now(), null, '11.4', 'Работы, выполняемые вахтовым методом в необжитых, отдаленных районах и районах с особыми природными условиями (в отношении проведения предварительных медицинских осмотров для работников, выполняющих работу вахтовым методом в указанных районах)'),
        (now(), null, now(), null, '12', 'Работы, непосредственно связанные с обслуживанием оборудования, работающего под избыточным давлением более 0,07 мегапаскаля (МПа) и подлежащего учету в органах Ростехнадзора: а) пара, газа (в газообразном, сжиженном состоянии); б) воды при температуре боле'),
        (now(), null, now(), null, '13', 'Работы, непосредственно связанные с применением легковоспламеняющихся и взрывчатых материалов, работы во взрыво- и пожароопасных производствах, работы на коксовой батарее на открытых производственных зонах'),
        (now(), null, now(), null, '14', 'Работы, выполняемые аварийно-спасательной службой, аварийно-спасательными формированиями, спасателями, а также работы, выполняемые пожарной охраной при тушении пожаров'),
        (now(), null, now(), null, '15', 'Работы, выполняемые непосредственно на механическом оборудовании, имеющем открытые движущиеся (вращающиеся) элементы конструкции, в случае если конструкцией оборудования не предусмотрена защита (ограждение) этих элементов (в том числе токарные, фрезерные и'),
        (now(), null, now(), null, '16', 'Подземные работы, включая работы на рудниках'),
        (now(), null, now(), null, '17', 'Работы, выполняемые непосредственно с применением средств индивидуальной защиты органов дыхания изолирующих и средств индивидуальной защиты органов дыхания фильтрующих с полной лицевой частью'),
        (now(), null, now(), null, '18', 'Управление наземными транспортными средствами <2>:'),
        (now(), null, now(), null, '18.1', 'Категории "A", "B", "BE", трактора и другие самоходные машины, мини-трактора, мотоблоки, автопогрузчики, электрокары, регулировщики и т.п., автомобили всех категорий с ручным управлением для инвалидов, мотоколяски для инвалидов'),
        (now(), null, now(), null, '18.2', 'Категории "C", "C1", "CE", "D1", "D1E", трамвай, троллейбус'),
        (now(), null, now(), null, '19', 'Водолазные работы:'),
        (now(), null, now(), null, '19.1', 'Водолазные работы на глубинах до 60 м (в аварийных случаях до 80 м с применением воздуха для дыхания), за исключением водолазных работ, указанных в пункте 19,3'),
        (now(), null, now(), null, '19.2', 'Водолазные работы на глубинах более 60 метров, выполняемые методом кратковременных погружений'),
        (now(), null, now(), null, '19.3', 'Водолазные работы, выполняемые методом длительного пребывания в условиях повышенного давления водной и газовой сред'),
        (now(), null, now(), null, '20', 'Работы по оказанию медицинской помощи внутри барокамеры при проведении лечебной рекомпрессии или гипербарической оксигенации'),
        (now(), null, now(), null, '21', 'Кессонные работы, работы в барокамерах и других устройствах в условиях повышенного давления воздушной и газовой среды (за исключением работ, указанных в пунктах 19 и 20)'),
        (now(), null, now(), null, '22', 'Работы, при выполнении которых разрешено ношение оружия и его применение (в случаях, когда требования о прохождении медицинских осмотров (освидетельствований) не установлены статьями 12 и 13 Федерального закона от 13 декабря 1996 г. N 150-ФЗ "Об оружии" и '),
        (now(), null, now(), null, '23', 'Работы, где имеется контакт с пищевыми продуктами в процессе их производства, хранения, транспортировки и реализации (в организациях пищевых и перерабатывающих отраслей промышленности, сельского хозяйства, пунктах, базах, складах хранения и реализации, в т'),
        (now(), null, now(), null, '24', 'Работы на водопроводных сооружениях, имеющие непосредственное отношение к подготовке воды, а также обслуживанию водопроводных сетей'),
        (now(), null, now(), null, '25', 'Работы в организациях, деятельность которых связана с воспитанием и обучением детей'),
        (now(), null, now(), null, '26', 'Работы в организациях, деятельность которых связана с коммунальным и бытовым обслуживанием населения'),
        (now(), null, now(), null, '27', 'Работы в медицинских организациях');


select *
from Person where userProfile_id = 1;