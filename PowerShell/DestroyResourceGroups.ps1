#Script to make resource groups named after users
#Users are assumed to be listed in .\azure_users.txt
#There are assumed to be 16
Import-Module -Name AzureRM
$users = Get-Content -Path .\azure_users.txt
For ($i=5; $i -lt 6; $i++) {
    $thisone = $($users | Select-Object -index $i)
    echo "Destroying resource group $thisone"
    Get-AzureRmResourceGroup -Name $thisone | Remove-AzureRmResourceGroup -Force
    }