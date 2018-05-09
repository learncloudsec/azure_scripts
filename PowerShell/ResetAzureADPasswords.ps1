#Script to set Azure Passwords from .\azure_passes.txt
#Users are assumed to be listed in .\azure_users.txt
#
Import-Module -Name AzureRM
$users = Get-Content -Path .\azure_users.txt
$passes = Get-Content -Path .\azure_passes.txt
For ($i=0; $i -lt 16; $i++) {
    $thisuser = $($users | Select-Object -index $i)
    $thissecurepass = ConvertTo-SecureString $($passes | Select-Object -index $i) -asplaintext -force
    echo "Setting password for $thisuser"
    Get-AzureRmADUser -DisplayName $thisuser | Update-AzureRmADUser -Password $thissecurepass
    }