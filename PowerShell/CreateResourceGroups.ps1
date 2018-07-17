#Script to make resource groups named after users listed.
#Users are assumed to be listed in .\azure_users.txt
#These should be valid AzureAD users.
Import-Module -Name AzureRM

#The tag we're setting can be edited here
$custom_tag = @{ Course="CSA_Course" }
#The number of resource groups for deployment can be set here
$rg_limit = 16
#File containing user list
$users = Get-Content -Path .\azure_users.txt

For ($i=0; $i -lt $rg_limit; $i++) {
    $thisone = $($users | Select-Object -index $i) #gets user name - used for both res_group name and for assigning permissions
    $user_guid = Get-AzureRmADUser -DisplayName $thisone #This gets the user, without needing a domain/login name
    # Creating
    Write-Output "Making resource group $thisone."
    New-AzureRmResourceGroup -Name $thisone -Location "uksouth" -Tag $custom_tag
    Write-Output "Giving user $thisone contributor access."
    New-AzureRmRoleAssignment -ObjectId $($user_guid.Id) -RoleDefinitionName Contributor -ResourceGroupName $thisone
    }