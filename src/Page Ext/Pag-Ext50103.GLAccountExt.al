pageextension 50103 "G/L Account Ext" extends "G/L Account List"
{
    layout
    {
        addafter("Income/Balance")
        {
            field("Amount Agile"; Rec."Amount Agile")
            {
                ApplicationArea = All;

            }
        }
    }
}
