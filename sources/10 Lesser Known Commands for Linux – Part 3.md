Translating-------------geekpi


10 Lesser Known Commands for Linux – Part 3
================================================================================
![](http://www.tecmint.com/wp-content/uploads/2013/11/10-Lesser-Known-Linux-Commands.png)

We have come up with the third article of this series which includes few other lesser known Linux commands, worth knowing. May be you are already aware of these commands, no doubt you are an experienced Linux user and loves exploration.

### 22. ^foo^bar Command ###

Run the last command with modification, in a single instance. Suppose I need to run a command ‘**ls -l**‘ to long list the content of a directory say ‘**Desktop**’. Accidentally, you type ‘**lls -l**‘. So now you will have to retype the whole command or edit the previous command using navigation key. That is painful when the command is long.

    avi@localhost:~/Desktop$ lls -l 
    bash: lls: command not found


    avi@localhost:~/Desktop$ ^lls^ls 

    ls -l 
    total 7489440 

    drwxr-xr-x 2 avi  avi       36864 Nov 13  2012 101MSDCF 
    -rw-r--r-- 1 avi  avi      206833 Nov  5 15:27 1.jpg 
    -rw-r--r-- 1 avi  avi      158951 Nov  5 15:27 2.jpg 
    -rw-r--r-- 1 avi  avi       90624 Nov  5 12:59 Untitled 1.doc

**Note**: In the above replacement we used “**^typo(to be replaced)^original_command**”. This command may be very dangerous if you knowingly or unknowingly replaced the typo with system command or anything risky say **rm -rf**.

### 23. > file.txt Command ###

This command flush the contents of a file without the need of removing and creating the same file again. This command is very useful in scripting language when we need an output or log on the same file again and again.

I have a file say ‘**test.txt**’ on my ‘**Desktop**‘ with a lot of text.

    avi@localhost:~/Desktop$ cat test.txt 
    
    Linux 
    GNU 
    Debian 
    Fedora 
    kali 
    ubuntu 
    git 
    Linus 
    Torvalds


    avi@localhost:~/Desktop$ > test.txt 
    avi@localhost:~/Desktop$ cat test.txt

**Note**: Again, this command can be dangerous, don’t ever try to flush the contents of a system file or configuration file. If you do so, you will be in serious trouble.

### 24. at Command ###

The ‘**at**‘ command is similar to [cron command][1] and can be used for scheduling a task or command to run at specified time.

    avi@localhost:~/Desktop$ echo "ls -l > /dev/pts/0" | at 14:012
    
    OR
    
    avi@localhost:~/Desktop$ echo "ls -l > /dev/pts/0" | at 2:12 PM

**Sample Output**

    -rw-r--r-- 1 avi  avi      220492 Nov  1 13:49 Screenshot-1.png 
    -rw-r--r-- 1 root root        358 Oct 17 10:11 sources.list 
    -rw-r--r-- 1 avi  avi  4695982080 Oct 10 20:29 squeeze.iso 
    ..
    ..
    -rw-r--r-- 1 avi  avi       90624 Nov  5 12:59 Untitled 1.doc 
    -rw-r--r-- 1 avi  avi       96206 Nov  5 12:56 Untitled 1.odt 
    -rw-r--r-- 1 avi  avi        9405 Nov 12 23:22 Untitled.png

**Note**: echo “**ls -l**” : This string echo’s the command (here **ls -l**) on standard terminal. You can replace ‘**ls -l**‘ with any command of your need and choice.

    > : redirects the output

The **/dev/pts/0** : This is the output device and/or file, where output is sought, here the output is at terminal.

In my case, my **tty** is at **/dev/pts/0**, at that time. You can check your **tty** by running command **tty**.

    avi@localhost:~/Desktop$ tty 
    
    /dev/pts/0

**Note**: The ‘**at**‘ command execute the task as soon as the system clock matches the specified time.

### 25. du -h –max-depth=1 Command ###

The below command outputs the size of sub-folders within the current directory, in human readable format.

    avi@localhost:/home/avi/Desktop# du -h --max-depth=1 
    
    38M	./test 
    1.1G	./shivji 
    42M	./drupal 
    6.9G	./101MSDCF 
    16G	.

**Note**: The above command can be very much useful in [checking system disk usage][2].

### 26. expr Command ###

The ‘**expr**‘ command is not that much lesser known command. This command is very much useful in carrying out simple mathematical calculation in terminal.

    avi@localhost:/home/avi/Desktop# expr 2 + 3 
    5
    
    avi@localhost:/home/avi/Desktop# expr 6 – 3 
    3
    
    avi@localhost:/home/avi/Desktop# expr 12 / 3 
    4
    
    avi@localhost:/home/avi/Desktop# expr 2 \* 9 
    18

### 27. look Command ###

Check for words from English dictionary in case of confusion, from the terminal itself. Viz., I am a bit confused if the spelling is carrier or carieer.

avi@localhost:/home/avi/Documents# look car 

    Cara 
    Cara's 
    …
    ... 
    carps 
    carpus 
    carpus's 
    carrel 
    carrel's 
    carrels 
    carriage 
    carriage's 
    carriages 
    carriageway 
    carriageway's 
    carried 
    carrier 
    carrier's 
    carriers 
    carries 
    …
    ... 
    caryatids

The above command showed all the words from dictionary starting with string ‘car’. I got what I was searching for.

### 28. yes Command ###

Another command which is not used frequently on regular basis, normally but is very useful in scripting language and for system Administrators.

This command continues to print a given string, till interrupt instruction is given by you.

    avi@localhost:~/Desktop$ yes "Tecmint is one of the best site dedicated to Linux, how to" 
    
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    …
    …
    ...
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to

### 29. factor Command ###

The factor command is actually a command of mathematical origin. This command outputs all the factors of a given number.

    avi@localhost:~/Desktop$ factor 22 
    22: 2 11
    
    avi@localhost:~/Desktop$ factor 21 
    21: 3 7
    
    avi@localhost:~/Desktop$ factor 11 
    11: 11

### 30. ping -i 60 -a IP_address ###

All of us use ping command to check is server is live or not. And I usually ping google, to check if I am connected to internet or not.

It is sometimes irritating, when you wait and keep watching your terminal to get reply of ping command or say, wait for server to get connected.

How about an audible sound as soon as the server comes live.

    avi@localhost:~/Desktop$ ping -i 60 -a www.google.com 
    
    PING www.google.com (74.125.200.103) 56(84) bytes of data. 
    64 bytes from www.google.com (74.125.200.103): icmp_req=1 ttl=44 time=105 ms 
    64 bytes from 74.125.200.103: icmp_req=2 ttl=44 time=281 ms

Let me tell you one thing, before you report that the command didn’t return any audible sound. Make sure your system audio is not mute, sound theme must be enabled in ‘**sound preferences**‘ and make sure ‘**Enable window and window sound**‘ is checked.

### 31. tac Command ###

This command is very interesting which prints the content of a text file in **reverse order**, i.e., from last line to first line.

I have a text file 35.txt in my Documents directory, under home folder. Checking it’s content using [cat command][3].

    avi@localhost:~/Documents$ cat 35.txt

**Sample Output**

> 1. Linux is built with certain powerful tools, which are unavailable in windows. 
> 2. One of such important tool is Shell Scripting. Windows however comes with such a tool but as usual it is much weak as compared to it's Linux Counterpart. 
> 3. Shell scripting/programming makes it possible to execute command(s), piped to get desired output in order to automate day-to-day usages.

Now reverse the content of file using tac command.

    avi@localhost:~/Documents$ tac 35.txt

**Sample Output**

> 3. Shell scripting/programming makes it possible to execute command(s), piped to get desired output in order to automate day-to-day usages. 
> 2. One of such important tool is Shell Scripting. Windows however comes with such a tool but as usual it is much weak as compared to it's Linux Counterpart. 
> 1. Linux is built with certain powerful tools, which are unavailable in windows.

That’s all for now. If you are aware of other lesser known Linux commands, you can put a comment, so that we can include those in our future articles.

Don’t forget to provide us with your value-able comment. I’ll be soon coming with another interesting article, very soon. Till then stay tuned and connected to **Tecmint**.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-commands-for-linux-part-3/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[2]:http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[3]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/