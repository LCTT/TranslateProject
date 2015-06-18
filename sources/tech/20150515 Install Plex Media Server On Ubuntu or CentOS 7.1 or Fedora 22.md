Install Plex Media Server On Ubuntu / CentOS 7.1 / Fedora 22
================================================================================
In this article we will show you how easily you can setup Plex Home Media Server on major Linux distributions with their latest releases.  After its successful installation of Plex you will be able to use your centralized home media playback system that streams its media to many Plex player Apps and the Plex Home will allows you to setup your environment by adding your devices and to setup a group of users that all can use Plex Together. So let’s start its installation first on Ubuntu 15.04.

### Basic System Resources ###

System resources mainly depend on the type and number of devices that you are planning to connect with the server. So according to our requirements we will be using as following system resources and software for a standalone server.

注：表格
<table width="666" style="height: 181px;">
<tbody>
<tr>
<td width="670" colspan="2"><b>Plex Home Media Server</b></td>
</tr>
<tr>
<td width="236"><b>Base Operating System</b></td>
<td width="425">Ubuntu 15.04 / CentOS 7.1 / Fedora 22 Work Station</td>
</tr>
<tr>
<td width="236"><b>Plex Media Server</b></td>
<td width="425">Version 0.9.12.3.1173-937aac3</td>
</tr>
<tr>
<td width="236"><b>RAM and CPU</b></td>
<td width="425">1 GB&nbsp; , 2.0 GHZ</td>
</tr>
<tr>
<td width="236"><b>Hard Disk</b></td>
<td width="425">30 GB</td>
</tr>
</tbody>
</table>

### Plex Media Server 0.9.12.3 on Ubuntu 15.04 ###

We are now ready to start the installations process of Plex Media Server on Ubuntu so let’s start with the following steps to get it ready.

#### Step 1: System Update ####

Login to your server with root privileges Make your that your system is upto date if not then do by using below command.

    root@ubuntu-15:~#apt-get update

#### Step 2: Download the Latest Plex Media Server Package ####

Create a new directory and download .deb plex Media Package in it from the official website of Plex for Ubuntu using wget command.

    root@ubuntu-15:~# cd /plex/
    root@ubuntu-15:/plex#
    root@ubuntu-15:/plex# wget https://downloads.plex.tv/plex-media-server/0.9.12.3.1173-937aac3/plexmediaserver_0.9.12.3.1173-937aac3_amd64.deb

#### Step 3: Install the Debian Package of Plex Media Server ####

Now within the same directory run following command to start installation of debian package and then check the status of plekmediaserver.

    root@ubuntu-15:/plex# dpkg -i plexmediaserver_0.9.12.3.1173-937aac3_amd64.deb

----------

    root@ubuntu-15:~# service plexmediaserver status

![Plexmediaserver Service](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-status.png)

### Plex Home Media Web App Setup on Ubuntu 15.04 ###

Let's open your web browser within your localhost network and open the Web Interface with your localhost IP and port 32400 and do following steps to configure it:

    http://172.25.10.179:32400/web
    http://localhost:32400/web

#### Step 1:Sign UP before Login ####

After you have access to the web interface of Plesk Media Server make sure to Sign Up and set your username email ID and Password to login as.

![Plex Sign In](http://blog.linoxide.com/wp-content/uploads/2015/06/PMS-Login.png)

#### Step 2: Enter Your Pin to Secure Your Plex Media Home User ####

![Plex User Pin](http://blog.linoxide.com/wp-content/uploads/2015/06/333.png)

Now you have successfully configured your user under Plex Home Media.

![Welcome To Plex](http://blog.linoxide.com/wp-content/uploads/2015/06/3333.png)

### Opening Plex Web App on Devices Other than Localhost Server ###

As we have seen in our Plex media home page that it indicates that "You do not have permissions to access this server". Its because of we are on a different network than the Server computer.

![Plex Server Permissions](http://blog.linoxide.com/wp-content/uploads/2015/06/33.png)

Now we need to resolve this permissions issue so that we can have access to server on the devices other than the hosted server by doing following setup.

### Setup SSH Tunnel for Windows System to access Linux Server ###

First we need to set up a SSH tunnel so that we can access things as if they were local. This is only necessary for the initial setup.

If you are using Windows as your local system and server on Linux then we can setup SSH-Tunneling using Putty as shown.

![Plex SSH Tunnel](http://blog.linoxide.com/wp-content/uploads/2015/06/ssh-tunnel.png)

**Once you have the SSH tunnel set up:**

Open your Web browser window and type following URL in the address bar.

    http://localhost:8888/web

The browser will connect to the server and load the Plex Web App with same functionality as on local.
Agree to the terms of Services and start

![Agree to Plex term](http://blog.linoxide.com/wp-content/uploads/2015/06/5.png)

Now a fully functional Plex Home Media Server is ready to add new media libraries, channels, playlists etc.

![PMS Settings](http://blog.linoxide.com/wp-content/uploads/2015/06/8.png)

### Plex Media Server 0.9.12.3 on CentOS 7.1 ###

We will follow the same steps on CentOS-7.1 that we did for the installation of Plex Home Media Server on Ubuntu 15.04.

So lets start with Plex Media Servers Package Installation.

#### Step 1: Plex Media Server Installation ####

To install Plex Media Server on centOS 7.1 we need to download the .rpm package from the official website of Plex. So we will use wget command to download .rpm package for this purpose in a new directory.

    [root@linux-tutorials ~]# cd /plex
    [root@linux-tutorials plex]# wget https://downloads.plex.tv/plex-media-server/0.9.12.3.1173-937aac3/plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm

#### Step 2: Install .RPM Package ####

After completion of complete download package we will install this package using rpm command within the same direcory where we installed the .rpm package.

    [root@linux-tutorials plex]# ls
    plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm
    [root@linux-tutorials plex]# rpm -i plexmediaserver-0.9.12.3.1173-937aac3.x86_64.rpm

#### Step 3: Start Plexmediaservice ####

We have successfully installed Plex Media Server Now we just need to restart its service and then enable it permanently.

    [root@linux-tutorials plex]# systemctl start plexmediaserver.service
    [root@linux-tutorials plex]# systemctl enable plexmediaserver.service
    [root@linux-tutorials plex]# systemctl status plexmediaserver.service

### Plex Home Media Web App Setup on CentOS-7.1 ###

Now we just need to repeat all steps that we performed during the Web app setup of Ubuntu.
So let's Open a new window in your web browser and access the Plex Media Server Web app using localhost or IP or your Plex server.

    http://172.20.3.174:32400/web
    http://localhost:32400/web

Then to get full permissions on the server you need to repeat the steps to create the SSH-Tunnel.
After signing up with new user account we will be able to access its all features and can add new users, add new libraries and setup it per our needs.

![Plex Device Centos](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-devices-centos.png)

### Plex Media Server 0.9.12.3 on Fedora 22 Work Station ###

The Basic steps to download and install Plex Media Server are the same as its we did for in CentOS 7.1.
We just need to download its .rpm package and then install it with rpm command.

![PMS Installation](http://blog.linoxide.com/wp-content/uploads/2015/06/plex-on-fedora.png)

### Plex Home Media Web App Setup on Fedora 22 Work Station ###

We had setup Plex Media Server on the same host so we don't need to setup SSH-Tunnel in this time scenario. Just open the web browser in your Fedora 22 Workstation with default port 32400 of Plex Home Media Server and accept the Plex Terms of Services Agreement.

![Plex Agreement](http://blog.linoxide.com/wp-content/uploads/2015/06/Plex-Terms.png)

**Welcome to Plex Home Media Server on Fedora 22 Workstation**

Lets login with your plex account and start with adding your libraries for your favorite movie channels , create your playlists, add your photos and enjoy with many other features of Plex Home Media Server.

![Plex Add Libraries](http://blog.linoxide.com/wp-content/uploads/2015/06/create-library.png)

### Conclusion ###

We had successfully installed and configured Plex Media Server on Major Linux Distributions. So, Plex Home Media Server has always been a best choice for media management. Its so simple to setup on cross platform as we did for Ubuntu, CentOS and Fedora. It has simplifies the tasks of organizing your media content and streaming to other computers and devices then to share it with your friends.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-plex-media-server-ubuntu-centos-7-1-fedora-22/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/