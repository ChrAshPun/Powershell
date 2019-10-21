# When the email address policy is enabled I can't change the primary SMTP address. 
# I can disable it from the Exchange Admin Center or I can use Powershell. 

Set-Mailbox <email address> -EmailAddressPolicyEnabled $false 
Set-Mailbox <email address> -EmailAddresses SMTP:<email address> 