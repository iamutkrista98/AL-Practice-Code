pageextension 50101 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("salenoseries"; Rec.salenoseries)
            {
                ApplicationArea = All;
            }
            field(pracnoseries; Rec.pracnoseries)
            {
                ApplicationArea = All;

            }
            field(mynoseries; Rec.mynoseries)
            {
                ApplicationArea = All;

            }

        }
    }
}
