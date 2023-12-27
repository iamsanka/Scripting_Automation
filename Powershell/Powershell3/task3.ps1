param (
    [string]$FolderName,
    [string]$FileName
)

$filePath = Join-Path -Path $FolderName -ChildPath $FileName

if (Test-Path -Path $filePath -PathType Leaf) {
    Write-Host "File '$FileName' exists in folder '$FolderName'."
} else {
    $userResponse = Read-Host "File '$FileName' does not exist in folder '$FolderName'. Create the file? (Yes/No)"

    if ($userResponse -eq "Yes") {
        $null = New-Item -Path $filePath -ItemType File
        Write-Host "File '$FileName' has been created in folder '$FolderName'."
    } else {
        Write-Host "File creation canceled."
    }
}


#.\task3.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell3" -FileName "example.txt"
