The Nautilus DevOps team is ready to launch a new application, which they will deploy on app servers in Stratos Datacenter. They are expecting significant traffic/usage of
 squid on app servers after that. This will generate massive logs, creating huge log files. To utilise the storage efficiently, they need to compress the log files and 
 retain them for a maximum of 3 weeks. Check the requirements shared below:

a. In all app servers install tomcat package.

b. Using logrotate configure tomcat logs rotation to monthly and keep only 3 rotated.

(If by default log rotation is set, then please update configuration as needed)


#Step 1- Connect to the App server via SSH
		ssh tony@stapp01

#Step 2- Switch to  root user 
		sudo su -

#Step 3- Install the package
    yum install epel-release -y
    yum install squid -y

# Step 4- Navigate to log rotate folder and check existing folder
    ll /etc/logrotate.d/
    cat /etc/logrotate.d/tomcat

#Step 5- Configure the log rotate for squid

    vi /etc/logrotate.d/tomcat

 /var/log/tomcat/catalina.out {
    copytruncate
    weekly
    rotate 52
    compress
    missingok
    create 0644 tomcat tomcat
}

    cat /etc/logrotate.d/tomcat

# Step 6- Start services & check the status
    systemctl start squid
    systemctl restart squid
    systemctl status squid

  # Repeat the same for all app servers 

Reference:https://www.nbtechsupport.co.in/2021/07/linux-logrotate.html?m=1



