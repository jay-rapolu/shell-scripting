#!/bin/bash

#defining Array
Movies=("Thandel" "Hi Nanna" "HIT 3" "Pushpa 2" "Court") 

#Accessing Array (Index Starts from 0)

#Accessing the nth Element Movies[n] by default it will pick the first item

#always use ${Arrayname[n]} to get correct output 0 is starting element and -1 is the last element and $Name is same as ${Name}

echo "First movie in the list is ${Movies[0]}"
echo "Last movie in the list is ${Movies[-1]}" 
echo "All movies in the list are ${Movies[@]}"