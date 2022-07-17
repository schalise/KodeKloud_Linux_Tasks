As per new application requirements shared by the Nautilus project development team, serveral new packages need to be installed on all app servers in Stratos Datacenter. Most of them are 
completed except for epel-release.

Therefore, install the epel-release package on all app-servers.

		#Step 1- Connect to all app server via SSH and perfrom the below activities on all app servers. 
		ssh tony@stapp01               
      	ssh steve@stapp02
      	ssh banner@stapp03

		#Step 2- Switch to  root user : 
		sudo su -
 
		#Step3- Verify and Install zip package
		rpm -qa |grep epel-release  #query all the packages installed in your system.
		sudo yum install epel-release -y

		#Step 4- Verify that the package has been installed
		sudo yum list installed | grep epel-release
		sudo rpm -qa |grep epel-release

# Additional Tasks
As per new application requirements shared by the Nautilus project development team, serveral new packages need to be installed on all app servers in Stratos Datacenter.
Most of them are completed except for wget.

Therefore, install the wget package on all app-servers.

Reference: https://www.nbtechsupport.co.in/2021/02/install-package-kodekloud-engineer-task.html
