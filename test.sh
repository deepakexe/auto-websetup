#!/bin/bash
num=$( echo $1 | tr -dc '/'| wc -c )
#echo $num
num=$(( $num + 1 ))
echo $1 | cut -d / -f $num | head -c -5
