#!/bin/bash

# There are six conditional operators in shell script they are: 
# -gt -> greater than
# -lt -> less than
# -eq -> equals
# -ge -> greater than or Equals
# -le -> less than or Equals
# -ne -> not equals 

echo "This Script is used to check if the entered number is positive or negative"

if [ $# -gt 1 ]
then
    echo "Please pass only one number in argument"
    exit 1
elif [ $# -lt 1 ] 
then
    echo "please pass one argument"
    exit 1
fi

CONSTNUM=5
NUMCHECK=$(($CONSTNUM+$1))

echo $1
echo $NUMCHECK

if [[ $1 != $NUMCHECK ]]
then
    echo "Please enter a numeric value"
    exit 1
else
    if [ $1 -ge 0 ]
    then
        echo "entered number $1 is a positive number"
    else
        echo "entered number $1 is a negative number"
    fi
fi