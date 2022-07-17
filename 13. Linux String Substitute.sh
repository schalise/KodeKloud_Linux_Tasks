The backup server in the Stratos DC contains several template XML files used by the Nautilus application. However, these template XML files must be populated with valid data before
 they can be used. One of the daily tasks of a system admin working in the xFusionCorp industries is to apply string and file manipulation commands!


Replace all occurances of the string Text to Sonar on the XML file /root/nautilus.xml located in the backup server.

	#Step 1- Connect via SSH to Backup Server  
	sshpass -p H@wk3y3 ssh -o StrictHostKeyChecking=no  clint@172.16.238.16
	
	#Step 2- Check the /root/nautilus.xml and grep for 'Text'
	ls -l /root/nautilus.xml
	sudo ls -l /root/nautilus.xml
	sudo cat /root/nautilus.xml |grep Text

	#Step 3- Switch to root user and search an replace.
	sudo su -
	sudo sed -i 's#Text#Sonar#g' nautilus.xml
	sudo cat /root/nautilus.xml |grep Sonar

References: https://www.nbtechsupport.co.in/2021/01/linux-string-substitute-kodekloud.html


