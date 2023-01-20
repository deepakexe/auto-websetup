#!/bin/bash
LINK="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
LEN=$(echo $LINK | awk '{print length}')
NUM=38
NEW_LEN=`expr $LEN - $NUM`
NAME=$(echo $LINK |tail -c -$NEW_LEN| head -c -5)
echo $NAME
