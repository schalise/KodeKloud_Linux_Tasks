New tools have been installed on the app server in Stratos Datacenter. Some of these tools can only be managed from the graphical user interface. Therefore, there are requirements for 
these app servers.

On all App servers in Stratos Datacenter change the default runlevel so that they can boot in GUI (graphical user interface) by default.


	#Step 1- Connect via SSH to App Server 
	sshpass -p  Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10
	sshpass -p  Am3ric@ ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12

	#Step 2- Switch to Root User
	sudo su -

	#Step 3- Check the default run level 
	systemctl get-default
	systemctl list-units

	#Step 4- Change Run level to 
	systemctl set-default graphical.target

	#Step 5- Post set default start graphical service & validate  the status
	systemctl start graphical.target 
	systemctl status graphical.target 
    systemctl get-default