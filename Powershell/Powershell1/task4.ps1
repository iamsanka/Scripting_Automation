# Create an empty array
$names = @()

# Prompt the user to enter seven names
for ($i = 1; $i -le 7; $i++) {
    $name = Read-Host "Enter name #$i"
    $names += $name
}

# Display the number of items in the array
$numberOfNames = $names.Count
Write-Host "Number of Names in the Array: $numberOfNames"

# Display all the items in the array
#Write-Host "All Names in the Array:"
#foreach ($name in $names) {
#    Write-Host $name
#}

# Display the first and last names in the array
$firstName = $names[0]
$lastName = $names[-1]
Write-Host "First Name in the Array: $firstName"
Write-Host "Last Name in the Array: $lastName"
