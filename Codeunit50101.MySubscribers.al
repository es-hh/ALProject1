codeunit 50101 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::"sales line", 'OnCopyFromItemOnAfterCheck', '', true, true)]
    local procedure farbeuebernehmen(var SalesLine: Record "Sales Line"; Item: Record Item);
    begin
        SalesLine.Farbe := item.Farbe;
    end;

    [EventSubscriber(ObjectType::Table, Database::"sales line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure noonavalidate(var Rec: Record "sales line")
    begin
        Message(rec."Sell-to Customer No.");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item List", 'OnOpenPageEvent', '', false, false)]
    local procedure MyProcedure(var Rec: Record Item)
    var
        Item: Record Item;
    begin
        //if page.RunModal(0,Item) = Action::LookupOK then
        //  message(item."No.");
    end;
    [EventSubscriber(ObjectType::Page, Page::"Purchase Journal", 'OnAfterValidateEvent', 'Account No.', false, false)]
    local procedure AccountNoOnValidate(var Rec: Record "Gen. Journal Line");

    begin
        Message(rec."Account No.");
    end;
}
