We have some users on all app servers in Stratos Datacenter. Some of them have been assigned some new roles and responsibilities, therefore their users need to be upgraded with sudo access so that they can perform admin level tasks.

a. Provide sudo access to user javed on all app servers.

b. Make sure you have set up password-less sudo for the user.

#Step 1- Connect to the App server via SSH
		ssh tony@stapp01

#Step 2- Switch to  root user : 
		sudo su -

#Step 3- Check the user is existing and have sudo permission
    sudo cat /etc/sudoers |grep javed

#Step 4- Provide sudo access to user javed on all app servers
    visudo
    javed    ALL=(ALL)   NOPASSWD:ALL
    sudo cat /etc/sudoers |grep javed
    su - javed


    # Repeat the same for all app servers 

Reference: https://www.nbtechsupport.co.in/2021/07/linux-configure-sudo.html

