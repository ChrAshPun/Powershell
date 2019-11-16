# The primary SMTP address cannot be changed until the email address policy is disabled
# Disable the policy from the Exchange Admin Center or use Powershell
# The Identity parameter also accepts <email address> and <GUID> as values

Set-Mailbox -Identity <alias> -EmailAddressPolicyEnabled $false 
Set-Mailbox -Identity <alias> -EmailAddresses SMTP:<email address> 
