Install Oracle VirtualBox On Ubuntu 18.04 LTS Headless Server
======

![](https://www.ostechnix.com/wp-content/uploads/2016/07/Install-Oracle-VirtualBox-On-Ubuntu-18.04-720x340.png)

This step by step tutorial walk you through how to install **Oracle VirtualBox** on Ubuntu 18.04 LTS headless server. And, this guide also describes how to manage the VirtualBox headless instances using **phpVirtualBox** , a web-based front-end tool for VirtualBox. The steps described below might also work on Debian, and other Ubuntu derivatives such as Linux Mint. Let us get started.

### Prerequisites

Before installing Oracle VirtualBox, we need to do the following prerequisites in our Ubuntu 18.04 LTS server.

First of all, update the Ubuntu server by running the following commands one by one.
```
$ sudo apt update

$ sudo apt upgrade

$ sudo apt dist-upgrade

```

Next, install the following necessary packages:
```
$ sudo apt install build-essential dkms unzip wget

```

After installing all updates and necessary prerequisites, restart the Ubuntu server.
```
$ sudo reboot

```

### Install Oracle VirtualBox on Ubuntu 18.04 LTS server

Add Oracle VirtualBox official repository. To do so, edit **/etc/apt/sources.list** file:
```
$ sudo nano /etc/apt/sources.list

```

Add the following lines.

Here, I will be using Ubuntu 18.04 LTS, so I have added the following repository.
```
deb http://download.virtualbox.org/virtualbox/debian bionic contrib

```

![][2]

Replace the word **‘bionic’** with your Ubuntu distribution’s code name, such as ‘xenial’, ‘vivid’, ‘utopic’, ‘trusty’, ‘raring’, ‘quantal’, ‘precise’, ‘lucid’, ‘jessie’, ‘wheezy’, or ‘squeeze**‘.**

Then, run the following command to add the Oracle public key:
```
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

```

For VirtualBox older versions, add the following key:
```
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

```

Next, update the software sources using command:
```
$ sudo apt update

```

Finally, install latest Oracle VirtualBox latest version using command:
```
$ sudo apt install virtualbox-5.2

```

### Adding users to VirtualBox group

We need to create and add our system user to the **vboxusers** group. You can either create a separate user and assign it to vboxusers group or use the existing user. I don’t want to create a new user, so I added my existing user to this group. Please note that if you use a separate user for virtualbox, you must log out and log in to that particular user and do the rest of the steps.

I am going to use my username named **sk** , so, I ran the following command to add it to the vboxusers group.
```
$ sudo usermod -aG vboxusers sk

```

Now, run the following command to check if virtualbox kernel modules are loaded or not.
```
$ sudo systemctl status vboxdrv

```

![][3]

As you can see in the above screenshot, the vboxdrv module is loaded and running!

For older Ubuntu versions, run:
```
$ sudo /etc/init.d/vboxdrv status

```

If the virtualbox module doesn’t start, run the following command to start it.
```
$ sudo /etc/init.d/vboxdrv setup

```

Great! We have successfully installed VirtualBox and started virtualbox module. Now, let us go ahead and install Oracle VirtualBox extension pack.

### Install VirtualBox Extension pack

The VirtualBox Extension pack provides the following functionalities to the VirtualBox guests.

  * The virtual USB 2.0 (EHCI) device
  * VirtualBox Remote Desktop Protocol (VRDP) support
  * Host webcam passthrough
  * Intel PXE boot ROM
  * Experimental support for PCI passthrough on Linux hosts



Download the latest Extension pack for VirtualBox 5.2.x from [**here**][4].
```
$ wget https://download.virtualbox.org/virtualbox/5.2.14/Oracle_VM_VirtualBox_Extension_Pack-5.2.14.vbox-extpack

```

Install Extension pack using command:
```
$ sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.2.14.vbox-extpack

```

Congratulations! We have successfully installed Oracle VirtualBox with extension pack in Ubuntu 16.04 LTS server. It is time to deploy virtual machines. Refer the [**virtualbox official guide**][5] to start creating and managing virtual machines in command line.

Not everyone is command line expert. Some of you might want to create and use virtual machines graphically. No worries! Here is where **phpVirtualBox** comes in handy!!

### About phpVirtualBox

**phpVirtualBox** is a free, web-based front-end to Oracle VirtualBox. It is written using PHP language. Using phpVirtualBox, we can easily create, delete, manage and administer virtual machines via a web browser from any remote system on the network.

### Install phpVirtualBox in Ubuntu 18.04 LTS

Since it is a web-based tool, we need to install Apache web server, PHP and some php modules.

To do so, run:
```
$ sudo apt install apache2 php php-mysql libapache2-mod-php php-soap php-xml

```

Then, Download the phpVirtualBox 5.2.x version from the [**releases page**][6]. Please note that we have installed VirtualBox 5.2, so we must install phpVirtualBox version 5.2 as well.

To download it, run:
```
$ wget https://github.com/phpvirtualbox/phpvirtualbox/archive/5.2-0.zip

```

Extract the downloaded archive with command:
```
$ unzip 5.2-0.zip

```

This command will extract the contents of 5.2.0.zip file into a folder named “phpvirtualbox-5.2-0”. Now, copy or move the contents of this folder to your apache web server root folder.
```
$ sudo mv phpvirtualbox-5.2-0/ /var/www/html/phpvirtualbox

```

Assign the proper permissions to the phpvirtualbox folder.
```
$ sudo chmod 777 /var/www/html/phpvirtualbox/

```

Next, let us configure phpVirtualBox.

Copy the sample config file as shown below.
```
$ sudo cp /var/www/html/phpvirtualbox/config.php-example /var/www/html/phpvirtualbox/config.php

```

Edit phpVirtualBox **config.php** file:
```
$ sudo nano /var/www/html/phpvirtualbox/config.php

```

Find the following lines and replace the username and password with your system user (The same username that we used in “Adding users to VirtualBox group” section).

In my case, my Ubuntu system username is **sk** , and its password is **ubuntu**.
```
var $username = 'sk';
var $password = 'ubuntu';

```

![][7]

Save and close the file.

Next, create a new file called **/etc/default/virtualbox** :
```
$ sudo nano /etc/default/virtualbox

```

Add the following line. Replace ‘sk’ with your own username.
```
VBOXWEB_USER=sk

```

Finally, Reboot your system or simply restart the following services to complete the configuration.
```
$ sudo systemctl restart vboxweb-service

$ sudo systemctl restart vboxdrv

$ sudo systemctl restart apache2

```

### Adjust firewall to allow Apache web server

By default, the apache web browser can’t be accessed from remote systems if you have enabled the UFW firewall in Ubuntu 18.04 LTS. You must allow the http and https traffic via UFW by following the below steps.

First, let us view which applications have installed a profile using command:
```
$ sudo ufw app list
Available applications:
Apache
Apache Full
Apache Secure
OpenSSH

```

As you can see, Apache and OpenSSH applications have installed UFW profiles.

If you look into the **“Apache Full”** profile, you will see that it enables traffic to the ports **80** and **443** :
```
$ sudo ufw app info "Apache Full"
Profile: Apache Full
Title: Web Server (HTTP,HTTPS)
Description: Apache v2 is the next generation of the omnipresent Apache web
server.

Ports:
80,443/tcp

```

Now, run the following command to allow incoming HTTP and HTTPS traffic for this profile:
```
$ sudo ufw allow in "Apache Full"
Rules updated
Rules updated (v6)

```

If you want to allow https traffic, but only http (80) traffic, run:
```
$ sudo ufw app info "Apache"

```

### Access phpVirtualBox Web console

Now, go to any remote system that has graphical web browser.

In the address bar, type: **<http://IP-address-of-virtualbox-headless-server/phpvirtualbox>**.

In my case, I navigated to this link – **<http://192.168.225.22/phpvirtualbox>**

You should see the following screen. Enter the phpVirtualBox administrative user credentials.

The default username and phpVirtualBox is **admin** / **admin**.

![][8]

Congratulations! You will now be greeted with phpVirtualBox dashboard.

![][9]

Now, start creating your VMs and manage them from phpvirtualbox dashboard. As I mentioned earlier, You can access the phpVirtualBox from any system in the same network. All you need is a web browser and the username and password of phpVirtualBox.

If you haven’t enabled virtualization support in the BISO of host system (not the guest), phpVirtualBox allows you to create 32-bit guests only. To install 64-bit guest systems, you must enable virtualization in your host system’s BIOS. Look for an option that is something like “virtualization” or “hypervisor” in your bios and make sure it is enabled.

That’s it. Hope this helps. If you find this guide useful, please share it on your social networks and support us.

More good stuffs to come. Stay tuned!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/07/Add-VirtualBox-repository.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/07/vboxdrv-service.png
[4]:https://www.virtualbox.org/wiki/Downloads
[5]:http://www.virtualbox.org/manual/ch08.html
[6]:https://github.com/phpvirtualbox/phpvirtualbox/releases
[7]:http://www.ostechnix.com/wp-content/uploads/2016/07/phpvirtualbox-config.png
[8]:http://www.ostechnix.com/wp-content/uploads/2016/07/phpvirtualbox-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2016/07/phpvirtualbox-2.png
