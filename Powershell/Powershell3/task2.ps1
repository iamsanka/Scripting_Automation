param (
    [string]$FolderName,
    [string]$FileName
)

if (Test-Path -Path $FolderName -PathType Container) {
    $filePath = Join-Path -Path $FolderName -ChildPath $FileName
    
    if (Test-Path -Path $filePath -PathType Leaf) {
        Write-Host "File '$FileName' exists in folder '$FolderName'."
    } else {
        Write-Host "Sorry, '$FileName' in the folder '$FolderName' does not exist."
    }
} else {
    Write-Host "Sorry, folder '$FolderName' does not exist."
}


#.\task2.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell3" -FileName "task1.ps1"
