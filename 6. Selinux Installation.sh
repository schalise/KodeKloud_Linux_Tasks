The xFusionCorp Industries security team recently did a security audit of their infrastructure and came up with ideas to improve the application and server security. They decided to use 
SElinux for an additional security layer. They are still planning how they will implement it; however, they have decided to start testing with app servers, so based on the recommendations
 they have the following requirements:

Install the required packages of SElinux on App server 2 in Stratos Datacenter and disable it permanently for now; it will be enabled after making some required configuration changes
 on this host. Don't worry about rebooting the server as there is already a reboot scheduled for tonight's maintenance window. Also ignore the status of SElinux command line right now;
  the final status after reboot should be disabled.

  STEPS - SUMMARY 

	1.	Connect via SSH to the correct App Server
	2. 	Install Selinux
	3.	Edit the /etc/selinux/config file as ROOT then verify

	#Step 1:Connect via SSH to the correct App Server
		ssh steve@stapp02
		Password:Am3ric@
		sudo su - 

	#Step 2: Install Selinux-	
	sudo yum install selinux -y	
	sudo yum install policycoreutils policycoreutils-python selinux-policy selinux-policy-targeted libselinux-utils setroubleshoot-server setools setools-console mcstrans
			
	#Step 3: Edit the /etc/selinux/config file as ROOT then verify
	sudo vi /etc/selinux/config

	# This file controls the state of SELinux on the system.
	# SELINUX= can take one of these three values:
	#     enforcing - SELinux security policy is enforced.
	#     permissive - SELinux prints warnings instead of enforcing.
	#     disabled - No SELinux policy is loaded.
	SELINUX=disabled                                                --Changed enforcing to disabled
	# SELINUXTYPE= can take one of these two values:
	#     targeted - Targeted processes are protected,
	#     minimum - Modification of targeted policy. Only selected processes are protected. 
	#     mls - Multi Level Security protection.
	SELINUXTYPE=targeted

	#Step 4: Verify the config file and check the status	
	sudo cat /etc/selinux/config 
	sudo cat /etc/selinux/config | grep SELINUX or grep SELINUX /etc/selinux/config
	sestatus