param (
    [string]$FileName
)

# Get the user's home folder
$homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

# Initialize an array to store the workstation names
$workstationNames = @()

# Ask the user for workstation names until they provide an empty input
while ($true) {
    $input = Read-Host "Enter a workstation name (leave empty to finish):"
    
    if ([string]::IsNullOrEmpty($input)) {
        break
    }
    
    $workstationNames += $input
}

# Create the full path for the output file
$outputFilePath = Join-Path -Path $homeFolder -ChildPath $FileName

# Write the workstation names to the output file
$workstationNames | Out-File -FilePath $outputFilePath

# Display a success message
Write-Host "Workstation names have been written to '$outputFilePath' successfully."


#.\task3.ps1 -FileName "workstation_names.txt"
