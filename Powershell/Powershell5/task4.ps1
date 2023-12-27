param (
    [string]$FileName
)

# Get information about all local users
$localUsers = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.Local -eq $true }

# Create an array to store user information
$userInfoArray = @()

# Retrieve information for each local user
foreach ($user in $localUsers) {
    $userObj = [PSCustomObject]@{
        Name = $user.Name
        FullName = $user.FullName
        SID = $user.SID
        LastLogon = (Get-LocalUser -Name $user.Name).LastLogon
    }
    $userInfoArray += $userObj
}

# Export the user information to a CSV file
$userInfoArray | Export-Csv -Path $FileName -NoTypeInformation

# Display a success message
Write-Host "Local user information has been written to '$FileName' successfully."



#.\task4.ps1 -FileName "local_users_info.csv"
