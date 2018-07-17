# Some scripts to help with the management of Azure.
Initially these are PowerShell, though Azure CLI may follow.

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
