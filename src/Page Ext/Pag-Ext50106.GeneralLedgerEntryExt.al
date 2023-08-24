pageextension 50106 "General Ledger Entry Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("G/L Account Name")
        {
            field("Sales Header Agile No."; Rec."Sales Header Agile No.")
            {
                ApplicationArea = All;
            }

        }
    }
}
