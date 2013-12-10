hyaocuk is translating

7 Tips For Becoming A Linux Terminal Power User
================================================================================
The Linux terminal is much more than merely entering commands into it. If you master the basic tricks, it will assist you in mastering the Bash shell that is used as default on a number of Linux distributions. 

As stated on howtogeek.com, here are some tips for new users as well as advanced users who may have missed out on something along the way-

**1. Tab Completion** – This saves time and is also handy if you’re unsure of a file or command’s exact name. For instance, there’s a file named “really long file name” in the current directory and you wish to delete it. You can type the entire file name, however, you will have to ensure that you escape the space characters properly. In case of multiple files in the current directory which start with the letter r, Bash will not be aware of the one you want.

In the event you have another file named “really very long file name” in the current directory and you hit Tab. Bash will fill in the “really\ “ part for both the files start with that. Post that press Tab again and you’ll find a list of matching file names.

**2. Pipes** – This permits you to transmit the output of a command to another command. In the UNIX philosophy, every program is a small utility that performs one thing well. For instance, the ls command lists out the files in the current directory and the grep command searches its input for a specified term.

You can combine these with pipes (the | character) and search for a file in the current directory. The command given below searches for the word “word”:

    ls | grep word

**3. Wild Cards** - The * (asterisk) character is a wild card for matching anything. For instance, if you want to delete both “really long file name” and “really very long file name” from the current directory, you can run the following command:

    rm really*name

This command deletes all files with file names starting with “really” and ending with “name.” However, in case you ran rm * instead, you would end up deleting every file in the current directory.

**4. Output Redirection** - The > character redirects a command’s output to a file in place of another command. For instance, the following line runs the ls command to list the files in the current directory and in lieu of printing that list to the terminal, it prints to a file named “file1” in the current directory:

    ls > file1

**5. Command History** – Bash memorizes history of the commands you enter into it. The up and down arrow keys can be used to scroll through recent commands used by you. The history command prints out a list of these commands for piping it to grep in order to search for commands used by you recently.

    ~, . & ..

The ~ character also called the tilde is used to show the current user’s home directory. So in lieu of typing cd /home/name for going to your home directory, you can type cd ~. This also functions with relative paths – cd ~/Desktop to go to the current user’s desktop.

In the same way, the . is for the current directory and the .. is for the directory above the current directory. So, cd .. goes up a directory. It functions with relative paths for instance when you are in your Desktop folder and wish to go to the Documents folder, that is in the same directory as the Desktop folder, you can make use of the cd ../Documents command.

**6. Running a Command in the Background** – Bash by default executes every command that is run by you in the current terminal. It’s normally okay but what if you wish to launch an application and maintain utilizing the terminal? By typing firefox for launching Firefox, it will take charge of your terminal and show error messages and other output till you have closed it. You can use the & operator to the end of the command for Bash to execute the program in the backdrop.

    firefox &

**7. Conditional Execution** – Bash can also run two commands sequentially. The second command can only execute when the first command is completed with success. For doing this, you can put both commands on the same line segregated by a &&, or double ampersand. The command given below will wait for five seconds, and start the gnome-screenshot tool:

    sleep 5 && gnome-screenshot 

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=123564

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
