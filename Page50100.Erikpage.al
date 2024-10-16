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