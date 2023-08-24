report 50100 "Sales Report Agile"
{
    ApplicationArea = All;
    Caption = 'Sales Report Agile';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Report/RDLC/Sales Report Agile.rdl';
    dataset
    {
        dataitem("Company Information"; "Company Information")
        {
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(Phone_No_; "Phone No.")
            {

            }
            column(Picture; Picture)
            {

            }
            dataitem("Posted Sales Header Agile"; "Posted Sales Header Agile")
            {
                PrintOnlyIfDetail = true;
                RequestFilterFields = "Posting Date";

                column(Posting_Date; "Posting Date")
                {

                }
                column(Customer_No_; "Customer No.")
                {

                }
                column(Customer_Name; "Customer Name")
                {

                }
                column(SaleNo; "No.")
                {

                }

                dataitem("Posted Sales Line Agile"; "Posted Sales Line Agile")
                {
                    DataItemLink = "Document No." = field("No.");
                    DataItemTableView = sorting("Document No.", "Line No.");
                    column(ItemType; Type)
                    {

                    }
                    column(No_; "No.")
                    {

                    }
                    column("ItemName"; Itm.Description)
                    {

                    }
                    column(GLDesc; GL.Name)
                    {

                    }
                    column(Amount; Amount)
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(Total_Amount; "Total Amount")
                    {

                    }
                    trigger OnAfterGetRecord()
                    begin
                        if Type = Type::"Item" then
                            Itm.GET("Posted Sales Line Agile"."No.")
                        else
                            if Type = Type::"GL Account" then
                                GL.GET("Posted Sales Line Agile"."No.");


                    end;

                }

                trigger OnPreDataItem()
                begin
                    if CusNo = '' then
                        Error('Customer Number is Required!')
                    else begin
                        "Posted Sales Header Agile".SetRange("Posted Sales Header Agile"."Customer No.", CusNo);
                        if not "Posted Sales Header Agile".FindSet() then
                            Error('No Data Found for the given Customer!');
                    end;

                end;







            }

        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group("Agile Filter")
                {

                    field("Customer No."; CusNo)
                    {
                        ApplicationArea = All;
                        TableRelation = Customer."No.";

                    }
                }
            }
        }
    }

    var
        Itm: Record Item;
        GL: Record "G/L Account";
        CusNo: Code[20];

}
