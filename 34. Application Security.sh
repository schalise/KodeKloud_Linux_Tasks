
We have a backup management application UI hosted on Nautilus backup server in Stratos DC. That backup management application code is deployed under Apache on the 
backup server itself, and Nginx is running as a reverse proxy on the same server. Apache and Nginx ports are 8085 and 8096, respectively. We have iptables firewall 
installed on this server. Make the appropriate changes to fulfill the requirements mentioned below:

a. We want to open all incoming connections to Nginx port and 
b. Block all incoming connections to Apache port. Also make sure rules are permanent.


#Step 1- Connect via SSH to Backup Server 
    ssh clint@stbkp01

#Step 2- Switch to  root user : 
		sudo su -

#Step 3- Check Iptables
    systemctl status iptables

#Step 4- Check the ports 
    ss -tlnp |grep http
    ss -tlnp |grep nginx

# Step 5- Add Iptable Rules
    iptables -A INPUT -p tcp --dport 8096 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
    iptables -A INPUT -p tcp --dport 8085 -m conntrack --ctstate NEW -j REJECT
    iptables -L --line-numbers

# Step 6- Save the rules 
     sudo iptables-save > /etc/sysconfig/iptables
     cat /etc/sysconfig/iptables
     systemctl status iptables
     systemctl status iptables

# Step 7- Validate Ngnix port reachable from JumpServer
    telnet stbkp01 8096 # This should allow
    telnet stbkp01 8085  # This should reject. 

Reference: https://www.nbtechsupport.co.in/2021/01/application-security-kodekloud-engineer.html













