pageextension 50107 VendorListExtensionES extends "Vendor List"
{
    layout
    {
        addafter("Balance (LCY)")
        {
            field("Balance ES";Rec."Balance ES")
            {
                ApplicationArea = All;
            }
        }
    }
    
    
}