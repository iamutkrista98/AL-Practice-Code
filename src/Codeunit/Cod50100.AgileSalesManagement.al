codeunit 50100 AgileSalesManagement
{
    // procedure PostPurchToPostedPurch(purchcode: Code[20])
    // var
    //     SalesHdr: Record "Sales Header Agile";
    //     PostedSalesHdr: Record "Posted Sales Header Agile";
    //     SalesLine: Record "Sales Line Agile";
    //     PostedSalesLine: Record "Posted Sales Line Agile";
    //     SalesLedgerEntry: Record "Sales Ledger Entry Agile";
    //     totalAmount: Decimal;
    // begin
    //     if SalesHdr.Get(purchcode) then begin
    //         PostedSalesHdr.Init();
    //         PostedSalesHdr.TransferFields(SalesHdr);
    //         PostedSalesHdr.Insert(true);
    //         PostedSalesHdr."Posting Date" := Today;
    //         PostedSalesHdr.Modify();
    //         SalesLine.Reset();
    //         SalesLine.SetRange("Document No.", SalesHdr."No.");
    //         if SalesLine.FindSet() then
    //             repeat
    //                 PostedSalesLine.Init();
    //                 PostedSalesLine.TransferFields(SalesLine);
    //                 totalAmount += SalesLine."Total Amount";
    //                 PostedSalesLine.Insert();
    //                 InsertIntoSalesLedger(SalesLine);
    //             until SalesLine.Next() = 0;
    //         PostedSalesHdr."Total Amount" := totalAmount;
    //         PostedSalesHdr.Modify();
    //         SalesLine.DeleteAll();
    //         SalesHdr.Delete();

    //     end;

    // end;
    procedure PostPurchToPostedPurch(purchcode: Code[20])

    var
        SaleHdr: Record "Sales Header Agile";
        SaleLine: Record "Sales Line Agile";
        PostedSaleHdr: Record "Posted Sales Header Agile";
        PostedSaleLine: Record "Posted Sales Line Agile";
        totalAmount: Decimal;
    begin
        if SaleHdr.Get(purchcode) then
            PostedSaleHdr.Init();
        PostedSaleHdr.TransferFields(SaleHdr);
        PostedSaleHdr.Insert(true);
        PostedSaleHdr."Posting Date" := Today;
        PostedSaleHdr.Modify();
        SaleLine.Reset();
        SaleLine.SetRange("Document No.", SaleHdr."No.");
        if SaleLine.FindSet() then
            repeat
                PostedSaleLine.Init();
                PostedSaleLine.TransferFields(SaleLine);
                totalAmount += SaleLine."Total Amount";
                PostedSaleLine.Insert(true);
                InsertIntoSalesLedger(SaleLine);
            until SaleLine.Next() = 0;
        PostedSaleHdr."Total Amount" := totalAmount;
        PostedSaleHdr.Modify();
        SaleLine.DeleteAll();
        SaleHdr.Delete();
    end;

    procedure InsertIntoSalesLedger(SalesLine: Record "Sales Line Agile")
    var
        SaleLedger: Record "Sales Ledger Entry Agile";
        SaleHdr: Record "Sales Header Agile";
        GenJnlLine: Record "Gen. Journal Line";
        GenLedSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";

        cusNo: Code[20];
    begin
        SaleLedger.Init();
        if SaleLedger.FindLast() then
            SaleLedger."Entry No." += 1
        else
            SaleLedger."Entry No." := 1;
        SaleLedger."Document No." := SalesLine."Document No.";
        SaleLedger."No." := SalesLine."No.";
        getCustomerNoFromSalesHeader(SalesLine."Document No.", cusNo);
        SaleLedger."Customer No." := cusNo;
        SaleLedger."Total Quantity" := SalesLine.Quantity;
        SaleLedger.Amount := SalesLine."Total Amount";
        SaleLedger.Insert();
        GenJnlLine.Init();
        GenJnlLine."Journal Batch Name" := 'CASH';
        GenJnlLine."Journal Template Name" := 'GENERAL';
        if GenJnlLine.FindLast() then
            GenJnlLine."Line No." += 10000
        else
            GenJnlLine."Line No." := 10000;
        GenJnlLine."Posting Date" := Today;
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
        GenJnlLine.Validate("Account No.", '1320');
        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::Purchase;
        GenJnlLine."Gen. Bus. Posting Group" := 'MISC';
        GenJnlLine.Amount := SaleLedger.Amount;
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '2910';
        GenJnlLine.Insert(true);
        // GenJnlLine."Posting Date" := Today();
        // GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
        // GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
        // GenJnlLine.Validate(GenJnlLine."Account No.", GenLedSetup."Agile GL Account");
        // GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::Sale;
        // GenJnlLine."Gen. Bus. Posting Group" := 'EU';
        // GenJnlLine."Gen. Prod. Posting Group" := 'RETAIL';
        // GenJnlLine.Amount := SaleLedger.Amount;
        // GenJnlLine."Sales Header Agile No." := SaleLedger."Document No.";
        // GenJnlLine."Debit Amount" := SaleLedger.Amount;
        // GenJnlLine.Insert(true);
        // GenJnlLine.Init();
        // GenJnlLine."Journal Template Name" := 'SALES';
        // GenJnlLine."Journal Batch Name" := 'DEFAULT';
        // GenJnlLine."Posting Date" := SaleHdr."Posting Date";
        // GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
        // GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        // GenJnlLine.Validate("Account No.", cusNo);
        // GenJnlLine."Sales Header Agile No." := SalesLine."Document No.";
        // GenJnlLine."Credit Amount" := SaleLedger.Amount;
        // GenJnlLine.Insert(true);


        // GenJnlLine.Init();
        // GenJnlLine."Posting Date" := SaleHdr."Posting Date";
        // // GenJnlLine."Account Type" := "Gen. Journal Account Type".FromInteger(0);
        // GenJnlLine."Account No." := cusNo;
        // GenJnlLine."Debit Amount" := SalesLine."Total Amount";
        // GenJnlLine."Sales Header Agile No." := SaleHdr."No.";
        // GenJnlLine."Credit Amount" := SalesLine."Total Amount";
        // GenJnlLine.Insert(true);

    end;

    local procedure getCustomerNoFromSalesHeader(DocumentNo: Code[20]; var cusNo: Code[20])
    var
        SaleHdr: Record "Sales Header Agile";
    begin
        if SaleHdr.Get(DocumentNo) then
            cusNo := SaleHdr."Customer No.";
    end;



    trigger OnRun()
    begin
        Message('The posting codeunit ran successfully!');
    end;

}
