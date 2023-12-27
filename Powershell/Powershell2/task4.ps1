param (
    [string]$UserName = "unknown",
    [int]$GreetingCount = 1
)

for ($i = 1; $i -le $GreetingCount; $i++) {
    Write-Host "Hello $UserName!"
}

#calling the script
#.\task4.ps1 -UserName "san" -GreetingCount 3