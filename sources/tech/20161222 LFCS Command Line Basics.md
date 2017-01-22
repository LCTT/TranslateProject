LFCS Command Line Basics
=======================

There are quite a few command line basics to cover in this article. We will go over the TeleTYpe (TTY) and a few commands with operators. Be sure to practice all of these and be aware that these are the same for CentOS and Ubuntu unless otherwise noted.

**TTY**

The TTY is used in Linux when there is no Graphical User Interface (GUI) running or when the user is outside of the GUI. TTY is also used when a terminal window is opened, but these are different types of TTY.

There are three types of TTYs:

1.  Physical
2.  Local Pseudo
3.  Remote Pseudo

Basically, each Linux system has around six or seven Physical TTYs. These are accessible by holding down a CTRL+ALT key and pressing F1 through F6 for CentOS and CTRL+ALT and F1 through F7 for Ubuntu.

**NOTE: **Some distros might have a different number of TTYs and different defaults for the GUI. Some distros may have a different key combination of CTRL+F# or ALT+F# to change between the Physical TTYs. When using VirtualBox use the Right CTRL key unless you have changed the Host key.

In CentOS the GUI will be on TTY 1 (CTRL+ALT+F1) and the other Physical TTYs are text based. On Ubuntu the GUI is on TTY 7 (CTRL+ALT+F7) and the other Physical TTYs are text based.

**NOTE:** It is not wise to attempt to load the GUI under another TTY since this can use up a lot of resources, but it is possible.

When Linux starts up, whether CentOS or Ubuntu, the default TTY is opened. If a GUI is installed then it goes to TTY1 for CentOS and TTY7 for Ubuntu. If you open a Terminal window (Pseudo TTY) and use the command 'who' you will see a listing of TTYs in use. An example is shown in Figure 1.

 ![Figure 01.jpg](https://www.linuxforum.com/attachments/figure-01-jpg.93/) 

**FIGURE 1**

In Figure 1 you can see that I am currently logged in to TTY1 (non-GUI). The second line of connections show that I am logged in to the GUI (TTY7) as well as two Pseudo TTYs (PTS/1 and PTS/2). Looking at Figure 2 you can see that the new entry shows a Remote Pseudo TTY (PTS/3). The Remote Pseudo connection is from a system with the IP address of 192.168.0.11.

 ![Figure 02.jpg](https://www.linuxforum.com/attachments/figure-02-jpg.94/) 

**FIGURE 2**

Remote TTY connections can be made with applications such as 'PuTTY' or any SSH Client (if SSH is enabled on the remote Linux system).

If a terminal window has small fonts you can use the keys CTRL+SHIFT and the '+' to enlarge the fonts. Press it multiple times to make it even bigger each time. To shrink it down in size use the CTRL+- to continually make it smaller. To make the terminal font back to the original size press CTRL+0.

**NOTE:** Be aware that the font will only get so large or so small before the key combination will not work anymore.

Hopefully you now understand the various type of TTYs. Let's look at some of the commands which can be used in a TTY.

**Commands**

One of the commands was already discussed previously. The command 'who' is used to show who is logged onto a system.

Another command is 'pwd'. The command 'pwd' stands for 'Print Working Directory'. The command returns the current directory in which you are located. For example, if the terminal prompt is '[jbuse@localhost ~]$' the username is 'jbuse' and the current directory is ~. The tilde (~) designates the user's home folder. The home folder should be '/home/_username_'. The username is the name used to log into the system.

To list the contents of the current folder use the command 'ls'. The 'ls' command stands for List. If no options are specified then the current folder is listed. If you give a folder name then the contents of that folder is listed. For example, to see the contents of the contents of the 'media' folder you would use the command 'ls /media'.

Along with the 'ls' command are a few options we can add to show more detail or specific details. If you wish to see all folder and files, even the hidden ones, use the option '-a'. To see all files and folders in the current directory use the command 'ls -a'. Hidden files and folders will appear with a period in front of the name.

To see a forward slash (/) after each folder name use the option '-F'. A listing of the current folder would be 'ls -F'. The '-F' is used to classify the files by file type. Symbolic links are signified by '@' after the folder name.

You can put the two together to have a command of 'ls -aF'.

**NOTE:** Some options may be of different cases. The options can be case-sensitive.

Another option is the '-l' for a long listing. A sample output is shown in Figure 3\. The folder and file names are listed to the right side. The files are colored white, the folders are dark blue and the symbolic links are light blue. As you can see in Figure 3 the symbolic link 'vtrgb' is linked from '/etc/alternatives/vtrgb'.

 ![Figure 03.jpg](https://www.linuxforum.com/attachments/figure-03-jpg.95/) 

**FIGURE 3**

The first column to the left is the permissions for the file or folder. The first letter is either a 'd' for directory or a '-' for a file. The next three letters show permissions for the owner ('r' – read, 'w' – write and 'x' – execute) followed by the group permissions and permissions for 'others'. The next column of numbers shows the number of links to the file or folder. The next column is the owner name followed by the group name of ownership. The next column is the number of bytes which the file or folder takes up on the storage device. The next three columns are the month, day and year the file was last modified. Finally, the final column is the path name.

So far you have seen that the listing is sorted alphabetically. To reverse the order from 'z to a' and not 'a to z' use the '-r' option. The '-r' or reverse option causes the ls command to reverse the output order.

To list the files by the modified timestamp use the '-t' option. The order is from the most recently modified to the oldest modification date. Of course to reverse the order use both the '-t' and the '-r' together in the command 'ls -tr'.

If you do not like looking at the long number of bytes which the file takes up use the option '-h'. The output will be more readable such as '4.0K' and not '4096'.

To get specific information on a single folder use the option '-d', but the folder must be specified. For example to see the specifics for the folder '/media' use the command 'ls -ld /media'.

Another command to be familiar with is the command 'cat'. The command 'cat' is used to copy a standard input (a file) to the standard output (the screen). Use 'cat' to easily view the contents of a file. For example to see the contents of a file called 'text' use the command 'cat text' if you are in the same folder as the file 'text'. If you are not in the same folder then you must specify the location. For example, if the file 'text' is in the folder '/home/jarret/test/' then the command would be 'cat /home/jarret/test/text'.

Another very useful command is 'man'. The 'man' command is used to view documentation for specific commands. For example, to see the MANual pages for the command 'ls' use the command 'man ls'.

**NOTE:** Remember that on the LFCS exam you have access to the 'man' command and can use it.

Look over these commands and test them out to be familiar with them. Use the 'man' command and look over the commands covered in this article to see what other options are available.

**NOTE:** I tend to use the word 'options' for the characters passed to a command to change its function or output. Some people may use the words 'parameters', 'arguments' and the like. They tend to be interchangeable.

--------------------------------------------------------------------------------

via: https://www.linuxforum.com/threads/lfcs-command-line-basics.3334/

作者：[Jarret][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxforum.com/members/jarret.268/
