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
            trigger OnValidate()
            var
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    GetLoanSetup();
                    NoSeriesMgt.TestManual(LoanSetup."Loan Nos.");
                    "No. Series" := '';
                end;
            end;
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
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
        field(6; "Open Entry Exists"; Boolean)
        {
            Caption = 'Open Entry Exists';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Exist("Loan Entry" WHERE("Loan No." = FIELD("No."), Open = CONST(true)));
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
        fieldgroup(Brick; "No.", "Contact No.", "Contact Name")
        {
        }
        fieldgroup(DropDown; "No.", "Contact No.")
        {
        }
    }
    var
        LoanSetup: Record "Loan Setup";
        InvalidContactErr: Label 'Contact with no.=%1 not found!', Comment = '%1 - Contact No.';

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            GetLoanSetup();
            LoanSetup.TestField("Loan Nos.");
            NoSeriesMgt.InitSeries(LoanSetup."Loan Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnDelete()
    begin
        CalcFields("Open Entry Exists");
        TestField("Open Entry Exists", false);
        RemoveLoanLines();
    end;

    internal procedure Post()
    var
        PostLoan: codeunit "Post Loan Meth";
    begin
        PostLoan.PostLoan(Rec, false);
    end;

    internal procedure PostReturn()
    begin
        Error('Procedure PostReturn not implemented.');
    end;

    local procedure GetLoanSetup()
    begin
        LoanSetup.Get();
    end;

    local procedure RemoveLoanLines()
    var
        LoanLine: Record "Loan Line";
    begin
        LoanLine.Reset();
        LoanLine.SetRange("Loan No.", "No.");
        LoanLine.DeleteAll();
    end;
}