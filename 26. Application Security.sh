We have a backup management application UI hosted on Nautilus backup server in Stratos DC. That backup management application code is deployed under Apache on the backup server 
itself, and Nginx is running as a reverse proxy on the same server. Apache and Nginx ports are 6100 and 8093, respectively. We have iptables firewall installed on this server. 
Make the appropriate changes to fulfill the requirements mentioned below:


We want to open all incoming connections to Nginx's port and block all incoming connections to Apache's port. Also make sure rules are permanent.

    #Step 1- Connect to the backup server via SSH
		ssh clint@stbkp01

	#Step 2- Switch to  root user : 
		sudo su -

	#Step 3- Check IP tables
		ls -l /etc/sysconfig/iptables	
		cat /etc/sysconfig/iptables

    #Check the port as per the task
        ss -tlnp |grep http
        ss -tlnp |grep nginx    
	 
	#Step 4- Add the rules for rejecting and allowing traffic from certain ports.
		iptables -A INPUT -p tcp --dport 8093 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
		iptables -A INPUT -p tcp --dport 6100 -m conntrack --ctstate NEW -j REJECT

	#Step 5- Start the httpd service & check the status.
		systemctl start iptables &&  systemctl  status iptables

	#Step 6- Saved the rules to ensure they remain persistent across reboot
		service iptables save 	# save the current iptables rules in /etc/sysconfig/iptables

	#Step 7- Verify iptables  from the backup server.
		iptables -L 
		iptables -nvL 

	#Step 8- Verify iptables from the jumphost
		telnet stbkp01 8093
		telnet stbkp01 6100

Reference: https://www.nbtechsupport.co.in/2021/01/application-security-kodekloud-engineer.html 
