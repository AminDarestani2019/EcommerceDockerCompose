USE master;
CREATE LOGIN amindarestani WITH PASSWORD = 'AD_crouse@1403';
ALTER SERVER ROLE sysadmin ADD MEMBER amindarestani;