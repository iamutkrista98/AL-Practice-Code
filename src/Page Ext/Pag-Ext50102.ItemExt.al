pageextension 50102 "Item Ext" extends "Item List"
{
    layout
    {
        addafter("Unit Price")
        {
            field("Amount Agile"; Rec."Amount Agile")
            {
                ApplicationArea = All;

            }
        }
    }
}
