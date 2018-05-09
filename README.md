# Some scripts to help with the management of Azure.
Initially these are PowerShell, though Azure CLI may follow.

To use them, populate 'azure_users' with desired users, and
'azure_passes' with desired creds. Be very careful with these
files.

Reset Passwords changes all user passwords as specified in the
text files. Create and destroy resource groups makes the groups
with appropriate permissions, and allows automated wiping at the 
end of the lab.
