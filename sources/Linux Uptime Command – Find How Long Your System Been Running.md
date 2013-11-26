Linux Uptime Command – Find How Long Your System Been Running
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-uptime-command.png)

Information about how long the system has been running may not critical for some people. But for server administrators, it is critical. Servers which running mission critical application must be running as long as possible. Sometimes it must be zero-downtime. So, how can we know information about it?

On Linux operating system, we can use uptime command. You don’t need root privileges to run this command. This command also already installed on Linux system by default.

The syntax is like this :

    $ uptime

You may see an output like this :

![](http://linoxide.com/wp-content/uploads/2013/11/uptime.png)

This information is provided in **/proc/uptime** file. Even the file is text based, but it’s a raw information which is not directly human-readable. That’s why we need uptime command to translate it.

Here’s how to read the information provided by uptime :

### System Time ###

You see at the Figure 1 above, the first information on the left side is **14:04:39**. It shows you the system time in 24 hours format.

### System Uptime ###

The second information is **Up 1004 days, 12:20.** It give you a timeframe how long the system has been running. From the Figure 1, it shows you that the system has been running for 1004 days and 12 hours – 20 minutes. If the system has not pass 24 hours then it will show you only hours and / or minutes timeframe. Take a look at Figure 2 and Figure 3 below. When the system is restarted then the counter will be reset to zero.

![](http://linoxide.com/wp-content/uploads/2013/11/uptime_minutes.png)

![](http://linoxide.com/wp-content/uploads/2013/11/uptime_hours1.png)

### Numbers of Users Logged In ###

The third information is uptime shows you numbers of users logged in. Figure 1 show you that there is **1 user** logged at that time. When there is multiple user logged in, uptime will tell you the numbers.

### Load Average ###

The last information is about the average load of the system. From the Figure 1 again you see numbers **0.25, 0.25, 0.19**. The two decimal point is translated as a percentage. 0.25 means 25% and 0.19 means 19%.

While the sequence 0.25, 0.25, 0.19 represent for the past 1 minutes, 5 minutes and 15 minutes. The lower numbers you get mean the better your system will perform.

That’s the usage of the **uptime** command in daily used. For more detailed information, please refer to uptime manual page by typing **man uptime** in your Linux console.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-uptime-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出