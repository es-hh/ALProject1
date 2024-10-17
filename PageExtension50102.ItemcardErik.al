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
