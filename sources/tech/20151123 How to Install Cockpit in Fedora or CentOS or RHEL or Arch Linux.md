How to Install Cockpit in Fedora / CentOS / RHEL/ Arch Linux
================================================================================
Cockpit is a free and open source server management software that makes us easy to administer our GNU/Linux servers via its beautiful web interface frontend. Cockpit helps make linux system administrator, system maintainers and DevOps easy to manage their server and to perform simple tasks, such as administering storage, inspecting journals, starting and stopping services and more. Its journal interface adds aroma in flower making people easy to switch between the terminal and web interface. And moreover, it makes easy to manage not only one server but several multiple networked servers from a single place at the same time with just a single click. It is very light weight and has easy to use web based interface. In this tutorial, we'll learn how we can setup Cockpit and use it to manage our server running Fedora, CentOS, Arch Linux and RHEL distributions as their operating system software. Some of the awesome benefits of Cockpit in our GNU/Linux servers are as follows:

1. It consist of systemd service manager for ease.
1. It has a Journal log viewer to perform troubleshoots and log analysis.
1. Storage setup including LVM was never easier before.
1. Basic Network configuration can be applied with Cockpit
1. We can easily add and remove local users and manage multiple servers.

### 1. Installing Cockpit ###

First of all, we'll need to setup Cockpit in our linux based server. In most of the distributions, the cockpit package is already available in their official repositories. Here, in this tutorial, we'll setup Cockpit in Fedora 22, CentOS 7, Arch Linux and RHEL 7 from their official repositories.

#### On CentOS / RHEL ####

Cockpit is available in the official repository of CenOS and RHEL. So, we'll simply install it using yum manager. To do so, we'll simply run the following command under sudo/root access.

    # yum install cockpit

![Install Cockpit Centos](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-centos.png)

#### On Fedora 22/21 ####

Alike, CentOS, it is also available by default in Fedora's official repository, we'll simply install cockpit using dnf package manager.

    # dnf install cockpit

![Install Cockpit Fedora](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-fedora.png)

#### On Arch Linux ####

Cockpit is currently not available in the official repository of Arch Linux but it is available in the Arch User Repository also know as AUR. So, we'll simply run the following yaourt command to install it.

    # yaourt cockpit

![Install Cockpit Archlinux](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-archlinux.png)

### 2. Starting and Enabling Cockpit ###

After we have successfully installed it, we'll gonna start the cockpit server with our service/daemon manager. As of 2015, most of the linux distributions have adopted Systemd whereas some of the linux distributions still run SysVinit to manage daemon, but Cockpit uses systemd for almost everything from running daemons to services. So, we can only setup Cockpit in the latest releases of linux distributions running Systemd. In order to start Cockpit and make it start in every boot of the system, we'll need to run the following command in a terminal or a console.

    # systemctl start cockpit

    # systemctl enable cockpit.socket

    Created symlink from /etc/systemd/system/sockets.target.wants/cockpit.socket to /usr/lib/systemd/system/cockpit.socket.

### 3. Allowing Firewall ###

After we have started our cockpit server and enable it to start in every boot, we'll now go for configuring firewall. As we have firewall programs running in our server, we'll need to allow ports in order to make cockpit accessible outside of the server.

#### On Firewalld ####

    # firewall-cmd --add-service=cockpit --permanent

    success

    # firewall-cmd --reload

    success

![Cockpit Allowing Firewalld](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-allowing-firewalld.png)

#### On Iptables ####

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # service iptables save

### 4. Accessing Cockpit Web Interface ###

Next, we'll gonna finally access the Cockpit web interface using a web browser. We'll simply need to point our web browser to https://ip-address:9090 or https://server.domain.com:9090 according to the configuration. Here, in our tutorial, we'll gonna point our browser to https://128.199.114.17:9090 as shown in the image below.

![Cockpit Webserver SSL Proceed](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-webserver-ssl-proceed.png)

We'll be displayed an SSL certification warning as we are using a self-signed SSL certificate. So, we'll simply ignore it and go forward towards the login page, in chrome/chromium, we'll need to click on Show Advanced and then we'll need to click on **Proceed to 128.199.114.17 (unsafe)** .

![Cockpit Login Screen](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-login-screen.png)

Now, we'll be asked to enter the login details in order to enter into the dashboard. Here, the username and password is the same as that of the login details we use to login to our linux server. After we enter the login details and click on Log In button, we will be welcomed into the Cockpit Dashboard.

![Cockpit Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-dashboard.png)

Here, we'll see all the menu and visualization of CPU, Disk, Network, Storage usages of the server. We'll see the dashboard as shown above.

#### Services ####

To manage services, we'll need to click on Services button on the menu situated in the right side of the web page. Then, we'll see the services under 5 categories, Targets, System Services, Sockets, Timers and Paths.

![Cockpit Services](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-services.png)
 
#### Docker Containers ####

We can even manage docker containers with Cockpit. It is pretty easy to monitor and administer Docker containers with Cockpit. As docker isn't installed and running in our server, we'll need to click on Start Docker.

![Cockpit Container](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-container.png)

Cockpit will automatically install and run docker in our server. After its running, we see the following screen. Then, we can manage the docker images, containers as per our requirement.

![Cockpit Containers Mangement](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-containers-mangement.png)

#### Journal Log Viewer ####

Cockpit has a managed log viewer which separates the Errors, Warnings, Notices into different tabs. And we also have a tab All where we can see them all in a single place.

![Cockpit Journal Logs](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-journal-logs.png)

#### Networking ####

Under the networking section, we see two graphs in which there is the visualization of Sending and Receiving speed. And we can see there the list of available interfaces with option to Add Bond, Bridge, VLAN. If we need to configure an interface, we can do so by simply clicking on the interface name. Below everything, we can see the Journal Log Viewer for Networking.

![Cockpit Network](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-network.png)

#### Storage ####

Now, its easy with Cockpit to see the R/W speed of our hard disk. We can see the Journal log of the Storage in order to perform troubleshoot and fixes. A clear visualization bar of how much space is occupied is shown in the page. We can even Unmount, Format, Delete a partition of a Hard Disk and more. Features like creating RAID Device, Volume Group is also available in it.

![Cockpit Storage](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-storage.png)

#### Account Management ####

We can easily create new accounts with Cockpit Web Interface. The accounts created in it is applied to the system's user account. We can change password, specify roles, delete, rename user accounts with it.

![Cockpit Accounts](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-accounts.png)

#### Live Terminal ####

This is an awesome feature built-in with Cockpit. Yes, we can execute commands, do stuffs with the live terminal provided by Cockpit interface. This makes us really easy to switch between the web interface and terminal according to our need.

![Cockpit Terminal](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-terminal.png)

### Conclusion ###

Cockpit is a good free and open source software developed by [Red Hat][1] for making the server management easy and simple. It is best for performing simple system administration tasks and is good for the new system administrators. It is still under pre-release as its stable release hasn't been released yet. So, it is not suitable for production. It is currently developed on the latest release of Fedora, CentOS, Arch Linux, RHEL where systemd is installed by default. If you are willing to install Cockpit in Ubuntu, you can get the PPA access but is currently outdated. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank You !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-cockpit-fedora-centos-rhel-arch-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.redhat.com/