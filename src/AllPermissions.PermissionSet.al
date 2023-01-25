permissionset 50100 "AllPermissions"
{
    Assignable = true;
    Permissions =
        tabledata "Loan Header" = RIMD,
        tabledata "Loan Setup" = RIMD,
        tabledata "Loan Line" = RIMD,
        tabledata "Loan Entry" = RIMD,
        table "Loan Header" = X,
        table "Loan Setup" = X,
        table "Loan Line" = X,
        table "Loan Entry" = X;
}