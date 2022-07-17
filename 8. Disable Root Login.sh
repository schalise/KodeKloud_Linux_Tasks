After doing some security audits of servers, xFusionCorp Industries security team has implemented some new security policies. One of them is to disable direct root login through SSH.
Disable direct SSH root login on all app servers in Stratos Datacenter.

	#Step 1:Connect via SSH to the correct App Server
	sshpass -p  Ir0nM@n ssh -o StrictHostKeyChecking=no tony@172.16.238.10

	#Step 2:Disable direct SSH root login
	sudo cat /etc/ssh/sshd_config | grep PermitRoot
	sudo vi /etc/ssh/sshd_config

PermitRootLogin no
# the setting of "PermitRootLogin without-password"

    sudo cat /etc/ssh/sshd_config | grep PermitRoot
    [tony@stapp01 ~]$ sudo systemctl enable sshd
    [tony@stapp01 ~]$ sudo systemctl start sshd
    [tony@stapp01 ~]$ sudo systemctl restart sshd
    [tony@stapp01 ~]$ sudo systemctl status sshd

	systemctl restart sshd && systemctl status sshd

	#Step 3:Repeat the same steps for remaining 2 servers
	sshpass -p  Am3ric@ ssh -o StrictHostKeyChecking=no steve@172.16.238.11
	sshpass -p  BigGr33n ssh -o StrictHostKeyChecking=no banner@172.16.238.12

Reference: https://www.nbtechsupport.co.in/2021/01/disable-root-login-linux-server.html
