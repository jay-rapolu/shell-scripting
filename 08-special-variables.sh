#!/bin/bash

echo "To Print all the arguments use \$@ or \$* : $@"
echo "To Print the no.of arguments passed use \$# : $#"
echo "To Print the name of the script file use \$0 : $0"
echo "To Print the nth argument use \$n : $1" #I'm using 1st argument for example
echo "To Print the present working directory use \$PWD : $PWD"
echo "To Print the current script running user use \$USER : $USER"
echo "To Print home directory of the script running user use \$HOME : $HOME"
echo "To Print PID of current running script file use \$\$ : $$"
sleep 20 &
echo "To Print PID of last background running process use \$! : $!"