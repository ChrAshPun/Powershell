#Exchange Mailboxes and Aliases 
Get-Mailbox -ResultSize Unlimited -OrganizationalUnit “dc=OTNO,dc=com” |Select-Object DisplayName,PrimarySmtpAddress, @{Name=“EmailAddresses”;Expression={$_.EmailAddresses }} | Export-CSV c:\temp\exportmailboxes.csv -NoTypeInformation 

#Exchange Distribution Groups and Aliases 
Get-DistributionGroup -ResultSize Unlimited -OrganizationalUnit “dc=OTNO,dc=com” |Select-Object DisplayName,PrimarySmtpAddress, @{Name=“EmailAddresses”;Expression={$_.EmailAddresses }} | Export-CSV c:\temp\exportdistributiongroups.csv -NoTypeInformation 

#Exchange distribution group membership 
     $Groups = Get-DistributionGroup -OrganizationalUnit “dc=OTNO,dc=com” 
     $Groups | ForEach-Object { 
     $group = $_.Name 
     $members = '' 
     Get-DistributionGroupMember $group | ForEach-Object { 
             If($members) { 
                   $members=$members + ";" + $_.SamAccountName 
                } Else { 
                   $members=$_.SamAccountName 
                } 
       } 
     New-Object -TypeName PSObject -Property @{ 
           GroupName = $group 
           Members = $members 
          } 
     } | Export-CSV "C:\\temp\Distribution-Group-Members.csv" -NoTypeInformation -Encoding UTF8 

# Exchange Contacts 
get-contact -OrganizationalUnit “dc=OTNO,dc=com” -ResultSize Unlimited | select * | Export-Csv c:\temp\contacts.csv 

# Exchange Forwarders 
get-mailbox -OrganizationalUnit “dc=OTNO,dc=com” -ResultSize Unlimited | select samaccountname,name,*forward* | Export-Csv c:\temp\forwarders.csv 

# Mailbox Size 
Get-Mailbox -OrganizationalUnit “dc=OTNO,dc=com” -ResultSize Unlimited | Get-MailboxStatistics | Select DisplayName,StorageLimitStatus, @{name="TotalItemSize (MB)"; expression={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1MB),2)}},ItemCount | Sort "TotalItemSize (MB)" -Descending | Export-CSV "C:\temp\mboxsizes.csv" -NoTypeInformation 
    
# Export X500 Addresses 
Get-Mailbox | Select Name, PrimarySMTPAddress, legacyExchangeDN | Export-Csv C:\temp\X500.csv -NoTypeInformation 