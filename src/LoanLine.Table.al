table 50102 "Loan Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Loan No."; Code[20])
        {
            Caption = 'Loan No.';
            tableRelation = "Loan Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(3; "Item Type"; enum LoanItemType)
        {
            Caption = 'Item Type';

        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            tableRelation = if ("Item Type" = CONST("Item")) Item;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            BlankZero = true;
        }
        field(6; "Expected Return Date"; Date)
        {
            Caption = 'Expected Return Date';
        }
        field(7; State; Enum LoanLineState)
        {
            Caption = 'State';
        }

        field(8; "Quantity Loaned"; Decimal)
        {
            Caption = 'Quantity Loaned';
            editable = false;
        }
        field(9; "Quantity Returned"; Decimal)
        {
            Caption = 'Quantity Returned';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Loan No.", "Line No.")
        {
            Clustered = true;
        }
    }
}