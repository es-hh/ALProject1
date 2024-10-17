
report 50144 Artikelliste
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Artikelliste.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(Nr; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No.");
                DataItemTableView = SORTING("Entry No.");
                column(Entry_No_; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; format("Posting Date"))
                {
                }
                column(Posting_Date_Caption; "Item Ledger Entry".FieldCaption("Posting Date"))
                {
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
}