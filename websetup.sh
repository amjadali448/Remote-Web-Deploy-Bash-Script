#!/bin/bash

URL1="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
URL2="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	PACKAGE="httpd wget unzip"
	SVC="httpd"
	ART_NAME="2136_kool_form_pack"
	echo "##########################################"
	echo "############ CENTOS ######################"
        echo "INSTALLING $SVC on Centos"

	sudo yum install $PACKAGE -y > /dev/null
	sudo systemctl start $SVC 
	sudo systemctl enable $SVC

	echo "##########################################"
        echo "INSTALLED $SVC on Centos"

	sudo mkdir  -p $TEMPDIR
	cd $TEMPDIR

	wget $URL1 > /dev/null
	unzip $ART_NAME.zip > /dev/null

	sudo cp -r $ART_NAME/* /var/www/html/

	sudo systemctl restart $SVC
	
	rm -rf $TEMPDIR
	echo "##########################################"
        echo "Application Deployed on Centos SUCCESSFULLY"

else
	PACKAGE="apache2 wget unzip"
	SVC="apache2"
	ART_NAME="2135_mini_finance"
	echo "##########################################"
        echo "############ UBUNTU ######################"
        echo "INSTALLING $SVC on Ubuntu"

	sudo apt update -y > /dev/null
	sudo apt install $PACKAGE -y > /dev/null
	sudo systemctl start $SVC 
	sudo systemctl enable $SVC
	sudo mkdir  -p $TEMPDIR
	cd $TEMPDIR
	echo "##########################################"
        echo "INSTALLED $SVC on Ubuntu"

	wget $URL2 > /dev/null
	unzip $ART_NAME.zip > /dev/null

	sudo cp -r $ART_NAME/* /var/www/html/

	sudo systemctl restart $SVC
	
	rm -rf $TEMPDIR
	echo "##########################################"
        echo "Application Deployed on Ubuntu SUCCESSFULLY"
fi
