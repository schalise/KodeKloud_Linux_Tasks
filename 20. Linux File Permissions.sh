There are new requirements to automate a backup process that was performed manually by the xFusionCorp Industries system admins team earlier. To automate this task, the team has
developed a new bash script xfusioncorp.sh. They have already copied the script on all required servers, however they did not make it executable on one the app server 
 i.e App Server 2 in Stratos Datacenter.

Please give executable permissions to /tmp/xfusioncorp.sh script on App Server 2. Also make sure every user can execute it.


	#Step 1- Connect via SSH to App Server 
    ssh steve@stapp02

	#Step 2- Switch to  root user : 
		sudo su -

	#Step 3-  List the file existing file permission 
    ls -ltr /tmp/xfusioncorp.sh

    #Step 4- All other users need to have execute permission. 
        chmod o+rx /tmp/xfusioncorp.sh or sudo chmod +x /tmp/xfusioncorp.sh
        # Please note that in case of bash script bash is the interpreter that is actually going to execute the script and the interpreter needs to read the script so even if you have 
        #given it only executable permission the interpreter i.e bash will not be able to execute it so you had to give it read permission as well along with execute permission.
        cat /tmp/xfusioncorp.sh

  #Step 5- Verify the file permissions and execute the script from user.
        ls -lrt /tmp/xfusioncorp.sh
        sh /tmp/xfusioncorp.sh

Reference: https://www.nbtechsupport.co.in/2021/06/linux-file-permissions.html

