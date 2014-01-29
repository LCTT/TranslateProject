内置审计跟踪工具- Linux last命令
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/12/linux-last-command.jpg)

如果你是一个服务器管理员，你或许理解你要保护你的服务器。不仅是从外部，还要从内部保护。linux有一个内置工具来看到最后登陆服务器的用户

这个命令是**last**。命令**对于追踪非常有用**。让我们来看一下last可以为你做些什么。

### last命令的功能是什么 ###

**Last** display a list of all user logged in (and out) from **/var/log/wtmp** since the file was created. This file is binary file which cannot view by text editor such as Vi, Joe or another else. This trick is pretty smart because user (or root) can not modify the file as they want.

Last gives you information the name of all users logged in, its tty, IP Address (if the user doing a remote connection) date – time, and how long the user logged in.

### How to run Last ###

You just need to type **last** on your console. Here’s the sample :

    $ last

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 09:20 - 13:25 (04:05) 

Here’s how to read last information :

- The first column tell who are the user
- The second column give us information about how the user is connected

>     pts/0 (pseudo terminal) means that the user connect via remote connections such as SSH or telnet
> 
>     tty (teletypewriter) means that the user connect via direct connection to the computer or local terminal
> 
>     Exception for reboot activity the status will be shown is system boot

- The third column **show where the user come from**. If the user connect from remote computer, you will see a hostname or an IP Address. If you see :0.0 or nothing it means that the user is connect via local terminal. Exception for reboot activity, the kernel version will be shown as the status
- The remaining columns display **when the log activity has happened**. Numbers in the bracket tell us how many hours and minutes the connection was happened

### Some examples of Last command on day-to-day operation ###

#### Limit the number of line shown ####

When you have a lot of lines to show, you can limit how many lines do you want to see. Use **-n parameter** to do it.

    $ last -n 3

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 09:20 - 13:25 (04:05)

**-n parameter** will make last command to display 3 lines starting from the current time and backwards

#### Don’t display the hostname ####

Use **-R parameter** to do is. Here’s the sample :

    $ last -R

    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot Mon Dec 2 09:20 - 13:25 (04:05)

As you see, now there is no information about hostname or IP Address

#### Display the hostname in the last column ####

To do this, we can use **-a parameter**

    $ last -a

    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53) 10.0.76.162
    pungki tty1 Mon Dec 2 09:31 still logged in :0.0
    reboot system boot Mon Dec 2 09:20 - 13:25 (04:05) 2.6.32-358.23.2.el6.i686

Now the hostname information such as 10.0.76.162 will be placed in the last column.

#### Print full login and logout time and dates ####

You can use **-F parameter** for this. Here’s a sample.

    $ last -F

    leni pts/0 10.0.76.162 Mon Dec 2 12:32:24 2013 – Mon Dec 2013 13:25:24 2013 (00:53)

#### Print specific user name ####

If you want to trace specific user, you can print it specifically. Put the name of user behind last command.

    $ last leni

    leni tty1 Mon Dec 2 18-42 still logged in
    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53) 10.0.76.162

Or if you want to know when **reboot** is done, you can also display it

    $ last reboot

    reboot system boot Mon Dec 2 09:20 - 16:55 (07:34)
    reboot system boot Sun Dec 1 04:26 - 04:27 (00:01)
    reboot system boot Wed Nov 27 20:27 - 01:24 (04:57)
    reboot system boot Tue Nov 26 21:06 - 06:13 (09:06)

#### Print spesific tty / pts ####

Last can also print information about specific tty / pts. Just put the tty name or pty name behind the last command. Here are some sample outputs :

    $ last tty1

    pungki tty1 Mon Dec 2 09:31 still logged in
    pungki tty1 Mon Dec 2 04:26 – down (00:00)
    pungki tty1 Mon Dec 2 04:07 – down (00:00)
    pungki tty1 Sun Dec 1 18:55 – 04:07 (09:12)

    $ last pts/0

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki pts/0 :0.0 Wed Nov 27 20:28 – down (04:56)

When you see **down value** – such as the second line above – , it means that the user was logged in from specific time until the system is reboot or shutdown.

#### Use another file than /var/log/wtmp ####

By default, last command will parse information from **/var/log/wtmp**. If you want t**he last command** parse from another file, you can use **-f parameter**. For example, you may rotate the log after a certain condition. Let’s say the previous file is named **/var/log/wtmp.1** . Then the last command will be like this.

    $ last -f /var/log/wtmp.1

#### Display the run level changes ####

There is **-x parameter** if you want to display run level changes. Here’s a sample output :

    pungki tty1 Mon Dec 2 19:21 still logged in
    runlevel (to lvl 3) 2.6.32-358.23.2 Mon Dec 2 19:20 – 19:29 (00:08)
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 19:20 – 19:29 (00:08)
    shutdown system down 2.6.32-358.23.2 Mon Dec 2 18:56 – 19:20 (00:23)
    runlevel (to lvl 0) 2.6.32-358.23.2 Mon Dec 2 18:56 – 18:56 (00:00)
    leni tty1 Mon Dec 2 18:42 – down (00:00) 

You can see that there are two entries of run level. Runlevel which has **to lvl 3** entry means the system is running on full console mode. No active X Window or GUI. Meanwhile, when the system is **shutdown**, Linux us **run level 0**. That’s why last show you **to lvl 0** entry

#### View bad logins ####

While **last** command logs successful logins, then **lastb** command **record failed login attempts**. You **must have root** access to run lastb command. Here’s a sample output from lastb command. Lastb will parse information from /var/log/btmp.

    # lastb

    leni tty1 Mon Dec 2 22:12 – 22:12 (00:00)
    rahma tty1 Mon Dec 2 22:11 – 22:11 (00:00) 

#### Rotate the logs ####

Since **/var/log/wtmp** record every single log in activities, the size of the file may grow quickly. By default, Linux will **rotate /var/log/wtmp** every month. The detail of rotation activity is put in /etc/logrotate.conf file. Here’s the content of my **/etc/logrotate.conf** file.

    /var/log/wtmp {
    　　monthly
    　　create 0664 root umtp
    　　minsize 1M
    　　rotate 1
    }

And for **/var/log/btmp**, here’s default configuration of rotate activity

    /var/log/btmp {
    　　missingok
    　　monthly
    　　create 0600 root umtp
    　　minsize 1M
    　　rotate 1
    }

### Conclusion ###

You can combine those parameters to custom the output of last and lastb. All parameter **which run on last** command, **also run on** lastb command. For more detail, please visit last manual page by typing **man last** on your console.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-last-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
