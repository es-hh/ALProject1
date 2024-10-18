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
            action(Filterpage)
            {
                ApplicationArea = All;
                Caption = 'Filterpage';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                  FilterpageMgmtWSH : Codeunit "Filterpage Mgmt.WSH";
                  Item: Record Item;
                  Customer: Record Customer;
                  begin
                    Item.SETRANGE(Blocked,FALSE);
                    Customer.SETRANGE(Blocked,Customer.Blocked::" ");
                    FilterpageMgmtWSH.SetzeParameter(27,STRSUBSTNO('%1,%2,%3',Item.FIELDNO("No."),Item.FIELDNO(Description),Item.FieldNo(Blocked)),Item.GETVIEW);
                    FilterpageMgmtWSH.SetzeParameter(18,STRSUBSTNO('%1,%2,%3',Customer.FIELDNO("No."),Customer.FIELDNO(Name),Customer.FIELDNO(Blocked)),Customer.GETVIEW);
                    FilterpageMgmtWSH.StartFilterPage('Caption der Filterpage');
                    Message(FilterpageMgmtWSH.HoleFiltertext(Database::Item,0));
                    Message(FilterpageMgmtWSH.HoleFiltertext(Database::Item,1));

                  end;
            }

        }
    }
}