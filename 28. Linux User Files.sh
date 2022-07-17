There was some users data copied on Nautilus App Server 3 at /home/usersdata location by the Nautilus production support team in Stratos DC. Later they found that they
 mistakenly mixed up different user data there. Now they want to filter out some user data and copy it to another location. Find the details below:

On App Server 3 find all files (not directories) owned by user ravi inside /home/usersdata directory and copy them all while keeping the folder structure 
(preserve the directories path) to /ecommerce directory.

#Step 1- Connect via SSH to App Server 
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12

#Step 2- Switch to Root User
	sudo su -

# List the files and folders in the given folder path in task
    ls -lrt /home/usersdata
    ls -lrt /media/
    find /home/usersdata/ -type f -user ravi |wc -l

#Find all files (not directories) owned by user ravi inside /home/usersdata directory and copy them
    find /home/usersdata/ -type f -user ravi -exec cp --parents {} /ecommerce \;
    ls -lrt  /media/home/usersdata/

