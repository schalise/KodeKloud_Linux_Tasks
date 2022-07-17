We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data.We also need to decrypt data we received from a remote location in 
order to understand its content.

On storage server in Stratos Datacenter we have private and public keys stored /home/*_key.asc. Use those keys to perform the following actions.

a. Encrypt /home/encrypt_me.txt to /home/encrypted_me.asc.

b. Decrypt /home/decrypt_me.asc to /home/decrypted_me.txt. (Passphrase for decryption and encryption is kodekloud).


GPG, or GnuPG, stands for GNU Privacy Guard. The GPG Project provides the tools and libraries to allows users to interface with a GUI or command line to integrate encryption with 
emails and operating systems like Linux. GPG includes the tools you need to use public-key encryption and digital signatures on your Linux system.


#Step 1-  Login on storage server & switch to root user  
    ssh natasha@ststor01
    sudo su -

#Step 2- Go to the ghome folder to see the file
		cd /home/
        ll

#Step 3- Import gpg Public and Private key 
    gpg --import public_key.asc
    gpg --import private_key.asc

#Step 4- Verify the keys are imported successfully. 
    gpg --list-keys
    gpg --list-secret-keys
   

# Step 5- Encrypt the file txt in to asc in same folder path 
    gpg --encrypt -r kodekloud@kodekloud.com --armor < encrypt_me.txt  -o encrypted_me.asc

# Step 6- Decrypt the file asc in to txt  using passphrase within same folder path 
    gpg --decrypt decrypt_me.asc > decrypted_me.txt

#Step 7- Validate the encrypt and decrypt file
    cat encrypt_me.txt
    cat encrypted_me.asc
    
    cat decrypted_me.txt
    cat decrypt_me.asc

   
Reference:https://www.nbtechsupport.co.in/2021/07/linux-gpg-encryption.html



     