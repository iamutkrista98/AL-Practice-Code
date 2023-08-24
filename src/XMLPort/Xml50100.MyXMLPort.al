xmlport 50100 MyXMLPort
{
    Caption = 'MyXMLPort';
    Format = VariableText;
    TextEncoding = UTF8;
    Direction = Export;
    UseRequestPage = false;
    TableSeparator = '<NewLine>';
    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'ItemHeader';
                SourceTableView = sorting(Number) where(Number = CONST(1));

                textelement(ItemNoTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemNoTitle := Item.FieldCaption("No.");
                    end;
                }
                textelement(ItemDescTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemDescTitle := Item.FieldCaption(Description);

                    end;
                }
                textelement(ItemTypeTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ItemTypeTitle := Item.FieldCaption(Type);
                    end;

                }

            }
            tableelement(Item; Item)
            {
                XmlName = 'Item';
                RequestFilterFields = "No.";

                fieldelement("No."; Item."No.")
                {

                }
                fieldelement(Description; Item.Description)
                {

                }
                fieldelement(Type; Item.Type)
                {

                }
                fieldelement(Inventory; Item.Inventory)
                {

                }
                fieldelement(BaseUnitOfMeasure; Item."Base Unit of Measure")
                {

                }


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

}
