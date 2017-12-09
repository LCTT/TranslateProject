translating by lujun9972
Executing Commands and Scripts at Reboot & Startup in Linux
======
There might arise a need to execute a command or scripts at reboot or every time when we start our system. So how can we do that, in this tutorial we are going to discuss just that. We will discuss how we can make our CentOS/RHEL and Ubuntu systems to execute a command or scripts at reboot or at system startup using two different methods. Both the methods are tested and works just fine,

### Method 1 – Using rc.local

In this method, we will use ‘rc.local’ file located in ‘/etc/’ to execute our scripts and commands at startup. We will make an entry to execute the script in the file & every time when our system starts, the script will be executed.

But we will first provide the permissions to make the file /etc/rc.local executable,

$ sudo chmod +x /etc/rc.local

Next we will add the script to be executed in the file,

$ sudo vi /etc/rc.local

& at the bottom of file, add the entry

sh /root/script.sh &

Now save the file & exit. Similarly we can execute a command using rc.local file but we need to make sure that we mention the full path of the command. To locate the full command path, run

$ which command

For example,

$ which shutter

/usr/bin/shutter

For CentOS, we use file ‘/etc/rc.d/rc.local’ instead of ‘/etc/rc.local’. We also need to make this file executable before adding any script or command to the file.

Note:- When executing a script at startup, make sure that the script ends with ‘exit 0’.

( Recommended Read : )

### Method 2 – Crontab method

This method is the easiest method of the two methods. We will create a cron job that will wait for 90 seconds after system startup & then will execute the command or script on the system.

To create a cron job, open terminal & run

$ crontab -e

& enter the following line ,

@reboot ( sleep 90 ; sh \location\script.sh )

where \location\script.sh is the location of script to be executed.

So this was our tutorial on how to execute a script or a command when system starts up. Please leave your queries, if any , using the comment box below

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/executing-commands-scripts-at-reboot/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
