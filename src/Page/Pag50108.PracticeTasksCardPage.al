page 50108 PracticeTasksCardPage
{
    Caption = 'PracticeTasksCardPage';
    PageType = Card;
    SourceTable = "Practice Tasks Table";

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
                field(CustNo; Rec.CustNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No: field.';
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
                field(LocationName; Rec.LocationName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Area Name field.';
                }
                field(RegisterDate; Rec.RegisterDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }

                group("Information Sources")
                {
                    field(Source1; Rec.Source1)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Newspaper field.';
                    }
                    field(Source2; Rec.Source2)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Relatives field.';
                    }
                    field(Source3; Rec.Source3)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Social Media field.';
                    }
                    field(AllSources; Rec.AllSources)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the AllSources field.';
                    }
                    field(compiled; compiled)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the compiled field.';
                    }
                    field(Photo; Rec.Photo)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Photo field.';
                    }
                    field(FileUpload; Rec.FileUpload)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the FileUpload field.';
                    }


                }

            }
        }
        area(FactBoxes)
        {
            part(CustomerList; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(CustNo);
            }
            part(MyPart; "Acc. Sched. KPI Web Srv. Lines")
            {
                ApplicationArea = All;
                SubPageView = sorting("Acc. Schedule Name");

            }
            part(MyPart2; "Posted Sales Line Agile Part")
            {
                ApplicationArea = All;
                SubPageView = sorting("Document No.", "Line No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetLocation)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                Image = Map;
                ToolTip = 'Executes the GetLocation action.';
                trigger OnAction()
                var
                    GeoLocate: Codeunit Geolocation;
                    Lat: Decimal;
                    Long: Decimal;
                begin
                    GeoLocate.SetHighAccuracy(true);
                    GeoLocate.RequestGeolocation();
                    GeoLocate.GetGeolocation(Lat, Long);
                    Rec.Latitude := Lat;
                    Rec.Longitude := Long;
                    if (Lat = 85.33) and (Long = 27.72) then
                        Rec.LocationName := 'Naxal'
                    else
                        Rec.LocationName := 'Other';
                end;
            }
            action(ReadOnly)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = PrintCover;
                ToolTip = 'Executes the ReadOnly action.';
                trigger OnAction()
                begin
                    Rec.AllSources := Rec.AllSources.ToUpper();
                end;

            }
            action(generate)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Create;
                ToolTip = 'Executes the generate action.';
                trigger OnAction()
                var
                    n1: Integer;
                    n2: Integer;
                    n3: Integer;
                    I: Integer;
                    coll: Text;

                begin
                    n1 := 1;
                    n2 := 1;
                    for I := 1 to 10 do begin
                        n3 := n1 + n2;
                        n1 := n2;
                        n2 := n3;
                        coll += Format(n3) + ' ';


                    end;
                    compiled := ('1 1 ') + coll;
                    Message('The fibonacci series: %1', compiled);


                end;
            }
            action(Export)
            {
                ApplicationArea = All;
                Image = Export;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Xmlport.Run(50100, true, false);

                end;

            }
        }
    }

    var
        compiled: Text;
}
