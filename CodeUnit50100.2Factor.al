codeunit 50100 "2FactorMgt"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ApplicationManagement, 'OnBeforeCompanyOpen', '', true, true)]
    local procedure OnBeforeCompanyOpen()
    var
        "2FactorUsers": Record "2 Factor Users";
    begin
        if GuiAllowed then
            if "2FactorUsers".FindFirst then
                if Page.RunModal(50100) = Action::LookupOK then
                    Message('Your In')
                else
                    Error('Wrong Token');
    end;
}