# Scripts for Azure management
These are all PowerShell scripts, though Azure CLI may follow.
To use PowerShell to manage Azure, the AzureRM module should be in place. See guide.
https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-6.4.0

## Usage
### ResetAzureADPasswords.ps1
Reset Passwords changes all user passwords as specified in the
text files. To use: -

Populate 'azure_users' with desired users. These users should already exist in AzureAD - this script does not create users.
Populate 'azure_passes' with desired passwords. These passes may need to meet complexity requirements.
Be very careful with these files.

### CreateResourceGroups.ps1
Creates resource groups named after (existing) AzureAD users names in 'azure_users.txt'. It sets each user as 'Contributer' of the resource group named after them.
It tags all resource groups to aid with management.

### DestroyResourceGroups.ps1
Destroys all *tagged* resource groups - this is intended to limit the scope of this script to only the groups created by the above resource group. 
