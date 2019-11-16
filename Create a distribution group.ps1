# Create a new distribution group

New-DistributionGroup -Name <Name> -Alias <Alias> -PrimarySmtpAddress <PrimarySmtpAddress> -ManagedBy <Alias> -OrganizationalUnit <organizational unit> -MemberDepartRestriction closed -MemberJoinRestriction closed

# Set a custom attribute

Set-DistributionGroup -Identity <Name> -customattribute1 <customattribute> -requiresenderauthenticationenabled $false 
