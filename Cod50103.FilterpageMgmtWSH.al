codeunit 50103 "Filterpage Mgmt.WSH"
{

    var
        TempBlob: Record "Sort Tabelle" temporary;
        SortTabParameterTemp: Record "Sort Tabelle" temporary;

    PROCEDURE SetzeParameter(TabNr: Integer;FeldListe: Text;ViewText: Text);
    BEGIN
      // Die Funktion wird pro TabNr einmal gestartet, z.B. OnOpenPage
      SortTabParameterTemp."Lfd. Nr." += 1;
      SortTabParameterTemp.Int1 := TabNr;
      SortTabParameterTemp.Text1 := FeldListe;
      SortTabParameterTemp.Text2 := TabCaption(TabNr);
      SortTabParameterTemp.INSERT;
      TempBlob."Lfd. Nr." := TabNr;
      TempBlobViewSetzen(TempBlob,ViewText);
      TempBlob.INSERT;
    END;

    PROCEDURE StartFilterPage(FilterPageCaption : Text);
    VAR
      MyFilterPage : FilterPageBuilder;
      FeldNr : Integer;
    BEGIN
      MyFilterPage.PAGECAPTION(FilterPageCaption);
      IF SortTabParameterTemp.FINDSET THEN REPEAT
        MyFilterPage.ADDTABLE(SortTabParameterTemp.Text2,SortTabParameterTemp.Int1);
        WHILE STRLEN(SortTabParameterTemp.Text1) > 0 DO BEGIN
          IF STRPOS(SortTabParameterTemp.Text1,',') > 0 THEN BEGIN
            EVALUATE(FeldNr,COPYSTR(SortTabParameterTemp.Text1,1,STRPOS(SortTabParameterTemp.Text1,',') - 1));
            SortTabParameterTemp.Text1 := COPYSTR(SortTabParameterTemp.Text1,STRPOS(SortTabParameterTemp.Text1,',') + 1);
          END ELSE BEGIN
            EVALUATE(FeldNr,SortTabParameterTemp.Text1);
            SortTabParameterTemp.Text1 := '';
          END;
          MyFilterPage.ADDFIELDNO(SortTabParameterTemp.Text2,FeldNr);
        END;
        IF HoleFiltertext(SortTabParameterTemp.Int1,0) <> '' THEN
          MyFilterPage.SETVIEW(SortTabParameterTemp.Text2,HoleFiltertext(SortTabParameterTemp.Int1,0));
      UNTIL SortTabParameterTemp.NEXT = 0;
      IF NOT MyFilterPage.RUNMODAL THEN
        EXIT;

      IF TempBlob.FINDSET THEN REPEAT
       TempBlobViewSetzen(TempBlob,MyFilterPage.GETVIEW(TabCaption(TempBlob."Lfd. Nr.")));
       TempBlob.MODIFY;
      UNTIL TempBlob.NEXT = 0;
    END;

    PROCEDURE HoleFiltertext(TabNr : Integer;Art : Option V,F) Filtertext : Text;
    VAR
      InStr : InStream;
      Textzeile : Text;
      RecRefFilter : RecordRef;
    BEGIN
      IF NOT TempBlob.GET(TabNr) THEN
        EXIT;
      TempBlob.CALCFIELDS(Blob1);
      TempBlob.Blob1.CREATEINSTREAM(InStr);
      WHILE NOT InStr.EOS DO BEGIN
        InStr.READTEXT(Textzeile);
        Filtertext += Textzeile;
      END;
      IF Art = Art::V THEN
        EXIT;
      RecRefFilter.OPEN(TabNr);
      RecRefFilter.SETVIEW(Filtertext);
      EXIT(RecRefFilter.GETFILTERS);
    END;

    LOCAL PROCEDURE TabCaption(TabNr : Integer) : Text;
    VAR
      RecRefTabCaption : RecordRef;
    BEGIN
      RecRefTabCaption.OPEN(TabNr);
      EXIT(RecRefTabCaption.CAPTION);
    END;

    LOCAL PROCEDURE TempBlobViewSetzen(VAR TempBlob : Record "Sort Tabelle";ViewText : Text);
    VAR
      OutStr : OutStream;
    BEGIN
      CLEAR(TempBlob.Blob1);
      IF ViewText = '' THEN
        EXIT;
      TempBlob.Blob1.CREATEOUTSTREAM(OutStr);
      OutStr.WRITETEXT(ViewText);
    END;


    

    
}
