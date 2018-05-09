#Script to make resource groups named after users
#Users are assumed to be listed in .\azure_users.txt
#
Import-Module -Name AzureRM
$users = Get-Content -Path .\azure_users.txt
For ($i=5; $i -lt 6; $i++) {
    $thisone = $($users | Select-Object -index $i) #gets user name - used for both res_group name and for assigning permissions
    $user_guid = Get-AzureRmADUser -DisplayName $thisone #This gets the user, without needing a domain/login name
    # Go!
    echo "Making resource group $thisone."
    New-AzureRmResourceGroup -Name $thisone -Location "uksouth" -Tag @{Department="CSA_Course"}
    echo "Giving user $thisone contributor access."
    New-AzureRmRoleAssignment -ObjectId $($user_guid.Id) -RoleDefinitionName Contributor -ResourceGroupName $thisone
    }