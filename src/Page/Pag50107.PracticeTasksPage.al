page 50107 PracticeTasksPage
{
    ApplicationArea = All;
    Caption = 'PracticeTasksPage';
    PageType = List;
    SourceTable = "Practice Tasks Table";
    UsageCategory = Lists;
    CardPageId = "PracticeTasksCardPage";
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Longitude; Rec.Longitude)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Longitude field.';
                }
                field(Latitude; Rec.Latitude)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Latitude field.';
                }
                field(RegisterDate; Rec.RegisterDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field(Source1; Rec.Source1)
                {
                    ApplicationArea = All;
                    Editable = true;

                }
                field(Source2; Rec.Source2)
                {
                    ApplicationArea = All;
                    Editable = true;


                }
                field(Source3; Rec.Source3)
                {
                    ApplicationArea = All;
                    Editable = true;

                }
                field(AllSources; Rec.AllSources)
                {
                    ApplicationArea = All;
                    Editable = true;

                }
            }
        }
    }
}
