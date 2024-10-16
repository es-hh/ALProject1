/// <summary>
/// TableExtension ItemErik (ID 50100) extends Record Item.
/// </summary>

tableextension 50100 ItemErik extends Item
{
    fields
    {
        field(50000; Farbe; Enum Farbe)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Codetest; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = "Barcode";
        }
        field(50002; "Artikelposten"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = exist("Item Ledger Entry" where("item no." = field("No.")));
            Editable = false;

        }
        field(50003; "Keine Artikelposten"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = - exist("Item Ledger Entry" where("item no." = field("No.")));
            Editable = false;

        }
    }
    fieldgroups
    {
        addlast(Brick; "No.", Description, Codetest)
        {

        }
    }

}
