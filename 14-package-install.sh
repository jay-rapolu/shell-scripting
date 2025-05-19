#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: Please run the script as root user."
    exit 1
else
    echo "Script is running as root user.. Proceeding to Installation."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Package Installation was unsuccessful"
        exit 1
    else
        echo "Package Installation was successfully done."
    fi
else
    echo "Package is available.. no need to install."
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "Package Installation was unsuccessful"
        exit 1
    else
        echo "Package Installation was successfully done."
    fi
else
    echo "Package is available.. no need to install."
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    dnf install python3 -y
    if [ $? -ne 0 ]
    then
        echo "Package Installation was unsuccessful"
        exit 1
    else
        echo "Package Installation was successfully done."
    fi
else
    echo "Package is available.. no need to install."
fi