#!/bin/bash

# There are six conditional operators in shell script they are: 
# -gt -> greater than
# -lt -> less than
# -eq -> equals
# -ge -> greater than or Equals
# -le -> less than or Equals
# -ne -> not equals 

echo "This Script is used to check if the entered number is positive or negative"

if [[ -n "$1" && "$1" -eq "$1" 2>/dev/null ]]
then
    if [ $1 -ge 0 ]
    then
        echo "entered number $1 is a positive number"
    else
        echo "entered number $1 is a negative number"
    fi
else
    echo "Please enter a numeric value"
fi