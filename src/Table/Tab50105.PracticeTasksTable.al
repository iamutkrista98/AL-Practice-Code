table 50105 "Practice Tasks Table"
{
    Caption = 'Practice Tasks Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSerMgt: Codeunit NoSeriesManagement;
            begin
                if Rec."No." <> xRec."No." then
                    SalesSetup.Get();
                SalesSetup.TestField(SalesSetup.pracnoseries);
                NoSerMgt.SetSeries("No.");
            end;
        }
        field(2; Name; Text[64])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
            Editable = false;

        }
        field(4; Longitude; Decimal)
        {
            Caption = 'Longitude';
            // DecimalPlaces = 2;
            Editable = false;
        }
        field(5; Latitude; Decimal)
        {
            Caption = 'Latitude';
            // DecimalPlaces = 2;
            Editable = false;

        }
        field(15; LocationName; Code[20])
        {
            Caption = 'Area Name';
            Editable = false;
        }
        field(6; pracno; Code[20])
        {

        }
        field(7; RegisterDate; Date)
        {
            Caption = 'Registration Date';
            Editable = false;
        }
        field(8; CustNo; Code[20])
        {
            Caption = 'Customer No:';
            TableRelation = Customer where(Name = filter('@S*'), "Location Code" = const('YELLOW'));
            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                if Cust.Get(CustNo) then begin
                    Name := Cust.Name;
                    Address := Cust.Address;

                end;

            end;
        }
        field(9; Source1; Boolean)
        {
            Caption = 'Newspaper';
            trigger OnValidate()
            begin
                if (Source1 = true) then
                    //     SourceList.Add(FieldCaption(Source1))
                    // else
                    //     SourceList.Remove(FieldCaption(Source1));
                    // for I := 1 to SourceList.Count do begin
                    //     StringBuilder.Append(SourceList.Get(I) + '|');
                    //     Validate(AllSources, StringBuilder.ToText());
                    // end;
                    getAllSource(FieldCaption(Source1))
                else
                    if AllSources.Contains(FieldCaption(Source1) + '|') then begin
                        AllSources := AllSources.Replace(FieldCaption(Source1) + '|', '');
                    end;

            end;


        }
        field(10; Source2; Boolean)
        {
            Caption = 'Relatives';
            trigger OnValidate()
            begin
                if (Source2 = true) then
                    //     SourceList.Add(FieldCaption(Source2))
                    // else
                    //     SourceList.Remove(FieldCaption(Source2));
                    // for I := 1 to SourceList.Count do begin
                    //     StringBuilder.Append(SourceList.Get(I) + '|');
                    //     Validate(AllSources, StringBuilder.ToText());
                    // end;
                    getAllSource(FieldCaption(Source2))
                else
                    if AllSources.Contains(FieldCaption(Source2) + '|') then
                        AllSources := AllSources.Replace(FieldCaption(Source2) + '|', '');
            end;

        }
        field(11; Source3; Boolean)
        {
            Caption = 'Social Media';
            trigger OnValidate()
            begin
                if (Source3 = true) then
                    //     SourceList.Add(FieldCaption(Source3))
                    // else
                    //     SourceList.Remove(FieldCaption(Source3));

                    // for I := 1 to SourceList.Count do begin
                    //     StringBuilder.Append(SourceList.Get(I) + '|');
                    //     Validate(AllSources, StringBuilder.ToText());
                    // end;
                    getAllSource(FieldCaption(Source3))
                else
                    if AllSources.Contains(FieldCaption(Source3) + '|') then begin
                        AllSources := AllSources.Replace(FieldCaption(Source3) + '|', '');
                    end;

            end;


        }
        field(12; AllSources; Text[200])
        {
            Editable = false;

        }
        field(13; Photo; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
            Compressed = true;
        }
        field(14; FileUpload; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Memo;
            Compressed = true;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSerMgt: Codeunit NoSeriesManagement;
        GeoLocate: Codeunit Geolocation;
        Long: Decimal;
        Lat: Decimal;

    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup.pracnoseries);
            Clear(NoSerMgt);
            NoSerMgt.InitSeries(SalesSetup.pracnoseries, xRec.pracno, 0D, "No.", Rec.pracno);
        end;
        RegisterDate := Today;


    end;

    local procedure getAllSource(sourcetext: Text)
    begin
        AllSources += sourcetext + '|';
    end;
}
