xFusionCorp Industries has an application running on Nautlitus infrastructure in Stratos Datacenter. The monitoring tool recognised that there is an issue with the haproxy service
 on LBR server. That needs to fixed to make the application work properly.

Troubleshoot and fix the issue, and make sure haproxy service is running on Nautilus LBR server.

	#Step-1
	sshpass -p '******' ssh -o StrictHostKeyChecking=no  loki@172.16.238.14
	sudo systemctl status haproxy.service -l
	sudo systemctl restart haproxy
	systemctl status haproxy

	#Step 2- 	
	cat /etc/haproxy/haproxy.cfg
	sudo vi /etc/haproxy/haproxy.cfg

	#Step 3- 
	Edit the File in the below two places and restart the service- 
	Change timeout checking 10s to timeout check 10s
	Change #backend app to backend app

	#Step 4- Verify
	sudo systemctl restart haproxy
	systemctl status haproxy

    #Step 4- Check the Configuration File
    haproxy -c -f /etc/haproxy/haproxy.cfg

References: https://www.nbtechsupport.co.in/2020/12/haproxy-lbr-troubleshooting-linux.html
