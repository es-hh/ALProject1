
codeunit 50105 rechneplus implements IMathe1
{
    procedure rechne(zahl1: decimal; zahl2: decimal): decimal
    begin
        exit(zahl1 + zahl2);
    end;

}

codeunit 50115 rechnemal implements IMathe2
{
    procedure rechne(zahl1: decimal; zahl2: decimal): decimal
    begin
        exit(zahl1 * zahl2);
    end;

}
codeunit 50117 rechnedurch implements IMathe2
{
    procedure rechne(zahl1: decimal; zahl2: decimal): decimal
    begin
        exit(zahl1 / zahl2);
    end;

}

codeunit 50116 rechneminus implements IMathe1
{
    procedure rechne(zahl1: decimal; zahl2: decimal): decimal
    begin
        exit(zahl1 - zahl2);
    end;

}
tableextension 50108 SalesLineErik extends "Sales Line"
{
    fields
    {
        field(50000; Farbe; Enum Farbe)
        {
            DataClassification = ToBeClassified;
        }
    }

}

pageextension 50106 SalesLineFabe extends "Sales Lines"
{
    layout
    {
        addafter(Description)
        {
            field(Farbe; Rec.Farbe)

            {
                ApplicationArea = All;
                Caption = 'Farbe';
            }
        }
    }
}
pageextension 50102 ItemcardErik extends "Item Card"
{

    layout
    {
        addlast(Item)
        {
            field(Farbe; Rec.Farbe)

            {
                ApplicationArea = All;
                Caption = 'Farbe';
                StyleExpr = styletext;
                trigger OnValidate()

                begin
                    CurrPage.Update();
                end;

                trigger OnDrillDown()
                var
                    Item: Record Item;
                begin
                    if page.RunModal(0, item) = Action::LookupOK then
                        message(Item."No.");
                end;
            }
            field(Codetest; Rec.Codetest)
            {
                ApplicationArea = All;
                Caption = 'Codetest';
                Style = "Unfavorable";
            }
            field(ICText; ItemCategory.Description)
            {
                ApplicationArea = All;
                Caption = 'Kategorie';
            }

            field(AnzPost; anzposten())
            {
                ApplicationArea = All;
                Caption = 'Anzahl Posten';
            }

        }

        modify("No.")
        {
            Caption = 'Artikelnummer';
        }
        modify(InventoryGrp)
        {
            Caption = 'Artikelgruppe';
        }



    }

    var
        ItemCategory: Record "Item Category";
        styletext: text;

    trigger OnAfterGetRecord()

    begin
        clear(ItemCategory);
        if ItemCategory.get(rec."Item Category Code") then;
        styletext := 'Standard';
        if rec.Farbe = rec.Farbe::Rot then
            styletext := 'Unfavorable';
    end;

    local procedure anzposten(): Integer;
    var
        ItemledgerEntry: Record 32;
    begin
        ItemledgerEntry.SetRange("Item No.", rec."No.");
        exit(ItemledgerEntry.count());
    end;


}
pageextension 50104 ItemListErik extends "Item List" //OriginalId
{
    layout
    {
        addfirst(Control1)
        {
            field(Codetest; Rec.Codetest)
            {
                ApplicationArea = All;
                Caption = 'Codetest';
                Style = "Unfavorable";
            }
            field("Artikelposten"; Rec."Artikelposten")
            {
                ApplicationArea = All;
                DrillDown = False;
                Style = "Strong";
            }
            field("Keine Artikelposten"; Rec."Keine Artikelposten")
            {
                ApplicationArea = All;
                DrillDown = False;
            }
        }
    }

    actions
    {
        addlast(Creation)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Artikelliste Erik Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;


                trigger OnAction()

                var
                    Item: record Item;

                begin
                    if page.RunModal(0, item) = action::LookupOK then
                        message(item."No.");
                    //report.runmodal(report::Artikelliste);                    

                end;
            }
            action(Filtertest)
            {
                ApplicationArea = All;
                Caption = 'Filtertest';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;


                trigger OnAction()



                begin
                    report.runmodal(Report::"Filtertest Report");
                end;
            }
            action(SITest1)
            {
                ApplicationArea = All;
                Caption = 'SI Test Setze Text';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Info;

                trigger OnAction()
                var
                    SITest: Codeunit SITest;
                begin
                    sitest.setzetext(Format(CurrentDateTime));
                end;
            }
            action(SITest2)
            {
                ApplicationArea = All;
                Caption = 'SI Test Message Text';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Info;

                trigger OnAction()
                var
                    SITest: Codeunit SITest;
                begin
                    sitest.messagetext();
                end;
            }

        }
    }
}
pageextension 50103 SalesOrderLinesErik extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(Farbe; Rec.Farbe)

            {
                ApplicationArea = All;
                Caption = 'Farbe';
            }
        }


    }

}
codeunit 50101 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::"sales line", 'OnCopyFromItemOnAfterCheck', '', true, true)]
    local procedure farbeuebernehmen(var SalesLine: Record "Sales Line"; Item: Record Item);
    begin
        SalesLine.Farbe := item.Farbe;
    end;

    [EventSubscriber(ObjectType::Table, Database::"sales line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure noonavalidate(var Rec: Record "sales line")
    begin
        Message(rec."Sell-to Customer No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item List", 'OnOpenPageEvent', '', false, false)]
    local procedure MyProcedure(var Rec: Record Item)
    var
        Item: Record Item;
    begin
        //if page.RunModal(0,Item) = Action::LookupOK then
        //  message(item."No.");
    end;
}
codeunit 50102 SITest
{
    //SingleInstance = True;

    var
        testtext: Text;

    procedure setzetext(textneu: Text)
    begin
        testtext := textneu;
    end;

    procedure messagetext();
    begin
        Message(testtext);
    end;

}


controladdin testaddin
{
    RequestedHeight = 450;
    //MinimumHeight = 2000;
    //MaximumHeight = 300;
    //RequestedWidth = 700;
    //MinimumWidth = 700;
    //MaximumWidth = 700;
    VerticalStretch = true;
    //VerticalShrink = false;
    HorizontalStretch = true;
    //HorizontalShrink = true;
    Scripts = 'controls.js';
    StartupScript = 'start.js';
    StyleSheets = 'controls.css';
    event Ready();
    event ButtonPressed(buttonText: Text);
    event Pong(id: Text);
    procedure addButton(id: Text; buttonName: Text; callText: Text);
    procedure modifyStyle(id: text; style: Text; value: Text);
    procedure Ping(id: Text; timeout: Integer);

}


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


codeunit 50118 BarodeErik implements "Barcode Font Provider"
{
    procedure GetSupportedBarcodeSymbologies(var Result: List of [enum System.Text."Barcode Symbology"])
    begin

    end;

    procedure EncodeFont(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"): Text
    begin

    end;

    procedure EncodeFont(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"; BarcodeEncodeSettings: Record "Barcode Encode Settings"): Text
    begin

    end;

    procedure ValidateInput(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology")
    begin

    end;

    procedure ValidateInput(InputText: Text; BarcodeSymbology: enum System.Text."Barcode Symbology"; BarcodeEncodeSettings: Record "Barcode Encode Settings")
    begin

    end;
}

enumextension 50119 BarcodeFontProviderErik extends "Barcode Font Provider"
{

    /// <summary>
    /// IDAutomation 1D-barcode provider.
    /// </summary>
    value(1; IDAutomation1DErik)
    {
        Caption = 'IDAutomation 1D Barcode Provider';
        Implementation = "Barcode Font Provider" = BarodeErik;
    }
}

report 50144 Artikelliste
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Artikelliste.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(Nr; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = SORTING("Entry No.");
                column(Entry_No_; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; format("Posting Date"))
                {
                }
                column(Posting_Date_Caption; "Item Ledger Entry".FieldCaption("Posting Date"))
                {
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
}