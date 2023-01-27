#!/bin/bash
res=50
for num in {1..10};
do
  echo "looping.."
  if [ $num = 1 ];
  then
    x=st
  elif [ $num = 2 ]; then
    x=nd
  elif [ $num = 3 ]; then
    x=rd
  else
    x=th
  fi
  echo "the $num$x element is: $res "
  res=$(( $res + 10 ))
echo
done

