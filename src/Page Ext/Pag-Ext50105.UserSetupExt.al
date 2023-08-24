pageextension 50105 UserSetupExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field(Permit; Rec.Permit)
            {
                ApplicationArea = All;
            }
        }
    }
}
