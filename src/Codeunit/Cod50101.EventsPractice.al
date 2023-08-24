codeunit 50101 EventsPractice
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header Agile", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteEventSalesHeaderAgile()
    begin
        Message('The record has been deleted');

    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header Agile", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyEventSalesHeaderAgile(var Rec: Record "Sales Header Agile"; var xRec: Record "Sales Header Agile")
    begin
        if xRec."Customer Name" = Rec."Customer Name" then
            Message('No Changes Made')
        else
            Message('Changes made to customer name');

    end;

    [EventSubscriber(ObjectType::Page, Database::"Sales Header Agile", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageSalesHeaderAgile()
    begin
        Message('This is the sales header agile page');
    end;

}
