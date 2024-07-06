USE master;

-- بررسی وجود لاگین و ایجاد آن در صورت عدم وجود
IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = N'amindarestani')
BEGIN
    CREATE LOGIN amindarestani WITH PASSWORD = 'AD_crouse@1403';
END

-- بررسی عضویت در نقش sysadmin و افزودن به نقش در صورت عدم عضویت
IF NOT EXISTS (
    SELECT SP.name
    FROM sys.server_role_members SRM
    JOIN sys.server_principals SP ON SRM.member_principal_id = SP.principal_id
    JOIN sys.server_principals RP ON SRM.role_principal_id = RP.principal_id
    WHERE RP.name = N'sysadmin' AND SP.name = N'amindarestani'
)
BEGIN
    ALTER SERVER ROLE sysadmin ADD MEMBER amindarestani;
END
