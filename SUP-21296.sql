select *
from rbPrintTemplate where name regexp 'шилд';

select * from Person where id = 614




UPDATE s11.rbPrintTemplate t
SET
    t.`default` = '<html>
<body>
    <b>{client.fullName}</b>,
    дата рождения: <b>{client.birthDate}</b> ({client.age})
    пол: <b>{client.sex}</b>
    код: <font style="font-weight: bold; color: #0000ff">{client.id}</font>, <b>Диспансеризация: </b>
    {if: client.statusDD}
        {: ddStatus, ddDate = client.statusDD}
            {if: ddStatus == 0}<font color="#00aa00">проведена {ddDate}</font>
            {elif: ddStatus == 1}<font color="#aa4000">начата {ddDate}</font>
            {elif: ddStatus == 2}<font color="#cc0000">не проводилась</font>
            {end:}
    {else:}
        не подлежит
    {end:}
    {for: s in client.socStatuses}
    <b>{s.classes}: {s.name};</b>
    {end:}
    <!--вытащить согласие-->
    {for: code in client.identification}
    {if: client.identification.nameDict[code] == u''Согласие''}
    Согласие:
    <font style='' color: #f00; font-weight: bold;''>
        {client.identification.byCode[code]}
        ({client.identification.checkDate[code]})
    </font>
    {end:}
    {end:}
    <br />
    СНИЛС: <b>{client.SNILS}</b>,
    прикрепление:
    <!--вывести последнее прикрепление-->
    {if: len(client.allAttaches) > 0}
    {if: client.allAttaches[len(client.allAttaches) - 1].name == u''умер''}
    <!--мертв-->
    <font style="font-weight: bold; color: #ff0000;">
        {client.allAttaches[len(client.allAttaches) - 1].name}
        ({client.allAttaches[len(client.allAttaches) - 1].begDate})
    </font>
    {else:}
    <!--жив-->
    {:i = 0 }
    {for: attach in client.allAttaches}
    {if: i > 0}
    <br />
    {end:}
    {if: attach.name != u''умер''}
    {if: attach.org == u''СПБ ГБУЗ "ГП N 60"''}<font style="font-weight: bold; color: #008000;">{else:}
        <font style="font-weight: bold; color: #92000a;">{end:}
            {attach.name}
            {attach.org}
            {if: attach.orgStructure}
            {attach.orgStructure}
            {end:}
            {: i = 1}
            {end:}
            {end:}
            {end:}
            {end:}
        </font>
    </font>
    <br />
    Документ: <b>{client.document}</b><br>
    Полис ОМС:
    {if: client.policy.insurer.area != u''Санкт-Петербург г''}
    <font style="font-weight: bold; color: #0000ff;">
        {if: client.compulsoryPolicy.policyKind.regionalCode}
        [{client.compulsoryPolicy.policyKind.regionalCode}]
        {end:}
        {client.compulsoryPolicy.serial}
        {client.compulsoryPolicy.number}
        {if: client.compulsoryPolicy.insurer}
        выдан
        {client.compulsoryPolicy.insurer}
        {client.policy.insurer.area}
        {end:}
        <!--проверяю, существует ли дата оконч. или дата нач. действия полиса-->
        {if: (client.compulsoryPolicy.endDate) or (client.compulsoryPolicy.begDate)}
        {: flag_compul = 1}
        {else:}
        {: flag_compul = 0}
        {end: }
        <!--если сущ. дата нач. или оконч., то выводить "действителен с .. по .."-->
        {if: flag_compul == 1}
        действителен с {client.compulsoryPolicy.begDate} по {client.compulsoryPolicy.endDate}
        {end:}
    </font>
    <br />
    {end:}
    {if: client.policy.insurer.area == u''Санкт-Петербург г''}
    <font style="font-weight: bold; color: #008000;">
        {if: client.compulsoryPolicy.policyKind.regionalCode}
        [{client.compulsoryPolicy.policyKind.regionalCode}]
        {end:}
        <font color="#cc0000">{client.compulsoryPolicy.serial}</font>
        <font color="#cc0000">{client.compulsoryPolicy.number}</font>
        {if: client.compulsoryPolicy.insurer}
        выдан
        {client.compulsoryPolicy.insurer}
        {client.policy.insurer.area}
        {end:}
        <!--проверяю, существует ли дата оконч. или дата нач. действия полиса-->
        {if: (client.compulsoryPolicy.endDate) or (client.compulsoryPolicy.begDate)}
        {: flag_compul = 1}
        {else:}
        {: flag_compul = 0}
        {end: }
        <!--если сущ. дата нач. или оконч., то выводить "действителен с .. по .."-->
        {if: flag_compul == 1}
        действителен с {client.compulsoryPolicy.begDate} по {client.compulsoryPolicy.endDate}
        {end:}
    </font>
    <br />
    {end:}
    Адрес регистрации: <font style="font-weight: bold">{client.regAddress}</font>
    <br />
    Адрес проживания: <font style="font-weight: bold">{client.locAddress}</font>
    <br />
    Занятость:
    <b>{client.work} {client.work.OKVED}</b>
    <br />
    Телефоны:
    <b>{client.phones}</b>
    <br />
    Примечания:
    <b>{client.notes}</b>
    <br />
    Дата подтверждения ЕИС:
    {for: code in client.identification}
    {if: client.identification.nameDict[code] == u''Идентификатор ЕИС РПФ''}
    <b>{client.identification.checkDate[code]}</b>
    {end:}
    {end:}
</body>
</html>'
WHERE t.id = 207;