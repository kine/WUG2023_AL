enum 50101 "LoanItemType" implements LoanItemTypeInterface
{
    Extensible = true;

    value(0; Item)
    {
        Caption = 'Item';
        Implementation = LoanItemTypeInterface = ItemLoanItemType;
    }
}