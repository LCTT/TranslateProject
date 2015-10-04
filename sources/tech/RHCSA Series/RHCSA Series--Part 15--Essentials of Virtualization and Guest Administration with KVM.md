FSSlc translating

RHCSA Series: Essentials of Virtualization and Guest Administration with KVM – Part 15
================================================================================
If you look up the word virtualize in a dictionary, you will find that it means “to create a virtual (rather than actual) version of something”. In computing, the term virtualization refers to the possibility of running multiple operating systems simultaneously and isolated one from another, on top of the same physical (hardware) system, known in the virtualization schema as host.

![KVM Virtualization Basics and KVM Guest Administration](http://www.tecmint.com/wp-content/uploads/2015/06/RHCSA-Part15.png)

RHCSA Series: Essentials of Virtualization and Guest Administration with KVM – Part 15

Through the use of the virtual machine monitor (also known as hypervisor), virtual machines (referred to as guests) are provided virtual resources (i.e. CPU, RAM, storage, network interfaces, to name a few) from the underlying hardware.

With that in mind, it is plain to see that one of the main advantages of virtualization is cost savings (in equipment and network infrastructure and in terms of maintenance effort) and a substantial reduction in the physical space required to accommodate all the necessary hardware.

Since this brief how-to cannot cover all virtualization methods, I encourage you to refer to the documentation listed in the summary for further details on the subject.

Please keep in mind that the present article is intended to be a starting point to learn the basics of virtualization in RHEL 7 using [KVM][1] (Kernel-based Virtual Machine) with command-line utilities, and not an in-depth discussion of the topic.

### Verifying Hardware Requirements and Installing Packages ###

In order to set up virtualization, your CPU must support it. You can verify whether your system meets the requirements with the following command:

    # grep -E 'svm|vmx' /proc/cpuinfo

In the following screenshot we can see that the current system (with an AMD microprocessor) supports virtualization, as indicated by svm. If we had an Intel-based processor, we would see vmx instead in the results of the above command.

![Check KVM Support](http://www.tecmint.com/wp-content/uploads/2015/06/Check-KVM-Support.png)

Check KVM Support

In addition, you will need to have virtualization capabilities enabled in the firmware of your host (BIOS or UEFI).

Now install the necessary packages:

- qemu-kvm is an open source virtualizer that provides hardware emulation for the KVM hypervisor whereas qemu-img provides a command line tool for manipulating disk images.
- libvirt includes the tools to interact with the virtualization capabilities of the operating system.
- libvirt-python contains a module that permits applications written in Python to use the interface supplied by libvirt.
- libguestfs-tools: miscellaneous system administrator command line tools for virtual machines.
- virt-install: other command-line utilities for virtual machine administration.

    # yum update && yum install qemu-kvm qemu-img libvirt libvirt-python libguestfs-tools virt-install

Once the installation completes, make sure you start and enable the libvirtd service:

    # systemctl start libvirtd.service
    # systemctl enable libvirtd.service

By default, each virtual machine will only be able to communicate with the rest in the same physical server and with the host itself. To allow the guests to reach other machines inside our LAN and also the Internet, we need to set up a bridge interface in our host (say br0, for example) by,

1. adding the following line to our main NIC configuration (most likely `/etc/sysconfig/network-scripts/ifcfg-enp0s3`):

    BRIDGE=br0

2. creating the configuration file for br0 (/etc/sysconfig/network-scripts/ifcfg-br0) with these contents (note that you may have to change the IP address, gateway address, and DNS information):

    DEVICE=br0
    TYPE=Bridge
    BOOTPROTO=static
    IPADDR=192.168.0.18
    NETMASK=255.255.255.0
    GATEWAY=192.168.0.1
    NM_CONTROLLED=no
    DEFROUTE=yes
    PEERDNS=yes
    PEERROUTES=yes
    IPV4_FAILURE_FATAL=no
    IPV6INIT=yes
    IPV6_AUTOCONF=yes
    IPV6_DEFROUTE=yes
    IPV6_PEERDNS=yes
    IPV6_PEERROUTES=yes
    IPV6_FAILURE_FATAL=no
    NAME=br0
    ONBOOT=yes
    DNS1=8.8.8.8
    DNS2=8.8.4.4

3. finally, enabling packet forwarding by making, in `/etc/sysctl.conf`,

    net.ipv4.ip_forward = 1

and loading the changes to the current kernel configuration:

    # sysctl -p

Note that you may also need to tell firewalld that this kind of traffic should be allowed. Remember that you can refer to the article on that topic in this same series ([Part 11: Network Traffic Control Using FirewallD and Iptables][2]) if you need help to do that.

### Creating VM Images ###

By default, VM images will be created to `/var/lib/libvirt/images` and you are strongly advised to not change this unless you really need to, know what you’re doing, and want to handle SELinux settings yourself (such topic is out of the scope of this tutorial but you can refer to Part 13 of the RHCSA series: [Mandatory Access Control Essentials with SELinux][3] if you want to refresh your memory). 

This means that you need to make sure that you have allocated the necessary space in that filesystem to accommodate your virtual machines.

The following command will create a virtual machine named `tecmint-virt01` with 1 virtual CPU, 1 GB (=1024 MB) of RAM, and 20 GB of disk space (represented by `/var/lib/libvirt/images/tecmint-virt01.img`) using the rhel-server-7.0-x86_64-dvd.iso image located inside /home/gacanepa/ISOs as installation media and the br0 as network bridge:

    # virt-install \
    --network bridge=br0
    --name tecmint-virt01 \
    --ram=1024 \
    --vcpus=1 \
    --disk path=/var/lib/libvirt/images/tecmint-virt01.img,size=20 \
    --graphics none \
    --cdrom /home/gacanepa/ISOs/rhel-server-7.0-x86_64-dvd.iso
    --extra-args="console=tty0 console=ttyS0,115200"

If the installation file was located in a HTTP server instead of an image stored in your disk, you will have to replace the –cdrom flag with –location and indicate the address of the online repository.

As for the –graphics none option, it tells the installer to perform the installation in text-mode exclusively. You can omit that flag if you are using a GUI interface and a VNC window to access the main VM console. Finally, with –extra-args we are passing kernel boot parameters to the installer that set up a serial VM console.

The installation should now proceed as a regular (real) server now. If not, please review the steps listed above.

### Managing Virtual Machines ###

These are some typical administration tasks that you, as a system administrator, will need to perform on your virtual machines. Note that all of the following commands need to be run from your host:

**1. List all VMs:**

    # virsh list --all

From the output of the above command you will have to note the Id for the virtual machine (although it will also return its name and current status) because you will need it for most administration tasks related to a particular VM.

**2. Display information about a guest:**

    # virsh dominfo [VM Id]

**3. Start, restart, or stop a guest operating system:**

    # virsh start | reboot | shutdown [VM Id]

**4. Access a VM’s serial console if networking is not available and no X server is running on the host:**

    # virsh console [VM Id]

**Note** that this will require that you add the serial console configuration information to the `/etc/grub.conf` file (refer to the argument passed to the –extra-args option when the VM was created).

**5. Modify assigned memory or virtual CPUs:**

First, shutdown the guest:

    # virsh shutdown [VM Id]

Edit the VM configuration for RAM:

    # virsh edit [VM Id]

Then modify

    <memory>[Memory size here without brackets]</memory>

Restart the VM with the new settings:

    # virsh create /etc/libvirt/qemu/tecmint-virt01.xml

Finally, change the memory dynamically:

    # virsh setmem [VM Id] [Memory size here without brackets]

For CPU:

    # virsh edit [VM Id]

Then modify

    <cpu>[Number of CPUs here without brackets]</cpu>

For further commands and details, please refer to table 26.1 in Chapter 26 of the RHEL 5 Virtualization guide (that guide, though a bit old, includes an exhaustive list of virsh commands used for guest administration).

### SUMMARY ###

In this article we have covered some basic aspects of virtualization with KVM in RHEL 7, which is both a vast and a fascinating topic, and I hope it will be helpful as a starting guide for you to later explore more advanced subjects found in the official [RHEL virtualization][4] getting started and [deployment / administration guides][5]. 

In addition, you can refer to the preceding articles in [this KVM series][6] in order to clarify or expand some of the concepts explained here.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kvm-virtualization-basics-and-guest-administration/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.linux-kvm.org/page/Main_Page
[2]:http://www.tecmint.com/firewalld-vs-iptables-and-control-network-traffic-in-firewall/
[3]:http://www.tecmint.com/selinux-essentials-and-control-filesystem-access/
[4]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Getting_Started_Guide/index.html
[5]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Deployment_and_Administration_Guide/index.html
[6]:http://www.tecmint.com/install-and-configure-kvm-in-linux/
