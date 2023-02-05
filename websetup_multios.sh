#!/bin/bash


#############EXECUTION: ./websetup_multios.sh<space>link of tooplate template#############


 #Declaring variables
TEMP_DIR="/tmp/webfiles"
LEN=$(echo $1 | awk '{print length}')
NUM=38
NEW_LEN=`expr $LEN - $NUM`
NAME=$(echo $1 |tail -c -$NEW_LEN| head -c -5)
yum --help &> /dev/null
if [ $? -eq 0 ]
then
    echo "OS Identified as: CentOS"
    PKGS="httpd unzip wget"
    SVC="httpd"
    PM="yum"
else
    echo "OS Identified as: Ubuntu"
    PKGS="apache2 unzip wget"
    SVC="apache2"
    PM="apt"
fi

echo "###################################################################"
echo "Installing dependencies"
echo "###################################################################"

echo
 #install the dependencies
sudo $PM install $PKGS -y &> /dev/null


echo "##################################################################"
echo "Starting and enabling APACHE...2"
echo "##################################################################"
echo
 #start and enable apache2
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

 #creating a temp folder to store the zip file to be downloaded
mkdir -p $TEMP_DIR
 #changing the the current directory to the temp folder
cd $TEMP_DIR
echo
echo "###################################################################"
echo "Downloading the template..."
echo "###################################################################"
echo
 #downloading the template from the website
wget $1  &> /dev/null
echo
echo "###################################################################"
echo "Unzipping the files..."
echo "###################################################################"
echo 
 #unzipping files
unzip $NAME.zip &> /dev/null
echo
echo "###################################################################"
echo "Copying files...."
echo "###################################################################"
echo
 #copying files to dedicated folder for apache2
sudo cp -r $NAME/* /var/www/html/
echo
echo "###################################################################"
echo "Restarting the APACHE2 ...."
echo "###################################################################"
echo
 #restarting the apache2 service
sudo systemctl restart $SVC
echo
echo "###################################################################"
echo "Removing the temporary files..."
echo "###################################################################"
echo
 #removing the temporary files
sudo rm -rf $TEMP_DIR
echo
systemctl status $SVC
