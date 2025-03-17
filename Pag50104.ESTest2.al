page 50104 "ES Test2"
{
    ApplicationArea = All;
    Caption = 'ES Test2';
    PageType = StandardDialog;
    SourceTable = "Gen. Journal Line";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the type of account that the entry on the journal line will be posted to.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies a document number for the journal line.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec."Journal Batch Name" := 'STANDARD';
        Rec."Journal Template Name" := 'EINKAUF';
        rec.SetUpNewLine(rec,0,true);
    end;

}
