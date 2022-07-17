The Nautilus system admins team recently deployed a web UI application for their backup utility running on the Nautilus backup server in Stratos Datacenter. The application is running on 
port 3001. They have firewalld installed on that server. The requirements that have come up include the following:

Open all incoming connection on 3001/tcp port. Zone should be public.

	#Step1- Connect via SSH to the Backup server.
	sshpass -p H@wk3y3 ssh -o StrictHostKeyChecking=no  clint@172.16.238.16

	#Step 2- Check status of firewall and the available options.
	firewall-cmd --help
     	sudo firewall-cmd --zone=public --list-all

	#Step 3. Add <port id>/protocol and reload.	
		sudo firewall-cmd --zone=public --permanent --add-port=3001/tcp
               		firewall-cmd --help | grep reload									
      		sudo firewall-cmd --reload
	
	#Step 4- Verify
		sudo firewall-cmd --zone=public --list-all
		cat /etc/httpd/conf/httpd.conf | grep Listen

Reference: https://www.nbtechsupport.co.in/2020/12/linux-firewalld-rules-backup-server.html