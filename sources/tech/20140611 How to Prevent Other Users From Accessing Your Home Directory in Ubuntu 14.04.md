Translating by GOLinux
How to Prevent Other Users From Accessing Your Home Directory in Ubuntu 14.04
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/00_lead_image_home_directory.png)

If you share your Ubuntu machine with other people, you probably have multiple users set up, thinking that the other users log into their own accounts and only have access to their own home directories. However, by default, any user can access any home directory.

When you add a new user in Ubuntu, the adduser utility creates a new home directory for the new account. By default, the new home directory is placed in the /home/ directory on the root followed by the username. For example, /home/lori. User home directories in Ubuntu are created with world read/execute permissions, giving all other users on the system rights to read the contents of other users’ home directories. See our article for more information about [how file permissions work in Linux][1].

**NOTE**: When we say to type something in this article and there are quotes around the text, DO NOT type the quotes, unless we specify otherwise.

You can easily change the permissions for your home directory to protect your private files. To check the permissions on your home directory, press Ctrl + Alt + T to open a Terminal window. Type the following line at the prompt and press Enter. Replace “<username>” with your own username.

    ls –ld /home/lori

**NOTE**: The command contains only lowercase L’s not the number 1.

At the beginning of the line, the permissions for the file are listed. As said in our [article][1] about Linux permissions:

> “The r stands for “read,” the w stands for “write,” and the x stands for “execute.” Directories will start with a “d” instead of a “-“. You’ll also notice that there are 10 spaces which hold value. You can ignore the first, and then there are 3 sets of 3. The first set is for the owner, the second set is for the group, and the last set is for the world.”

So, the home directory listed below has read, write, and execute permissions for the owner and read and execute permission for the group and world.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/01_permissions_for_home_folder.png)

To change these permissions, type the following line at the prompt and press Enter.

    sudo chmod 0750 /home/lori

Type your password when prompted and press Enter.

**NOTE**: The chmod command uses octal numbers as one way to indicate permissions. Our [article][1] about Linux file permissions uses a different method that requires more steps but may be easier to understand. Using the octal numbers to specify permissions is a quicker method. Use whichever method with which you are more comfortable. To learn about using octal numbers to set permissions, see this [article][2].

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/02_changing_permissions_for_home_folder.png)

Press the up arrow twice to use the “ls –ld /home/<username>” command again to check the permissions. Notice that the permissions for world are all dashes (-). That means that the world cannot read, write, or execute anything in your home directory.

However, users in the same group as you can read and execute files and folders in your home directory. If you don’t want anyone else but yourself to have access to your home directory, enter “0700” as the numbers in the chmod command.

**NOTE**: For more information about managing users and groups in Linux, see our [article][3].

To close the terminal window, type “exit” at the prompt and press Enter.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/03_new_permissions.png)

Now, when other users on the system try to access your home directory, the following dialog box displays.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/04_location_could_not_be_displayed.png)

You can also set up Ubuntu to use specific permissions when setting up the home directory for a new user you are creating. To do this, you need to edit the adduser configuration file. To do this, type the following command at the prompt and press Enter.

    gksudo gedit /etc/adduser.conf

We are using gedit to edit the file. You can use a different text editor if you want.

NOTE: The gksudo command is like the sudo command but is used to run graphical programs as root. The sudo command is used to run command line programs as root.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/05_opening_gedit_as_root.png)

Enter your password in the Password edit box on the dialog box that displays and press Enter or click OK.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/06_entering_password.png)

Scroll down to the DIR_MODE command in the adduser.conf file. The number set is “0755” by default. Change it to reflect the  different types of permissions (r, w, x) you want to grant to the different types of users (owner, group, world), such as “0750” or “0700” as discussed earlier. Click Save.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/07_changing_dir_mode.png)

Close gedit by selecting Quit from the File menu. You can also click the X button in the upper-left corner of the window to close gedit.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/08_closing_gedit.png)

Close the Terminal window by clicking the X in the upper-left corner of the window.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/09_closing_terminal_window_with_x.png)

Now, the files in your home directory will remain private. Just remember that, if there are other users in the same group as you, you might want to take away the permissions for both group and world for your home directory.

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/190084/how-to-prevent-other-users-from-accessing-your-home-directory-in-ubuntu-14.04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/67987/htg-explains-how-do-linux-file-permissions-work/
[2]:http://www.linux.org/threads/file-permissions-chmod.4094/
[3]:http://www.howtogeek.com/howto/36845/the-beginners-guide-to-managing-users-and-groups-in-linux/
