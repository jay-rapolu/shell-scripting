#!/bin/bash

echo ""

if [ $! == ""]
then
    echo "Please pass a number as first argument along with the script to execute it"
    exit 1
fi

echo "This Script is used to check if the entered number is positive or negative"
echo ""

# There are six conditional operators in shell script they are: 
# -gt -> greater than
# -lt -> less than
# -eq -> equals
# -ge -> greater than or Equals
# -le -> less than or Equals
# -ne -> not equals 

if [ $1 -ge 0 ]
then
    echo "entered number $1 is a positive number"
else
    echo "entered number $1 is a negative number"
fi