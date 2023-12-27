# Get the user's home folder
$homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

# Check if the home folder exists
if (Test-Path -Path $homeFolder -PathType Container) {
    # Get the list of files in the home folder
    $files = Get-ChildItem -Path $homeFolder -File

    # Count the number of files
    $fileCount = $files.Count

    # Display the home folder name and the number of files
    Write-Host "Home Folder: $homeFolder"
    Write-Host "Number of Files: $fileCount"
} else {
    Write-Host "Home folder does not exist."
}
