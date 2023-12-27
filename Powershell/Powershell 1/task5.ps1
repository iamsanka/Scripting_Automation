# Get all available commands
$allCommands = Get-Command

# Filter for application commands (those not provided by PowerShell itself)
$applicationCommands = $allCommands | Where-Object { $_.Source.Length -gt 0 }

# Count the number of application commands
$numberOfApplicationCommands = $applicationCommands.Count

# Display the number of application commands
Write-Host "Number of Application Commands: $numberOfApplicationCommands"
