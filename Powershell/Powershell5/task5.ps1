param (
    [string]$FileName
)

# Function to add an event to the Windows Event Log
function Add-MyEvent {
    param (
        [string]$Type,
        [string]$Message
    )

    $Source = "MyPowerShell"

    switch ($Type) {
        "Error" {
            Write-EventLog -LogName Application -Source $Source -EntryType Error -EventID 1 -Message $Message
        }
        "Warning" {
            Write-EventLog -LogName Application -Source $Source -EntryType Warning -EventID 2 -Message $Message
        }
        "Information" {
            Write-EventLog -LogName Application -Source $Source -EntryType Information -EventID 3 -Message $Message
        }
        default {
            Write-Host "Invalid event type. Valid types are Error, Warning, or Information."
        }
    }
}

# Check if the script is running with administrator privileges
if (-not [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent() -in [Security.Principal.WindowsBuiltInRole]::Administrator) {
    Add-MyEvent -Type "Error" -Message "This script must be run with Administrator privileges."
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

    # Display a success message and log an information event
    $successMessage = "$createdUserCount user accounts have been created successfully."
    Add-MyEvent -Type "Information" -Message $successMessage
    Write-Host $successMessage
} else {
    # Display an error message and log an error event if the file does not exist
    $errorMessage = "Error: The file '$FileName' does not exist."
    Add-MyEvent -Type "Error" -Message $errorMessage
    Write-Host $errorMessage
}


