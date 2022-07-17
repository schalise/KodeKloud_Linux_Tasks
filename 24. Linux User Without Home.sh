The system admins team of xFusionCorp Industries has set up a new tool on all app servers, as they have a requirement to create a service user account that will be used by that tool.
 They are finished with all apps except for App 2 in Stratos Datacenter.

Create a user named james in App Server 2 without a home directory.
	
	#Step 1- Connect via SSH to AppServer 2
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no steve@172.16.238.11
    ssh steve@stapp02
	
	#Step 2- Switch to Root User
	sudo su -

	#Step 3- Check user james is existed
	sudo id javed
    cat /etc/passwd |grep james

	#Step 4- Create the user 
	sudo  useradd -M james
	sudo cat/etc/passwd | grep james

	#Step 5- Validate the task by listing the file exist in  Home directory
	ll  /home 