translating---geekpi

Show a Custom Message to Users Before Linux Server Shutdown
============================================================


In a previous article, we explained the [difference between shutdown, poweroff, halt and reboot][3] Linux commands, where we uncovered what these mentioned commands actually do when you execute them with various options.

This article will show you how to send a custom message to all system users before shutting down a Linux server.

**Suggested Read:** [tuptime – Shows Historical and Statistical Running Time of Linux Systems][4]

As a system administrator, before you can shut down a server, you may want to send system users a message alerting them that the system is going. By default, the shutdown command broadcasts a message to other system users as shown in the screenshot below:

```
# shutdown 13:25
```
Linux Shutdown Broadcast Message
```
Shutdown scheduled for Fri 2017-05-12 13:25:00 EAT, use 'shutdown -c' to cancel.
Broadcast message for root@tecmint (Fri 2017-05-12 13:23:34 EAT):
The system is going down for power-off at Fri 2017-05-12 13:25:00 EAT!
```

To send a custom message to other system users before an in line shutdown, run the command below. In this example, the shutdown will happen after two minutes from the time of command execution:

```
# shutdown 2 The system is going down for required maintenance. Please save any important work you are doing now!
```
 [![Linux System Shutdown Message](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-System-Shutdown-Message.png)][5] 

Linux System Shutdown Message

Supposing you have certain critical system operations such as scheduled system backups or updates to be executed at a time the system would be down, you can cancel the shutdown using the `-c` switch as shown below and initiate it at a later time after such operations have been performed:

```
# shutdown -c
```
Linux Shutdown Cancel Message
```
Shutdown scheduled for Fri 2017-05-12 14:10:22 EAT, use 'shutdown -c' to cancel.
Broadcast message for root@tecmint (Fri 2017-05-14 :10:27 EAT):
The system shutdown has been cancelled at Fri 2017-05-12 14:11:27 EAT!
```

Additionally, learn how to [auto execute commands/scripts during reboot or startup][6] using simple and traditional methods in Linux.

Don’t Miss:

1.  [Managing System Startup Process and Services (SysVinit, Systemd and Upstart)][1]

2.  [11 Cron Scheduling Task Examples in Linux][2]

Now you know how to send custom messages to all other system users before a system shutdown. Are there any ideas you want to share relating to this topic? Use the comment form below to do that?

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: https://www.tecmint.com/show-linux-server-shutdown-message/

作者：[Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/linux-boot-process-and-manage-services/
[2]:https://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:https://www.tecmint.com/shutdown-poweroff-halt-and-reboot-commands-in-linux/
[4]:https://www.tecmint.com/find-linux-uptime-shutdown-and-reboot-time-with-tuptime/
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Linux-System-Shutdown-Message.png
[6]:https://www.tecmint.com/auto-execute-linux-scripts-during-reboot-or-startup/
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
