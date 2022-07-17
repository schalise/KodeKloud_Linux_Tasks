There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. 
After digging into the issue, the team found that mariadb service is down on the database server.

Look into the issue and fix the same.	
	
	#Step 1: Login into the Database Server
	sshpass -p Sp!dy ssh -o StrictHostKeyChecking=no  peter@172.16.239.10
	ssh peter@172.16.239.10

	#Step 2: Switch to root user
	sudo su -

	#Step 3- Check the status of Maria DB Server
	systemctl status mariadb
	systemctl start mariadb

	#Step 4- Change the ownership settings of MY SQL
	cd /var/lib/                 
   	ls -la 
   	chown mysql:mysql mysql/ 

	#Step 5-Change the ownership of the mariadb server
	cd /var/run/
   	ls -la
	sudo chown mysql:mysql   /var/run/mariadb/	

	#Step 5: Start the MariaDB Service
	 systemctl start  mariadb &&  systemctl status  mariadb
    
Reference: https://www.nbtechsupport.co.in/2021/01/mariadb-troubleshooting-kodekloud.html
