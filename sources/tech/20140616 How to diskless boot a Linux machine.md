zsJacky translating

How to diskless boot a Linux machine
================================================================================
Diskless booting implies that a client computer does not have any disk storage when booting an operating system. In that case, the computer can load the kernel as well as the root filesystem from a remote NFS server over network. It may use several different methods to load the kernel and the root filesystem from an NFS server: RARP, BOOTP or DHCP protocols. In this tutorial, I will use BOOTP/DHCP protocol because they are supported by many network cards.

### Advantage of Diskless Computers ###

Imagine you have 30 computers in your office, all of which need to access the same application. If you are managing the computers as an administrator, what would you do? It will be a waste of your time if you install the application on every computer. On the other hand, a diskless system can eliminate the problem. With a diskless system, you just need to install the application on a central NFS server, and then boot all 30 clients over network.

### Requirements ###

Two or more Linux computers equipped with network cards that support DHCP protocol. The computer that will act as an NFS server should have a hard drive, and the other client computer(s) do not need any hard drive. The server and client computer(s) need to be connected to the same local network.

There are five steps to setting up the diskless system.

1. Install required packages
1. Configure a TFTP server
1. Configure a DHCP server
1. Configure an NFS server
1. Booting diskless clients

In this tutorial, I assume that the computer which will run as a booting server is running Ubuntu. If you are using other Linux distribution, the principle is the same.

### Step One: Install Required Packages ###

Use apt-get to install all necessary packages as follows.

    $ sudo apt-get install dhcp3-server tftpd-hpa syslinux nfs-kernel-server initramfs-tools

### Step Two: Configure a TFTP Server ###

TFTP server is a small FTP server which is needed for automated transfer of boot files between a client computer and server in the local network.

Add the following lines to /etc/default/tftpd-hpa

    RUN_DAEMON="yes"
    OPTIONS="-l -s /var/lib/tftpboot/"

Next, create a boot directory.

    $ sudo mkdir -p /var/lib/tftpboot/pxelinux.cfg

Copy the bootstrap ROM.

    $ sudo cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot

Create a default boot configuration file as follows.

    $ sudo vi /tftpboot/pxelinux.cfg/default

----------

    LABEL Ubuntu
    KERNEL vmlinuz
    APPEND root=/dev/nfs initrd=initrd.img nfsroot=10.10.101.1:/nfsroot ip=dhcp rw

Note:

- "root=/dev/nfs" means the network filesystem on the server (doesn't need to change).
- "initrd=initrd.img" is a boot script for system startup.
- "nfsroot=10.10.101.1/nfsroot" indicates the server's IP address and the NFS share folder name. Substitute the IP address with your server's address.
- "ip=dhcp" means that client computers use DHCP addressing scheme.
- "rw" means that the NFS share is read/write.

Finally, restart the TFTPD service.

    sudo /etc/init.d/tftpd-hpa restart

### Step Three: Configure DHCP Service ###

You also need to configure DHCP service on the NFS server to allow booting with /var/lib/tftpboot/pxelinux.0. Your configuration might look like the following, assuming you using subnet 10.10.101.0.

    $ sudo vi /etc/dhcp3/dhcpd.conf

----------

    allow booting;
    allow bootp;
    
    subnet 10.10.101.0 netmask 255.255.255.0 {
    	range 10.10.101.2 10.10.101.254;
    	option broadcast-address 10.10.101.255;
    	option routers 10.10.101.1;
    	filename "/pxelinux.0";
    }

Then restart DHCP service.

    $ sudo service isc-dhcp-server restart

### Step Four: Configure an NFS server ###

Create a directory that holds the client root filesystem.

    $ sudo mkdir /nfsroot

Next, configure the NFS server to export the client root filesystem. For that, add the following line to /etc/exports.

    /nfsroot             *(rw,no_root_squash,async,insecure,no_subtree_check)

Run the following command to reload modified /etc/exports.

    $ sudo exportfs -rv

By default, Ubuntu does not add network boot support to the initrd image. Thus you need to create a new initrd.img file. For that, first add the following line to /etc/initramfs-tools/initramfs.conf

    BOOT=nfs
    MODULES=netboot

Then run the following command to create a new initrd.img.

    $ sudo mkinitramfs -o /var/lib/tftpboot/initrd.img

Copy the new kernel image to /var/lib/tftpboot.

$ sudo cp /boot/vmlinuz-`uname -r` /var/lib/tfftpboot/vmlinuz
Now it is time to copy the entire root filesystem to /nfsroot.

Assuming tgat you are using a fresh Ubuntu server installation, you just need to clone the server filesystem to the NFS root.

    $ sudo cp -ax / /nfsroot

Then open /nfsroot/etc/fstab with a text editor to add the following line.

    /dev/nfs       /               nfs    defaults          1       1

The directory /var/lib/tftpboot should have world read/write permissions. Otherwise the client would not be able to boot from network.

    $ sudo chmod -R 777 /var/lib/tfftpboot

Lastly, to avoid any misconfiguration on the server, I recommend using a static IP address for the interface which DHCP service is running on. For example, if its network interface is named eth0, your configuration in /etc/network/interfaces should look like this:

    iface eth0 inet static
    	address 10.10.101.1
    	netmask 255.255.255.0
    	broadcast 10.10.101.255
    	network 10.10.101.0

### Step Five: Booting a Diskless Client ###

After you completed the configuration on the server. Boot your client from network. To boot from network, you typically need to change the boot order priority in your BIOS configuration.

If a client booted successful, then your diskless environment is ready. You can add one or more client computers without changing anything.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/diskless-boot-linux-machine.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出