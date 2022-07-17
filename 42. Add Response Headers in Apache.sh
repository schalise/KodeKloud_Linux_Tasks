We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose.
We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:

Install httpd package on App Server 2 using yum and configure it to run on 8086 port, make sure to start its service.

Create an index.html file under Apaches default document root i.e /var/www/html and add below given content in it.

Welcome to the xFusionCorp Industries!

Configure Apache to enable below mentioned headers:

X-XSS-Protection header with value 1; mode=block

X-Frame-Options header with value SAMEORIGIN

X-Content-Type-Options header with value nosniff

Note: You can test using curl on the given app server as LBR URL will not work for this task.


#Step 1- Connect to the App server via SSH
		ssh steve@stapp02

#Step 2- Switch to  root user 
		sudo su -

#Step 3-Verify httpd is installed or not 
    rpm -qa | grep httpd


#Step 4- Install httpd package on the server
        sudo yum install httpd -y

# Step 5- Edit the configuration  file change port as per the task & add Header at end and save it

        sudo vi /etc/httpd/conf/httpd.conf 

        # Listen: Allows you to bind Apache to specific IP addresses and/or

        # Change this to Listen on specific IP addresses as shown below to

        #Listen 12.34.56.78:80
        Listen 8086

       Header set X-XSS-Protection "1; mode=block"
       Header always append X-Frame-Options SAMEORIGIN
       Header set X-Content-Type-Options nosniff

#Step 6- Use the grep command to verify the changes 

    cat /etc/httpd/conf/httpd.conf  |grep Listen
    cat /etc/httpd/conf/httpd.conf  |grep X

#Step 7 - Start httpd & check the status 

        systemctl start httpd
        systemctl status httpd

#Step 8- Create Index file with given content in task and save the file

       sudo vi /var/www/html/index.html
        Welcome to the xFusionCorp Industries!

        cat /var/www/html/index.html

#Step 9- Validate the task by Curl command

        curl http://stapp02:8086
        curl -i http://stapp02:8086

References:https://www.nbtechsupport.co.in/2021/07/add-response-headers-in-apache.html


