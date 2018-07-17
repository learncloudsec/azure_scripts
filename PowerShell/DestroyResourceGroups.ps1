# Multithreaded script to kill all resource groups with a given tag.
# There are planned to be 16 or fewer resource groups, so no thread limits are set here.
# The earlier version was single-threaded and painfully slow.
Import-Module -Name AzureRM

#The tag we're looking for can be edited here
$custom_tag = @{ Course="CSA_Course" }

#Build list of all resource groups with the tag set above
$target_rgs = (Get-AzureRmResourceGroup -Tag $custom_tag).ResourceGroupName
Write-Output "Removing resource groups: $target_rgs"

#Script block that kills a given resource group with a given name
$kill_block = {param($res_grp) Remove-AzureRmResourceGroup -Name $res_grp -Force}

#Loop to launch multiple threads of kill_block for all resource groups in set.
ForEach ($rg in $target_rgs) {
    Start-Job -ScriptBlock $kill_block -ArgumentList $rg
}

#Wait for jobs to complete and report
Get-Job | Wait-Job
Get-Job | Receive-Job