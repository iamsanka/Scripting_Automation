# Get the current logged username
$currentUsername = $env:USERNAME

# Get the current date and time
$currentDate = Get-Date

# Display the current username and date on the console
Write-Host "Logged Username: $currentUsername"
Write-Host "Current Date: $currentDate"
