param (
    [string]$FileName
)

# Check if the file exists
if (Test-Path -Path $FileName -PathType Leaf) {
    # Read the text file
    $urls = Get-Content -Path $FileName

    # Open each URL in a web browser
    foreach ($url in $urls) {
        Start-Process $url
    }

    # Display a success message
    Write-Host "URLs have been opened in the web browser."
} else {
    # Display an error message if the file does not exist
    Write-Host "Error: The file '$FileName' does not exist."
}



#.\task2.ps1 -FileName "urls.txt"
