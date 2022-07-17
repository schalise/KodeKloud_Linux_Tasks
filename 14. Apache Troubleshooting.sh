xFusionCorp Industries utilizes monitoring tools to check the status of every service, application, etc. running on the systems. The monitoring system identified that Apache service is
 not running on some of the Nautilus Application Servers in Stratos Datacenter.


1. Identify the faulty Nautilus Application Servers and fix the issue. Also, make sure Apache service is up and running on all Nautilus Application Servers. Do not try to stop any kind of
 firewall that is already running.

2. Apache is running on 8084 port on all Nautilus Application Servers and its document root must be /var/www/html on all app servers.

3. Finally you can test from jump host using curl command to access Apache on all app servers and it should work fine. E.g. curl http://172.16.238.10:8084/
	
	#Step 1- Connect via SSH to App Server 

	sshpass -p Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10
	sshpass -p  Am3ric@ ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12
	
	#Step 2- Check the status of Application Server
	systemctl status httpd
	
	#Step 3- Remove https and then reinstall it again on each app server.

		sudo yum remove httpd -y
		sudo yum install httpd -y
		
	#Step 4- Edit the /etc/httpd/conf/httpd.conf file.

		sudo vi /etc/httpd/conf/httpd.conf
        cat -n  /etc/httpd/conf/httpd.conf  |grep 31
        cat /etc/httpd/conf/httpd.conf |grep DocumentRoot
        cat /etc/httpd/conf/httpd.conf |grep Listen

		Listen 172.16.238.10:8084
		Listen 172.16.238.11:8084
		Listen 172.16.238.12:8084

	#Step 5- Restart httpd and check status.

        sudo systemctl restart httpd
		systemctl status httpd
        systemctl start httpd  &&  systemctl  status httpd
		exit
		
	#Step 6- Go back to jump server and test curl to each App server.
		curl http://172.16.238.10:8084/
		curl http://172.16.238.11:8084/
		curl http://172.16.238.12:8084/

Reference: https://www.nbtechsupport.co.in/2021/01/apache-troubleshooting-kodekloud.html
