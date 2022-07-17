On our Storage server in Stratos Datacenter we are having some issues where nfsuser user is holding hundred of processes, which is degrading the performance of the server.
 Therefore, we have a requirement to limit its maximum processes. Please set its maximum process limits as below:

a. soft limit = 79
b. hard_limit = 92


		#Step 1- Connect via SSH to the Storage Server.
		sshpass -p '******' ssh -o StrictHostKeyChecking=no  natasha@172.16.238.15
        ssh natasha@ststor01

		#Step 2- Switch to  root user : 
		sudo su -

		#Step 3- Edit limit.conf file as below 
		vi /etc/security/limits.conf

		#Step 4- Add the below limit lines
		@nfsuser	soft	nproc	79
		@nfsuser	hard	nproc	92

		#Step 5- Verify the changes
		cat /etc/security/limits.conf
		cat /etc/security/limits.conf | grep nproc | grep -v ^

Reference: https://www.nbtechsupport.co.in/2021/01/linux-resource-limits-kodekloud.html
