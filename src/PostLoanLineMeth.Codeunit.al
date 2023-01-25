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
    begin
        Error('Procedure CreateLoanEntry not implemented.');
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