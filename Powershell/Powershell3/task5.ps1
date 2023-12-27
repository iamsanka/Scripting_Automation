param (
    [string]$FolderName,
    [string]$NewName
)

# Check if the folder exists
if (-not (Test-Path -Path $FolderName -PathType Container)) {
    Write-Host "Folder '$FolderName' does not exist."
    exit
}

# Count the number of files in the folder
$fileCount = (Get-ChildItem -Path $FolderName -File).Count

# Ask for confirmation
$confirmationMessage = "All $fileCount files in folder '$FolderName' will be renamed with name '$NewName'. Proceed? (Yes/No)"
$userResponse = Read-Host -Prompt $confirmationMessage

if ($userResponse -eq "Yes") {
    $files = Get-ChildItem -Path $FolderName -File
    $i = 1
    foreach ($file in $files) {
        $newFileName = "$NewName$i$($file.Extension)"
        $newFilePath = Join-Path -Path $FolderName -ChildPath $newFileName
        $file | Rename-Item -NewName $newFileName -Path $newFilePath
        $i++
    }
    Write-Host "All files have been renamed in folder '$FolderName'."

} else {
    Write-Host "File renaming canceled."
}


#.\task5.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell3" -NewName "NewFile"
