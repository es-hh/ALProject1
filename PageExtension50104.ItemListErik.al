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