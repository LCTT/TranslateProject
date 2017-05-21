How to Delete HUGE (100-200GB) Files in Linux
============================================================

by [Aaron Kili][11] | Published: May 11, 2017 | Last Updated: May 11, 2017

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][12] | [4 Free Shell Scripting eBooks][13]

Usually, to [delete/remove a file from Linux terminal][1], we use the rm command (delete files), shred command (securely delete a file), wipe command (securely erase a file) or secure-deletion toolkit (a collection of [secure file deletion tools][2]).

We can use any of the above utilities to deal with relatively small files. What if we want to delete/remove a huge file/directory say of about 100-200GB. This may not be as easy as it seems, in terms of the time taken to remove the file (I/O scheduling) as well as the amount of RAM consumed while carrying out the operation.

In this tutorial, we will explain how to efficiently and reliably delete huge files/directories in Linux.

**Suggested Read:** [5 Ways to Empty or Delete a Large File Content in Linux][3]

The main aim here is to use a technique that will not slow down the system while removing a huge file, resulting to reasonable I/O. We can achieve this using the ionice command.

### Deleting HUGE (200GB) Files in Linux Using ionice Command

ionice is a useful program which sets or gets the I/O scheduling class and priority for another program. If no arguments or just `-p` is given, ionice will query the current I/O scheduling class and priority for that process.

If we give a command name such as rm command, it will run this command with the given arguments. To specify the [process IDs of running processes][4] for which to get or set the scheduling parameters, run this:

```
# ionice -p PID
```

To specify the name or number of the scheduling class to use (0 for none, 1 for real time, 2 for best-effort, 3 for idle) the command below.

This means that rm will belong to idle I/O class and only uses I/O when any other process does not need it:

```
---- Deleting Huge Files in Linux -----
# ionice -c 3 rm /var/logs/syslog
# ionice -c 3 rm -rf /var/log/apache
```

If there won’t be much idle time on the system, then we may want to use the best-effort scheduling class and set a low priority like this:

```
# ionice -c 2 -n 6 rm /var/logs/syslog
# ionice -c 2 -n 6 rm -rf /var/log/apache
```

Note: To delete huge files using a secure method, we may use the shred, wipe and various tools in the secure-deletion toolkit mentioned earlier on, instead of rm command.

**Suggested Read:** [3 Ways to Permanently and Securely Delete Files/Directories’ in Linux][5]

For more info, look through the ionice man page:

```
# man ionice 
```

That’s it for now! What other methods do you have in mind for the above purpose? Use the comment section below to share with us.


--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: https://www.tecmint.com/delete-huge-files-in-linux/

作者：[Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[2]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[3]:https://www.tecmint.com/empty-delete-file-content-linux/
[4]:https://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[5]:https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/
[6]:https://www.tecmint.com/delete-huge-files-in-linux/#
[7]:https://www.tecmint.com/delete-huge-files-in-linux/#
[8]:https://www.tecmint.com/delete-huge-files-in-linux/#
[9]:https://www.tecmint.com/delete-huge-files-in-linux/#
[10]:https://www.tecmint.com/delete-huge-files-in-linux/#comments
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/
