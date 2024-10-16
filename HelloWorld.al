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

