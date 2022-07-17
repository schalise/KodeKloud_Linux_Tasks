# Linux Collaborative Directories
The Nautilus team doesnt want its data to be accessed by any of the other groups/teams due to security reasons and want their data to be strictly accessed by the devops
 group of the team.

a. Setup a collaborative directory /devops/data on Nautilus App 1 server in Stratos Datacenter.
b. The directory should be group owned by the group devops and the group should own the files inside the directory. 
c. The directory should be read/write/execute to the group owners, and others should not have any access.


#Step 1- Connect via SSH to the App Server 1
    ssh tony@stapp01

#Step 2- Switch to Root User
	sudo su -


#Step 3- Create the folder under App Server 1
    mkdir -p /devops/data 
    ll -lsd /devops/data/
    ls -la /devops/data/

#Step 4- Change group of the directory from root to devops group.
    chgrp -R devops /devops/data
    ll -lsd /devops/data

    chgrp = changing primary group for the directory.
    -R = Recursive . changes will reflect all sub-directories and files

#Step 5- Modify the permission for sharedgrp.
    chmod -R 2770 /devops/data
    ll -lsd /devops/data/
    ls -ld /devops/data/

    2770  - Giving full permission to user (root) & group users and zero permmision for other users.

           2 - Special Permission. set group id.

           7 -  4+2+1 = 7 (4= read, 2 = write, 1 = execute).User (root) Permission

           7 -  4+2+1 = 7 (4= read, 2 = write, 1 = execute). Group Permission

           0 - Other users.(zero permission).

Reference:  https://www.nbtechsupport.co.in/2021/06/linux-collaborative-directories.html


