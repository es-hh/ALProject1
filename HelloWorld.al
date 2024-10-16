// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding

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
