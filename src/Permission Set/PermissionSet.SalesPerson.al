permissionset 50100 "Sales Person"
{
    Assignable = true;
    Caption = 'Sales Person';
    Permissions =
        tabledata Customer = Rimd,
        tabledata "Payment Terms" = RMD,
        tabledata Currency = RM,
        tabledata "Sales Header" = RIM,
        codeunit AgileSalesManagement = x;

}
