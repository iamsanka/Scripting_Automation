param (
    [string]$ServerIP = "192.168.1.1",
    [int]$PingAttempts = 1
)

# Ask for permission to ping
$confirmation = Read-Host "Do you want to simulate pinging $ServerIP $PingAttempts times? (Yes/No)"

if ($confirmation -eq "Yes") {
    for ($i = 1; $i -le $PingAttempts; $i++) {
        Write-Host "Pinging $ServerIP (Attempt $i) - Reply received successfully."
    }
} else {
    Write-Host "Ping simulation canceled."
}


#.\task5.ps1 -ServerIP "10.0.0.1" -PingAttempts 5