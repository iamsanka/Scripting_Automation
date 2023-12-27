param (
    [string]$FolderName
)

# Check if the folder exists
if (Test-Path -Path $FolderName -PathType Container) {
    # Get the user's home folder
    $homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

    # Create the full path for the output file
    $outputFilePath = Join-Path -Path $homeFolder -ChildPath "files.txt"

    # Get the names of files in the specified folder
    $fileNames = Get-ChildItem -Path $FolderName -File | ForEach-Object {
        $_.Name
    }

    # Write the file names to the output file
    $fileNames | Out-File -FilePath $outputFilePath -Force -Encoding UTF8

    # Display a success message
    Write-Host "File names have been written to '$outputFilePath' successfully."
} else {
    Write-Host "Sorry, '$FolderName' does not exist."
}


#.\task5.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell4"
