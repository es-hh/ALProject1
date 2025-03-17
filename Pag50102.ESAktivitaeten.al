page 50102 "ES Aktivitaeten"
{
    ApplicationArea = All;
    Caption = 'Kasse';    
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Integer";
    SourceTableView = where(Number = const(0));

    layout
    {
        area(content)
        {
            cuegroup("Kasse")
            {
                Caption = 'Zahlungsart';
                
                actions
                {
                    action(test)
                    {
                        Caption = 'EC';
                        ApplicationArea = All;
                        Image = TileBlue;

                    }
                    action(test2)
                    {
                        Caption = 'Bar';
                        ApplicationArea = All;
                        Image = TileCurrency;

                    }
                    action(test3)
                    {
                        Caption = 'Kreditkarte';
                        ApplicationArea = All;
                        Image = TileYellow;

                    }
                }
                /*
                field("F1"; Rec.Number)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'EC';
                    DrillDown = true;
                    DrillDownPageID = "Item List";
                    ToolTip = 'TT 1';
                    //Image = Camera;
                    Style = Favorable;
                    StyleExpr = true;
                    HideValue = true;

                }
                field("F2"; Rec.Number)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Kreditkarte';
                    DrillDown = true;
                    DrillDownPageID = "Item List";
                    ToolTip = 'TT 2';
                }
                field("F3"; Rec.Number)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Bar';
                    DrillDown = true;
                    DrillDownPageID = "Item List";
                    ToolTip = 'TT 3';
                }
                */


            }
        }
    }
}