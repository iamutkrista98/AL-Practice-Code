// codeunit 50101 EventCodeUnit
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnBeforeInsertGLEntry', '', false, false)]
//     local procedure OnPostGLAccOnBeforeInsertGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
//     begin
//         GenJournalLine.TestField("Sales Header Agile No.");
//         GLEntry."Sales Header Agile No." := GenJournalLine."Sales Header Agile No.";

//     end;

//     // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
//     // local procedure OnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line")
//     // var
//     //     SalesLine: Record "Sales Line Agile";
//     //     SalesHeader: Record "Sales Header Agile";
//     // begin
//     //     SalesLine.Reset();
//     //     SalesLine.SetRange("Document No.", SalesHeader."No.");
//     //     if SalesLine.FindSet() then
//     //         repeat
//     //             GenJournalLine."Sales Header Agile No." := SalesLine."Document No.";
//     //         until SalesLine.Next() = 0;

//     // end;

// }
