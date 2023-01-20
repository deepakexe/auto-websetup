!/bin/bash


#############EXECUTION: ./websetup2.sh<space>link of tooplate template#############


 #Declaring variables
PKGS="apache2 unzip wget"
TEMP_DIR="/tmp/webfiles"
SVC="apache2"
LEN=$(echo $1 | awk '{print length}')
NUM=38
NEW_LEN=`expr $LEN - $NUM`
NAME=$(echo $1 |tail -c -$NEW_LEN| head -c -5)

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
wget $1  > /dev/null
echo
echo "###################################################################"
echo "Unzipping the files..."
echo "###################################################################"
echo 
 #unzipping files
unzip $NAME.zip > /dev/null
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
