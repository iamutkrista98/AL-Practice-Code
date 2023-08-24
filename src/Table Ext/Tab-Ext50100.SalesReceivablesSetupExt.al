tableextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "salenoseries"; Code[20])
        {
            Caption = 'Sale No Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50101; "pracnoseries"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Practice No Series';
            TableRelation = "No. Series";
        }
        field(50102; mynoseries; Code[20])
        {
            Caption = 'My No Series';
            TableRelation = "No. Series";

        }
    }
}
