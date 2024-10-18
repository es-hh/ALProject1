table 50101 "Sort Tabelle"
{
    Caption = 'Sort Tabelle';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Lfd. Nr."; Integer)
        {
            Caption = 'Lfd. Nr.';
        }
        field(100; Int1; Integer)
        {
            Caption = 'Int1';
        }
        field(200; Text1; Text[250])
        {
            Caption = 'Text1';
        }
        field(201; Text2; Text[250])
        {
            Caption = 'Text2';
        }
        field(300; Blob1; Blob)
        {
            Caption = 'Blob1';
        }
    }
    keys
    {
        key(PK; "Lfd. Nr.")
        {
            Clustered = true;
        }
    }
}
