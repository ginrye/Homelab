# Define the rule name and description
$RuleName = "Allow SSH"
$RuleDescription = "Allow inbound SSH traffic on port 22"

# Check if the rule already exists
$existingRule = Get-NetFirewallRule | Where-Object { $_.DisplayName -eq $RuleName }

if ($existingRule -eq $null) {
    # Create the rule
    New-NetFirewallRule -DisplayName $RuleName -Description $RuleDescription -Protocol TCP -LocalPort 22 -Action Allow
    Write-Host "Firewall rule '$RuleName' added to allow SSH traffic."
} else {
    Write-Host "Firewall rule '$RuleName' already exists. No changes made."
}
