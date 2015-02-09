How To Install / Configure VNC Server On CentOS 7.0
================================================================================
Hi there, this tutorial is all about how to install or setup [VNC][1] Server on your very CentOS 7. This tutorial also works fine in RHEL 7.  In this tutorial, we'll learn what is VNC and how to install or setup [VNC Server][1] on CentOS 7

As we know, most of the time as a system administrator we are managing our servers over the network. It is very rare that we will need to have a physical access to any of our managed servers. In most cases all we need is to SSH remotely to do our administration tasks. In this article we will configure a GUI alternative to a remote access to our CentOS 7 server, which is VNC. VNC allows us to open a remote GUI session to our server and thus providing us with a full graphical interface accessible from any remote location.

VNC server is a Free and Open Source Software which is designed for allowing remote access to the Desktop Environment of the server to the VNC Client whereas  VNC viewer is used on remote computer to connect to the server .

**Some Benefits of VNC server are listed below:**

    Remote GUI administration makes work easy & convenient.
    Clipboard sharing between host CentOS server & VNC-client machine.
    GUI tools can be installed on the host CentOS server to make the administration more powerful
    Host CentOS server can be administered through any OS having the VNC-client installed.
    More reliable over ssh graphics and RDP connections.

So, now lets start our journey towards the installation of VNC Server. We need to follow the steps below to setup and to get a working VNC.

First of all we'll need a working Desktop Environment (X-Windows), if we don't have a working GUI Desktop Environment (X Windows) running, we'll need to install it first.

**Note: The commands below must be running under root privilege. To switch to root please execute "sudo -s" under a shell or terminal without quotes("")**

### 1. Installing X-Windows ###

First of all to install [X-Windows][2] we'll need to execute the below commands in a shell or terminal. It will take few minutes to install its packages.

    # yum check-update
    # yum groupinstall "X Window System"

![installing x windows](http://blog.linoxide.com/wp-content/uploads/2015/01/installing-x-windows.png)

    #yum install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts

![install gnome classic session](http://blog.linoxide.com/wp-content/uploads/2015/01/gnome-classic-session-install.png)
    
    # unlink /etc/systemd/system/default.target
    # ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

![configuring graphics](http://blog.linoxide.com/wp-content/uploads/2015/01/configuring-graphics.png)

    # reboot

After our machine restarts, we'll get a working CentOS 7 Desktop.

Now, we'll install VNC Server on our machine.

### 2. Installing VNC Server Package ###

Now, we'll install VNC Server package in our CentOS 7 machine. To install VNC Server, we'll need to execute the following command.

    # yum install tigervnc-server -y

![vnc server](http://blog.linoxide.com/wp-content/uploads/2015/01/install-tigervnc.png)

### 3. Configuring VNC ###

Then, we'll need to create a configuration file under **/etc/systemd/system/** directory. We can copy the **vncserver@:1.service** file from example file from **/lib/systemd/system/vncserver@.service** 

    # cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service

![copying vnc server configuration](http://blog.linoxide.com/wp-content/uploads/2015/01/copying-configuration.png)

Now we'll open **/etc/systemd/system/vncserver@:1.service** in our favorite text editor (here, we're gonna use **nano**). Then find the below lines of text in that file and replace <USER> with your username. Here, in my case its linoxide so I am replacing <USER> with linoxide and finally looks like below.

    ExecStart=/sbin/runuser -l <USER> -c "/usr/bin/vncserver %i"
    PIDFile=/home/<USER>/.vnc/%H%i.pid

TO

    ExecStart=/sbin/runuser -l linoxide -c "/usr/bin/vncserver %i"
    PIDFile=/home/linoxide/.vnc/%H%i.pid

If you are creating for root user then

    ExecStart=/sbin/runuser -l root -c "/usr/bin/vncserver %i"
    PIDFile=/root/.vnc/%H%i.pid

![configuring user](http://blog.linoxide.com/wp-content/uploads/2015/01/configuring-user.png)

Now, we'll need to reload our systemd.

    # systemctl daemon-reload

Finally, we'll create VNC password for the user . To do so, first you'll need to be sure that you have sudo access to the user, here I will login to user "linoxide" then, execute the following. To login to linoxide we'll run "**su linoxide" without quotes** .

    # su linoxide
    $ sudo vncpasswd

![setting vnc password](http://blog.linoxide.com/wp-content/uploads/2015/01/vncpassword.png)

**Make sure that you enter passwords more than 6 characters.**

### 4. Enabling and Starting the service ###

To enable service at startup ( Permanent ) execute the commands shown below.

    $ sudo systemctl enable vncserver@:1.service

Then, start the service.

    $ sudo systemctl start vncserver@:1.service

### 5. Allowing Firewalls ###

We'll need to allow VNC services in Firewall now.

    $ sudo firewall-cmd --permanent --add-service vnc-server
    $ sudo systemctl restart firewalld.service

![allowing firewalld](http://blog.linoxide.com/wp-content/uploads/2015/01/allowing-firewalld.png)

Now you can able to connect VNC server using IP and Port ( Eg : ip-address:1 )

### 6. Connecting the machine with VNC Client ###

Finally, we are done installing VNC Server. No, we'll wanna connect the server machine and remotely access it. For that we'll need a VNC Client installed in our computer which will only enable us to remote access the server machine.

![remote access vncserver from vncviewer](http://blog.linoxide.com/wp-content/uploads/2015/01/vncviewer.png)

You can use VNC client like [Tightvnc viewer][3] and [Realvnc viewer][4] to connect Server.
To connect with additional users create files with different ports, please go to step 3 to configure and add a new user and port, You'll need to create **vncserver@:2.service** and replace the username in config file and continue the steps by replacing service name for different ports. **Please make sure you logged in as that particular user for creating vnc password**.

VNC by itself runs on port 5900. Since each user will run their own VNC server, each user will have to connect via a separate port. The addition of a number in the file name tells VNC to run that service as a sub-port of 5900. So in our case, arun's VNC service will run on port 5901 (5900 + 1) and further will run on 5900 + x. Where, x denotes the port specified when creating config file **vncserver@:x.service for the further users**.

We'll need to know the IP Address and Port of the server to connect with the client. IP addresses are the unique identity number of the machine. Here, my IP address is 96.126.120.92 and port for this user is 1. We can get the public IP address by executing the below command in a shell or terminal of the machine where VNC Server is installed.

    # curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

### Conclusion ###

Finally, we installed and configured VNC Server in the machine running CentOS 7 / RHEL 7 (Red Hat Enterprises Linux) . VNC is the most easy FOSS tool for the remote access and also a good alternative to Teamviewer Remote Access. VNC allows a user with VNC client installed to control the machine with VNC Server installed. Here are some commands listed below that are highly useful in VNC . Enjoy !!

#### Additional Commands : ####

- To stop VNC service .

    # systemctl stop vncserver@:1.service

- To disable VNC service from startup.

    # systemctl disable vncserver@:1.service

- To stop firewall.

    # systemctl stop firewalld.service

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-configure-vnc-server-centos-7-0/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://en.wikipedia.org/wiki/Virtual_Network_Computing
[2]:http://en.wikipedia.org/wiki/X_Window_System
[3]:http://www.tightvnc.com/
[4]:https://www.realvnc.com/