#!/bin/bash

USERID=$(id -u)
PACKAGE=$1

if [ $# -eq 0 ]
then
    echo "Please enter a package name as first argument"
    exit 1
fi

if [ $USERID -eq 0 ]
then
    echo "Script is Running with root permissions.. proceeding for package installation"
else
    echo "Please run the script with root user permissions.. exiting the script"
    exit 1
fi

dnf list installed | grep -i $PACKAGE

if [ $? -eq 0 ]
then
    echo "The Package is already installed in the machine"
    exit 1
else
    echo "checking if the package is availble or not"
    dnf list installed | grep -i $PACKAGE
    echo $?
    if [ $? -eq 0 ]
    then
        echo "Installing the Package"
        dnf install $PACKAGE -y
    else
        echo "entered package name is incorrect or package name is not available."
        exit 1
    fi
fi