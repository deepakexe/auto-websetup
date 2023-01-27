#!/bin/bash
#ls /var/run/apache2/apache2.pid &>>/dev/null
#if [ $? -eq 0 ]
if [ -f /var/run/apache2/apache2.pid ] 
then
    echo "Apache2 service is running!"
else
    echo "Apache2 service is not running."
    echo 
    echo 
    echo "Trying to restart Apache2..."
    sudo systemctl start apache2
    if [ $? -eq 0 ]
    then
        echo "Apache2 service is restarted"
    else
        echo "Apache2 service cannot be started ...contact your Admin"
    fi
fi
