The Nautilus production support team and security team had a meeting last month in which they decided to use local yum repositories for maintaing packages needed for 
their servers. For now they have decided to configure a local yum repo on Nautilus Backup Server. This is one of the pending items from last month, so please configure
a local yum repository on Nautilus Backup Server as per details given below.

a. We have some packages already present at location /packages/downloaded_rpms/ on Nautilus Backup Server.

b. Create a yum repo named local_yum and make sure to set Repository ID to local_yum. Configure it to use packages location /packages/downloaded_rpms/.

c. Install package samba from this newly created repo.


#Step 1- Connect to the Backup server via SSH
		ssh clint@stbkp01

#Step 2- Switch to  root user : 
		sudo su -

#Step 3- check is there already any yum repository is available
        yum repolist

#Step 4-Create a local repo since there exist no repo
        cd /etc/yum.repos.d
        vi /etc/yum.repos.d/local_yum.repo

#Step 5-Add the location of the downloaded rpms folder.
        [local_yum]
            name=local_yum
            baseurl=file:///packages/downloaded_rpms/
            enabled = 1
            gpgcheck = 0
                
    mv local_yum local_yum.repo
    yum repolist 

#Step 6-Validate that the repo is created 
    yum clean all
    yum repolist

#Step 7-Install the Package and check the status 
    yum install samba
    sudo systemctl enable samba
    sudo systemctl restart samba
    sudo systemctl status samba


Reference: https://snoopitech.com/configure-local-yum-repos-kodekloud-engineer-task-success/
           https://www.nbtechsupport.co.in/2021/02/configure-local-yum-repos-kodekloud.html




