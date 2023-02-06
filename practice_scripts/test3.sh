#!/bin/bash

    #finding no. of fields
num=$( echo $1 | tr -dc '/'| wc -c )
num=$(( $num + 1 ))

    #checking extension
x=$( echo $1 | grep ".zip$" | wc -l )

    #Deciding name
if [ $x -gt 0 ]
then
    NAME=$( echo $1 | cut -d / -f $num | head -c -5 )
    echo $NAME
else
    NAME=$( echo $1 | cut -d / -f $num )
    echo $NAME
fi
