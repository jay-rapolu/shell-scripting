#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: Please run the script as root user."
    exit 1
else
    echo "Script is running as root user.. Proceeding to Installation."
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error:: $2 Package Installation was unsuccessful"
        exit 1
    else
        echo "Success:: $2 Package Installation was successfully done."
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    VALIDATE $? mysql
else
    echo "Package is available.. no need to install."
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo "Package is available.. no need to install."
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package."
    dnf install python3 -y
    VALIDATE $? python3
else
    echo "Package is available.. no need to install."
fi