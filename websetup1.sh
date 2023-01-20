#!/bin/bash
 #Declaring variables
PKGS="apache2 unzip wget"
TEMP_DIR="/tmp/webfiles"
TEMP_LINK="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
ART="2132_clean_work"
SVC="apache2"

echo "###################################################################"
echo "Installing dependencies"
echo "###################################################################"

echo
 #install the dependencies
sudo apt install $PKGS -y > /dev/null


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
wget $TEMP_LINK  > /dev/null
echo
echo "###################################################################"
echo "Unzipping the files..."
echo "###################################################################"
echo 
 #unzipping files
unzip $ART.zip > /dev/null
echo
echo "###################################################################"
echo "Copying files...."
echo "###################################################################"
echo
 #copying files to dedicated folder for apache2
sudo cp -r $ART/* /var/www/html/
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
