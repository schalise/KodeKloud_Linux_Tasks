There are specific access levels for users defined by the xFusionCorp Industries system admin team. Rather than providing access levels to every individual user, the team has decided to
 create groups with required access levels and add users to that groups as needed. See the following requirements:

a. Create a group named nautilus_developers in all App servers in Stratos Datacenter.

b. Add the user jarod to nautilus_developers in all App servers. (create the user if not present already)

	#Step 1- Connect via SSH to App Server 
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no tony@172.16.238.10
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no banner@172.16.238.12
	
	#Step 2- Create the group
	sudo groupadd nautilus_developers

	#Step 3- Add user to the group
	sudo useradd -G nautilus_developers jarod

	#Step 4- Verify
	getent passwd | grep jarod
	getent group nautilus_developers
	getent group


	