pageextension 50103 SalesOrderLinesErik extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(Farbe; Rec.Farbe)

            {
                ApplicationArea = All;
                Caption = 'Farbe';
            }
        }


    }

}
