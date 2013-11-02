10 Lesser Known Linux Commands – Part 2
================================================================================
Continuing the last conversation from [11 Lesser Known Useful Linux Commands – Part I][1]（注：此文已经被其他网站翻译，链接：[http://www.searchsv.com.cn/showcontent_77595.htm][2]或者：[http://www.oschina.net/translate/11-lesser-known-useful-linux-commands][5]) here in this article we will be focusing on other lesser known Linux commands, that will prove to be very much useful in managing Desktop and Server.

![](http://www.tecmint.com/wp-content/uploads/2013/10/10-Lesser-Known-Commands.png)

*10 Lesser Known Linux Commands*

### 12. <space> Command ###

Every piece of command you type in terminal gets recorded in the **history** and can be retried using **history** command.

How about cheating [history command][2]? Yeah you can do it and its very easy. Just put one or more white space before typing a command in terminal and your command wont be recorded.

Lets give it a try, we will try five common Linux commands (say** ls, pwd, uname, echo “hi”** and **who**) in terminal after one white space and check if these commands are docked in history or not.

    avi@localhost:~$  ls
    avi@localhost:~$  pwd
    avi@localhost:~$  uname
    avi@localhost:~$  echo “hi”
    avi@localhost:~$  who

Now run ‘**history**‘ command to see whether these above executed commands are recorded or not.

    avi@localhost:~$ history
    
       40  cd /dev/ 
       41  ls 
       42  dd if=/dev/cdrom1 of=/home/avi/Desktop/squeeze.iso 
       43  ping www.google.com 
       44  su

You see our last executed commands are not logged. we can also cheat history by using an alternate command ‘**cat | bash**‘ of-course without quotes, in the same way as above.

### 13. stat Command ###

The **stat** command in Linux displays the status information of a file or filesystem. The **stat** shows a whole lot of information about the file which name is passed as argument. Status Information includes file **Size, Blocks, Access Permission, Date-time** of file last access, **Modify, change**, etc.

    avi@localhost:~$ stat 34.odt 
    
      File: `34.odt' 
      Size: 28822 	Blocks: 64 IO Block: 4096   regular file 
    Device: 801h/2049d	Inode: 5030293 Links: 1 
    Access: (0644/-rw-r--r--)  Uid: ( 1000/ avi)   Gid: ( 1000/ avi) 
    Access: 2013-10-14 00:17:40.000000000 +0530 
    Modify: 2013-10-01 15:20:17.000000000 +0530 
    Change: 2013-10-01 15:20:17.000000000 +0530

### 14. <alt>. and <esc>. ###

The above key combination is not actually a command but a tweak which put the last command argument at prompt, in the order of last entered command to previous entered command. Just press and hold ‘**Alt**‘ or ‘**Esc**‘ and continue pressing ‘**.**‘.

### 15. pv command ###

You might have seen simulating text in **Movies** specially **Hollywood Movies**, where the text appears as if it is being typed in the Real time. You can echo any kind of text and output in simulating fashion using ‘**pv**‘ command, as pipelined above. The **pv** command might not be installed in your system, and you have to **apt** or **yum** the required packages to install ‘**pv**‘ into your box.

    root@localhost:# echo "Tecmint [dot] com is the world's best website for qualitative Linux article" | pv -qL 20

**Sample Outpit**

    Tecmint [dot] com is the world's best website for qualitative Linux article

### 16. mount | column -t ###

The above command shows the list of all the mounted filesystem in a nice formatting with specification.

    avi@localhost:~$ mount | column -t

**Sample Outpit**

    /dev/sda1on  / type  ext3 (rw,errors=remount-ro) 
    tmpfson  /lib/init/rw  type  tmpfs(rw,nosuid,mode=0755) 
    proc on  /proc type  proc (rw,noexec,nosuid,nodev) 
    sysfson  /sys  type  sysfs(rw,noexec,nosuid,nodev) 
    udev on  /dev  type  tmpfs(rw,mode=0755) 
    tmpfson  /dev/shm  type  tmpfs(rw,nosuid,nodev) 
    devpts   on  /dev/pts  type  devpts   (rw,noexec,nosuid,gid=5,mode=620) 
    fusectl  on  /sys/fs/fuse/connections  type  fusectl  (rw) 
    binfmt_misc  on  /proc/sys/fs/binfmt_misc  type  binfmt_misc  (rw,noexec,nosuid,nodev) 
    nfsd on  /proc/fs/nfsd type  nfsd (rw)

### 17. Ctr+l command ###

Before going further, let me ask you how you clear your terminal. Hmmm! You type “**clear**” at prompt. Well the above command perform the action of cleaning your terminal all at a once. Just press “**Ctr+l**” and see how it clears your terminal all at once.

### 18. curl command ###

How about checking your **unread mail** from the **command line**. This command is very useful for those who work on headless server. Again it asks for password at run time and you need not hard code your password in the above line, which is otherwise a security risk.

    avi@localhost:~$ curl -u avishek1210@gmail.com --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if //; print "$2\n" if /<(title|name)>(.*)<\/\1>/;'

**Sample Outpit**

    Enter host password for user 'avishek1210@gmail.com': 
    Gmail - Inbox for avishek1210@gmail.com 
    People offering cars in Delhi - Oct 26 
    	Quikr Alerts 
    another dependency question 
    	Chris Bannister 
    	Ralf Mardorf 
    	Reco 
    	Brian 
    	François Patte 
    	Curt 
    	Siard 
    	berenger.morel 
    Hi Avishek - Download your Free MBA Brochure Now... 
    	Diya 
    ★Top Best Sellers Of The Week, Take Your Pick★ 
    	Timesdeal 
    aptitude misconfigure? 
    	Glenn English 
    Choosing Debian version or derivative to run Wine when resource poor 
    	Chris Bannister 
    	Zenaan Harkness 
    	Curt 
    	Tom H 
    	Richard Owlett 
    	Ralf Mardorf 
    	Rob Owens

### 19. screen Command ###

The **screen** command makes it possible to detach a long running process from a session that can again be reattached, as and when required which provides flexibility in command execution.

To run a process (long) we generally execute as

    avi@localhost:~$ ./long-unix-script.sh

Which lacks flexibility and needs the user to continue with the current session, however if we execute the above command as.

    avi@localhost:~$ screen ./long-unix-script.sh

It can be **de-attached** or **re-attached** in different sessions. When a command is executing press “**Ctrl + A**” and then “**d”** to **de-attach**. To attach run.

    avi@localhost:~$ screen -r 4980.pts-0.localhost

**Note**: Here, the later part of this command is **screen id**, which you can get using ‘**screen -ls**‘ command. To know more about ‘**screen command**‘ and their usage, please read our article that shows some useful [10 screen commands with examples][4].

### 20. file ###

No! the above command is not a typo. ‘**file**‘ is a command which gives you information about the type of file.

    avi@localhost:~$ file 34.odt
    34.odt: OpenDocument Text

### 21. id ###

The above command print real and effective **user** and **group** ids.

    avi@localhost:~$ id

**Sample Output**

    uid=1000(avi) gid=1000(avi) 
    groups=1000(avi),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),109(netdev),111(bluetooth),117(scanner)

That’s all for now. Seeing the success of last article of this series and this very article, I’ll be coming with another part of this article containing several other **Lesser Known Linux** commands very soon. Till then **Stay Tuned** and connected to **Tecmint**. Don’t Forget to provide us with your **value-able Feedback** in **Comments**.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-linux-commands-part-2/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/11-lesser-known-useful-linux-commands/
[2]:http://www.searchsv.com.cn/showcontent_77595.htm
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/
[5]:http://www.oschina.net/translate/11-lesser-known-useful-linux-commands