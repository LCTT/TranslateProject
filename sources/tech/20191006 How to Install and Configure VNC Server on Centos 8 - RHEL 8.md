[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Configure VNC Server on Centos 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-configure-vnc-server-centos8-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Install and Configure VNC Server on Centos 8 / RHEL 8
======

A **VNC** (Virtual Network Computing) Server is a GUI based desktop sharing platform that allows you to access remote desktop machines. In **Centos 8** and **RHEL 8** systems, VNC servers are not installed by default and need to be installed manually. In this article, we’ll look at how to install VNC Server on CentOS 8 / RHEL 8 systems with a simple step-by-step installation guide.

### Prerequisites to Install VNC Server on Centos 8 / RHEL 8

To install VNC Server in your system, make sure you have the following requirements readily available on your system:

  * CentOS 8 / RHEL 8
  * GNOME Desktop Environment
  * Root access
  * DNF / YUM Package repositories



### Step by Step Guide to Install VNC Server on Centos 8 / RHEL 8

### Step 1)  Install GNOME Desktop environment

Before installing VNC Server in your CentOS 8 / RHEL 8, make sure you have a desktop Environment (DE) installed. In case GNOME desktop is already installed or you have installed your server with gui option then you can skip this step.

In CentOS 8 / RHEL 8, GNOME is the default desktop environment. if you don’t have it in your system, install it using the following command:

```
[root@linuxtechi ~]# dnf groupinstall "workstation"
Or
[root@linuxtechi ~]# dnf groupinstall "Server with GUI
```

Once the above packages are installed successfully then run the following command to enable the graphical mode

```
[root@linuxtechi ~]# systemctl set-default graphical
```

Now reboot the system so that we get GNOME login screen.

```
[root@linuxtechi ~]# reboot
```

Once the system is rebooted successfully uncomment the line “**WaylandEnable=false**” from the file “**/etc/gdm/custom.conf**” so that remote desktop session request via vnc is handled by xorg of GNOME desktop in place of wayland display manager.

**Note:** Wayland is the default display manager (GDM) in GNOME and it not is configured to handled remote rendering API like X.org

### Step 2) Install VNC Server (tigervnc-server)

Next we’ll install the VNC Server, there are lot of VNC Servers available, and for installation purposes, we’ll be installing **TigerVNC Server**. It is one of the most popular VNC Server and a high-performance and platform-independent VNC that allows users to interact with remote machines easily.

Now install TigerVNC Server using the following command:

```
[root@linuxtechi ~]# dnf install tigervnc-server tigervnc-server-module -y
```

### Step 3) Set VNC Password for Local User

Let’s assume we want ‘pkumar’ user to use VNC for remote desktop session, then switch to the user and set its password using vncpasswd command,

```
[root@linuxtechi ~]# su - pkumar
[root@linuxtechi ~]$ vncpasswd
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
[root@linuxtechi ~]$
[root@linuxtechi ~]$ exit
logout
[root@linuxtechi ~]#
```

### Step 4) Setup VNC Server Configuration File

Next step is to configure VNC Server Configuration file. Create a file “**/etc/systemd/system/[root@linuxtechi][1]**” with the following content so that tigervnc-server’s service started for above local user “pkumar”.

```
[root@linuxtechi ~]# vim /etc/systemd/system/root@linuxtechi
[Unit]
Description=Remote Desktop VNC Service
After=syslog.target network.target

[Service]
Type=forking
WorkingDirectory=/home/pkumar
User=pkumar
Group=pkumar

ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
ExecStart=/usr/bin/vncserver -autokill %i
ExecStop=/usr/bin/vncserver -kill %i

[Install]
WantedBy=multi-user.target
```

Save and exit the file,

**Note:** Replace the user name in above file which suits to your setup.

By default, VNC server listen on tcp port 5900+n, where n is the display number, if the display number is “1” then VNC server will listen its request on TCP port 5901.

### Step 5) Start VNC Service and allow port in firewall

I am using display number as 1, so use the following commands to start and enable vnc service on display number “1”,

```
[root@linuxtechi ~]# systemctl daemon-reload
[root@linuxtechi ~]# systemctl start  root@linuxtechi:1.service
[root@linuxtechi ~]# systemctl enable  vnroot@linuxtechi:1.service
Created symlink /etc/systemd/system/multi-user.target.wants/root@linuxtechi:1.service → /etc/systemd/system/root@linuxtechi
[root@linuxtechi ~]#
```

Use below **netstat** or **ss** command to verify whether VNC server start listening its request on 5901,

```
[root@linuxtechi ~]# netstat -tunlp | grep 5901
tcp        0      0 0.0.0.0:5901            0.0.0.0:*               LISTEN      8169/Xvnc
tcp6       0      0 :::5901                 :::*                    LISTEN      8169/Xvnc
[root@linuxtechi ~]# ss -tunlp | grep -i 5901
tcp   LISTEN  0       5                    0.0.0.0:5901           0.0.0.0:*      users:(("Xvnc",pid=8169,fd=6))
tcp   LISTEN  0       5                       [::]:5901              [::]:*      users:(("Xvnc",pid=8169,fd=7))
[root@linuxtechi ~]#
```

Use below systemctl command to verify the status of VNC server,

```
[root@linuxtechi ~]# systemctl status root@linuxtechi:1.service
```

![vncserver-status-centos8-rhel8][2]

Above command’s output confirms that VNC is started successfully on port tcp port 5901. Use the following command allow VNC Server port “5901” in os firewall,

```
[root@linuxtechi ~]# firewall-cmd --permanent --add-port=5901/tcp
success
[root@linuxtechi ~]# firewall-cmd --reload
success
[root@linuxtechi ~]#
```

### Step 6) Connect to Remote Desktop Session

Now we are all set to see if the remote desktop connection is working. To access the remote desktop, Start the VNC Viewer from your Windows  / Linux workstation and enter your **VNC server IP Address** and **Port Number** and then hit enter

[![VNC-Viewer-Windows10][2]][3]

Next, it will ask for your VNC password. Enter the password that you have created earlier for your local user and click OK to continue

[![VNC-Viewer-Connect-CentOS8-RHEL8-VNC-Server][2]][4]

Now you can see the remote desktop,

[![VNC-Desktop-Screen-CentOS8][2]][5]

That’s it, you’ve successfully installed VNC Server in Centos 8 / RHEL 8.

**Conclusion**

Hope the step-by-step guide to install VNC server on Centos 8 / RHEL 8 has provided you with all the information to easily setup VNC Server and access remote desktops. Please provide your comments and suggestion in the feedback section below. See you in the next article…Until then a big THANK YOU and BYE for now!!!

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-vnc-server-centos8-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/cdn-cgi/l/email-protection
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Viewer-Windows10.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Viewer-Connect-CentOS8-RHEL8-VNC-Server.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Desktop-Screen-CentOS8.jpg
