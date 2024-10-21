table 50102 "Tabelle E1"
{
    Caption = 'Tabelle E1';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Int; Integer)
        {
            Caption = 'Int';
        }
    }
    keys
    {
        key(PK; Int)
        {
            Clustered = true;
        }
    }
}
