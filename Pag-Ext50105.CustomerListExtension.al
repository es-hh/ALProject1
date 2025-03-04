pageextension 50105 "Customer List Extension" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
             
            action("Erikliste")
            {
                ApplicationArea = All;
                Image = GainLossEntries;
                RunObject = report "Debitor Posten Erik";
            }
        }
    }        
}
