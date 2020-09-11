[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Configure KVM on RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-configure-kvm-on-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Install and Configure KVM on RHEL 8
======

**KVM** is an open source virtualization technology which converts your Linux machine into a type-1 bare-metal hypervisor that allows you to run multiple virtual machines (VMs) or guest VMs

<https://www.linuxtechi.com/wp-content/uploads/2019/06/Install-KVM-RHEL8.jpg>

KVM stands for **Kernel based Virtual machine**, as the name suggests KVM is a kernel module, once it is loaded into the kernel , then your Linux machine will start working as a KVM hypervisor. In this article we will demonstrate how to install KVM on RHEL 8 system but before start installing KVM on your RHEL 8 system first we have to make sure that your system’s processor supports hardware virtualization extensions like **Intel VT** or **AMD-V** and enabled it from BIOS.

**RHEL 8 KVM Lab Details:**

  * OS = RHEL 8
  * Hostname = rhel8-kvm
  * Ethernet Cards = ens32 –  192.168.1.4 &amp; ens36 – 192.168..1.12
  * RAM = 4 GB
  * CPU = 2
  * Disk = 40 GB Free Space (/var/libvirtd)



Let’s Jump into the KVM installation steps

### Step:1) Verify Hardware Virtualization is enabled or not

Open the terminal and execute the beneath egrep command

```
[root@linuxtechi ~]# egrep -c '(vmx|svm)' /proc/cpuinfo
2
[root@linuxtechi ~]#
```

If output of above egrep command is equal to 1 or more than 1 then this confirms that hardware virtualization is enabled and supported.

Alternate way to check whether hardware virtualization is enabled or not , execute the beneath command,

```
[root@linuxtechi ~]# lscpu | grep Virtualization:
Virtualization:      VT-x
[root@linuxtechi opt]#
```

If there is no output in above command then it confirms that Virtualization is not enabled from BIOS.

**Note:** To enable hardware virtualization reboot your system, go to bios settings and then look for Intel VT or AMD virtualization option and enable one of this option which which suits to your system architecture.

### Step:2) Install KVM and its dependent packages using dnf

Run the following dnf command to install KVM and its dependent packages,

```
[root@linuxtechi ~]# dnf install qemu-kvm qemu-img libvirt virt-install libvirt-client virt-manager -y
```

Once above packages has been installed successfully, then run the below command to confirm whether KVM module has been loaded into the kernel or not,

```
root@linuxtechi ~]# lsmod | grep -i kvm
kvm_intel             245760  0
kvm                   745472  1 kvm_intel
irqbypass              16384  1 kvm
[root@linuxtechi ~]#
```

### Step:3) Enable and Start libvirtd service

Run the following systemctl command to enable and start libvirtd service,

```
[root@linuxtechi ~]# systemctl enable libvirtd
[root@linuxtechi ~]# systemctl start libvirtd
```

### Step:4) Create Network bridge and attach Interface to it 

In RHEL 8, network scripts are deprecated, We have to use Network Manager (nmcli / nmtui) to configure network and network bridges.

I have two Ethernet cards on my server, ens36 will attached to bridge br0 and ens32 will be used for management .

```
[root@linuxtechi ~]# nmcli connection show
NAME    UUID                                  TYPE      DEVICE
ens32   1d21959d-e2ea-4129-bb89-163486c8d7bc  ethernet  ens32
ens36   1af408b6-c98e-47ce-bca7-5141b721f8d4  ethernet  ens36
virbr0  d0f05de4-4b3b-4710-b904-2524b5ad11bf  bridge    virbr0
[root@linuxtechi ~]#
```

Delete the existing connection of interface “ens36”

```
[root@linuxtechi ~]# nmcli connection delete ens36
Connection 'ens36' (1af408b6-c98e-47ce-bca7-5141b721f8d4) successfully deleted.
[root@linuxtechi ~]#
```

Create a Network Bridge with name “**br0**” using mcli command,

```
[root@linuxtechi ~]# nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
Connection 'br0' (62c14e9d-3e72-41c2-8ecf-d17978ad02da) successfully added.
[root@linuxtechi ~]#
```

Assign the same IP of ens36 to the bridge interface using following nmcli commands,

```
[root@linuxtechi ~]# nmcli connection modify br0 ipv4.addresses 192.168.1.12/24 ipv4.method manual
[root@linuxtechi ~]#  nmcli connection modify br0 ipv4.gateway 192.168.1.1
[root@linuxtechi ~]# nmcli connection modify br0 ipv4.dns 192.168.1.1
```

Add ens36 interface as bridge salve to the network bridge br0,

```
[root@linuxtechi ~]# nmcli connection add type bridge-slave autoconnect yes con-name ens36 ifname ens36 master br0
Connection 'ens36' (0c2065bc-ad39-47a7-9a3e-85c80cd73c94) successfully added.
[root@linuxtechi ~]#
```

Now bring up the network bridge using beneath nmcli command,

```
[root@linuxtechi ~]# nmcli connection up br0
Connection successfully activated (master waiting for slaves) (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/9)
[root@linuxtechi ~]#
```

Verify the connections using following command,

```
[root@linuxtechi ~]# nmcli connection show
NAME    UUID                                  TYPE      DEVICE
br0     00bcff8f-af85-49ad-9196-974de2d9d9d1  bridge    br0
ens32   1d21959d-e2ea-4129-bb89-163486c8d7bc  ethernet  ens32
ens36   eaef13c9-c24e-4a3f-ae85-21bf0610471e  ethernet  ens36
virbr0  d0f05de4-4b3b-4710-b904-2524b5ad11bf  bridge    virbr0
[root@linuxtechi ~]#
```

View the bridge (br0) details and status using ip command,

![rhel-8-bridge-details][1]

**Note:** If you want to use network-scripts in RHEL 8 system then install network-scripts packages,

```
~ ]# dnf install network-scripts -y
```

### Step:5) Creating and Managing KVM Virtual Machines

In RHEL 8 there are different ways to create and manage KVM virtual machines,

  * virt-manager (GUI)
  * Command Line tools (**virt-install** &amp; **virsh**)



During the KVM installation we have already installed virt-manager and virt-install packages.

### Creating Virtual Machines using virt-manager GUI tool:

Run the virt-manager command from command line or Access virt-manager from RHEL 8 Desktop

[![Access-Virt-Manager-RHEL8][2]][3]

Click on Monitor Icon to create a new guest VM (Virtual Machine),

Choose Local Installation Media as ISO,

[![Choose-ISO-KVM-RHEL8][4]][5]

Click on forward,

In the next screen, browse the OS installation ISO file , in my case i have placed Ubuntu 18.04 LTS server ISO file under /opt folder,

[![Installation-ISO-File-RHEL8-KVM][6]][7]

click on Forward to Proceed further,

In the next window you will be prompted to specify RAM and vCPU for your virtual machine, so specify the values that suits your installation and then click on Forward,

[![Specify-RAM-CPU-KVM-RHEL8][8]][9]

In next window specify disk size for your Virtual Machine and the click on Forward, in my case i am giving disk space for my VM as 20 GB,

[![Disk-Image-RHEL8-KVM-VM][10]][11]

In the next window, specify the name of VM and choose the Network that you want to attach to VM’s Ethernet card, as we had created network bridge “br0” for vms networking, so choose bridge“br0”.

[![Network-Selection-KVM-RHEL8][12]][13]

Click on Finish to proceed with VM creation and its OS installation,

[![OS-Installation-KVM-VM-RHEL8][14]][15]

Follow the screen Instructions and complete the Installation.

**Creating KVM Virtual Machine from Command Line**

if you are fan of command line then there is a command line tool for you called “**virt-install**” to create virtual machines. Once the Virtual machines are provisioned then vms can be managed via command line tool “[virsh][16]“.

Let’s assume we want to create CentOS 7 VM using virt-install, i have already placed CentOS 7 ISO file under /opt folder,

Execute beneath command to provision a VM

```
[root@linuxtechi ~]# virt-install -n CentOS7-Server --description "CentOS 7 Virtual Machine" --os-type=Linux --os-variant=rhel7 --ram=1096 --vcpus=1 --disk path=/var/lib/libvirt/images/centos7-server.img,bus=virtio,size=20 --network bridge:br0 --graphics none --location /opt/CentOS-7-x86_64-DVD-1511.iso --extra-args console=ttyS0
```

Output of command would be something like below,

![Virt-Install-KVM-RHEL8][17]

Follow screen instructions to complete CentOS 7 Installation. That’s all from this tutorial, i hope these steps helped you to setup KVM on your RHEL 8 system, please do share your feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-kvm-on-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/06/rhel-8-bridge-details-1024x628.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Access-Virt-Manager-RHEL8-1024x471.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Access-Virt-Manager-RHEL8.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Choose-ISO-KVM-RHEL8-1024x479.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Choose-ISO-KVM-RHEL8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Installation-ISO-File-RHEL8-KVM-1024x477.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Installation-ISO-File-RHEL8-KVM.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Specify-RAM-CPU-KVM-RHEL8-1024x478.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Specify-RAM-CPU-KVM-RHEL8.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Disk-Image-RHEL8-KVM-VM-1024x483.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Disk-Image-RHEL8-KVM-VM.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Network-Selection-KVM-RHEL8-1024x482.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Network-Selection-KVM-RHEL8.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/06/OS-Installation-KVM-VM-RHEL8-1024x479.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/06/OS-Installation-KVM-VM-RHEL8.jpg
[16]: https://www.linuxtechi.com/create-revert-delete-kvm-virtual-machine-snapshot-virsh-command/
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/06/Virt-Install-KVM-RHEL8.jpg
