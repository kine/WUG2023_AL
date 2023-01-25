codeunit 50102 "Post Loan Line Meth"
{
    internal procedure PostLoanLine(var LoanLine: Record "Loan Line")
    var
        IsHandled: Boolean;
    begin
        OnBeforePostLoanLine(LoanLine, IsHandled);

        DoPostLoanLine(LoanLine, IsHandled);

        OnAfterPostLoanLine(LoanLine);
    end;

    local procedure DoPostLoanLine(var LoanLine: Record "Loan Line"; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;
        CreateLoanEntry(LoanLine);
        SetPostedQuantity(LoanLine);
        SetLoanLineState(LoanLine);
        LoanLine.Modify(true);
    end;

    local procedure SetPostedQuantity(var LoanLine: Record "Loan Line")
    begin
        LoanLine.Validate("Quantity Loaned", LoanLine."Quantity");
    end;

    local procedure SetLoanLineState(var LoanLine: Record "Loan Line")
    begin
        LoanLine.Validate(State, LoanLine.State::Loaned);
    end;

    local procedure CreateLoanEntry(var LoanLine: Record "Loan Line")
    var
        LoanEntry: Record "Loan Entry";
        LoanHeader: Record "Loan Header";
    begin
        LoanHeader.Get(LoanLine."Loan No.");
        LoanEntry.Init();
        LoanEntry.Validate("Entry No.", 0);
        LoanEntry.Validate("Loan No.", LoanLine."Loan No.");
        LoanEntry.Validate("Loan Line No.", LoanLine."Line No.");
        LoanEntry.Validate("Posting Date", WorkDate());
        LoanEntry.Validate("Entry Type", LoanEntry."Entry Type"::Loan);
        LoanEntry.Validate("Contact No.", LoanHeader."Contact No.");
        LoanEntry.Validate("Item Type", LoanLine."Item Type");
        LoanEntry.Validate("Item No.", LoanLine."Item No.");
        LoanEntry.Validate(Open, true);
        LoanEntry.Validate(Quantity, LoanLine."Quantity" - LoanLine."Quantity Loaned");
        LoanEntry.Validate("Outstanding Quantity", LoanEntry.Quantity);
        LoanEntry.Insert(True);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostLoanLine(var LoanLine: Record "Loan Line"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostLoanLine(var LoanLine: Record "Loan Line");
    begin
    end;
}