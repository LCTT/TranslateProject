Install OpenQRM Cloud Computing Platform In Debian
================================================================================
### Introduction ###

**openQRM** is a web-based open source Cloud computing and datacenter management platform that integrates flexibly with existing components in enterprise data centers.

It supports the following virtualization technologies:

- KVM,
- XEN,
- Citrix XenServer,
- VMWare ESX,
- LXC,
- OpenVZ.

The Hybrid Cloud Connector in openQRM supports a range of private or public cloud providers to extend your infrastructure on demand via **Amazon AWS**, **Eucalyptus** or **OpenStack**. It, also, automates provisioning, virtualization, storage and configuration management, and it takes care of high-availability. A self-service cloud portal with integrated billing system enables end-users to request new servers and application stacks on-demand.

openQRM is available in two different flavours such as:

- Enterprise Edition
- Community Edition

You can view the difference between both editions [here][1].

### Features ###

- Private/Hybrid Cloud Computing Platform;
- Manages physical and virtualized server systems;
- Integrates with all major open and commercial storage technologies;
- Cross-platform: Linux, Windows, OpenSolaris, and *BSD;
- Supports KVM, XEN, Citrix XenServer, VMWare ESX(i), lxc, OpenVZ and VirtualBox;
- Support for Hybrid Cloud setups using additional Amazon AWS, Eucalyptus, Ubuntu UEC cloud resources;
- Supports P2V, P2P, V2P, V2V Migrations and High-Availability;
- Integrates with the best Open Source management tools – like puppet, nagios/Icinga or collectd;
- Over 50 plugins for extended features and integration with your infrastructure;
- Self-Service Portal for end-users;
- Integrated billing system.

### Installation ###

Here, we will install openQRM in Ubuntu 14.04 LTS. Your server must atleast meet the following requirements.

- 1 GB RAM;
- 100 GB Hdd;
- Optional: Virtualization enabled (VT for Intel CPUs or AMD-V for AMD CPUs) in Bios.

First, install make package to compile openQRM source package.

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install make

Then, run the following commands one by one to install openQRM.

Download the latest available version [from here][2].

    wget http://sourceforge.net/projects/openqrm/files/openQRM-Community-5.1/openqrm-community-5.1.tgz
    
    tar -xvzf openqrm-community-5.1.tgz
    
    cd openqrm-community-5.1/src/
    
    sudo make
    
    sudo make install
    
    sudo make start

During installation, you’ll be asked to update the php.ini file.

![~-openqrm-community-5.1-src_001](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_001.png)

Enter mysql root user password.

![~-openqrm-community-5.1-src_002](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_002.png)

Re-enter password:

![~-openqrm-community-5.1-src_003](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_003.png)

Select the mail server configuration type.

![~-openqrm-community-5.1-src_004](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_004.png)

If you’re not sure, select Local only. In our case, I go with **Local only** option.

![~-openqrm-community-5.1-src_005](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_005.png)

Enter your system mail name, and finally enter the Nagios administration password.

![~-openqrm-community-5.1-src_007](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@server-openqrm-community-5.1-src_007.png)

The above commands will take long time depending upon your Internet connection to download all packages required to run openQRM. Be patient.

Finally, you’ll get the openQRM configuration URL along with username and password.

![~_002](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/sk@debian-_002.png)

### Configuration ###

After installing openQRM, open up your web browser and navigate to the URL: **http://ip-address/openqrm**.

For example, in my case http://192.168.1.100/openqrm.

The default username and password is: **openqrm/openqrm**.

![Mozilla Firefox_003](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/Mozilla-Firefox_003.png)

Select a network card to use for the openQRM management network.

![openQRM Server - Mozilla Firefox_004](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_004.png)

Select a database type. In our case, I selected mysql.

![openQRM Server - Mozilla Firefox_006](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_006.png)

Now, configure the database connection and initialize openQRM. Here, I use **openQRM** as database name, and user as **root** and debian as password for the database. Be mindful that you should enter the mysql root user password that you have created while installing openQRM.

![openQRM Server - Mozilla Firefox_012](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_012.png)

Congratulations!! openQRM has been installed and configured.

![openQRM Server - Mozilla Firefox_013](http://180016988.r.cdn77.net/wp-content/uploads/2015/02/openQRM-Server-Mozilla-Firefox_013.png)

### Update openQRM ###

To update openQRM at any time run the following command:

    cd openqrm/src/
    make update

What we have done so far is just installed and configured openQRM in our Ubuntu server. For creating, running Virtual Machines, managing Storage, integrating additional systems and running your own private Cloud, I suggest you to read the [openQRM Administrator Guide][3].

That’s all now. Cheers! Happy weekend!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-openqrm-cloud-computing-platform-debian/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.openqrm-enterprise.com/products/edition-comparison.html
[2]:http://sourceforge.net/projects/openqrm/files/?source=navbar
[3]:http://www.openqrm-enterprise.com/fileadmin/Documents/Whitepaper/openQRM-Enterprise-Administrator-Guide-5.2.pdf