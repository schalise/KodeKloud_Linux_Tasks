A developer siva has been assigned Nautilus project temporarily as a backup resource. As a temporary resource for this project, we need a temporary user for siva. It’s a good idea to 
create a user with a set expiration date so that the user wont be able to access servers beyond that point.

Therefore, create a user named siva on the App Server 1. Set expiry date to 2021-02-17 in Stratos Datacenter. Make sure the user is created as per standard and is in lowercase.


	#Step 1- Connect via SSH to App Server 
	sshpass -p Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10
    ssh tony@stapp01
	
	#Step 2-Create the user with an option to set expiry date (using ROOT).	
	sudo useradd -e 2021-02-17 siva 

	#Step3- Verify user is created successfully  with default expiry date.
    sudo chage -l siva