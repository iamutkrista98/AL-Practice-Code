report 50102 testrep
{
    Caption = 'testrep';
    DefaultLayout = RDLC;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'src/RDLC/testreport.rdl';
    dataset
    {
        dataitem("GLEntries"; "G/L Entry")
        {
            column(SystemCreatedBy; SystemCreatedBy)
            {

            }
            column(G_L_Account_No_; "G/L Account No.")
            {

            }


            dataitem("Posted Approval Entry"; "Posted Approval Entry")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(ReviewedBy; RevId)
                {

                }
                column(VerifiedBy; VerId)
                {

                }
                trigger OnPreDataItem()
                begin
                    "Posted Approval Entry".Get(GLEntries."Document No.");
                    "Posted Approval Entry".SetRange("Posted Approval Entry".Status, "Posted Approval Entry".Status::Approved);
                    "Posted Approval Entry".SetRange("Posted Approval Entry"."Sequence No.", 1);
                    RevId := "Posted Approval Entry"."Approver ID";
                    "Posted Approval Entry".Reset();
                    "Posted Approval Entry".Get(GLEntries."Document No.");
                    "Posted Approval Entry".SetRange("Posted Approval Entry".Status, "Posted Approval Entry".Status::Approved);
                    "Posted Approval Entry".SetRange("Posted Approval Entry"."Sequence No.", 2);
                    VerId := "Posted Approval Entry"."Approver ID";
                end;

            }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        RevId: Text;
        VerId: Text;
}
