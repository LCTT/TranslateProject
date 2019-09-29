[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Use Cockpit on CentOS 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-use-cockpit-tool-centos8-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Install and Use Cockpit on CentOS 8 / RHEL 8
======

**Cockpit** is a Web based server management tool available for CentOS and RHEL systems, recently **CentOS 8** and **RHEL 8** are released where cockpit is kept as default server management tool. Its package is available in the default CentOS 8 and RHEL 8 package repositories. Cockpit is a useful Web based GUI tool through which sysadmins can monitor and manage their Linux servers, it can also used to manage networking and storage on servers, containers, virtual machines and inspections of system and application’s logs.

In this article we will demonstrate how to install and setup Cockpit on CentOS 8 and RHEL 8 system.

### Installation and setup of Cockpit on CentOS 8 / RHEL 8 System

Login to your CentOS8 / RHEL 8 system and open the terminal and execute the following dnf command,

```
[root@linuxtechi ~]# dnf install cockpit -y
```

Run the following command to enable and start cockpit service,

```
[root@linuxtechi ~]# systemctl start cockpit.socket
[root@linuxtechi ~]# systemctl enable cockpit.socket
```

Allow Cockpit ports in OS firewall using following command,

```
[root@linuxtechi ~]# firewall-cmd --permanent --add-service=cockpit
[root@linuxtechi ~]# firewall-cmd --reload
```

Verify whether cockpit service is up and running or not, execute the following commands,

```
[root@linuxtechi ~]# systemctl status cockpit.socket
[root@linuxtechi ~]# ss -tunlp | grep cockpit
[root@linuxtechi ~]# ps auxf|grep cockpit
```

![cockpit-status-centos8-rhel8][1]

### Access Cockpit on CentOS 8 / RHEL 8 system

As we can see in above command’s output that cockpit is listening on tcp port 9090, open your system web browser and type url :

https://&lt;Your-CentOS8/RHEL8-System-IP&gt;:9090

[![CentOS8-cockpit-login-screen][1]][2]

Cockpit Login Screen for RHEL 8,

[![RHEL8-Cockpit-Login-Screen][1]][3]

Use the user name which has admin rights, or we can also use the root user’s credentials to login. In case you want to assign admin rights to any local user, execute the following command,

```
[root@linuxtechi ~]# usermod -G wheel pkumar
```

here pkumar is my local user,

Once you enter the user’s credentials, choose “**Reuse my password for privileged tasks**” and then click on “**Log In**” option after that we will get following screen,

[![cockpit-dashboard-centos8][1]][4]

On the Left-hand side bar, we can see what things can be monitored and configured via cockpit GUI,

Let’s assume if you wish to check whether there are any updates available for your CentOS 8 / RHEL 8 system, click on “**System Updates**” option,

[![Software-Updates-Cockpit-GUI-CentOS8-RHEL8][1]][5]

To Install all updates, click on “**Install All Updates**”

[![Install-Software-Updates-CentOS8-RHEL8][1]][6]

If wish to modify networking and want to add Bond interface and Bridge, then click on “**Networking**”

[![Networking-Cockpit-Dashboard-CentOS8-RHEL8][1]][7]

As we can in above window, we have the options to create Bond interface, Bridge and VLAN tagged interface.

Let’s assume we want to create a bridge as “**br0**” and want to add **enp0s3** as port to it, click on “**Add Bridge**” option,

Specify the bridge name as “br0” and port as “enp0s3” and then click on apply

[![Add-Bridge-Cockpit-CentOS8-RHEL8][1]][8]

In the next screen we will see that our bridge is active and got the same IP as of enp0s3 interface,

[![Bridge-Details-Cockpit-Dashboard-CentOS8-RHEL8][1]][9]

If you wish to inspect system logs then click on “**Logs**” options, there we can view logs based on their severity

[![System-Logs-Cockpit-Dashboard-CentOS8-RHEL8][1]][10]

That’s all from this article, similarly sysadmins can use remaining other options of cockpit to monitor and manage their CentOS 8 and RHEL 8 server. In case these steps help you to setup cockpit on your Linux server then please do share your feedback and comments in the comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-use-cockpit-tool-centos8-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-cockpit-login-screen.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/RHEL8-Cockpit-Login-Screen.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/cockpit-dashboard-centos8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Software-Updates-Cockpit-GUI-CentOS8-RHEL8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Install-Software-Updates-CentOS8-RHEL8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Networking-Cockpit-Dashboard-CentOS8-RHEL8.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Add-Bridge-Cockpit-CentOS8-RHEL8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Bridge-Details-Cockpit-Dashboard-CentOS8-RHEL8.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/System-Logs-Cockpit-Dashboard-CentOS8-RHEL8.jpg
