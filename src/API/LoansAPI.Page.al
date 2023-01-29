page 50104 "Loans API"
{
    APIGroup = 'loans';
    APIPublisher = 'wug';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'loans';
    DelayedInsert = true;
    EntityName = 'loan';
    EntitySetName = 'loans';
    PageType = API;
    SourceTable = "Loan Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(openEntryExists; Rec."Open Entry Exists")
                {
                    Caption = 'Open Entry Exists';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
