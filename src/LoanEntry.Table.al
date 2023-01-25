table 50103 "Loan Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Loan No."; Code[20])
        {
            Caption = 'Loan No.';
            TableRelation = "Loan Header";
        }
        field(3; "Loan Line No."; Integer)
        {
            Caption = 'Loan Line No.';
            TableRelation = "Loan Line"."Line No." where("Loan No." = field("Loan No."));
        }
        field(4; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(5; "Entry Type"; Enum LoanEntryType)
        {
            Caption = 'Entry Type';
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(8; "Item Type"; enum LoanItemType)
        {
            Caption = 'Item Type';
        }
        field(9; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = if ("Item Type" = Const("Item")) Item."No.";
        }
        field(10; Open; Boolean)
        {
            Caption = 'Open';
        }
        field(11; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Key1; "Contact No.")
        { }
        key(Key2; "Loan No.")
        { }
        key(Key3; Open)
        { }
        key(Key4; "Item Type", "Item No.")
        { }
    }

}