The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. 
To make these scripts work properly we need to make sure thor user on jump host haspassword-less SSH access to all app servers through their respective sudo users. 
Based on the requirements, perform the following:

Set up a password-less authentication for user thor on jump host to all app servers through their respective sudo users.

#Step 1- 1st check your login as thor user  on the server  & create a key by below command
		whoami
		 ssh-keygen -t rsa

#Step 2- Copy public key by below command on all the APP server's  
    ssh-copy-id  tony@stapp01
    ssh-copy-id steve@stapp02
    ssh-copy-id banner@stapp03

#Step 3- Logging into the APP server without password
    ssh tony@stapp01
    whoami

#Do steps 2 -3 in all app server stapp01,stapp02, stapp03.    

Reference: https://www.nbtechsupport.co.in/2021/01/linux-ssh-authentication-kodekloud.html
