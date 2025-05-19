#!/bin/bash

USERID=$(id -u)

R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
M='\e[35m'
C='\e[36m'
D='\e[0m'

if [ $# -eq 0 ]
then
    echo "${Y}Please enter atleast one package name.${D}"
    exit 1
fi

if [ $USERID -eq 0 ]
then
    echo "Script is Running with root permissions.. proceeding for package installation"
else
    echo "${R}Please run the script with root user permissions.. exiting the script${D}"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Package is available... Installing the Package"
        dnf install $2 -y
        echo "${G}Package Installed Successfully${D}"
    else
        echo "entered package name is incorrect or package name is not available."
        exit 1
    fi
}

dnf list installed $1 2> /dev/null

if [ $? -eq 0 ]
then
    echo "${Y}The Package is already installed in the machine${D}"
else
    echo "checking if the package is availble or not"
    dnf list available $1 > /dev/null
    VALIDATE $? $1
fi