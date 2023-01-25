table 50101 "Loan Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PK"; Code[20])
        {
            Caption = 'PK';
        }
        field(2; "Loan Nos."; Code[20])
        {
            Caption = 'Loan Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "PK")
        {
            Clustered = true;
        }
    }

}