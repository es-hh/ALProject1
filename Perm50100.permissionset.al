permissionset 50100 permall
{
    Assignable = true;
    Permissions = tabledata Eriktabelle=RIMD,
        tabledata Filtertest=RIMD,
        tabledata "Sort Tabelle"=RIMD,
        tabledata "Tabelle E1"=RIMD,
        table Eriktabelle=X,
        table Filtertest=X,
        table "Sort Tabelle"=X,
        table "Tabelle E1"=X,
        report Artikelliste=X,
        report "Bin Report"=X,
        report "Debitor Posten Erik"=X,
        report "Filtertest Report"=X,
        codeunit BarodeErik=X,
        codeunit "Filterpage Mgmt.WSH"=X,
        codeunit MySubscribers=X,
        codeunit rechnedurch=X,
        codeunit rechnemal=X,
        codeunit rechneminus=X,
        codeunit rechneplus=X,
        codeunit SITest=X,
        page Erikpage=X,
        page "Filtertest List"=X,
        page PageWithAddIn=X,
        page "Test Caption"=X,
        page Zahlenliste=X;
}