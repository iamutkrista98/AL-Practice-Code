page 50109 MyPage
{
    Caption = 'MyPage';
    PageType = Card;
    SourceTable = Customer;
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(PaymentType; options)
                {
                    ApplicationArea = All;


                }
                field(TimeDifference; TimeDifference)
                {
                    ApplicationArea = All;

                }
                field(time1; time1)
                {


                }
                field(time2; time2)
                {
                }



            }
            group(Advanced)
            {
                Visible = ShowBalance;
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ToggleBalance)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if not CheckPermission(UserId) then
                        error('You dont have special permission for the action')
                    else
                        ShowBalance := not ShowBalance;
                end;
            }
            action(View)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if ab.Add('hello', 45) and ab.Add('how are you', 65) then
                        Message('Hello there %1', ab)
                    else
                        Message('Already Added');
                    if ab.Replace('hello', 72) then
                        Message('The new replaced JSON is %1', ab)
                    else
                        Message('The JSON Object Key value has already been replaced');
                end;

            }
            action(Visualize)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    case options of
                        options::Cash:
                            Message('Selected Cash');
                        options::Esewa:
                            Message('Selected Esewa');
                        options::Khalti:
                            Message('Selected Khalti');


                    end;
                end;

            }
            action(EvaluateTimeDifference)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    temptime: Text;
                begin
                    TimeDifference := time2 - time1;
                    Message('The time difference between %1 and %2 is: %3', time1, time2, TimeDifference);
                    temptime := Format(TimeDifference div 3600);
                    if (Format(TimeDifference) > temptime) then
                        Message('You are late')
                    else
                        Message('You are on time');
                end;
            }
            action(StringBuilderOperations)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('The capacity of the builder is: %1 and the max capacity is %2', StringType.Capacity(), StringType.MaxCapacity());
                end;
            }
        }
    }
    protected var
        [InDataSet]
        ShowBalance: Boolean;

    var
        ab: JsonObject;
        options: Option "Cash","Esewa","Khalti";
        TimeDifference: Duration;
        time1, time2 : Time;
        StringType: TextBuilder;

    local procedure CheckPermission(UserId: Text): Boolean
    var
        check: Record "User Setup";
    begin
        if check.Get(UserId) then
            if check.Permit = true then
                exit(true)
            else
                exit(false);



    end;

    trigger OnOpenPage()
    begin
        time1 := 010130T;
        time2 := 050505T;
        StringType.Append('hello there, how are you. i hope you are fine');
    end;



}
