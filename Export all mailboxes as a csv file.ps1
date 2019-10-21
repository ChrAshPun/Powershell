
Get-Mailbox | select Name,Alias,OrganizationalUnit,PrimarySMTPAddress | Export-csv –path "C:/Temp/AllMailboxes.csv" -NoTypeInformation
