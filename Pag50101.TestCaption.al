page 50101 "Test Caption"
{
    ApplicationArea = All;
    Caption = 'Test Caption';
    PageType = List;
    SourceTable = "Integer";
    UsageCategory = None;
    SourceTableView = sorting(Number) WHERE(Number = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; Rec.Number)
                {
                    ToolTip = 'Specifies the Excel row number.';
                }
                field(ItemNo; Item."no.")
                {
                    CaptionClass = Item.FieldCaption("No.");
                    trigger OnDrillDown()
                    begin
                        page.runmodal(page::"Item List",item);
                    end;
                }
            }
        }
    }
    var
        Item: Record Item;

    trigger OnAfterGetRecord()
    begin
        Item.FindFirst();
        Item.next(Rec.Number);
    end;

}
