 #!/bin/sh
 
 #Zenmap script installer
 #NOTE: script might update if nmap decides to 
 
echo "Simple Zenmap installer"
echo ""

if [ "$EUID" -ne 0 ];
then 
	echo "You must run as a sudo user"
	exit
else
	if [ -d "/bin/alien" ]; 
	then
		echo "Alien is alreay installed"
		echo ""
	
	else
		echo "Installing Alien..."
		echo ""
		apt-get install alien	
	fi
	
	wget https://nmap.org/dist/zenmap-7.80-1.noarch.rpm
	alien zenmap-7.80-1.noarch.rpm
	
	if [ -f "zenmap_7.80-2_all.deb" ];
	then 
		
		if [ -d "/bin/zenmap" ];
		then
			dpkg -i zenmap_7.80-2_all.deb
			echo ""
			echo "Zenmap has been sucessfully installed"
			zenmap
			rm -f zenmap-7.80-1.noarch.rpm
			rm -f zenmap_7.80-2_all.deb
		else
			echo "Zenmap is already installed."
			exit
	fi
fi
