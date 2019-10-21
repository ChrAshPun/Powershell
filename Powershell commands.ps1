
# Example Powershell Commands

Get-Mailbox | select Name,Alias,OrganizationalUnit,PrimarySMTPAddress | Export-csv –path "C:/Temp/AllMailboxes.csv" -NoTypeInformation

# When the email address policy is enabled I can't change the primary SMTP address. 
# I can disable it from the Exchange Admin Center or I can use Powershell. 

Set-Mailbox <email address> -EmailAddressPolicyEnabled $false 
Set-Mailbox <email address> -EmailAddresses SMTP:<email address> 

# Get mailbox sizes

Get-Mailbox –OrganizationalUnit <OrganizationalUnit> -ResultSize Unlimited | Get-MailboxStatistics | select displayname,storagelimitstatus, @{name="TotalItemSize (MB)"; expression={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB),2)}},ItemCount | Sort "TotalItemSize (MB)" -Descending | Export-csv –path "C:\Temp\MailboxSizes.csv" -NoTypeInformation 

# How to create a new distribution group
New-DistributionGroup -Name <Name> -Alias <Alias> -PrimarySmtpAddress <PrimarySmtpAddress> -ManagedBy <Alias> -OrganizationalUnit <OrganizationalUnit> -MemberDepartRestriction closed -MemberJoinRestriction closed

Set-DistributionGroup -Identity <Name> -customattribute1 AutoAlert -requiresenderauthenticationenabled $false 

Add-DistributionGroupMember <DistributionGroup> -Member "<email address>" 
Get-DistributionGroupMember <DistributionGroup> 

# Update Customattribute1 For An Entire Database 
# List the current values for customattribute1 in a database  

Get-Mailbox -Database Clipper_DB | select DisplayName, CustomAttribute1
 
# Update customattribute1 for the entire database 

Get-Mailbox -Database Clipper_DB | Set-Mailbox -CustomAttribute1 Clipper 








 

 

