#!/bin/bash
echo "###################################################################"
echo "Installing dependencies"
echo "###################################################################"

echo
#install the dependencies
sudo apt install apache2 unzip wget -y > /dev/null


echo "##################################################################"
echo "Starting and enabling APACHE...2"
echo "##################################################################"
echo
#start and enable apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo

#creating a temp folder to store the zip file to be downloaded
mkdir -p /temp/webfiles
#changing the the current directory to the temp folder
cd /tmp/webfiles
echo
echo "###################################################################"
echo "Downloading the template..."
echo "###################################################################"
echo
#downloading the template from the website
wget https://www.tooplate.com/zip-templates/2132_clean_work.zip > /dev/null
echo
echo "###################################################################"
echo "Unzipping the files..."
echo "###################################################################"
echo 
#unzipping files
unzip 2132_clean_work.zip > /dev/null
echo
echo "###################################################################"
echo "Copying files...."
echo "###################################################################"
echo
#copying files to dedicated folder for apache2
sudo cp -r 2132_clean_work/* /var/www/html/
echo
echo "###################################################################"
echo "Restarting the APACHE2 ...."
echo "###################################################################"
echo
#restarting the apache2 service
sudo systemctl restart apache2
echo
echo "###################################################################"
echo "Removing the temporary files..."
echo "###################################################################"
echo
#removing the temporary files
sudo rm -rf /tmp/webfiles
echo
systemctl status apache2
