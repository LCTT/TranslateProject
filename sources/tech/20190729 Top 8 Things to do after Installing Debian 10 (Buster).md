[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 8 Things to do after Installing Debian 10 (Buster))
[#]: via: (https://www.linuxtechi.com/things-to-do-after-installing-debian-10/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Top 8 Things to do after Installing Debian 10 (Buster)
======

Debian 10 code name Buster is the latest LTS release from the house of Debian and the latest release comes packed with a lot of features. So if you have already installed the Debian 10 in your system and thinking what next, then please continue reading the article till the end as we provide you with the top 8 things to do after installing Debian 10. For those who haven’t installed Debian 10, please read this guide [**Debian 10 (Buster) Installation Steps with Screenshots**][1]. So lets continue with the article:

<https://www.linuxtechi.com/wp-content/uploads/2019/07/Things-to-do-after-installing-debian10.jpg>

### 1) Install and Configure sudo

Once you complete setting up Debian 10 in your system, the first thing you need to do is install the sudo package as it enables you to get administrative privileges to install any package you need. In order to install and configure sudo, please use the following command:

Become the root user and then install sudo package using the beneath command,

```
root@linuxtechi:~$ su -
Password:
root@linuxtechi:~# apt install sudo -y
```

Add your local user to sudo group using the following [usermod][2] command,

```
root@linuxtechi:~# usermod -aG sudo  pkumar
root@linuxtechi:~#
```

Now verify whether local user got the sudo rights or not,

```
root@linuxtechi:~$ id
uid=1000(pkumar) gid=1000(pkumar) groups=1000(pkumar),27(sudo)
root@linuxtechi:~$ sudo vi /etc/hosts
[sudo] password for pkumar:
root@linuxtechi:~$
```

### 2) Fix Date and time

Once you’ve successfully configured the sudo package, next thing you need to  fix the date and time according to your location. In order to fix the date and time,

Go to System **Settings** –&gt; **Details** –&gt; **Date and Time** and then change your time zone that suits to your location.

<https://www.linuxtechi.com/wp-content/uploads/2019/07/Adjust-date-time-Debian10.jpg>

Once the time zone is changed, you can see the time changed automatically in your clock

### 3) Apply all updates

After Debian 10 installation, it is recommended to install all updates which are available via Debian 10 package repositories, execute the beneath apt command,

```
root@linuxtechi:~$ sudo apt update
root@linuxtechi:~$ sudo apt upgrade -y
```

**Note:** If you are a big fan of vi editor then install vim using the following command apt command,

```
root@linuxtechi:~$ sudo apt install vim -y
```

### 4) Install Flash Player Plugin

By default, the Debian 10 (Buster) repositories don’t come packed with the Flash plugin and hence users looking to install flash player in their system need to follow the steps outlined below:

Configure Repository for flash player:

```
root@linuxtechi:~$ echo "deb http://ftp.de.debian.org/debian buster main contrib" | sudo tee -a  /etc/apt/sources.list
deb http://ftp.de.debian.org/debian buster main contrib
root@linuxtechi:~
```

Now update package index using following command,

```
root@linuxtechi:~$ sudo apt update
```

Install flash plugin using following apt command

```
root@linuxtechi:~$ sudo apt install pepperflashplugin-nonfree -y
```

Once package is installed successfully, then try to play videos in YouTube,

<https://www.linuxtechi.com/wp-content/uploads/2019/07/Flash-Player-plugin-Debian10.jpg>

### 5)  Install Software like VLC, SKYPE, FileZilla and Screenshot tool

So now we’ve enabled flash player, it is time to install all other software like VLC, Skype, Filezilla and screenshot tool like flameshot in our Debian 10 system.

**Install VLC Media Player**

To install VLC player in your system using apt command,

```
root@linuxtechi:~$ sudo apt install vlc -y
```

After the successful installation of VLC player, try to play your favorite videos

<https://www.linuxtechi.com/wp-content/uploads/2019/07/Debian10-VLC.jpg>

**Install Skype:**

First download the latest Skype package as shown below:

```
root@linuxtechi:~$ wget https://go.skype.com/skypeforlinux-64.deb
```

Next install the package using the apt command as shown below:

```
root@linuxtechi:~$ sudo apt install ./skypeforlinux-64.deb
```

After successful installation of Skype, try to access it and enter your Credentials,

<https://www.linuxtechi.com/wp-content/uploads/2019/07/skype-Debian10.jpg>

**Install Filezilla**

To install Filezilla in your system use the following apt command,

```
root@linuxtechi:~$ sudo apt install filezilla -y
```

Once FileZilla package is installed successfully, try to access it,

<https://www.linuxtechi.com/wp-content/uploads/2019/07/FileZilla-Debian10.jpg>

**Install Screenshot tool (flameshot)**

Use the following command to install screenshoot tool flameshot,

```
root@linuxtechi:~$ sudo apt install flameshot -y
```

**Note:** Shutter Tool in Debian 10 has been removed

<https://www.linuxtechi.com/wp-content/uploads/2019/07/flameshoot-debian10.jpg>

### 6) Enable and Start Firewall

It is always recommended to start firewall to make your secure over the network. If you are looking to enable firewall in Debian 10, **UFW** (Uncomplicated Firewall) is the best tool handle firewall. Since UFW is available in the Debian repositories, it is quite easy to install as shown below:

```
root@linuxtechi:~$ sudo apt install ufw
```

Once you have installed UFW, the next step is to set up the firewall. So, to setup the firewall, disable all incoming traffic by denying the ports and allow only the required ports like ssh, http and https.

```
root@linuxtechi:~$ sudo ufw default deny incoming
Default incoming policy changed to 'deny'
(be sure to update your rules accordingly)
root@linuxtechi:~$ sudo ufw default allow outgoing
Default outgoing policy changed to 'allow'
(be sure to update your rules accordingly)
root@linuxtechi:~$
```

Allow SSH port

```
root@linuxtechi:~$ sudo ufw allow ssh
Rules updated
Rules updated (v6)
root@linuxtechi:~$
```

In case you have installed Web Server in your system then allow their ports too in the firewall using the following ufw command,

```
root@linuxtechi:~$ sudo ufw allow 80
Rules updated
Rules updated (v6)
root@linuxtechi:~$ sudo ufw allow 443
Rules updated
Rules updated (v6)
root@linuxtechi:~$
```

Finally, you can enable UFW using the following command

```
root@linuxtechi:~$ sudo ufw enable
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup
root@linuxtechi:~$
```

In case if you want to check the status of your firewall, you can check it using the following command

```
root@linuxtechi:~$ sudo ufw status
```

### 7) Install Virtualization Software (VirtualBox)

First step in installing Virtualbox is by importing the public keys of the Oracle VirtualBox repository to your Debian 10 system

```
root@linuxtechi:~$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
OK
root@linuxtechi:~$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
OK
root@linuxtechi:~$
```

If the import is successful, you will see a “OK” message displayed.

Next you need to add the repository to the source list

```
root@linuxtechi:~$ sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"
root@linuxtechi:~$
```

Finally, it is time to install VirtualBox 6.0 in your system

```
root@linuxtechi:~$ sudo apt update
root@linuxtechi:~$ sudo apt install virtualbox-6.0 -y
```

Once VirtualBox packages are installed successfully, try access it and start creating virtual machines,

<https://www.linuxtechi.com/wp-content/uploads/2019/07/VirtualBox6-Debian10-Workstation.jpg>

### 8) Install latest AMD Drivers

Finally, you can also install additional AMD drivers needed like the graphics card, ATI Proprietary and Nvidia Graphics drivers. To Install the latest AMD Drivers, first we must modify **/etc/apt/sources.list** file, add **non-free** word in lines which contains **main** and **contrib**, example is shown below

```
root@linuxtechi:~$ sudo vi /etc/apt/sources.list
…………………
deb http://deb.debian.org/debian/ buster main non-free contrib
deb-src http://deb.debian.org/debian/ buster main non-free contrib

deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

deb http://ftp.us.debian.org/debian/ buster-updates main contrib non-free
……………………
```

Now use the following apt commands to install latest AMD drivers in Debian 10 system

```
root@linuxtechi:~$ sudo apt update
root@linuxtechi:~$ sudo apt install firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu -y
```

That’s all from this article, I hope you got an idea what one should after installing Debian 10. Please do share your feedback and comments in comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/things-to-do-after-installing-debian-10/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/debian-10-buster-installation-guide/
[2]: https://www.linuxtechi.com/linux-commands-to-manage-local-accounts/
