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
    actions
    {
        area(processing)
        {
            group("Actions")
            {
                Caption = 'Actions';
                action("Post Loan")
                {
                    ApplicationArea = All;
                    Caption = 'Post Loan';
                    Image = Post;
                    ToolTip = 'Loan the selected item.';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.Post();
                    end;
                }
                action(Return)
                {
                    ApplicationArea = All;
                    Caption = 'Post Return';
                    Image = Return;
                    ToolTip = 'Return the selected item.';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.PostReturn();
                    end;
                }
            }
        }
    }
}
