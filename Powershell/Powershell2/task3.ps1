# Prompt the user to enter three strings
$param1 = Read-Host "Enter the first string"
$param2 = Read-Host "Enter the second string"
$param3 = Read-Host "Enter the third string"

# Create an array to hold the parameters
$params = @($param1, $param2, $param3)

# Sort the array by string length
$params = $params | Sort-Object { $_.Length }

# Display the sorted strings
Write-Host "Sorted Strings by Length:"
foreach ($param in $params) {
    Write-Host $param
}
