pageextension 50101 PayementTerms extends "Payment Terms"
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
                    // Kommentar Git Web
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