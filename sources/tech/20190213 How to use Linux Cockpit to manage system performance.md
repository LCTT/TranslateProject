[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Linux Cockpit to manage system performance)
[#]: via: (https://www.networkworld.com/article/3340038/linux/sitting-in-the-linux-cockpit.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to use Linux Cockpit to manage system performance
======

Linux Cockpit is a web-based interface that provides graphical administrative access to a system. Here's a look at what it allows you to control.

![](https://images.idgesg.net/images/article/2019/02/cockpit_airline_airplane_control_pilot-by-southerlycourse-getty-100787904-large.jpg)

If you haven't tried the relatively new Linux Cockpit, you might be surprised by all it can do. It's a user-friendly web-based console that provides some very easy ways to administer Linux systems — _through the **web**_. You can monitor system resources, add or remove accounts, monitor system usage, shut down the system and perform quite a few other tasks — all through a very accessible web connection. It's also very easy to set up and use.

While many Linux sysadmins spend most of their time on the command line, access to a remote system using a tool like PuTTY doesn't always provide the most useful command output. Linux Cockpit provides graphs and easy-to-use forms for viewing performance measures and making changes to your systems.

Linux Cockpit allows you to view many aspects of system performance and make configuration changes, though the task list may depend on the particular flavor of Linux that you are using. Some of the categories of tasks include the following:

  * Monitoring system activity (CPU, memory, disk IO and network traffics) — **System**
  * Viewing system log entries — **Logs**
  * Seeing how full your disk partitions are — **Storage**
  * Watching networking activity (sent and received) — **Networking**
  * Taking a look at user accounts — **Accounts**
  * Checking the status of system services — **Services**
  * Pulling up information on installed applications — **Applications**
  * Viewing and installing available updates (if logged in as root) and restart the system if needed — **Software Updates**
  * Opening and using a terminal window — **Terminal**



Some Linux Cockpit installations will also allow you to run diagnostic reports, dump the kernel, examine SELinux (security) settings, and list subscriptions.

Here's an example of system activity as displayed by Linux Cockpit:

![cockpit activity][1] Sandra Henry-Stocker

Linux Cockpit display of system activity

### How to set up Linux Cockpit

On some Linux installations (e.g., recent RHEL), Linux Cockpit may already be installed and ready for use. On others, you may have to take some easy steps to install it and make it accessible.

On Ubuntu, for example, these commands should work:

```
$ sudo apt-get install cockpit
$ man cockpit    <== just checking
$ sudo systemctl enable --now cockpit.socket
$ netstat -a | grep 9090
tcp6 0 0 [::]:9090 [::]:* LISTEN
$ sudo systemctl enable --now cockpit.socket
$ sudo ufw allow 9090
```

Once Linux Cockpit is enabled, point your browser at **https:// <system-name-or-IP>:9090**.

A list of distributions that work with Cockpit along with installation instructions is available at [the Cockpit Project][2].

Linux Cockpit doesn't provide any recognition of **sudo** privileges without some additional configuration. If you are not allowed to make a change using the Cockpit interface, you will see one of those little red international prohibition signs imposed over the button you'd otherwise click on.

To get sudo privileges working, you need to be sure that the user is in the **wheel** (RHEL) or **adm** (Debian) group in the **/etc/group** file, that the Server Administrator checkbox has been selected for this user account when logged into Cockpit as root and that the user selects "Reuse my password" when logging into Cockpit.

It's nice to be able to get some graphical control over the Linux systems you administer even when they're thousands of miles away or lacking consoles. While I love working on the console, I like seeing a graph or a button now and then. Linux Cockpit provides a very useful interface for routine administrative tasks.

Post updated Feb. 13, 11:30am ET

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3340038/linux/sitting-in-the-linux-cockpit.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/cockpit-activity-100787994-large.jpg
[2]: https://cockpit-project.org/running.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
