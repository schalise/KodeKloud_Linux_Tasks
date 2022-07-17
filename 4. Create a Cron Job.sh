The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that 
they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

a. Install cronie package on all Nautilus app servers and start crond service.

b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

	#Step 1- Connect via SSH to App Server 
	sshpass -p  Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10
	sshpass -p  Am3ric@ ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12

	#Step 2-  Install cronie package
	sudo yum install -y cronie

	#Step3: Start cron service and check status
	sudo systemctl start crond.service 
	sudo systemctl status crond.service

	#Step 4- Create a cronjob
	sudo crontab -e
	
	#Step 5- Check cron job for root:
	sudo crontab -u root -l
	sudo crontab -l -u root
	
	#Step 6- Check if a cron job is created for the root user in cron directory
	sudo ls /var/spool/cron
	sudo cat /var/spool/cron/root