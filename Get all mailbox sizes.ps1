# Get all mailbox sizes 

Get-Mailbox –OrganizationalUnit <organizational unit> -ResultSize Unlimited | Get-MailboxStatistics | select DisplayName,StorageLimitStatus, @{name="TotalItemSize (MB)"; expression={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB),2)}},ItemCount | Sort "TotalItemSize (MB)" -Descending | Export-csv –path "C:\Temp\MailboxSizes.csv" -NoTypeInformation 
