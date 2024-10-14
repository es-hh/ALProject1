// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding
pageextension 50101 ErikExtension extends "Payment Terms"
{

    actions
    {
        addfirst(Navigation)
        {
            // Adds the action called "My Navigate" to the Navigate menu. 
            action("My Navigate")
            {
                ApplicationArea = All;
                Image = GainLossEntries;
                RunObject = page Erikpage;
            }

            action("Zahl")

            {
                ApplicationArea = All;

                trigger OnAction()

                begin
                    mathe(1);
                    mathe(1, 2);
                end;
            }

            action(JS)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    page.RunModal(page::PageWithAddIn);
                end;
            }

        }

    }

    local procedure mathe(zahl1: Decimal)
    var
        cust: Record Customer;
    begin
        Message(Format(zahl1));

    end;

    local procedure mathe(zahl1: Decimal; zahl2: decimal)

    begin
        Message(Format(zahl1 + zahl2));

    end;



}
table 50100 Eriktabelle
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LfdNr; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Farbe; Enum Farbe)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Processing; DateTime)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; LfdNr)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;


}
page 50100 Erikpage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Eriktabelle;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field(Name; rec.LfdNr)
                {
                    ApplicationArea = All;
                }
                field(Farbe; Rec.Farbe)
                {
                    ApplicationArea = All;
                }
                field(Processing; Rec.Processing)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Testaktion';


                trigger OnAction()
                begin
                    with rec do begin

                    end;
                    Message('Test');
                end;


            }
        }
    }
    trigger OnOpenPage()
    begin
        boolarray[10] := true;
    end;

    var
        intarray: array[10] of Record "Unit of Measure";
        boolarray: array[10] of Boolean;
}
enum 50100 Farbe
{
    Extensible = true;

    value(0; None)
    {
        Caption = '', locked = true;
    }
    value(1; Blau)
    {
        Caption = 'Blau', Comment = 'Bitte übersetzen';
    }
    value(2; Gruen)
    {
        Caption = 'Green';
    }
    value(3; Rot)
    {
        Caption = 'Red';
    }
}

table 50129 Filtertest
{
    DataClassification = ToBeClassified;
    DrillDownPageId = 50129;
    LookupPageId = 50129;

    fields
    {
        field(1; C1; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;

        }
        field(2; C2; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Filtertest.C2 where(C1 = field(C1));
            ValidateTableRelation = false;
            TestTableRelation = false;
        }


    }

    keys
    {
        key(Key1; C1, C2)
        {
            Clustered = true;
        }
    }


}
