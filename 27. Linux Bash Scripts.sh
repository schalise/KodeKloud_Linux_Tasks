The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script 
for taking websites backup. They have a static website running on App Server 1 in Stratos Datacenter, and they need to create a bash script named blog_backup.sh which 
should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 1)


a. Create a zip archive named xfusioncorp_blog.zip of /var/www/html/blog directory.

b. Save the archive in /backup/ on App Server 1. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save 
this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script wont ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) 
must be able to run it.

	#Step 1- Connect to the app server via SSH
		ssh tony@stapp01 

	#Step 2- Go to Script Folder and create a bash script named news_backup.sh
		cd  /scripts
		vi /scripts/blog_backup.sh
		
		Copy the below lines and save it :wq!
		#!/bin/bash

		zip -r /backup/xfusioncorp_blog.zip /var/www/html/blog
		scp /backup/xfusioncorp_blog.zip clint@stbkp01:/backup/
		
	#Step 3- Create a keygen and copy the key to backup server so that bash script will not require any password.
		ssh-keygen
		ssh-copy-id clint@stbkp01
		ssh clint@stbkp01

	#Step 4-  Go to scripts folder and run the bash scripts
		cd  /scripts
		chmod +x blog_backup.sh    (To get execute permission for user running scripts)
		ll
		sh  blog_backup.sh
	
	#Step 5- Check the backup folder for the zip file on both app01 and backup server.
		ssh clint@stbkp01
		cd /backup
		ll



The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 1 in Stratos Datacenter, and they need to create a bash script named ecommerce_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 1)


a. Create a zip archive named xfusioncorp_ecommerce.zip of /var/www/html/ecommerce directory.

b. Save the archive in /backup/ on App Server 1. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script wont ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

#Step 1- Connect to the app server via SSH
		ssh tony@stapp01 

	#Step 2- Go to Script Folder and create a bash script named news_backup.sh
		cd  /scripts
		vi /scripts/ecommerce_backup.sh
		
		Copy the below lines and save it :wq!
		#!/bin/bash

		zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce
		scp /backup/xfusioncorp_ecommerce.zip clint@stbkp01:/backup/

		cat  /scripts/ecommerce_backup.sh
		
	#Step 3- Create a keygen and copy the key to backup server so that bash script will not require any password.
		ssh-keygen
		ssh-copy-id clint@stbkp01
		ssh clint@stbkp01

	#Step 4-  Go to scripts folder and run the bash scripts in App Server 1 from Tony(Not Root)
		cd  /scripts
		chmod +x ecommerce_backup.sh   (To get execute permission for user running scripts)
		ll
		sh  ecommerce_backup.sh 
	
	#Step 5- Check the backup folder for the zip file on both app01 and backup server for verification
		ssh clint@stbkp01
		cd /backup
		ll

Reference: https://www.nbtechsupport.co.in/2021/02/linux-bash-scripts-kodekloud-engineer.html
			# Very Important Day to Day Production tasks

# Tips: 
Everything is good, whats missing in your case is to allow the server user (in this case tony) to execute the script.
Generate the SSH key for tony instead of root user
Copy the public key of user tony to clint@stbkp01 (use ssh-copy-id, as you used at 06:18)
Ensure that the created script (news_backup.sh) is owned by tony
Note: if the server changes, the user also changes. For instance: If it's stapp02 the user is steve