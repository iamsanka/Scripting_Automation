param (
    [string]$FileName
)

# Check if the file exists
if (Test-Path -Path $FileName -PathType Leaf) {
    # Read the CSV file
    $userNames = Import-Csv -Path $FileName

    # Initialize an array to store generated user accounts
    $userAccounts = @()

    # Generate user accounts based on the naming convention
    foreach ($user in $userNames) {
        $firstName = $user.FirstName.Substring(0, 2).ToLower()
        $lastName = $user.LastName.Substring(0, 4).ToLower()
        $userAccount = "$lastName$firstName"
        $userAccounts += $userAccount
    }

    # Display a success message
    $successMessage = @"
    User accounts have been generated successfully.
    Accounts: $($userAccounts -join ', ')
"@
    Write-Host $successMessage
} else {
    # Display an error message if the file does not exist
    Write-Host "Error: The file '$FileName' does not exist."
}


#.\task1.ps1 -FileName "usernames.csv"
