#!/bin/bash

USERID=$(id -u)

if [ $# -eq 0 ]
then
    echo "Please enter atleast one package name."
    exit 1
fi

if [ $USERID -eq 0 ]
then
    echo "Script is Running with root permissions.. proceeding for package installation"
else
    echo "Please run the script with root user permissions.. exiting the script"
    exit 1
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo "Package is available"
        echo "Installing the Package"
        dnf install $2 -y
        echo "Package Installed Successfully"
    else
        echo "entered package name is incorrect or package name is not available."
        exit 1
    fi
}

dnf list installed $1 > /dev/null

if [ $? -eq 0 ]
then
    echo "The Package is already installed in the machine"
else
    echo "checking if the package is availble or not"
    dnf list available $PACKAGE > /dev/null
    VALIDATE() $? $1
fi