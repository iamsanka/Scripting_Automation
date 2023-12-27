function Get-FileInfo2 {
    param (
        [string]$Extension
    )

    $homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
    $files = Get-ChildItem -Path $homeFolder -File -Filter "*$Extension"

    foreach ($file in $files) {
        [PSCustomObject]@{
            Name = $file.Name
            Length = $file.Length
            LastWriteTime = $file.LastWriteTime
        }
    }
}

# Run the function with the extension parameter (e.g., ".txt" or ".csv")
Get-FileInfo2 -Extension ".dll"
