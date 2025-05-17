#!/bin/bash

# There are six conditional operators in shell script they are: 
# -gt -> greater than
# -lt -> less than
# -eq -> equals
# -ge -> greater than or Equals
# -le -> less than or Equals
# -ne -> not equals 

echo ""
echo "This Script is used to check if the entered number is positive or negative"
echo "=========================================================================="

if [ $# -gt 1 ]
then
    echo "Please pass only one number in argument"
    exit 1
elif [ $# -lt 1 ] 
then
    echo "please pass one argument"
    exit 1
fi

CONSTNUM=0
INPUT=$1
NUMCHECK=$(($CONSTNUM+$1))

if [[ $NUMCHECK -eq 0 ]]
then
    echo "Please enter a numeric value or non-zero number"
elif [[ $NUMCHECK -gt 0 ]]
then
    echo "entered number $INPUT is a positive number"
elif [[ $NUMCHECK -lt 0 ]]
then
    echo "entered number $INPUT is a negative number"
fi