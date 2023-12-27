# Prompt the user for the folder path
$folderPath = Read-Host "Enter the folder path"

# Check if the folder path exists
if (Test-Path -Path $folderPath -PathType Container) {
    # Get the list of items (files and folders) in the specified folder
    $items = Get-ChildItem -Path $folderPath

    # Initialize counters for files and folders
    $fileCount = 0
    $folderCount = 0

    # Loop through each item to count files and folders
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            # If it's a folder, increment the folder count
            $folderCount++
        } else {
            # If it's a file, increment the file count
            $fileCount++
        }
    }

    # Display the folder name and the counts
    Write-Host "Folder Name: $folderPath"
    Write-Host "Number of Files: $fileCount found at $folderPath"
    Write-Host "Number of Folders: $folderCount found at $folderPath"
} else {
    Write-Host "The specified folder path does not exist."
}
