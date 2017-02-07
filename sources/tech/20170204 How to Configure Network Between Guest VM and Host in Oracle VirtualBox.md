How to Configure Network Between Guest VM and Host in Oracle VirtualBox
============================================================

Once you have installed different operating systems in [Oracle VirtualBox][2], you may want to enable communication between the host and the virtual machines.

In this article, we will describe the simplest and direct method of setting up a network for guest virtual machines and the host in Linux.

For the purpose of this tutorial:

1.  Host Operating System – Linux Mint 18
2.  Virtual Machine OS – CentOS 7 and Ubuntu 16.10

#### Requirements

1.  A working [Oracle Virtualbox installed][1] on Host machine.
2.  You must have installed a guest operating system such as Ubuntu, Fedora, CentOS, Linux Mint or any of your choice in the Oracle virtual box.
3.  Power off the virtual machines as you perform the configurations up to the step where your required to turn them on.

In order for the guest and host machines to communicate, they need to be on the same network and by default, you can attach up to four network cards to your guest machines.

The default network card (Adapter 1) is normally used to connect the guest machines to the Internet using NATvia the host machine.

Important: Always set the first adapter to communicate with the host and the second adapter to connect to the Internet.

### Create a Network For Guests and Host Machine

At the Virtualbox manager interface below, start by creating a network on which the host and guests will operate.

Go to File –> Preferences or hit `Ctrl + G`:

[
 ![Virtualbox Preferences Window](http://www.tecmint.com/wp-content/uploads/2017/02/Virtualbox-Preferences-Window.png) 
][3]

Virtualbox Preferences Window

From the following interface, there are two options; choose Host-only Networks by clicking on it. Then use the `+`sign on the right to add a new host-only network.

[
 ![Set Guest Network](http://www.tecmint.com/wp-content/uploads/2017/02/Set-Guest-Network.png) 
][4]

Set Guest Network

Below is a screen shot showing a new host-only network has been created called vboxnet0.

[
 ![Virtualbox Preferences Window](http://www.tecmint.com/wp-content/uploads/2017/02/Virtualbox-Preferences-Window-1.png) 
][5]

Virtualbox Preferences Window

If you want, you can remove it by using the `-` button in the middle and to view the network details/settings, click on the edit button.

You can as well change the values as per your preferences, such as the network address, network mask, etc.

Note: The IPv4 address in the interface below is the IP address of your host machine.

[
 ![Host Network Details](http://www.tecmint.com/wp-content/uploads/2017/02/Host-Network-Details.png) 
][6]

Host Network Details

In the next interface, you can configure the DHCP server that is if you want the guest machines to use a dynamic IP address (make sure it is enabled before using it). But I recommend using a static IP address for the virtual machines.

Now click OK on all network settings interfaces below to save the changes.

[
 ![Set Guest Static IP aAddress](http://www.tecmint.com/wp-content/uploads/2017/02/Set-Guest-Static-IP-Address.png) 
][7]

Set Guest Static IP aAddress

#### Configure Virtual Machine Network Settings

Note: You can follow the steps below for every virtual machine that you want to add on the network to communicate with the host machine.

Back at the virtual box manager interface, select your guest virtual machine such as Ubuntu 16.10 server or CentOS 7 and click on the Settings menu.

[
 ![Configure VM Settings](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-VM-Settings.png) 
][8]

Configure VM Settings

#### Configure Adapter to Connect Virtual Machine to Host

Choose the Network option from the interface above. Afterwards, configure first network card (Adapter 1) with the following settings:

1.  Check the option: “Enable Network Adapter” to turn it on.
2.  In the field Attached to: select Host-only Adapter
3.  Then select the Name of the network: vboxnet0

As in the screen shot below and click OK to save the settings:

[
 ![Enable Network Adapter for Guest VM](http://www.tecmint.com/wp-content/uploads/2017/02/Enable-Network-Adapter-for-Guest-VM.png) 
][9]

Enable Network Adapter for Guest VM

#### Configure Adapter to Connect Virtual Machine to Internet

Then add a second network card (Adapter 2) to connect virtual machine to the Internet via the host. Use the settings below:

1.  Check the option: “Enable Network Adapter” to activate it.
2.  In the field Attached to: select NAT

[
 ![Enable Network Adapter for VM](http://www.tecmint.com/wp-content/uploads/2017/02/Enable-Network-Adapter-for-VM.png) 
][10]

Enable Network Adapter for VM

#### Setup Static IP Address for Guest Virtual Machine

At this stage, power on the guest virtual machine, login and [configure static IP address][11]. Run the command below to show all the interfaces on the guest machine and allocated IP addresses:

```
$ ip add
```
[
 ![Configure Static IP Address for VM](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Static-IP-Address-for-VM.png) 
][12]

Configure Static IP Address for VM

From the screen shot above, you can see that there are three interfaces enabled on the virtual machine:

1.  `lo` – loopback interface
2.  `enp0s3` (Adapter 1) – for host-only communication which is using the DHCP as set in one of the previous steps and later configured with a static IP address.
3.  `enp0s8` (Adapter 2) – for connection to the Internet. It will use DHCP by default.

##### On Debian/Ubuntu/Linux Mint

Important: Here, I used Ubuntu 16.10 Server: IP address: 192.168.56.5.

Open the file /etc/network/interfaces using your favorite editor with super user privileges:

```
$ sudo vi /etc/network/interfaces
```

Use the following settings for the interface enp0s3 (use your preferred values here):

```
auto  enp0s3
iface enp0s3 inet static
address  192.168.56.5
network  192.168.56.0
netmask  255.255.255.0
gateway  192.168.56.1
dns-nameservers  8.8.8.8  192.168.56.1
```

Save the file and exit.

Then restart network services like so:

```
$ sudo systemctl restart networking
```

Alternatively, reboot the system and closely, check if the interface is using the new ip addresses:

```
$ ip add
```

##### On RHEL/CentOS/Fedora

Important: For this section, I used CentOS 7: IP address: 192.168.56.10.

Begin by opening the file for enp0s3 – host-only network interface; /etc/sysconfig/network-scripts/ifcfg-enp0s3using your favorite editor with super user privileges:

```
$ sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

Create/modify the following settings (use your preferred values here):

```
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.56.10
NETWORK=192.168.56.0
NETMASK=255.255.255.0
GATEWAY=192.168.56.1
DNS=8.8.8.8 192.168.56.1
NM_CONTROLLED=no     #use this file not network manager to manage interface
```

Save the file and exit. Then restart network service as follows (you can as well reboot):

```
$ sudo systemctl restart network.service 
```

Check if the interface is using the new IP addresses as follows:

```
$ ip add
```

#### Manage Virtual Machines From Host Using SSH

On the host machine, use SSH to manage your virtual machines. In the following example, am accessing the CentOS 7 (192.168.56.10)server using SSH:

```
$ ssh tecmint@192.168.56.10
$ who
```
[
 ![Connect Guest VM using SSH](http://www.tecmint.com/wp-content/uploads/2017/02/Connect-Guest-VM-using-SSH.png) 
][13]

Connect Guest VM using SSH

That’s it! In this post, we described a straightforward method of setting up a network between a guest virtual machines and the host. Do share your thoughts about this tutorial using the feedback section below.

--------------------------------------------------------------------------------

译者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/network-between-guest-vm-and-host-virtualbox/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-virtualbox-on-redhat-centos-fedora/
[2]:http://www.tecmint.com/install-virtualbox-on-redhat-centos-fedora/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Virtualbox-Preferences-Window.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Guest-Network.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Virtualbox-Preferences-Window-1.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Host-Network-Details.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Guest-Static-IP-Address.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-VM-Settings.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Enable-Network-Adapter-for-Guest-VM.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Enable-Network-Adapter-for-VM.png
[11]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Static-IP-Address-for-VM.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Connect-Guest-VM-using-SSH.png
