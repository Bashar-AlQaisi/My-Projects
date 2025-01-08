#!/bin/bash

# Check if `bc` is installed
if command -v bc &> /dev/null; then
echo "'bc' is already installed. Exiting..."
else
echo "'bc' apt is not installed. Attempting to install it..." 
echo "Hint to Download: use sudo apt update , sudo apt install bc" 
exit 0
fi

# Function to add two numbers
add() {
echo "scale=2; $1 + $2" | bc
}

# Function to subtract two numbers
subtract() {
echo "scale=2; $1 - $2" | bc
}

# Function to multiply two numbers
multiply() {
echo "scale=2; $1 * $2" | bc
}

# Function to divide two numbers
divide() {
if [ $2 -eq 0 ]; then
echo "Error: Division by zero is not allowed."
else
echo "scale=2; $1 / $2" | bc
fi
}

# Main program loop
while true; do
# Display menu options
echo ""
echo ""
echo "***********************"
echo "Simple Calculator"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Exit"
echo ""

# Prompt user for choice
read -p "Enter your choice (1-5): " choice

# Handle user's choice
case $choice in
1)
read -p "Enter first number: " num1
read -p "Enter second number: " num2
result=$(add $num1 $num2)
echo ""
echo "Result: $result"
;;
2)
read -p "Enter first number: " num1
read -p "Enter second number: " num2
result=$(subtract $num1 $num2)
echo ""
echo "Result: $result"
;;
3)
read -p "Enter first number: " num1
read -p "Enter second number: " num2
result=$(multiply $num1 $num2)
echo ""
echo "Result: $result"
;;
4)
read -p "Enter first number: " num1
read -p "Enter second number: " num2
result=$(divide $num1 $num2)
echo ""
echo "Result: $result"
;;
5)
echo "Exiting the calculator. Goodbye!"
exit 0
;;
*)
echo "Invalid choice. Please choose a number between 1 and 5."
;;
esac

done

echo "" #