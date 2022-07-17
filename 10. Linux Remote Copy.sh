One of the Nautilus developers has copied confidential data on the jump host in Stratos DC. That data must be copied to one of the app servers. Because developers do 
not have access to app servers, they asked the system admins team to accomplish the task for them.

Copy /tmp/nautilus.txt.gpg file from jump server to App Server 2 at location /home/opt.

#Step-1: Check the file in the directory in the specified directory in the jump server.
	ls -lrt /tmp
	sudo cat /tmp/nautilus.txt.gpg

	#Step-2: Copy /tmp/nautilus.txt.gpg file from jump server to App Server 2 at location tmp
	sudo scp -r /tmp/nautilus.txt.gpg steve@172.16.238.11:/tmp


	#Step-3: Connect via SSH to the app server and move the file from the initial directory to the required directory. 

	ssh steve@stapp02
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	ls -l /tmp
	sudo mv /tmp/nautilus.txt.gpg /home/opt

	#Step 4: Verify the file has been moved. 
	ls -l /home/opt/
	sudo cat /home/opt/nautilus.txt.gpg

Reference: https://www.nbtechsupport.co.in/2021/01/linux-remote-copy-kodekloud-engineer.html
