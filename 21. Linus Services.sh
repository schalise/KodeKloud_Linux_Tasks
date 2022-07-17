As per details shared by the development team, the new application release has some dependencies on the back end. There are some packages/services that need to be installed 
on all app servers under Stratos Datacenter. As per requirements please perform the following steps:

a. Install postfix package on all the application servers.

b. Once installed, make sure it is enabled to start during boot.

#Step 1- Connect via SSH to APP Server
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no tony@172.16.238.10		#	App server 1
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no steve@172.16.238.11	#	App server 2
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no banner@172.16.238.12	#	App server 3

#Step 2- Switch to Root User
	sudo su -

#Step 3- Install postfix service package
	sudo yum install -y postfix

#Step 4- Edit the hosts file and disable IPv6.
	sudo vi /etc/hosts
	1. Disable IPv6.
	2. Comment the ipv6 entry in /etc/hosts file.
	#::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

#Step 5- Re-start & enable the postfix service

        	systemctl  restart postfix
            systemctl  enable postfix
            systemctl status postfix
            systemctl list-unit-files | grep postfix

Reference: https://www.nbtechsupport.co.in/2021/01/linux-services-troubleshooting.html
