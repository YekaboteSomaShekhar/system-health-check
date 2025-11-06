#!/bin/bash

# Script that asks for two numbers and operators(+,-,*) and performs the calculation.

read -p "Enter first number: " num1
read -p "Enter second number: " num2

#Addition
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is $sum."

#Subtraction
difference=$((num1 - num2))
echo "The difference of $num1 and $num2 is $difference."

#Multiplication
product=$((num1 * num2))
echo "The product of $num1 and $num2 is $product."


# 2. Script that counts how many files are in the current directory.

count=$(ls -1 | wc -l)

echo "There are $count files in the current directory."


# 3. Script to greet multiple names until user types "done"

#Using while loop
while true
do
    read -p "Enter a name (or type 'done' to stop): " name

    if [[ "$name" == "done" ]]; then
       echo "Exiting... Goodbye!"
        break
   fi

   echo "Hello, $name!"
done


# 4. Temperature Converter: Celsius to Fahrenheit

# Ask user for Celsius temperature
read -p "Enter temperature in Celsius: " celsius

# Convert using integer arithmetic (rounded)
fahrenheit=$(( (celsius * 9 / 5) + 32 ))

echo "$celsius°C is equal to $fahrenheit°F."
