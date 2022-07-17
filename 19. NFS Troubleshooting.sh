The Nautilus production support team was trying to fix issues with their storage server. The storage server has a shared directory /web, which is mounted on all app servers at 
location /var/www/html so that whatever data they store on storage server under /web can be shared among all app servers. Somehow NFS server is broken and having some issues.

Identify the root cause of the issue and fix it to make sure sharing works fine among all app servers and storage server.

#Step 1- Connect via SSH to the Storage Server
	sshpass -p  '******' ssh -o StrictHostKeyChecking=no natasha@172.16.238.15
    ssh natasha@ststor01

#Step 2- Switch to Root User
	sudo su -
    #Make sure NFS is installed. If not, install and enable NFS utiities anyway.
	sudo yum install -y nfs-utils nfs-utils-lib

#Step 3- Verify the status of NFS & RPC service
    systemctl status nfs-server && systemctl status rpcbind
    systemctl status nfs-server
    systemctl status rpcbind

#Step 4- Edit the  /etc/exportfs  file and correct the changes as per below
    cat /etc/exports				#	checks contents of export file
	sudo vi /etc/exports			#	edits the export file

                /web 172.16.238.10(rw,sync,no_subtree_check,no_root_squash,fsid=0)	#	note that /web is the shared/mounting directory
                /web 172.16.238.11(rw,sync,no_subtree_check,no_root_squash,fsid=0)			
                /web 172.16.238.12(rw,sync,no_subtree_check,no_root_squash,fsid=0)

#Step 5- Validate the exports file are correct
    exportfs -av
    showmount -e ststor01
	showmount -e 172.16.238.15


App Server Steps- (Repeat the steps for all App Servers)

	#Step 6- login to one of the App server and mount the file system 
        sshpass -p  '******' ssh -o StrictHostKeyChecking=no tony@172.16.238.10		#	App server 1
        sshpass -p  '******' ssh -o StrictHostKeyChecking=no steve@172.16.238.11		#	App server 2
        sshpass -p  '******' ssh -o StrictHostKeyChecking=no banner@172.16.238.12		#	App server 3


    #Step 7- Switch to Root User
	sudo su -

    #Step 8- Verify the status of NFS & RPC service
    systemctl start nfs-server && systemctl start rpcbind
    systemctl status nfs-server && systemctl status rpcbind

   # Step 9- validate the export list  (Ensure App server sees the filesystem and the correct shared shared directory(showmount).   
	showmount -e ststor01 or
	showmount -e 172.16.238.15

    #Step 13- Mount the File System as per the destination mountpoint
        mount -t nfs ststor01:/web   /var/www/html                             or
	    sudo mount -t nfs 172.16.238.15:/web /var/www/html/ 

    #Step 14-Validate that the mount point  mounted successfully
	mount | grep nfs
    mount |grep appdata																	
	ls -l /var/www/html

References: https://www.nbtechsupport.co.in/2020/12/nfs-troubleshooting-linux-server.html

