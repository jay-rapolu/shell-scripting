#!/bin/bash

echo "Hello User, Please enter your email id or phone number: "
read user
echo "Please enter the password: "
read -s pass
echo "Thanks for details, welcome $user"

#read -p "Hello User, Please enter your email id or phone number: " user -> you can use this if you want to display before read instead of echo.