Some users of the monitoring app have reported issues with xFusionCorp Industries mail server. They have a mail server in Stork DC
 where they are using postfix mail transfer agent. Postfix service seems to fail. Try to identify the root cause and fix it.	

#Step 1- Connect via SSH to Mail Server
	 ssh groot@stmail01
	
#Step 2- Switch to Root User
	sudo su -

#Step 3-  Start postfix service , check status with -l for details error output 
	systemctl start postfix
    systemctl status postfix -l

				
● postfix.service - Postfix Mail Transport Agent
   Loaded: loaded (/usr/lib/systemd/system/postfix.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Mon 2022-06-06 14:45:22 UTC; 47s ago
  Process: 663 ExecStart=/usr/sbin/postfix start (code=exited, status=1/FAILURE)
  Process: 662 ExecStartPre=/usr/libexec/postfix/chroot-update (code=exited, status=0/SUCCESS)
  Process: 659 ExecStartPre=/usr/libexec/postfix/aliasesdb (code=exited, status=75)

Jun 06 14:45:21 stmail01.stratos.xfusioncorp.com postfix[663]: fatal: parameter inet_interfaces: no local interface found for ::1
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: Child 663 belongs to postfix.service
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: control process exited, code=exited status=1
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service got final SIGCHLD for state start
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service changed start -> failed
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: Job postfix.service/start finished, result=failed
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: Failed to start Postfix Mail Transport Agent.
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: Unit postfix.service entered failed state.
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service failed.
Jun 06 14:45:22 stmail01.stratos.xfusioncorp.com systemd[1]: postfix.service: cgroup is empty

#Step 4-Edit the configuration file
	cat /etc/postfix/main.cf |grep inet_interface
	vi /etc/postfix/main.cf
	cat /etc/postfix/main.cf |grep inet_interface

#Step 6-  Post configuration saved start the services and check the status 
	systemctl start postfix
	systemctl status postfix 

#Step 7- validate the task by telnet the port 25
	telnet stmail01 25 

Reference: https://www.nbtechsupport.co.in/2021/06/linux-postfix-troubleshooting.html
