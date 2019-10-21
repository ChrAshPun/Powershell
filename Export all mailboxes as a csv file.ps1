# Export all mailboxes as a csv file

Get-Mailbox | select Name,Alias,OrganizationalUnit,PrimarySMTPAddress | Export-csv –path "C:/Temp/AllMailboxes.csv" -NoTypeInformation
