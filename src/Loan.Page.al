page 50101 "Loan"
{
    ApplicationArea = All;
    Caption = 'Loan';
    PageType = Card;
    SourceTable = "Loan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the value of the Contact Name field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Lines; "Loan Lines Subpage")
            {
                ApplicationArea = All;
                Caption = 'Loan Lines';
                Editable = true;
                SubPageLink = "Loan No." = FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
