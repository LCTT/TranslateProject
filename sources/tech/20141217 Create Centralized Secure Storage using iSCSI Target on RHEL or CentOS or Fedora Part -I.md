Translating----geekpi

Create Centralized Secure Storage using iSCSI Target on RHEL/CentOS/Fedora Part -I
================================================================================
**iSCSI** is a block level Protocol for sharing **RAW Storage Devices** over TCP/IP Networks, Sharing and accessing Storage over iSCSI, can be used with existing IP and Ethernet networks such as NICs, Switched, Routers etc. iSCSI target is a remote hard disk presented from an remote iSCSI server (or) target.

![Install iSCSI Target in Linux](http://www.tecmint.com/wp-content/uploads/2014/07/Install-iSCSI-Target-in-Linux.jpg)
Install iSCSI Target in Linux

We don’t need a high resource for stable connectivity and performance in Client side’s. iSCSI Server called as Target, this share’s the storage from server. iSCSI Client’s called as Initiator, this will access the storage which shared from Target Server. There are iSCSI adapter’s available in market for Large Storage services such as SAN Storage’s.

**Why we need a iSCSI adapter for Large storage Area?**

Ethernet adapters (NIC) are designed to transfer packetized file level data among systems, servers and storage devices like NAS storage’s, they are not capable for transferring block level data over Internet.

### Features of iSCSI Target ###

- Possible to run several iSCSI targets on a single machine.
- A single machine making multiple iscsi target available on the iSCSI SAN
- The target is the Storage and makes it available for initiator (Client) over the network
- These Storage’s are Pooled together to make available to the network is iSCSI LUNs (Logical Unit Number).
- iSCSI supports multiple connections within the same session
- iSCSI initiator discover the targets in network then authenticating and login with LUNs, to get the remote storage locally.
- We can Install any Operating systems in those locally mounted LUNs as what we used to install in our Base systems.

### Why the need of iSCSI? ###

In Virtualization we need storage with high redundancy, stability, iSCSI provides those all in low cost. Creating a SAN Storage in low price while comparing to Fiber Channel SANs, We can use the standard equipment’s for building a SAN using existing hardware such as NIC, Ethernet Switched etc..

Let start to get install and configure the centralized Secure Storage using iSCSI Target. For this guide, I’ve used following setups.

- We need separate 1 systems to Setup the iSCSI Target Server and Initiator (Client).
- Multiple numbers of Hard disk can be added in large storage environment, But we here using only 1 additional drive except Base installation disk.
- Here we using only 2 drives, One for Base server installation, Other one for Storage (LUNs) which we going to create in PART-II of this series.

#### Master Server Setup ####

- Operating System – CentOS release 6.5 (Final)
- iSCSI Target IP – 192.168.0.200
- Ports Used : TCP 860, 3260
- Configuration file : /etc/tgt/targets.conf

## Installing iSCSI Target ##

Open terminal and use yum command to search for the package name which need to get install for iscsi target.

    # yum search iscsi

#### Sample Output ####

    ========================== N/S matched: iscsi =======================
    iscsi-initiator-utils.x86_64 : iSCSI daemon and utility programs
    iscsi-initiator-utils-devel.x86_64 : Development files for iscsi-initiator-utils
    lsscsi.x86_64 : List SCSI devices (or hosts) and associated information
    scsi-target-utils.x86_64 : The SCSI target daemon and utility programs

We got the search result as above, choose the **Target** package and install to play around.

    # yum install scsi-target-utils -y

![Install iSCSI Utils](http://www.tecmint.com/wp-content/uploads/2014/07/Install-iSCSI-in-Linux.jpg)
Install iSCSI Utils

List the installed package to know the default config, service, and man page location.

    # rpm -ql scsi-target-utils.x86_64

![List All iSCSI Files](http://www.tecmint.com/wp-content/uploads/2014/07/List-All-ISCSI-Files.jpg)

List All iSCSI Files

Let’s start the iSCSI Service, and check the status of Service up and running, iSCSI service named as **tgtd**.

    # /etc/init.d/tgtd start
    # /etc/init.d/tgtd status

![Start iSCSI Service](http://www.tecmint.com/wp-content/uploads/2014/07/Start-iSCSI-Service.jpg)

Start iSCSI Service

Now we need to configure it to start Automatically while system start-up.

    # chkconfig tgtd on

Next, verify that the run level configured correctly for the tgtd service.

    # chkconfig --list tgtd

![Enable iSCSI on Startup](http://www.tecmint.com/wp-content/uploads/2014/07/Enable-iSCSI-on-Startup.jpg)

Enable iSCSI on Startup

Let’s use **tgtadm** to list what targets and LUNS we currently got configured in our Server.

    # tgtadm --mode target --op show

The **tgtd** installed up and running, but there is no **Output** from the above command because we have not yet defined the LUNs in Target Server. For manual page, Run ‘**man**‘ command.

    # man tgtadm

![iSCSI Man Pages](http://www.tecmint.com/wp-content/uploads/2014/07/iSCSI-Man-Pages.jpg)

iSCSI Man Pages

Finally we need to add iptables rules for iSCSI if there is iptables deployed in your target Server. First, find the Port number of iscsi target using following netstat command, The target always listens on TCP port 3260.

    # netstat -tulnp | grep tgtd

![Find iSCSI Port](http://www.tecmint.com/wp-content/uploads/2014/07/Find-iSCSI-Port.jpg)

Find iSCSI Port

Next add the following rules to allow iptables to Broadcast the iSCSI target discovery.

    # iptables -A INPUT -i eth0 -p tcp --dport 860 -m state --state NEW,ESTABLISHED -j ACCEPT
    # iptables -A INPUT -i eth0 -p tcp --dport 3260 -m state --state NEW,ESTABLISHED -j ACCEPT

![Open iSCSI Ports](http://www.tecmint.com/wp-content/uploads/2014/07/Open-iSCSI-Ports.jpg)

Open iSCSI Ports

![Add iSCSI Ports to Iptables](http://www.tecmint.com/wp-content/uploads/2014/07/Add-iSCSI-Ports-to-Iptables.jpg)

Add iSCSI Ports to Iptables

**Note**: Rule may vary according to your **Default CHAIN Policy**. Then save the Iptables and restart the iptables.

    # iptables-save
    # /etc/init.d/iptables restart

![Restart iptables](http://www.tecmint.com/wp-content/uploads/2014/07/Restart-iptables.jpg)

Restart iptables

Here we have deployed a target server to share LUNs to any initiator which authenticating with target over TCP/IP, This suitable for small to large scale production environments too.

In my next upcoming articles, I will show you how to [Create LUN’s using LVM in Target Server][1] and how to share LUN’s on Client machines, till then stay tuned to TecMint for more such updates and don’t forget to give valuable comments.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-centralized-secure-storage-using-iscsi-targetin-linux/

作者：[Babin Lonston][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://www.tecmint.com/create-luns-using-lvm-in-iscsi-target/