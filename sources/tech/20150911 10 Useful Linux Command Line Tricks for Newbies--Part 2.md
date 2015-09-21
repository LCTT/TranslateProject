10 Useful Linux Command Line Tricks for Newbies – Part 2
================================================================================
I remember when I first started using Linux and I was used to the graphical interface of Windows, I truly hated the Linux terminal. Back then I was finding the commands hard to remember and proper use of each one of them. With time I realised the beauty, flexibility and usability of the Linux terminal and to be honest a day doesn’t pass without using. Today, I would like to share some useful tricks and tips for Linux new comers to ease their transition to Linux or simply help them learn something new (hopefully).

![10 Linux Commandline Tricks for Newbies](http://www.tecmint.com/wp-content/uploads/2015/09/10-Linux-Commandline-Tricks.jpg)

10 Linux Commandline Tricks – Part 2

- [5 Interesting Command Line Tips and Tricks in Linux – Part 1][1]
- [5 Useful Commands to Manage Linux File Types – Part 3][2]

This article intends to show you some useful tricks how to use the Linux terminal like a pro with minimum amount of skills. All you need is a Linux terminal and some free time to test these commands.

### 1. Find the right command ###

Executing the right command can be vital for your system. However in Linux there are so many different command lines that they are often hard to remember. So how do you search for the right command you need? The answer is apropos. All you need to run is:

    # apropos <description>

Where you should change the “description” with the actual description of the command you are looking for. Here is a good example:

    # apropos "list directory"
    
    dir (1) - list directory contents
    ls (1) - list directory contents
    ntfsls (8) - list directory contents on an NTFS filesystem
    vdir (1) - list directory contents

On the left you can see the commands and on the right their description.

### 2. Execute Previous Command ###

Many times you will need to execute the same command over and over again. While you can repeatedly press the Up key on your keyboard, you can use the history command instead. This command will list all commands you entered since you launched the terminal:

    # history
    
        1  fdisk -l
        2  apt-get install gnome-paint
        3  hostname tecmint.com
        4  hostnamectl tecmint.com
        5  man hostnamectl 
        6  hostnamectl --set-hostname tecmint.com
        7  hostnamectl -set-hostname tecmint.com
        8  hostnamectl set-hostname tecmint.com
        9  mount -t "ntfs" -o
       10  fdisk -l
       11  mount -t ntfs-3g /dev/sda5 /mnt
       12  mount -t rw ntfs-3g /dev/sda5 /mnt
       13  mount -t -rw ntfs-3g /dev/sda5 /mnt
       14  mount -t ntfs-3g /dev/sda5 /mnt
       15  mount man
       16  man mount
       17  mount -t -o ntfs-3g /dev/sda5 /mnt
       18  mount -o ntfs-3g /dev/sda5 /mnt
       19  mount -ro ntfs-3g /dev/sda5 /mnt
       20  cd /mnt
       ...

As you will see from the output above, you will receive a list of all commands that you have ran. On each line you have number indicating the row in which you have entered the command. You can recall that command by using:

    !#

Where # should be changed with the actual number of the command. For better understanding, see the below example:

    !501

Is equivalent to:

    # history

### 3. Use midnight Commander ###

If you are not used to using commands such cd, cp, mv, rm than you can use the midnight command. It is an easy to use visual shell in which you can also use mouse:

![Midnight Commander in Action](http://www.tecmint.com/wp-content/uploads/2015/09/mc-command.jpg)

Midnight Commander in Action

Thanks to the F1 – F12 keys, you can easy perform different tasks. Simply check the legend at the bottom. To select a file or folder click the “Insert” button.

In short the midnight command is called “mc“. To install mc on your system simply run:

    $ sudo apt-get install mc        [On Debian based systems]

----------

    # yum install mc                 [On Fedora based systems]

Here is a simple example of using midnight commander. Open mc by simply typing:

    # mc

Now use the TAB button to switch between windows – left and right. I have a LibreOffice file that I will move to “Software” folder:

![Midnight Commander Move Files](http://www.tecmint.com/wp-content/uploads/2015/09/Midnight-Commander-Move-Files.jpg)

Midnight Commander Move Files

To move the file in the new directory press F6 button on your keyboard. MC will now ask you for confirmation:

![Move Files to New Directory](http://www.tecmint.com/wp-content/uploads/2015/09/Move-Files-to-new-Directory.png)

Move Files to New Directory

Once confirmed, the file will be moved in the new destination directory.

Read More: [How to Use Midnight Commander File Manager in Linux][4]

### 4. Shutdown Computer at Specific Time ###

Sometimes you will need to shutdown your computer some hours after your work hours have ended. You can configure your computer to shut down at specific time by using:

    $ sudo shutdown 21:00

This will tell your computer to shut down at the specific time you have provided. You can also tell the system to shutdown after specific amount of minutes:

    $ sudo shutdown +15

That way the system will shut down in 15 minutes.

### 5. Show Information about Known Users ###

You can use a simple command to list your Linux system users and some basic information about them. Simply use:

    # lslogins

This should bring you the following output:

    UID USER PWD-LOCK PWD-DENY LAST-LOGIN GECOS
    0 root 0 0 Apr29/11:35 root
    1 bin 0 1 bin
    2 daemon 0 1 daemon
    3 adm 0 1 adm
    4 lp 0 1 lp
    5 sync 0 1 sync
    6 shutdown 0 1 Jul19/10:04 shutdown
    7 halt 0 1 halt
    8 mail 0 1 mail
    10 uucp 0 1 uucp
    11 operator 0 1 operator
    12 games 0 1 games
    13 gopher 0 1 gopher
    14 ftp 0 1 FTP User
    23 squid 0 1
    25 named 0 1 Named
    27 mysql 0 1 MySQL Server
    47 mailnull 0 1
    48 apache 0 1 Apache
    ...

### 6. Search for Files ###

Searching for files can sometimes be not as easy as you think. A good example for searching for files is:

    # find /home/user -type f

This command will search for all files located in /home/user. The find command is extremely powerful one and you can pass more options to it to make your search even more detailed. If you want to search for files larger than given size, you can use:

    # find . -type f -size 10M

The above command will search from current directory for all files that are larger than 10 MB. Make sure not to run the command from the root directory of your Linux system as this may cause high I/O on your machine.

One of the most frequently used combinations that I use find with is “exec” option, which basically allows you to run some actions on the results of the find command.

For example, lets say that we want to find all files in a directory and change their permissions. This can be easily done with:

    # find /home/user/files/ -type f -exec chmod 644 {} \;

The above command will search for all files in the specified directory recursively and will executed chmod command on the found files. I am sure you will find many more uses on this command in future, for now read [35 Examples of Linux ‘find’ Command and Usage][5].

### 7. Build Directory Trees with one Command ###

You probably know that you can create new directories by using the mkdir command. So if you want to create a new folder you will run something like this:

    # mkdir new_folder

But what, if you want to create 5 subfolders within that folder? Running mkdir 5 times in a row is not a good solution. Instead you can use -p option like that:

    # mkdir -p new_folder/{folder_1,folder_2,folder_3,folder_4,folder_5}

In the end you should have 5 folders located in new_folder:

    # ls new_folder/
    
    folder_1 folder_2 folder_3 folder_4 folder_5

### 8. Copy File into Multiple Directories ###

File copying is usually performed with the cp command. Copying a file usually looks like this:

    # cp /path-to-file/my_file.txt /path-to-new-directory/

Now imagine that you need to copy that file in multiple directories:

    # cp /home/user/my_file.txt /home/user/1
    # cp /home/user/my_file.txt /home/user/2
    # cp /home/user/my_file.txt /home/user/3

This is a bit absurd. Instead you can solve the problem with a simple one line command:

    # echo /home/user/1/ /home/user/2/ /home/user/3/ | xargs -n 1  cp /home/user/my_file.txt

### 9. Deleting Larger Files ###

Sometimes files can grow extremely large. I have seen cases where a single log file went over 250 GB large due to poor administrating skills. Removing the file with rm utility might not be sufficient in such cases due to the fact that there is extremely large amount of data that needs to be removed. The operation will be a “heavy” one and should be avoided. Instead, you can go with a really simple solution:

    # > /path-to-file/huge_file.log

Where of course you will need to change the path and the file names with the exact ones to match your case. The above command will simply write an empty output to the file. In more simpler words it will empty the file without causing high I/O on your system.

### 10. Run Same Command on Multiple Linux Servers ###

Recently one of our readers asked in our [LinuxSay forum][6], how to execute single command to multiple Linux boxes at once using SSH. He had his machines IP addresses looking like this:

    10.0.0.1
    10.0.0.2
    10.0.0.3
    10.0.0.4
    10.0.0.5

So here is a simple solution of this issue. Collect the IP addresses of the servers in a one file called list.txt one under other just as shown above. Then you can run:

    # for in $i(cat list.txt); do ssh user@$i 'bash command'; done

In the above example you will need to change “user” with the actual user with which you will be logging and “bash command” with the actual bash command you wish to execute. The method is better working when you are [using passwordless authentication with SSH key][7] to your machines as that way you will not need to enter the password for your user over and over again.  

Note that you may need to pass some additional parameters to the SSH command depending on your Linux boxes setup.

### Conclusion ###

The above examples are really simple ones and I hope they have helped you to find some of the beauty of Linux and how you can easily perform different operations that can take much more time on other operating systems.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-useful-linux-command-line-tricks-for-newbies/

作者：[Marin Todorov][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/marintodorov89/
[1]:http://www.tecmint.com/5-linux-command-line-tricks/
[2]:http://www.tecmint.com/manage-file-types-and-set-system-time-in-linux/
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/midnight-commander-a-console-based-file-manager-for-linux/
[5]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[6]:http://www.linuxsay.com/
[7]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/