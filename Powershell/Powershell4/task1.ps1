function Get-FileInfo {
    $homeFolder = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
    $files = Get-ChildItem -Path $homeFolder -File

    foreach ($file in $files) {
        [PSCustomObject]@{
            Name = $file.Name
            Length = $file.Length
        }
    }
}

# Run the function
Get-FileInfo
