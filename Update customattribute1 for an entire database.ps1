# Update customattribute1 for an entire database
 
Get-Mailbox -Database Clipper_DB | select DisplayName, CustomAttribute1
Get-Mailbox -Database Clipper_DB | Set-Mailbox -CustomAttribute1 <customattribute1>
