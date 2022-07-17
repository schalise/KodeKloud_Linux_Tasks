For security reasons the xFusionCorp Industries security team has decided to use custom Apache users for each web application hosted, rather than its default user. This will be the Apache 
user, so it shouldnt use the default home directory. Create the user as per requirements given below:
a. Create a user named rose on the App server 1 in Stratos Datacenter.
b. Set UID to 1543 and its home directory to /var/www/rose.

#Step 1- Connect via SSH to App Server 1 
	sshpass -p Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10 
	or
    ssh tony@stapp01
	password: Ir0nM@n
	
	#Step 2- Check status of firewall and the available options.
	sudo useradd -u 1543 -d /var/www/rose rose
            	  |      	 |		       |
     		 userid(UID)   home directory user
	
	#Step3- Verify the details of the user
	grep rose /etc/passwd

	Reference: https://www.nbtechsupport.co.in/2021/01/create-user-with-specific-id-home.html
	