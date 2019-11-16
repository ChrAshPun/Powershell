# Get all room mailboxes

Get-MailboxDatabase –Identity <Name> | Get-Mailbox | where {$_.Resourcetype -eq "room"} | Export-CSV –Path "C:\Temp\RoomMailboxes.csv" 