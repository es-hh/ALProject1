pageextension 50108 Page39Extension extends "General Journal"
{
    actions
    {
        addfirst(processing)
        {
            // Adds the action called "My Navigate" to the Navigate menu. 
            action("Import")
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var

                    GenJournalLine: Record "Gen. Journal Line";
                    Zeilennr: Integer;
                    InStr: InStream;
                    FileName: Text;                    
                    TextRead: Text;

                begin
                    GenJournalLine.SetRange("Journal Template Name",Rec."Journal Template Name");
                    GenJournalLine.SetRange("Journal Batch Name",Rec."Journal Batch Name");
                    if GenJournalLine.FindLast() then
                      Zeilennr := GenJournalLine."Line No.";

                    if (File.UploadIntoStream('Open File', '', 'All Files (*.*)|*.*',FileName, InStr)) then begin                    
                        repeat
                           Instr.ReadText(TextRead);
                           GenJournalLine.init;
                           GenJournalLine."Journal Template Name" := Rec."Journal Template Name";
                           GenJournalLine."Journal Batch Name" := rec."Journal Batch Name";
                           Zeilennr += 1000;
                           GenJournalLine."Line No." := Zeilennr;
                           Evaluate(GenJournalLine."Posting Date",TextRead.Substring(1,8));
                           GenJournalLine.Validate("Posting Date");
                           GenJournalLine.Validate("Account No.",textread.Substring(9,4));
                           Evaluate(GenJournalLine.Amount,TextRead.Substring(13));
                           GenJournalLine.Validate(Amount);
                           GenJournalLine.insert;
                        until InStr.EOS;                                                        
                    end;
                end;
            }
        }
    }
}
