 The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready 
 that server for application deployment. Prepare the server as per requirements shared below:

	1. Install and configure nginx on App Server 1.
	2. On App Server 1 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location 
    and deploy the same in Nginx.
	3. Create an index.html file with content Welcome! under Nginx document root.
	4. For final testing try to access the App Server 3 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.

#Step 1- Connect to the App server via SSH
		ssh tony@stapp01

#Step 2- Switch to  root user : 
		sudo su -

#Step 3- Install epel repo & Nginx package  
         yum install -y epel-release
         yum install -y nginx 
        rpm -qa grep | nginx       

#Step 3- Edit NGINX Configuration File
 Note  Server_name  IP should be the as per your app server mentioned in the task. 
    # Add the server_name in the settings. 
    #Add the SSL certificate under TLS settings.


     vi /etc/nginx/nginx.conf

        server {

        listen       80;

        listen       [::]:80;

        server_name  172.16.238.12;

        root         /usr/share/nginx/html;

 

        # Load configuration files for the default server block.

        include /etc/nginx/default.d/*.conf;

 

        error_page 404 /404.html;

        location = /404.html {

        }

 

        error_page 500 502 503 504 /50x.html;

        location = /50x.html {

        }

    }

# Settings for a TLS enabled server.

 

    server {

        listen       443 ssl http2;

        listen       [::]:443 ssl http2;

        server_name  172.16.238.12;

        root         /usr/share/nginx/html;

        ssl_certificate "/etc/pki/CA/certs/nautilus.crt";

        ssl_certificate_key "/etc/pki/CA/private/nautilus.key";

        ssl_session_cache shared:SSL:1m;

        ssl_session_timeout  10m;

        ssl_ciphers HIGH:!aNULL:!MD5;

        ssl_prefer_server_ciphers on;

 

#        # Load configuration files for the default server block.

        include /etc/nginx/default.d/*.conf;

 

        error_page 404 /404.html;

            location = /40x.html {

        }

 

        error_page 500 502 503 504 /50x.html;

            location = /50x.html {

        }

    }

 

}
    

#Step 4- Copy the nautilus.crt and nautilus.key files to the correct location
     cp /tmp/nautilus.crt /etc/pki/CA/certs/
     cp /tmp/nautilus.key /etc/pki/CA/private/

#Step 5- Create an index.html with the word Welcome! on Nginx document root
    ll /usr/share/nginx/html/
    cd /usr/share/nginx/html

    # Now create an index.html with word Welcome! on nginx document root. 
    cd /usr/share/nginx/html
    ls -l

#when you do ls -l command you might be index.html already presented on this location but you can't edit that file.

    vi index.html ( you will get error when you tried to save the file>

     #Remove the existing file and create a new one  with the word Welcome!
        rm -r /usr/share/nginx/html/index.html
        vi /usr/share/nginx/html/index.html
            Welcome!
            Save the file !wq!
        cat /usr/share/nginx/html/index.html

#Step 6- Start  & check the status of  the Nginx service 
        systemctl start nginx
        systemctl status nginx

#Step 7- Validate the task from Jump Server 
       sudo yum install curl -y
       curl -Ik https://172.16.238.12  ## use ip of app server

