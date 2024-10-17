pageextension 50106 SalesLineFabe extends "Sales Lines"
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
