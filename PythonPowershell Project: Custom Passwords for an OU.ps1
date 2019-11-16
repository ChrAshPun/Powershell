# Python & Powershell Project: Custom Passwords for an entire Organizational Unit

# Task: Create custom passwords for all the users in an OU.
# The syntax needed to be: "P@ssw0rd" + "<first initial of first name>" + "<first initial of last name>" 

# 1. Export a csv file containing all the names of the users
Get-Mailbox –OrganizationUnit <organizationalunit> | select Name,DistinguishedName | Export-csv "C:\Temp\Names.csv" -NoTypeInformation

# I copied the contents in the csv file & created a list of strings containing the full names of each user to Jupyter Notebook:

''' 
list = [
    "Bob Smith", 
    "Alex Flores", 
    "etc"]
'''

# 2. Generated the passwords using a for loop in a for loop to iterate through the string elements:
# The intial of the last name was found as the char that was one index after the ' ' in the string

'''
password_list = []
for index, value in enumerate(list):
    for elem in value:
        if elem == ' ':
            # value[0] = initial of first name 
            # value[(value.index(elem)+1)] = initial of last name
            password_list.append("P@ssw0rd" + (value[0] + value[(value.index(elem)+1)]))
'''

# Copied the passwords to the csv file and used it for the Powershell script. 
# On Notepad, the csv file looked like this:

'''
Name,Password,DistinguishedName
Bob Smith, P@ssw0rdBS, "CN=...DC=local"
etc
'''

# 3. From Powershell, I used this command for info: get-help Set-ADAccountPassword –examples
# Lastly, I ran this script from Powershell ISE:

$users = Import-csv "C:\Temp\Passwords.csv"

ForEach ($user in $users)
{
    Set-ADAccountPassword -Identity $user.DistinguishedName -NewPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Reset
    Write-Host "The password for $user.Name "has been changed to" $user.Password
}
