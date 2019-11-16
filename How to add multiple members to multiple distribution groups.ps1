# You can add one member at a time like this: 

Add-DistributionGroupMember <distribution group> -Member "<email address>" 
Get-DistributionGroupMember <distribution group> 

# How to add multiple members to multiple distribution groups
# 1. Export a csv file of the distribution groups 

Get-DistributionGroup -OrganizationalUnit <organizational unit> | select <Name> | Export-csv "C:Temp\distributiongroups.csv"

# remove any groups you don't need
# On Notepad, it should look like this:

# "Name"
# "distribution group 1"
# "distribution group 2"
# "distribution group 3"
# etc

# 2. run this script in Powershell ISE

$distributiongroups = Import-csv "C:Temp\distributiongroups.csv"

ForEach ($distributiongroup in $distributiongroups)
{
    # add the following members to all the distribution groups
    Add-DistributionGroupMember $distributiongroup.Name -Member "<email address>"
    Add-DistributionGroupMember $distributiongroup.Name -Member "<email address>"
    
    Write-Host "<Name> and <Name> have been added as members to:" $distributiongroup.Name  
}
