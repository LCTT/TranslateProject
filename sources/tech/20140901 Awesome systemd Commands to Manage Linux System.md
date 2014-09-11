(translating by szrlee)
Awesome ! systemd Commands to Manage Linux System

酷！用systemd命令来管理linux系统
================================================================================
Systemd is the new system and service manager for Linux.

Systemd是一种新的linux系统服务管理器。

It is a replacement for init system and can manage system startup and services. It starts up and supervises the entire system. In article we are using [centos 7.0 installed with systemd 216 version][1] and the latest version is [available for download from freedesktop.org][2].

它替换了init系统，能够管理系统的启动过程和一些系统服务，一旦启动起来，就将监管整个系统。

With new player in town, PID 1 is occupied by “systemd” and can be seen from pstree command as well:

因为linux系统里这一新的玩家，PID 1被“systemd”占据了，这能通过pstree命令看到。

    [root@linoxide ~]# pstree

![](http://linoxide.com/wp-content/uploads/2014/08/01.systemd_pstree.png)

Lets explore what systemd is capable of and what possibilities we have with the new replacement for sysVinit.

那么现在让我们来探索systemd擅长什么，它又有多大的可能性成为sysVinit的新的替代品。

### 1. Faster startup ###

The sysvinit starts the processes serially, one at a time. Systemd starts services in parallel and starts only those services which are actually required, reducing the boot time significantly.
You can get the boot process duration with the following command:

    [root@linoxide ~]# systemd-analyze

![](http://linoxide.com/wp-content/uploads/2014/08/02.systemd_analyze.png)

The command systemd-analyze time also shows the same information.

    [root@linoxide ~]# systemd-analyze time

![](http://linoxide.com/wp-content/uploads/2014/08/03.systemd_analyze2.png)

If you want to print a list of all running units, the blame option to systemd-analyze command can provide you with that, ordered by the time taken to initialize.

    [root@linoxide ~]# systemd-analyze blame

![](http://linoxide.com/wp-content/uploads/2014/08/04.systemd_blame.png)

The above screen shows only a small number of processes, you can scroll through the list with arrows just like in less pager.

### 2. The systemctl command ###

The systemctl command is the most talked command that comes with systemd. You can manage a whole lot of your system with this command. Let’s explore this command before going any further:

#### 2.1 List Units ####

systemctl command without any option lists all the running units. The list-units switch also does the same.

    [root@linoxide ~]# systemctl

or

    [root@linoxide ~]# systemctl list-units

![](http://linoxide.com/wp-content/uploads/2014/08/05.systemd_list_units.png)

#### 2.2 Listing failed units ####

The failed units can be listed with --failed switch.

    [root@linoxide ~]# systemctl --failed

![](http://linoxide.com/wp-content/uploads/2014/08/06.systemd_failed.png)

You will see the use of systemctl command at many places in this article.

### 3. Managing services ###

Let us now see how services can be managed with systemd.

#### 3.1 Active services ####

All the active services can be checked with the following command:

    [root@linoxide ~]# systemctl list-units -t service

![](http://linoxide.com/wp-content/uploads/2014/08/07.systemd_active_services.png)

#### 3.2 Service status ####

In the sysvinit, we could use the “service” command to manage the services, but with systemd, the systemctl command is used to manage services. In ordwer to see whether a service is running or not, we can use the systemctl command like this:

    [root@linoxide ~]# systemctl status dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/08.systemd_status.png)

#### 3.3 Start a service ####

To start a service, again we use the systemctl command as:

    [root@linoxide ~]# systemctl start dnsmasq

As opposed to service command, this command does not give any output. But of course, we can check the status of the service once again to confirm that its started successfully:

![](http://linoxide.com/wp-content/uploads/2014/08/09.systemd_start.png)

#### 3.4 Stopping a service ####

Now you are smart enough and already know the command to stop a service with systemd:

    [root@linoxide ~]# systemctl stop dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/10.systemd_stop.png)

#### 3.5 Restart a service ####

Similarly, restarting a service is managed using ‘systemctl restart ‘:

    [root@linoxide ~]# systemctl restart dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/11.systemd_restart.png)

#### 3.6 Reload a service ####

In case we need to reload the configuration of service (say ssh), without restarting it, we can use the command:

    [root@linoxide ~]# systemctl reload sshd

![](http://linoxide.com/wp-content/uploads/2014/08/12.systemd_reload.png)

Although all of the above syntax are working, the official documentation suggests that these command be run with following syntax:

    [root@linoxide ~]# systemctl status dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/13.systemd_alternate_syntax.png)

### 4. Managing services at boot ###

The chkconfig command was used to manage services at boot. The same command systemd is used with systemd to manage services at boot.

#### 4.1 Checking service status at boot ####

In order to check if a service is enabled on boot or not:

    [root@linoxide ~]# systemctl is-enabled dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/14.systemd_is_enabled.png)

#### 4.2 Enable a service at boot ####

systemctl command can be used like this to enable a service at boot (this corresponds to sysvinit ‘chkconfig on’)

    [root@linoxide ~]# systemctl enable dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/15.systemd_enable.png)

#### 4.3 Disable a service at boot ####

Similarly, the services can be disabled at boot with systemctl command:

    [root@linoxide ~]# systemctl disable dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/16.systemd_disable.png)

### 5. Managing Remote systems ###

Typically, all of the ablve systemctl commands can be used to manage a remote host with systemctl command itself. This will use ssh for communication with the remote host. All you need to do is add the user and host to systemctl command like this:

    [root@linoxide ~]# systemctl status sshd -H root@1.2.3.4

![](http://linoxide.com/wp-content/uploads/2014/08/17.systemd_remote.png)

### 6. Managing targets: ###

Systemd has concept of targets having similar purpose to runlevels in sysVinit.
The runlevels in sysVinit were mostly numeric (0,1,2,…). Here are the runlevels in sysVinit with their systemd counterparts:

> 0 runlevel0.target, poweroff.target
> 
> 1, s, single runlevel1.target, rescue.target
> 
> 2, 4 runlevel2.target, runlevel4.target, multi-user.target
> 
> 3 runlevel3.target, multi-user.target
> 
> 5 runlevel5.target, graphical.target
> 
> 6 runlevel6.target, reboot.target
> 
> emergency emergency.target

#### 6.1 Changing current target ####

The current target(runlevel) can be changed with the command:

    [root@linoxide ~]# systemctl isolate graphical.target

![](http://linoxide.com/wp-content/uploads/2014/08/18.systemd_isolate.png)

#### 6.2 List current target ####

If you want to see what target you are in, you need to list all the corresponding units. It might not feel at home with this new way, but its the way systemd works.

    [root@linoxide ~]# systemctl list-units --type=target

![](http://linoxide.com/wp-content/uploads/2014/08/19.systemd_targets.png)

You can see “graphical.target” listed here. This is what we changed our target into. Now let’s change the runlevel again to multi-user.target and then analyze this output:

    [root@linoxide ~]# systemctl isolate multi-user.target
    [root@linoxide ~]# systemctl list-units --type=target

![](http://linoxide.com/wp-content/uploads/2014/08/20.systemd_multi-user.png)

#### 6.3 List default target ####

To list the default target, we use systemctl command like this:

    [root@linoxide ~]# systemctl get-default

![](http://linoxide.com/wp-content/uploads/2014/08/21.systemd_get_default.png)

#### 6.4 Change default target ####

The default target can be set with set-default command with systemctl:

    [root@linoxide ~]# systemctl set-default graphical.target

![](http://linoxide.com/wp-content/uploads/2014/08/22.systemd_set_default.png)

### 7. Logging in systemd ###

The systemd has its own logging system called journald. It replaces the syslog daemon from sysVinit. The command journalctl is used to read the logs.

    [root@linoxide ~]# journalctl

![](http://linoxide.com/wp-content/uploads/2014/08/23.systemd_logs.png)

#### 7.1 Boot messages ####

To see all boot messages, run the command “journalctl -b”.

    [root@linoxide ~]# journalctl -b

![](http://linoxide.com/wp-content/uploads/2014/08/24.systemd_boot.png)

#### 7.2 Follow logs ####

The following command follows the system logs in real time (similar to tail -f).

    [root@linoxide ~]# journalctl -f

![](http://linoxide.com/wp-content/uploads/2014/08/25.systemd_follow_logs.png)

#### 7.3 Service specific logs ####

To check logs specific to a particular service or executable, use journalctl like this:

    [root@linoxide ~]# journalctl /usr/sbin/dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/26.systemd_specific.png)

### 8. Power management ###

The systemctl command can be used to put the system down, or reboot or hibernate.

To poweroff, reboot, suspend and hibernate, use the following commands respectively:

    [root@linoxide ~]# systemctl poweroff

    [root@linoxide ~]# systemctl reboot

    [root@linoxide ~]# systemctl suspend

    [root@linoxide ~]# systemctl reboot

### 9. Bonus ###

The systemd brings out the whole new approach to interacting with your operating system. The systemd is so full of features. For example, you can get the hostname and other useful features about your Linux machine, you can use hostnamectl command

    [root@linoxide ~]# hostnamectl

![](http://linoxide.com/wp-content/uploads/2014/08/27.systemd_hostnamectl.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-systemd-commands/

作者：[Raghu][a]
译者：[szrlee](https://github.com/szrlee)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/raghu/
[1]:http://linoxide.com/linux-how-to/install-systemd-centos-redhat/
[2]:http://www.freedesktop.org/software/systemd/
