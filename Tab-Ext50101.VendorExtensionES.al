tableextension 50101 VendorExtensionES extends Vendor
{
    fields
    {

        field(50100; "Balance ES"; Decimal)
        {
            AutoFormatExpression = Rec."Currency Code";
            AutoFormatType = 1;
            
            CalcFormula = sum("Detailed Vendor Ledg. Entry".Amount where("Vendor No." = field("No."),
                                                                           "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                           "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                           "Currency Code" = field("Currency Filter")));
                                                                           
            //CalcFormula = count(Item);            
            CaptionML = ENU = 'Balance ES',
                        DEU = 'Saldo ES';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
