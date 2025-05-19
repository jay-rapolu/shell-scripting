#!/bin/bash

USERID=$(id -u)
LOG_DIR=/var/log/shell-script
FILE_NAME=$(echo $0 | cut -d '.' -f1)
LOG_PATH=/var/log/shell-script/$FILE_NAME.log
PACKAGES=("mysql" "nginx" "httpd" "maven")

#Colors
R='\e[31m'
G='\e[32m'
Y='\e[33m'
D='\e[0m'

mkdir -p $LOG_DIR

if [ $USERID -ne 0 ]
then
    echo -e "${R}Error::${D} Please run the script as root user." | tee -a $LOG_PATH
    exit 1
else
    echo -e "${Y}Starting Script::${D} Script is running as root user.. Proceeding to Installation." | tee -a $LOG_PATH
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "${R}Error::${D} $2 Package Installation was unsuccessful" | tee -a $LOG_PATH
        exit 1
    else
        echo -e "${G}Success::${D} $2 Package Installation was successfully done." | tee -a $LOG_PATH
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>> $LOG_PATH
    if [ $? -ne 0 ]
    then
        echo -e "Package is not Installed.. ${Y}Installing the Package.${D}" | tee -a $LOG_PATH
        dnf install $package -y &>> $LOG_PATH
        VALIDATE $? $package 
    else
        echo -e "${Y}Available::${D} Package is available.. no need to install." | tee -a $LOG_PATH
    fi
done
