
Scenario: The System admin team of xFusionCorp Industries has installed a backup agent tool on all app servers. As per the tool requirements they need to create a user with a 
non-interactive shell. Therefore, create a user named kareem with a non-interactive shell in the app02 server.

	#Step 1: #Connect via SSH to the correct app server
	ssh steve@stapp02
	password: Am3ric@
	
	#Step 2: Check whether the user exist on the server or not
	sudo id kareem

	#Step 3: Create a user named kareem with a non-interactive shell  
	sudo useradd kareem -s /sbin/nologin
	sudo adduser kareem  -s /sbin/nologin

	#Step 4: Validate the user is created successfully or not
	sudo  id kareem
	sudo cat /etc/passwd |grep kareem

	Reference: https://www.nbtechsupport.co.in/2020/12/create-linux-user-with-non-interactive.html

	