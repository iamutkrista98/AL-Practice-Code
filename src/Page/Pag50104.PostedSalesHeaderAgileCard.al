page 50104 "Posted Sales Header Agile Card"
{
    Caption = 'Posted Sales Header Agile Card';
    PageType = Card;
    SourceTable = "Posted Sales Header Agile";
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
            group("Sales Line Agile")
            {
                part(SalesLineAgile; "Posted Sales Line Agile Part")
                {
                    SubPageLink = "Document No." = field("No.");
                    ApplicationArea = All;
                    UpdatePropagation = Both;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                Image = Print;

                trigger OnAction()
                var
                    PostedHdr: Record "Posted Sales Header Agile";
                begin
                    PostedHdr.Reset();
                    PostedHdr.SetRange("No.", Rec."No.");
                    PostedHdr.SetRange("Customer No.", Rec."Customer No.");
                    if PostedHdr.FindFirst() then
                        Report.Run(Report::"Sales Report Agile", true, true, PostedHdr);


                end;
            }
        }
    }
}
