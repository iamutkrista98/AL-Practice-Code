page 50101 "Sales Header Agile Card"
{
    Caption = 'Sales Header Agile Card';
    PageType = Card;
    SourceTable = "Sales Header Agile";

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
                    Visible = false;
                }
            }
            group("Sales Line Agile")
            {
                part(SalesLineAgile; "Sales Line Agile Subform")
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
            action(Post)
            {
                Caption = 'Post';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Post;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AgileSalesManagement: Codeunit AgileSalesManagement;

                begin
                    if Confirm('Are you sure you want to post?', false) then
                        AgileSalesManagement.PostPurchToPostedPurch(Rec."No.");
                    Message('Document has been posted successfully');

                end;

            }

        }
    }
}
