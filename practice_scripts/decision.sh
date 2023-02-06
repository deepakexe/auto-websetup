#!/bin/bash
read -p 'Enter a number: ' NUM

#conditional
if [ $NUM -gt 60 ] 
then
    echo "this is if block"
    echo "the number is greatr than 60."
else
    echo "this is the else block"
    echo "the number is less than or equal to 60 "
fi
sleep 3
echo "you have successfully exited the decison making"
X=$(uname)
echo "your operating system is $X"
