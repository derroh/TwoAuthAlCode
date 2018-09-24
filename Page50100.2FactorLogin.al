page 50100 "2 Factor Login"
{
    PageType = Card;

    layout
    {
        area(content)
        {
            group(Login)
            {
                field(Token; Token)
                {
                    trigger OnValidate();
                    var
                        "2factorSetup": Record "2 Factor Users";
                    begin
                        if "2factorSetup".GET(UserId) then begin
                            if "2factorSetup"."Login Token" <> Token then
                                ERROR('WRONG TOKEN');
                        end else
                            ERROR('No VAILD USER');
                    end;
                }
            }
        }


    }

    var
        Token: Code[20];

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    var
        "2factorSetup": Record "2 Factor Users";
    begin
        if "2factorSetup".GET(UserId) then begin
            if "2factorSetup"."Login Token" <> Token then
                ERROR('WRONG TOKEN');
            if "2factorSetup".Expire < CurrentDateTime then
                Error('Your token has expired');    
        end else
            ERROR('No VAILD USER');
        EXIT(true);
    end;
}