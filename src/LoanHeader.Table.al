table 50100 "Loan Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Loans";
    DrillDownPageId = "Loans";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(2; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = "Contact";
            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                if "Contact No." <> '' then begin
                    if not Contact.Get("Contact No.") then
                        Error(InvalidContactErr, "Contact No.");
                    Validate("Contact Name", Contact.Name);
                end;

            end;
        }
        field(4; "Contact Name"; Text[50])
        {
            Caption = 'Contact Name';
            Editable = false;
        }
        field(3; "Status"; Enum LoanStatus)
        {
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Contact No.")
        {

        }
    }

    fieldgroups
    {
        fieldgroup("Brick"; "No.", "Contact No.")
        {
        }
        fieldgroup("DropDown"; "No.", "Contact No.")
        {
        }
    }
    var
        InvalidContactErr: Label 'Contact with no.=%1 not found!', Comment = '%1 - Contact No.';
}