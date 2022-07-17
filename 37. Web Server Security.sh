 During a recent security audit, the application security team of xFusionCorp Industries found security issues with the Apache web server on Nautilus App Server 1 server in Stratos DC. They have listed several
security issues that need to be fixed on this server. Please apply the security settings below:

a. On Nautilus App Server 1 it was identified that the Apache web server is exposing the version number. Ensure this server has the appropriate settings to hide the 
    version number of the Apache web server.

b. There is a website hosted under /var/www/html/media on App Server 1. It was detected that the directory /media lists all of its contents while browsing the URL. 
Disable the directory browser listing in Apache config.

c. Also make sure to restart the Apache service after making the changes.

#Step 1- Connect to the App server via SSH
		ssh steve@stapp01

#Step 2- Switch to  root user : 
		sudo su -

#Step 3- Check the existing Apache HTTPd service status 
        systemctl status httpd

#Step 4- Verify the existing configuration 
        cat /etc/httpd/conf/httpd.conf  |grep ServerTokens
        cat /etc/httpd/conf/httpd.conf  |grep ServerSignature
        cat /etc/httpd/conf/httpd.conf  |grep Indexes

#Step 5- Edit the /etc/httpd/conf/httpd.conf file and add the below lines and save the file
        vi /etc/httpd/conf/httpd.conf

        press / and type the word Options and Press n to find the next occurrence
         #delete  Indexes from Options Indexes FollowSymLinks to hide the version number
         Options FollowSymLinks 
        # Go to the end of the line and add below lines for Disabling Directory Browser Listing 
        ServerTokens Prod
        ServerSignature Off

#Step 6- Verify the changes
        cat /etc/httpd/conf/httpd.conf  |grep ServerTokens
        cat /etc/httpd/conf/httpd.conf  |grep ServerSignature
        cat /etc/httpd/conf/httpd.conf  |grep Indexes


                [root@stapp02 ~]# cat /etc/httpd/conf/httpd.conf  | grep ServerTokens
                ServerTokens Prod
                [root@stapp02 ~]# cat /etc/httpd/conf/httpd.conf  |grep ServerSignature
                ServerSignature Off
                [root@stapp02 ~]# cat /etc/httpd/conf/httpd.conf  |grep Indexes
                Indexes Includes FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews

#Step 7- Save the config file, start the httpd services
         systemctl start httpd
         systemctl status httpd

 #Step 8-Validate Apache httpd is running or not
        curl -I http://stapp02:8080
        curl -I http://stapp02:8080/media


Vi Editing Tips
    The basic steps to perform a search in Vim are as follows:

Press /.
Type the search pattern.
Press Enter to perform the search.
Press n to find the next occurrence or N to find the previous occurrence.
Search for Whole Word

Reference: 
            https://www.nbtechsupport.co.in/2021/01/web-server-security-apache-kodekloud.html?m=1
            https://www.youtube.com/watch?v=IVgW84Pi3TY
            https://linuxize.com/post/vim-search/


