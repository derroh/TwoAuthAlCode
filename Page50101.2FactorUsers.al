page 50101 "2 Factor Users"
{
    PageType = List;
    SourceTable = "2 Factor Users";
    UsageCategory=Lists;
    ApplicationArea=all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID";"User ID")
                {
                    
                }

                field("Secret Token";"Secret Token")
                {

                }

                field("Login Token";"Login Token")
                {

                }

                field(Expire;Expire)
                {

                }
            }
        }
        
    }

}