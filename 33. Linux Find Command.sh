During a routine security audit, the team identified an issue on the Nautilus App Server. Some malicious content was identified within the website code. After digging into the issue they found that there 
might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:


a. On App Server 1 at location /var/www/html/ecommerce find out all files (not directories) having .css extension.

b. Copy all those files along with their parent directory structure to location /ecommerce on same server.

c. Please make sure not to copy the entire /var/www/html/ecommerce directory content.

#Step 1- Connect via SSH to the App Server 1
    ssh tony@stapp01

#Step 2- Switch to Root User
	sudo su -

#Step 3- Find the file with  extension and  copy in a folder
    find /var/www/html/ecommerce -type f -name '*.css' -exec cp --parents {} /ecommerce \; 


 # Step 4- Validate the task by checking /beta folder
    ll /ecommerce