page 50129 "Filtertest List"
{

    ApplicationArea = All;
    Caption = 'Filtertest List';
    PageType = List;
    SourceTable = Filtertest;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(C1; Rec.C1)
                {
                    ApplicationArea = All;
                }
                field(C2; Rec.C2)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
