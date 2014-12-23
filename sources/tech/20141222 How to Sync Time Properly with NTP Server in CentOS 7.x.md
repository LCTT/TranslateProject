How to Sync Time Properly with NTP Server in CentOS 7.x
================================================================================
**Chrony** is an open source and free application that helps you keep the system clock in sync with a NTP server, thus allowing you to keep the exact time. It consists of two programs chronyd and chronyc. chronyd is the daemon that runs in the background and adjusts the system clock which is running in the kernel to the time on a NTP server. It determines the rate at which the computer gains or loses time, and compensates for this. chronyc provides a user interface for monitoring the performance and configuring various settings. It can do so while running on the same computer as the chronyd instance it is controlling or a different remote computer.

Chrony comes installed by default on RHEL based operating systems like CentOS 7.

### Chrony configuration ###

When it starts Chrony will read the settings in /etc/chrony.conf configuration file. The most important settings on a CentOS 7 operating system are:

**server** - This can be used multiple times to add NTP server, it should be used in the format "server ". In general you can add as many server addresses as you wish.

    Example:
    server 0.centos.pool.ntp.org
    server 3.europe.pool.ntp.org

**stratumweight** - The stratumweight directive sets how much distance should be added per stratum to the synchronization distance when chronyd selects the synchronization source from available sources. By default in CentOS it's 0, to makes chronyd ignore stratum when selecting the source

**driftfile** - One of the main activities of the chronyd program is to work out the rate at which the system clock gains or loses time relative to real time. Each time chronyd has a new value of gain/loss rate, it is desirable to record it in a file and this will allow it to compansate the system clock at the rate it was last restarted, even before it has a chance to obtain good estimate from the NTP server.

**rtcsync** - The rtcsync directive will enable a kernel mode where the system time is copied to the real time clock (RTC) every 11 minutes.

**allow / deny** - here you can specify a host, subnet, or network from which to allow or deny NTP connections to a machine acting as NTP server.

    Examples:
    allow 192.168.4.5
    deny 192.168/16

**cmdallow / cmddeny** - same as allow only that you can specifiy witch IP address or host to have control command over chronyd

**bindcmdaddress** - this directive allows you to restrict the network interface to which chronyd will listen for command packets (issued by chronyc). This provides an additional level of access restriction above that available through cmddeny mechanism.

    Example:
    bindcmdaddress 127.0.0.1
    bindcmdaddress ::1

**makestep** - normally chronyd will cause the system to gradually correct any time offset, by slowing down or speeding up the clock as required. In certain situations, the system clock may be so far adrift that this slewing process would take a very long time to correct the system clock. This directive forces chronyd to step system clock if the adjustment is larger than a threshold value, but only if there were no more clock updates since chronyd was started than a specified limit (a negative value can be used to disable the limit).

### Using chronyc ###

You can also change settings by running the chronyc command and then use one of the following commands:

**accheck** - Check whether NTP access is allowed on the speicif host

**activity** - This will display how many NTP sources are online/offline

![](http://blog.linoxide.com/wp-content/uploads/2014/10/chrony-activity.jpg)

**add server** - Add a new NTP server manually.

**clients** - Report on clients that have accessed the server

**delete** - Manually remove an NTP server or peer

**settime** - Manually set the daemon time

**tracking** - Display system time information

You can see the full list of commands by using the help command:

![](http://blog.linoxide.com/wp-content/uploads/2014/10/commands.jpg)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/chrony-time-sync/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/