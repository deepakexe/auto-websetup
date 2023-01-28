#!/bin/bash

############# AUTHOR: Deepak PURI github@deepakexe #######################
############# EXECUTION: ./websetup_multios.sh<space>link of tooplate template #############


    #Declaring variables
TEMP_DIR="/tmp/webfiles"

    #finding no. of fields
num=$( echo $1 | tr -dc '/'| wc -c )
num=$(( $num + 1 ))

    #checking extension
x=$( echo $1 | grep ".zip$" | wc -l )                #x is number of times .zip has appeared

    #Deciding name
if [ $x -gt 0 ]                                      #if x >0 (means it has zip extension)
then
    NAME=$( echo $1 | cut -d / -f $num | head -c -5 ) #if extension is zip,return last field & remove last 5 characters
else
    NAME=$( echo $1 | cut -d / -f $num )              #else return laast field
fi
yum --help &> /dev/null                               #execute a yum command 
if [ $? -eq 0 ]                                       #if return code is 0; it is RHEL
then                                                  #else it is a ubuntu
    echo "OS Identified as: CentOS"
    PKGS="httpd unzip wget"
    SVC="httpd"
else
    echo "OS Identified as: Ubuntu"
    PKGS="apache2 unzip wget"
    SVC="apache2"
fi

echo "###################################################################"
echo "Installing dependencies"
echo "###################################################################"

echo
 #install the dependencies
sudo apt install $PKGS -y &> /dev/null


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
