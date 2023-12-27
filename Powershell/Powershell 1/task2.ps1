# Prompt the user for their first name
$firstName = Read-Host -Prompt "Enter your first name"

# Prompt the user for their last name
$lastName = Read-Host -Prompt "Enter your last name"

# Prompt the user for their group code
$groupCode = Read-Host -Prompt "Enter your group code"

# Display the collected information on the console
Write-Host "Welcome to the course: $firstName $lastName $groupCode"
