param (
    [string]$FileName,
    [switch]$NoPassword
)

# Check if the script is running with administrator privileges
if (-not [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent() -in [Security.Principal.WindowsBuiltInRole]::Administrator) {
    Write-Host "Error: This script must be run with Administrator privileges."
    exit
}

# Check if the file exists
if (Test-Path -Path $FileName -PathType Leaf) {
    # Read the CSV file
    $userAccounts = Import-Csv -Path $FileName

    # Initialize a counter for successfully created users
    $createdUserCount = 0

    # Create user accounts based on the naming convention
    foreach ($user in $userAccounts) {
        $firstName = $user.FirstName.Substring(0, 2).ToLower()
        $lastName = $user.LastName.Substring(0, 4).ToLower()
        $userAccount = "$lastName$firstName"

        # Create the user account with or without a password
        if ($NoPassword) {
            New-LocalUser -Name $userAccount -NoPassword
        } else {
            New-LocalUser -Name $userAccount
        }

        $createdUserCount++
    }

    # Display a success message
    Write-Host "$createdUserCount user accounts have been created successfully."
} else {
    # Display an error message if the file does not exist
    Write-Host "Error: The file '$FileName' does not exist."
}


#.\task3.ps1 -FileName "usernames.csv" -NoPassword
