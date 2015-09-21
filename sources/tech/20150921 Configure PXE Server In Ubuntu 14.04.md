Configure PXE Server In Ubuntu 14.04
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/09/pxe-featured.jpg)

PXE (Preboot Execution Environment) Server allows the user to boot a Linux distribution from a network and install it on hundreds of PCs at a time without any Linux iso images. If your client’s computers don’t have CD/DVD or USB drives, or if you want to set up multiple computers at the same time in a large enterprise, then PXE server can be used to save money and time.

In this article we will show you how you can configure a PXE server in Ubuntu 14.04.

### Configure Networking ###

To get started, you need to first set up your PXE server to use a static IP. To set up a static IP address in your system, you need to edit the “/etc/network/interfaces” file.

1. Open the “/etc/network/interfaces” file.

    sudo nano /etc/network/interfaces

Add/edit as described below:

    # The loopback network interface
    auto lo
    iface lo inet loopback
    # The primary network interface
    auto eth0
    iface eth0 inet static
    address 192.168.1.20
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8

Save the file and exit. This will set its IP address to “192.168.1.20”. Restart the network service.

    sudo /etc/init.d/networking restart

### Install DHCP, TFTP and NFS: ###

DHCP, TFTP and NFS are essential components for configuring a PXE server. First you need to update your system and install all necessary packages.

For this, run the following commands:

    sudo apt-get update
    sudo apt-get install isc-dhcp-Server inetutils-inetd tftpd-hpa syslinux nfs-kernel-Server

### Configure DHCP Server: ###

DHCP stands for Dynamic Host Configuration Protocol, and it is used mainly for dynamically distributing network configuration parameters such as IP addresses for interfaces and services. A DHCP server in PXE environment allow clients to request and receive an IP address automatically to gain access to the network servers.

1. Edit the “/etc/default/dhcp3-server” file.

    sudo nano /etc/default/dhcp3-server

Add/edit as described below:

    INTERFACES="eth0"

Save (Ctrl + o) and exit (Ctrl + x) the file.

2. Edit the “/etc/dhcp3/dhcpd.conf” file:

    sudo nano /etc/dhcp/dhcpd.conf

Add/edit as described below:

    default-lease-time 600;
    max-lease-time 7200;
    subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.21 192.168.1.240;
    option subnet-mask 255.255.255.0;
    option routers 192.168.1.20;
    option broadcast-address 192.168.1.255;
    filename "pxelinux.0";
    next-Server 192.168.1.20;
    }

Save the file and exit.

3. Start the DHCP service.

    sudo /etc/init.d/isc-dhcp-server start

### Configure TFTP Server: ###

TFTP is a file-transfer protocol which is similar to FTP. It is used where user authentication and directory visibility are not required. The TFTP server is always listening for PXE clients on the network. When it detects any network PXE client asking for PXE services, then it provides a network package that contains the boot menu.

1. To configure TFTP, edit the “/etc/inetd.conf” file.

    sudo nano /etc/inetd.conf

Add/edit as described below:

    tftp dgram udp wait root /usr/sbin/in.tftpd /usr/sbin/in.tftpd -s /var/lib/tftpboot

Save and exit the file.

2. Edit the “/etc/default/tftpd-hpa” file.

    sudo nano /etc/default/tftpd-hpa

Add/edit as described below:

    TFTP_USERNAME="tftp"
    TFTP_DIRECTORY="/var/lib/tftpboot"
    TFTP_ADDRESS="[:0.0.0.0:]:69"
    TFTP_OPTIONS="--secure"
    RUN_DAEMON="yes"
    OPTIONS="-l -s /var/lib/tftpboot"

Save and exit the file.

3. Enable boot service for `inetd` to automatically start after every system reboot and start tftpd service.

    sudo update-inetd --enable BOOT
    sudo service tftpd-hpa start

4. Check status.

    sudo netstat -lu

It will show the following output:

    Proto Recv-Q Send-Q Local Address Foreign Address State
    udp 0 0 *:tftp *:*

### Configure PXE boot files ###

Now you need the PXE boot file “pxelinux.0” to be present in the TFTP root directory. Make a directory structure for TFTP, and copy all the bootloader files provided by syslinux from the “/usr/lib/syslinux/” to the “/var/lib/tftpboot/” path by issuing the following commands:

    sudo mkdir /var/lib/tftpboot
    sudo mkdir /var/lib/tftpboot/pxelinux.cfg
    sudo mkdir -p /var/lib/tftpboot/Ubuntu/14.04/amd64/
    sudo cp /usr/lib/syslinux/vesamenu.c32 /var/lib/tftpboot/
    sudo cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot/

#### Set up PXELINUX configuration file ####

The PXE configuration file defines the boot menu displayed to the PXE client when it boots up and contacts the TFTP server. By default, when a PXE client boots up, it will use its own MAC address to specify which configuration file to read, so we need to create that default file that contains the list of kernels which are available to boot.

Edit the PXE Server configuration file with valid installation options.

To edit “/var/lib/tftpboot/pxelinux.cfg/default,”

    sudo nano /var/lib/tftpboot/pxelinux.cfg/default

Add/edit as described below:

    DEFAULT vesamenu.c32
    TIMEOUT 100
    PROMPT 0
    MENU INCLUDE pxelinux.cfg/PXE.conf
    NOESCAPE 1
    LABEL Try Ubuntu 14.04 Desktop
    MENU LABEL Try Ubuntu 14.04 Desktop
    kernel Ubuntu/vmlinuz
    append boot=casper netboot=nfs nfsroot=192.168.1.20:/var/lib/tftpboot/Ubuntu/14.04/amd64
    initrd=Ubuntu/initrd.lz quiet splash
    ENDTEXT
    LABEL Install Ubuntu 14.04 Desktop
    MENU LABEL Install Ubuntu 14.04 Desktop
    kernel Ubuntu/vmlinuz
    append boot=casper automatic-ubiquity netboot=nfs nfsroot=192.168.1.20:/var/lib/tftpboot/Ubuntu/14.04/amd64
    initrd=Ubuntu/initrd.lz quiet splash
    ENDTEXT

Save and exit the file.

Edit the “/var/lib/tftpboot/pxelinux.cfg/pxe.conf” file.

    sudo nano /var/lib/tftpboot/pxelinux.cfg/pxe.conf

Add/edit as described below:

    MENU TITLE PXE Server
    NOESCAPE 1
    ALLOWOPTIONS 1
    PROMPT 0
    MENU WIDTH 80
    MENU ROWS 14
    MENU TABMSGROW 24
    MENU MARGIN 10
    MENU COLOR border 30;44 #ffffffff #00000000 std

Save and exit the file.

### Add Ubuntu 14.04 Desktop Boot Images to PXE Server ###

For this, Ubuntu kernel and initrd files are required. To get those files, you need the Ubuntu 14.04 Desktop ISO Image. You can download the Ubuntu 14.04 ISO image in the /mnt folder by issuing the following command:

    sudo cd /mnt
    sudo wget http://releases.ubuntu.com/14.04/ubuntu-14.04.3-desktop-amd64.iso

**Note**: the download URL might change as the ISO image is updated. Check out this website for the latest download link if the above URL is not working.

Mount the ISO file, and copy all the files to the TFTP folder by issuing the following commands:

    sudo mount -o loop /mnt/ubuntu-14.04.3-desktop-amd64.iso /media/
    sudo cp -r /media/* /var/lib/tftpboot/Ubuntu/14.04/amd64/
    sudo cp -r /media/.disk /var/lib/tftpboot/Ubuntu/14.04/amd64/
    sudo cp /media/casper/initrd.lz /media/casper/vmlinuz /var/lib/tftpboot/Ubuntu/

### Configure NFS Server to Export ISO Contents ###

Now you need to setup Installation Source Mirrors via NFS protocol. You can also use http and ftp for Installation Source Mirrors. Here I have used NFS to export ISO contents.

To configure the NFS server, you need to edit the “/etc/exports” file.

    sudo nano /etc/exports

Add/edit as described below:

    /var/lib/tftpboot/Ubuntu/14.04/amd64 *(ro,async,no_root_squash,no_subtree_check)

Save and exit the file. For the changes to take effect, export and start NFS service.

    sudo exportfs -a
    sudo /etc/init.d/nfs-kernel-server start

Now your PXE Server is ready.

### Configure Network Boot PXE Client ###

A PXE client can be any computer system with a PXE network boot enable option. Now your clients can boot and install Ubuntu 14.04 Desktop by enabling “Boot From Network” options from their systems BIOS.

You’re now ready to go – start your PXE Client Machine with the network boot enable option, and you should now see a sub-menu showing for your Ubuntu 14.04 Desktop that we created.

![pxe](https://www.maketecheasier.com/assets/uploads/2015/09/pxe.png)

### Conclusion ###

Configuring network boot installation using PXE server is efficient and a time-saving method. You can install hundreds of client at a time in your local network. All you need is a PXE server and PXE enabled clients. Try it out, and let us know if this works for you.

Reference: 
- [PXE Server wiki][1]
- [PXE Server Ubuntu][2]

Image credit: [fupsol_unl_20][3]

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/configure-pxe-server-ubuntu/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
[1]:https://en.wikipedia.org/wiki/Preboot_Execution_Environment
[2]:https://help.ubuntu.com/community/PXEInstallServer
[3]:https://www.flickr.com/photos/jhcalderon/3681926417/