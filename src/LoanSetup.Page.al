page 50102 "Loan Setup"
{
    ApplicationArea = All;
    Caption = 'Loan Setup';
    PageType = Card;
    SourceTable = "Loan Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Loan Nos."; Rec."Loan Nos.")
                {
                    ToolTip = 'Specifies the value of the Loan Nos. field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}
