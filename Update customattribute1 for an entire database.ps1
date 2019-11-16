# Update customattribute1 for an entire database
 
Get-MailboxDatabase -Database <database> | Get-Mailbox | Set-Mailbox -CustomAttribute1 <customattribute>
