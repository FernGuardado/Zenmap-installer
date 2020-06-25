 #!/bin/sh
 
 #Zenmap script installer
 #NOTE: script might update if a new verison of Zenmap comes out 
 
echo "Simple Zenmap installer"
echo ""

if [ "$EUID" -ne 0 ];
then 
	echo "You must run as a sudo user"
	exit
else
	if [ -d "/bin/alien" ]; 
	then
		echo "Alien is already installed"
		echo ""
	
	else
		echo "Installing Alien..."
		echo ""
		apt-get install alien	
	fi
	
	wget https://nmap.org/dist/zenmap-7.80-1.noarch.rpm
	alien zenmap-7.80-1.noarch.rpm
	dpkg -i zenmap_7.80-2_all.deb
	
	if [ -d "/bin/zenmap" ];
	then
		echo ""
		echo "Zenmap was not installed correctly"
		exit
	else
		echo "Zenmap has been sucessfully installed"
		zenmap
	fi
fi
