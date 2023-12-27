# Prompt the user for the first integer
$firstNumber = Read-Host -Prompt "Enter the first integer"

# Prompt the user for the second integer
$secondNumber = Read-Host -Prompt "Enter the second integer"

# Convert the input strings to integers
$firstNumber = [int]$firstNumber
$secondNumber = [int]$secondNumber

# Perform arithmetic operations
$addition = $firstNumber + $secondNumber
$subtraction = $firstNumber - $secondNumber
$multiplication = $firstNumber * $secondNumber

# Check if the second number is not zero before division
if ($secondNumber -ne 0) {
    $division = $firstNumber / $secondNumber
}
else {
    $division = "Cannot divide by zero"
}

# Display the results
Write-Host "Addition: $addition"
Write-Host "Subtraction: $subtraction"
Write-Host "Multiplication: $multiplication"
Write-Host "Division: $division"
