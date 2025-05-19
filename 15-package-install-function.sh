#!/bin/bash

USERID=$(id -u)
LOG_DIR=/var/log/shell-script
FILE_NAME=$(echo $0 | cut -d '.' -f1)
LOG_PATH=/var/log/shell-script/$FILE_NAME.log

mkdir -p $LOG_DIR

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
        echo "Error:: $2 Package Installation was unsuccessful" | tee -a $LOG_PATH
        exit 1
    else
        echo "Success:: $2 Package Installation was successfully done."
    fi
}

dnf list installed mysqld

if [ $? -ne 0 ]
then
    echo "Package is not Installed.. Installing the Package." | tee -a $LOG_PATH
    dnf install mysqld -y &>> $LOG_PATH
    VALIDATE $? mysqld
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