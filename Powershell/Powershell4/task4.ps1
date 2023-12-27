# Initialize an array to store the file names
$fileNames = @()

# Ask the user for file names until they provide an empty input
while ($true) {
    $input = Read-Host "Enter a file name (leave empty to finish):"
    
    if ([string]::IsNullOrEmpty($input)) {
        break
    }
    
    $fileNames += $input
}

# Get the user's home folder
$homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

# Initialize a counter for successfully created files
$createdFileCount = 0

# Get the current date and time in the specified format
$currentDateTime = Get-Date -Format "dd.MM.yyyy HH.mm"

# Create files with the provided names and write the current date and time
foreach ($fileName in $fileNames) {
    $filePath = Join-Path -Path $homeFolder -ChildPath $fileName
    
    try {
        $currentDateTime | Out-File -FilePath $filePath -Force -Encoding UTF8
        $createdFileCount++
    } catch {
        Write-Host "Error creating file '$fileName': $_"
    }
}

# Display the number of successfully created files
Write-Host "$createdFileCount files were created successfully."
