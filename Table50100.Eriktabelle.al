table 50100 Eriktabelle
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LfdNr; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Farbe; Enum Farbe)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Processing; DateTime)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; LfdNr)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;


}


