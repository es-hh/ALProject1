page 50123 Zahlenliste
{
    ApplicationArea = All;
    Caption = 'Zahlenliste mit einer sehr langen Caption. Es soll geprüft werden, ob es eine maximale Länge für eine Caption gibt.';
    PageType = List;
    SourceTable = "Integer";
    UsageCategory = Lists;
    SourceTableView = Sorting(Number) where(Number = filter(> 0));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; Rec.Number)
                {
                    Caption = 'Feldüberschrift mit einem sehr langen Text. Nochmal geändert. Branch 2';
                    ToolTip = 'Specifies the Excel row number.';
                }
            }
        }
    }

    actions
    {

        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("Casetext")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    i, j, k : Integer;
                begin
                    //Cherry 3
                    i := 1;
                    case true of
                        i = k:
                            Message('1');
                        j = k:
                            Message('2');
                    end;
                end;
            }
            action("DF Test")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    df: dateformula;
                    ta: array[10] of text[20];
                begin
                    message(format(maxstrlen(ta[1])));
                    //Kommentar Main Branch

                end;
            }
        }

    }
    trigger OnFindRecord(Which: Text): Boolean
    begin
        exit(PageOnFindRecord(Which));
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        exit(PageOnNextRecord(Steps));
    end;

    procedure ZahlAnzeigen(Zahl: Integer) Anzeigen: Boolean
    var
        k: Integer;

    begin
        Anzeigen := TRUE;
        k := 1;
        REPEAT
            k += 1;
            IF (Zahl MOD k = 0) THEN
                Anzeigen := FALSE;
        UNTIL ((k * k) > Zahl) OR (NOT Anzeigen);
        Anzeigen := not Anzeigen;
    end;

    procedure PageOnFindRecord(WhichNeu: Text): Boolean
    var
        IntRec, IntRecSpeicher : record Integer;
        Anzeigen: Boolean;
        Steps: Integer;

    begin
        IntRec.COPY(Rec);
        IF NOT IntRec.FIND(WhichNeu) THEN
            EXIT(FALSE);

        IntRecSpeicher := IntRec;

        REPEAT
            Anzeigen := ZahlAnzeigen(IntRec.Number);
            IF NOT Anzeigen THEN
                Steps := IntRec.NEXT;
        UNTIL (Steps = 0) OR Anzeigen;

        IF NOT Anzeigen THEN BEGIN
            IntRec := IntRecSpeicher;
            REPEAT
                Anzeigen := ZahlAnzeigen(IntRec.Number);
                IF NOT Anzeigen THEN
                    Steps := IntRec.NEXT(-1);
            UNTIL (Steps = 0) OR Anzeigen;
        END;

        IF Anzeigen THEN
            Rec := IntRec;
        EXIT(Anzeigen);
    end;

    procedure PageOnNextRecord(StepsNeu: Integer): Integer
    var
        Richtung, Steps, i : Integer;
        IntRec: Record Integer;
    begin
        IF StepsNeu = 0 THEN
            EXIT(0);
        IF StepsNeu < 0 THEN
            Richtung := -1
        ELSE
            Richtung := 1;

        IntRec.COPY(Rec);
        REPEAT
            i := IntRec.NEXT(Richtung);
            IF i <> 0 THEN
                IF ZahlAnzeigen(IntRec.Number) THEN
                    Steps += i;
        UNTIL (i = 0) OR (Steps = StepsNeu);


        IF Steps <> 0 THEN
            Rec := IntRec;

        EXIT(Steps);

    end;



}
