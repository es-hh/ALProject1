page 50130 PageWithAddIn
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = Eriktabelle;
    Caption = 'AL-Bollerwagen';


    layout
    {
        area(Content)
        {
            field(Timeoutfield; timeout)
            {
                ApplicationArea = All;
                Caption = 'Timeouteingabe';
            }
            // The control add-in can be placed on the page using usercontrol keyword.
            usercontrol(ControlName; testaddin)
            {
                ApplicationArea = All;
                trigger Ready()
                begin
                    CurrPage.ControlName.addButton('B1', 'Tour', 'Tour');
                    CurrPage.ControlName.modifyStyle('B1', 'width', '100%');
                    CurrPage.ControlName.addButton('B2', 'Artikel (Kolli Barcode) -> Auftrag', 'Artikel 1');
                    CurrPage.ControlName.modifyStyle('B2', 'width', '100%');
                    CurrPage.ControlName.addButton('B3', 'Auftrag (Komm.Zettel) -> Artikel', 'Artikel 2');
                    CurrPage.ControlName.modifyStyle('B3', 'width', '100%');
                    CurrPage.ControlName.addButton('B4', 'NVE stornieren', 'Storno');
                    CurrPage.ControlName.modifyStyle('B4', 'width', '49.6%');
                    CurrPage.ControlName.addButton('B5', 'NVE wiegen', 'Wiegen');
                    CurrPage.ControlName.modifyStyle('B5', 'width', '49.6%');
                end;

                trigger ButtonPressed(buttonText: Text)

                begin
                    case buttonText of
                        'Wiegen':
                            begin
                                operation := operation::"Plus und Mal";
                                interfacetest(operation, 3, 4);

                            end;
                        'Tour':
                            CurrPage.ControlName.Ping('Tourpong', timeout)
                        else
                            Message(buttonText);
                    end;
                end;

                trigger Pong(id: Text)
                begin
                    Message(id);
                end;
            }
            /*
            field(Name; rec.LfdNr)
                {
                    ApplicationArea = All;
                }
            field(Farbe; Rec.Farbe)
            {
                ApplicationArea = All;
            }
            */
        }
    }

    procedure interfacetest(inter: Interface IMathe2; zahl1: decimal; zahl2: decimal)
    begin
        message(format(inter.rechne(zahl1, zahl2)));
    end;

    var
        timeout: integer;
        card: page "Sales Order";
        operation: enum Operation;
}


