On Nautilus storage server in Stratos DC there is a storage location /data which is used by different developers to keep their data (no confidential data). One of the developers
 rose has raised a ticket and asked for a copy of his/her data present in /data/rose directory on storage server. /home is an FTP location on storage server where developers can
  download their data. Below are the instructions shared by the system admin team to accomplish the task:

a. Make a rose.tar.gz compressed archive of /data/rose directory and move the archive to /home directory on Storage Server.

	#Step 1- Connect via SSH to Storage Server
	sshpass -p '******' ssh -o StrictHostKeyChecking=no  natasha@172.16.238.15
    ssh natasha@ststor01
    
	#Step 2- Switch to Root User
	sudo su -

	#Step3- Check the data directory
	ls -l  /data/

	#Step 4- Create the tar.gz file for the requester.
	sudo tar -cvzf rose.tar.gz /data/rose

	#Step 5- This moves the tar.gz file to the /home directory.
	sudo mv rose.tar.gz /home/

	#Step 6- Checks the tar.gz file in the /home directory.
	ls -l /home/

Reference: https://www.nbtechsupport.co.in/2021/01/linux-archives-kodekloud-engineer-task.html

