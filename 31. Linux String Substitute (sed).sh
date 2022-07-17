There is some data on Nautilus App Server 1 in Stratos DC. Data needs to be alteredin several of the files. On Nautilus App Server 1, alter the /home/BSD.txt file 
as per details given below:

a. Delete all lines containing word software and save results in /home/BSD_DELETE.txt file. (Please be aware of case sensitivity)

b. Replace all occurrence of word the to their and save resultsin /home/BSD_REPLACE.txt file.

Note: Lets say you are asked to replace word to with from. In that case, make sure not to alter any words containing this string; for example upto, contributor etc.


#Step 1- Connect via SSH to App Server 3
	 ssh banner@stapp03
	
#Step 2- Switch to Root User
	sudo su -

#Step 3- List the existing file and cat the word given in task which need to delete.
    ls -lrt /home/
    cat /home/BSD.txt |grep software

# Note :- As per the task, BSD.txt file should be intact. But using "sed -i" will change the file in place.So if you want to use "sed -i" , make the copy of the BSD.txt to respective
 files and do the changes on newly created files.

Another option is which task required is just apply "sed" on original file and redirect the output to respective files. This wont affect the original place.


#Step 4- Delete all lines containing word software and save results in /home/BSD_DELETE.txt file
    sed '/\<software\>/d' /home/BSD.txt > /home/BSD_DELETE.txt
    cat /home/BSD_DELETE.txt |grep software

#Step 5- Cat the output for the word which going to replace 
    cat /home/BSD.txt |grep the

#Step 6- Replace  all occurrence of word the to their  and redirect to new file
    sed 's/\bthe\b/their/g' /home/BSD.txt > /home/BSD_REPLACE.txt    

#Step 7- Validate the word replaced successfully
    cat /home/BSD_REPLACE.txt |grep the
    cat /home/BSD_REPLACE.txt |grep their


Reference: https://www.nbtechsupport.co.in/2021/06/linux-string-substitute-sed.html


