The Nautilus devops team got some requirements related to some Apache config changes. They need to setup some redirects for some URLs. There might be some more 
changes need to be done. Below you can find more details regarding that:

httpd is already installed on app server 2. Configure Apache to listen on port 8083.

Configure Apache to add some redirects as mentioned below:

a.) Redirect http://stapp02.stratos.xfusioncorp.com:<Port>/ to http://www.stapp02.stratos.xfusioncorp.com:<Port>/ i.e non www to www. 
This must be a permanent redirect i.e 301

b.) Redirect http://www.stapp02.stratos.xfusioncorp.com:<Port>/blog/ to http://www.stapp02.stratos.xfusioncorp.com:<Port>/news/. 
This must be a temporary redirect i.e 302.


    #Step 1- Connect to the backup server via SSH
		ssh steve@stapp02

	#Step 2- Switch to  root user : 
		sudo su -

    #Step 3- Confirm the current httpd version & configuration
        rpm-qa | grep httpd 
        cat /etc/httpd/conf/httpd.conf | grep Listen
        cat /etc/httpd/conf/httpd.conf | grep redirect

    #Step 4- Edit the configuration file and Configure Apache to listen on port 8083.
        vi /etc/httpd/conf/httpd.conf
        cat /etc/httpd/conf/httpd.conf |grep Listen

    #Step 5- Re-direct permanent & temporary  as per the task by creating main.conf
        ll /etc/httpd/conf.d/
        vi /etc/httpd/conf.d/main.conf

        <VirtualHost *:8083>
        ServerName stapp02.stratos.xfusioncorp.com
        Redirect 301 / http://www.stapp02.stratos.xfusioncorp.com:8083/
        </VirtualHost>

    <VirtualHost *:8083>
    ServerName www.stapp02.stratos.xfusioncorp.com:8083/blog/
    Redirect 302 /blog/ http://www.stapp02.stratos.xfusioncorp.com:8083/news/
    </VirtualHost>

        cat  /etc/httpd/conf.d/main.conf

    #Step 6- Save the file and restart and check the httpd status
        systemctl restart httpd
        systemctl status  httpd

    #Step 7- Validate the task
        curl http://stapp02.stratos.xfusioncorp.com:8083/
        curl http://www.stapp02.stratos.xfusioncorp.com:8083

        curl http://www.stapp02.stratos.xfusioncorp.com:8083/blog/
        curl http://www.stapp02.stratos.xfusioncorp.com:8083/news/


Reference: https://www.nbtechsupport.co.in/2021/07/apache-redirects.html


