table 50129 Filtertest
{
    DataClassification = ToBeClassified;
    DrillDownPageId = 50129;
    LookupPageId = 50129;

    fields
    {
        field(1; C1; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;

        }
        field(2; C2; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Filtertest.C2 where(C1 = field(C1));
            ValidateTableRelation = false;            
        }


    }

    keys
    {
        key(Key1; C1, C2)
        {
            Clustered = true;
        }
    }


}
