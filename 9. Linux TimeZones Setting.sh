During the daily standup, it was pointed out that the timezone across Nautilus Application Servers in Stratos Datacenter doesn't match with that of the local datacenter's timezone,
 which is America/Blanc-Sablon.

 	#Step 1: #Connect via SSH to the correct app server and switch to root user
	ssh tony@stapp01
	password:Ir0nM@n
    sudo su -
	
	#Step 2: Check existing Time Zone set for server
	timedatectl
    timedatectl -h

	#Step 3: Set the Timezone and verify it
	timedatectl set-timezone America/Blanc-Sablon
    timedatectl

References: https://www.nbtechsupport.co.in/2021/06/linux-timezones-setting.html
