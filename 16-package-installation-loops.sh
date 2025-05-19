#!/bin/bash

USERID=$(id -u)
LOG_DIR=/var/log/shell-script
FILE_NAME=$(echo $0 | cut -d '.' -f1)
LOG_PATH=/var/log/shell-script/$FILE_NAME.log
PACKAGES=("mysql" "nginx" "httpd" "maven")
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

for package in ${PACKAGES[@]}
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "Package is not Installed.. Installing the Package." | tee -a $LOG_PATH
        dnf install $package -y &>> $LOG_PATH
        VALIDATE $? $package
    else
        echo "Package is available.. no need to install."
    fi
done
