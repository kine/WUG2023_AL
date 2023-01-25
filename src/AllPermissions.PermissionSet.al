permissionset 50100 "AllPermissions"
{
    Assignable = true;
    Permissions =
        tabledata "Loan Header" = RIMD,
        tabledata "Loan Setup" = RIMD,
        table "Loan Header" = X,
        table "Loan Setup" = X;
}