param (
    [string]$FolderName
)

if (Test-Path -Path $FolderName -PathType Container) {
    $fileCount = (Get-ChildItem -Path $FolderName -File).Count

    Write-Host "Folder '$FolderName' exists."
    Write-Host "Number of files in '$FolderName': $fileCount"
    
    if ($fileCount -gt 0) {
        Write-Host "Files in '$FolderName':"
        Get-ChildItem -Path $FolderName -File | ForEach-Object {
            Write-Host "- $_.Name"
        }
    } else {
        Write-Host "No files found in '$FolderName'."
    }
} else {
    Write-Host "Sorry, '$FolderName' does not exist."
}


#.\task1.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell2"
