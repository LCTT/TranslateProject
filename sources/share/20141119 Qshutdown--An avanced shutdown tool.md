Qshutdown – An avanced shutdown tool
================================================================================
qshutdown is a Qt program to shutdown/reboot/suspend/hibernate the computer at a given time or after a certain number of minutes. It shows the time until the corresponding request is send to either the Gnome- or KDE-session-manager, to HAL or to DeviceKit and if none of these works the command ‘sudo shutdown -P now' is used. This program may be useful for people who want to work with the computer only for a certain time.

qshutdown will show it self 3 times as a warning if there are less than 70 seconds left. (if 1 Minute or local time +1 Minute was set it’ll appear only once.)

This program uses qdbus to send a shutdown/reboot/suspend/hibernate request to either the gnome- or kde-session-manager, to HAL or to DeviceKit and if none of these works, the command ’sudo shutdown’ will be used (note that when sending the request to HAL or DeviceKit, or the shutdown command is used, the Session will never be saved. If the shutdown command is used, the program will only be able to shutdown and reboot). So if nothing happens when the shutdown- or reboot-time is reached, it means that one lacks the rights for the shutdown command.

In this case one can do the following:

Post the following in a terminal: "EDITOR:nano sudo -E visudo" and add this line: "* ALL = NOPASSWD:/sbin/shutdown" whereas * replaces the username or %groupname.

Configurationfile qshutdown.conf

The maximum Number of countdown_minutes is 1440 (24 hours).The configurationfile (and logfile) is located at ~/.qshutdown

For admins:

With the option Lock_all in qshutdown.conf set to true the user won’t be able to change any settings. If you change the permissions of qshutdown.conf with "sudo chown root -R ~/.qshutdown" and "sudo chmod 744 ~/.qshutdown/qshutdown.conf", the user won’t be able to change anything in the configurationfile.

### Install Qshutdown in Ubuntu ###

Open the terminal and run the following command

    sudo apt-get install qshutdown

### Screenshots ###

![](http://www.ubuntugeek.com/wp-content/uploads/2014/11/12.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2014/11/23.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2014/11/31.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2014/11/41.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/qshutdown-an-avanced-shutdown-tool.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix