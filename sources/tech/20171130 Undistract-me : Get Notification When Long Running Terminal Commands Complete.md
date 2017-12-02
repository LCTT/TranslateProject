Undistract-me : Get Notification When Long Running Terminal Commands Complete
============================================================

by [sk][2] · November 30, 2017

![Undistract-me](https://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2-720x340.png)

A while ago, we published how to [get notification when a Terminal activity is done][3]. Today, I found out a similar utility called “undistract-me” that notifies you when long running terminal commands complete. Picture this scenario. You run a command that takes a while to finish. In the mean time, you check your facebook and get so involved in it. After a while, you remembered that you ran a command few minutes ago. You go back to the Terminal and notice that the command has already finished. But you have no idea when the command is completed. Have you ever been in this situation? I bet most of you were in this situation many times. This is where “undistract-me” comes in help.  You don’t need to constantly check the terminal to see if a command is completed or not. Undistract-me utility will notify you when a long running command is completed. It will work on Arch Linux, Debian, Ubuntu and other Ubuntu-derivatives.

#### Installing Undistract-me

Undistract-me is available in the default repositories of Debian and its variants such as Ubuntu. All you have to do is to run the following command to install it.

```
sudo apt-get install undistract-me
```

The Arch Linux users can install it from AUR using any helper programs.

Using [Pacaur][4]:

```
pacaur -S undistract-me-git
```

Using [Packer][5]:

```
packer -S undistract-me-git
```

Using [Yaourt][6]:

```
yaourt -S undistract-me-git
```

Then, run the following command to add “undistract-me” to your Bash.

```
echo 'source /etc/profile.d/undistract-me.sh' >> ~/.bashrc
```

Alternatively you can run this command to add it to your Bash:

```
echo "source /usr/share/undistract-me/long-running.bash\nnotify_when_long_running_commands_finish_install" >> .bashrc
```

If you are in Zsh shell, run this command:

```
echo "source /usr/share/undistract-me/long-running.bash\nnotify_when_long_running_commands_finish_install" >> .zshrc
```

Finally update the changes:

For Bash:

```
source ~/.bashrc
```

For Zsh:

```
source ~/.zshrc
```

#### Configure Undistract-me

By default, Undistract-me will consider any command that takes more than 10 seconds to complete as a long-running command. You can change this time interval by editing /usr/share/undistract-me/long-running.bash file.

```
sudo nano /usr/share/undistract-me/long-running.bash
```

Find “LONG_RUNNING_COMMAND_TIMEOUT” variable and change the default value (10 seconds) to something else of your choice.

 [![](http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-1.png)][7] 

Save and close the file. Do not forget to update the changes:

```
source ~/.bashrc
```

Also, you can disable notifications for particular commands. To do so, find the “LONG_RUNNING_IGNORE_LIST” variable and add the commands space-separated like below.

By default, the notification will only show if the active window is not the window the command is running in. That means, it will notify you only if the command is running in the background Terminal window. If the command is running in active window Terminal, you will not be notified. If you want undistract-me to send notifications either the Terminal window is visible or in the background, you can set IGNORE_WINDOW_CHECK to 1 to skip the window check.

The other cool feature of Undistract-me is you can set audio notification along with visual notification when a command is done. By default, it will only send a visual notification. You can change this behavior by setting the variable UDM_PLAY_SOUND to a non-zero integer on the command line. However, your Ubuntu system should have pulseaudio-utils and sound-theme-freedesktop utilities installed to enable this functionality.

Please remember that you need to run the following command to update the changes made.

For Bash:

```
source ~/.bashrc
```

For Zsh:

```
source ~/.zshrc
```

It is time to verify if this really works.

#### Get Notification When Long Running Terminal Commands Complete

Now, run any command that takes longer than 10 seconds or the time duration you defined in Undistract-me script.

I ran the following command on my Arch Linux desktop.

```
sudo pacman -Sy
```

This command took 32 seconds to complete. After the completion of the above command, I got the following notification.

 [![](http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2.png)][8] 

Please remember Undistract-me script notifies you only if the given command took more than 10 seconds to complete. If the command is completed in less than 10 seconds, you will not be notified. Of course, you can change this time interval settings as I described in the Configuration section above.

I find this tool very useful. It helped me to get back to the business after I completely lost in some other tasks. I hope this tool will be helpful to you too.

More good stuffs to come. Stay tuned!

Cheers!

Resource:

*   [Undistract-me GitHub Repository][1]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/undistract-get-notification-long-running-terminal-commands-complete/

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/jml/undistract-me
[2]:https://www.ostechnix.com/author/sk/
[3]:https://www.ostechnix.com/get-notification-terminal-task-done/
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/11/undistract-me-2.png
