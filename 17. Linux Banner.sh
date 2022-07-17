During the monthly compliance meeting, it was pointed out that several servers in the Stratos DC do not have a valid banner. The security team has provided serveral 
approved templates which should be applied to the servers to maintain compliance. These will be displayed to the user upon a successful login.

Update the message of the day on all application and db servers for Nautilus. Make use of the approved template located at /home/thor/nautilus_banner on jump host

	#Step 1-  Enable SCP on the Jump Server.
	sudo su -
	sudo yum install -y openssh-clients

	#Step 2-Copy the nautilus_banner template from the jump server to all app server.
	sudo scp -r /home/thor/nautilus_banner tony@172.16.238.10:/tmp
	sudo scp -r /home/thor/nautilus_banner steve@172.16.238.11:/tmp
	sudo scp -r /home/thor/nautilus_banner banner@172.16.238.12:/tmp

	#Step 3- Enable SCP on DB Server.
	sshpass -p Sp!dy ssh -o StrictHostKeyChecking=no  peter@172.16.239.10
	sudo yum install -y openssh-clients
	
	#Step 4 -Copy the nautilus_banner template from the jump server to db server.
	sudo scp -r /home/thor/nautilus_banner peter@172.16.239.10:/tmp

	#Step 5- GO INTO EACH OF THE FOUR SERVER AND COPY FILE TO /etc/mot Since each server already has a copy of the template file in its directory, 

	sshpass -p  Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10
	sshpass -p  Am3ric@ ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12
	sshpass -p Sp!dy ssh -o StrictHostKeyChecking=no  peter@172.16.239.10
	cd /tmp
	ls -lrt
	sudo mv /tmp/nautilus_banner /etc/motd
	ls -l /etc/motd
	cat /etc/motd


	Reference: https://www.nbtechsupport.co.in/2020/12/linux-banner-kodekloud-engineer-task.html
	