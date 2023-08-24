tableextension 50103 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    fields
    {
        field(50100; "Agile Journal Template"; Code[20])
        {
            Caption = 'Agile Journal Template';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(50101; "Agile Journal Batch"; Code[20])
        {
            Caption = 'Agile Journal Batch';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Agile Journal Template"));
        }
        field(50102; "Agile GL Account"; Code[20])
        {
            Caption = 'Agile GL Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account" where("Direct Posting" = const(true));
        }
    }
}
