The system admin team of xFusionCorp Industries has noticed an issue with some servers in Stratos Datacenter where some of the servers are not in sync w.r.t time. Because of this, 
several application functionalities have been impacted. To fix this issue the team has started using common/standard NTP servers. They are finished with most of the servers except 
App Server 1. Therefore, perform the following tasks on this server:

Install and configure NTP server on App Server 1.

Add NTP server 1.sg.pool.ntp.org in NTP configuration on App Server 1.

Please do not try to start/restart/stop ntp service, as we already have a restart for this service scheduled for tonight and we dont want these changes to be applied right now.

#Step 1- Connect via SSH to the App Server 1
    ssh tony@stapp01

#Step 2- Switch to Root User
	sudo su -


#Step 3- Check NTP is installed , if not then install on the server 
    rpm -qa |grep ntp
    sudo yum install -y ntp

#Step 4- Confirm package install successfully
    rpm -qa |grep ntp

#Step 5- Add NTP server in configuration file 
    vi /etc/ntp.conf
    cat /etc/ntp.conf |grep sg.pool

#Step 6- Check NTP daemon status
    ntpstat
    systemctl status ntpd

#Step 6- Start NTP daemon enable and check the status 
    systemctl enable ntpd
    systemctl start ntpd
    systemctl status ntpd

Reference: https://www.nbtechsupport.co.in/2021/06/linux-ntp-setup.html
