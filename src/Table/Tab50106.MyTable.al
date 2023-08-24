// table 50106 MyTable
// {
//     Caption = 'MyTable';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; myfield; Decimal)
//         {
//             Caption = 'myfield';
//         }
//         field(2; "No."; Code[20])
//         {
//             Caption = 'No.';

//             trigger OnValidate()
//             var
//                 SalesSetup: Record "Sales & Receivables Setup";
//                 NoSerMgt: Codeunit NoSeriesManagement;
//             begin
//                 if Rec."No." <> xRec."No." then
//                     SalesSetup.GET();
//                 SalesSetup.TestField(SalesSetup.mynoseries);
//                 NoSerMgt.SetSeries("No.");
//             end;


//         }
//         field(3; "Global Dimension 1 Filter"; Code[20])
//         {
//             Caption = 'Global Dimension 1 Filter';
//             FieldClass = FlowFilter;
//         }
//         field(4; "Global Dimension 2 Filter"; Code[20])
//         {
//             Caption = 'Global Dimension 2 Filter';
//             FieldClass = FlowFilter;
//         }
//         field(5; "Currency Filter"; Code[20])
//         {
//             Caption = 'Currency Filter';
//             FieldClass = FlowFilter;
//         }
//         field(6; "Total Amount"; Decimal)
//         {
//             Caption = 'Total Amount';
//             FieldClass = FlowField;
//             CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("Currency Filter")));
//             "Initial Entry Global Dim. 1"=Field("Global Dimension")
//         }
//         field(7; "Amount upper bound"; Decimal)
//         {
//             Caption = 'Amount upper bound';
//         }
//         field(8; "Amount lower bound"; Decimal)
//         {
//             Caption = 'Amount lower bound';
//         }
//         field(9; "First Entry"; Boolean)
//         {
//             Caption = 'First Entry';
//         }
//         field(10; "Customer Balance"; Decimal)
//         {
//             Caption = 'Customer Balance';
//         }
//         field(11; mynos; Code[20])
//         {

//         }
//     }
//     keys
//     {
//         key(PK; myfield)
//         {
//             Clustered = true;
//         }
//     }

//     trigger OnInsert()
//     var
//         SalesSetup: Record "Sales & Receivables Setup";
//         NoSerMgt: Codeunit NoSeriesManagement;
//     begin
//         if "No." = '' then begin
//             SalesSetup.Get();
//             SalesSetup.TestField(SalesSetup.mynoseries);
//             Clear(NoSerMgt);
//             NoSerMgt.InitSeries(SalesSetup.mynoseries, xRec.mynos, 0D, "No.", Rec.mynos);
//         end;
//     end;
// }
