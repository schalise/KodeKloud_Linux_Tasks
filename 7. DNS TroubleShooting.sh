The system admins team of xFusionCorp Industries has noticed intermittent issues with DNS resolution in several apps . App Server 1 in Stratos Datacenter is having some DNS resolution issues, so we want to add some additional DNS nameservers on this server.
As a temporary fix we have decided to go with Google public DNS (ipv4). Please make appropriate changes on this server.

STEPS - SUMMARY

	1.	Connect via SSH to the correct app server.
	2.	Verify if DNS is really not working by doing a ping test.
	3.	Edit /etc/resolv.conf and add nameserver for Google
	4.	Test the connectivity

	#Step 1:#Connect via SSH to the correct app server
	ssh tony@172.16.238.10
	password: Ir0nM@n

	#Step 2: Switch to root user
	sudo su - 

	#Step 3: #Verify if DNS is really not working by doing a ping test.
	ping www.google.com

	#Step 4:  Verify the existing  resolve.conf file  
	sudo cat /etc/resolv.conf
	sudo ls -l /etc/resolv.conf
	
	#Step 5: Edit /etc/resolv.conf and add nameserver for Google
	 sudo vi /etc/resolv.conf
	
	#Step 6: Add public DNS 8.8.8.8  and 8.8.4.4 as per the task.	
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	sudo cat /etc/resolv.conf

	#Step 7: #Test connectivity
	ping 8.8.8.8
	ping 8.8.4.4

Reference: https://www.nbtechsupport.co.in/2020/12/dns-troubleshooting-linux-server.html
