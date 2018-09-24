table 50100 "2 Factor Users"
{
    DataPerCompany = false;
    fields
    {
        field(1; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
        }

        field(2; "Secret Token"; Code[10])
        {
            trigger OnValidate();
            var "2FactorUser" : Record "2 Factor Users";
            begin
                "2FactorUser".SetRange("Secret Token","Secret Token");
                if "2FactorUser".FindLast then
                    Error('The Secret Token must be uniq');        
            end;
        }

        field(3; Expire; Datetime)
        {

        }

        field(4; "Login Token"; Code[10])
        {
            trigger OnValidate();
            begin
                Expire := CreateDateTime(Today,Time+300000);
            end;
        }
    }

    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }

    var
        

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}