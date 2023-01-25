codeunit 50101 "Post Loan Meth"
{
    internal procedure PostLoan(var LoanHeader: Record "Loan Header"; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmPostLoan(LoanHeader, HideDialog) then exit;
        OnBeforePostLoan(LoanHeader, IsHandled);
        DoPostLoan(LoanHeader, IsHandled);
        OnAfterPostLoan(LoanHeader);
        AcknowledgePostLoan(LoanHeader, HideDialog)
    end;

    local procedure DoPostLoan(var LoanHeader: Record "Loan Header"; IsHandled: Boolean);
    var
        LoanLines: Record "Loan Line";
    begin
        if IsHandled then
            exit;

        GetLines(LoanHeader, LoanLines);
        PostLines(LoanHeader, LoanLines);
        SetLoanStatus(LoanHeader);

    end;

    local procedure ConfirmPostLoan(var LoanHeader: Record "Loan Header"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure that you want post this loan?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgePostLoan(var LoanHeader: Record "Loan Header"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully posted loan %1.', Comment = '%1 = Loan No.';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg, LoanHeader."No.");
    end;

    local procedure GetLines(var LoanHeader: Record "Loan Header"; LoanLine: Record "Loan Line")
    begin
        LoanLine.SetRange("Loan No.", LoanHeader."No.");
    end;

    local procedure PostLines(var LoanHeader: Record "Loan Header"; LoanLine: Record "Loan Line")
    begin
        if LoanLine.FindSet then
            repeat
                LoanLine.PostLoanLine();
            until LoanLine.Next = 0;
    end;

    local procedure SetLoanStatus(var LoanHeader: Record "Loan Header")
    begin
        LoanHeader.Validate(Status, LoanHeader.Status::Loaned);
        LoanHeader.Modify(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostLoan(var LoanHeader: Record "Loan Header"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostLoan(var LoanHeader: Record "Loan Header");
    begin
    end;
}