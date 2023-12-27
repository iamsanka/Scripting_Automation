param (
    [string]$FolderName,
    [string]$FileName,
    [int]$Number
)

# Create the folder if it doesn't exist
if (-not (Test-Path -Path $FolderName -PathType Container)) {
    $null = New-Item -Path $FolderName -ItemType Directory
    Write-Host "Folder '$FolderName' has been created."
}

# Create the specified number of files
$createdFiles = @()
for ($i = 1; $i -le $Number; $i++) {
    $fileNumber = $i - 1
    $newFileName = "$FileName$fileNumber.txt"
    $filePath = Join-Path -Path $FolderName -ChildPath $newFileName
    $null = New-Item -Path $filePath -ItemType File
    $createdFiles += $newFileName
}

# Return a report
if ($Number -eq 1) {
    Write-Host "1 file has been created in folder '$FolderName'."
} else {
    Write-Host "$Number files have been created in folder '$FolderName'."
}

if ($createdFiles.Count -gt 0) {
    Write-Host "Created files:"
    $createdFiles | ForEach-Object {
        Write-Host "- $_"
    }
} else {
    Write-Host "No files have been created."
}


#.\task4.ps1 -FolderName "D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises\Powershell\Powershell3" -FileName "file" -Number 5
