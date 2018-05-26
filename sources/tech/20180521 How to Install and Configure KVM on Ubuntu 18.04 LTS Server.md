translating by wyxplus
How to Install and Configure KVM on Ubuntu 18.04 LTS Server
======
**KVM** (Kernel-based Virtual Machine) is an open source full virtualization solution for Linux like systems, KVM provides virtualization functionality using the virtualization extensions like **Intel VT** or **AMD-V**. Whenever we install KVM on any linux box then it turns it into the hyervisor by loading the kernel modules like **kvm-intel.ko** ( for intel based machines) and **kvm-amd.ko** ( for amd based machines).

KVM allows us to install and run multiple virtual machines (Windows & Linux). We can create and manage KVM based virtual machines either via **virt-manager** graphical user interface or **virt-install** & **virsh** cli commands.

In this article we will discuss how to install and configure **KVM hypervisor** on Ubuntu 18.04 LTS server. I am assuming you have already installed Ubuntu 18.04 LTS server on your system. Login to your server and perform the following steps.

### Step:1 Verify Whether your system support hardware virtualization

Execute below egrep command to verify whether your system supports hardware virtualization or not,
```
linuxtechi@kvm-ubuntu18-04:~$ egrep -c '(vmx|svm)' /proc/cpuinfo
1
linuxtechi@kvm-ubuntu18-04:~$

```

If the output is greater than 0 then it means your system supports Virtualization else reboot your system, then go to BIOS settings and enable VT technology.

Now Install “ **kvm-ok** ” utility using below command, it is used to determine if your server is capable of running hardware accelerated KVM virtual machines
```
linuxtechi@kvm-ubuntu18-04:~$ sudo apt install cpu-checker

```

Run kvm-ok command and verify the output,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
linuxtechi@kvm-ubuntu18-04:~$

```

### Step:2 Install KVM and its required packages

Run the below apt commands to install KVM and its dependencies
```
linuxtechi@kvm-ubuntu18-04:~$ sudo apt update
linuxtechi@kvm-ubuntu18-04:~$ sudo apt install qemu qemu-kvm libvirt-bin  bridge-utils  virt-manager

```

Once the above packages are installed successfully, then your local user (In my case linuxtechi) will be added to the group libvirtd automatically.

### Step:3 Start & enable libvirtd service

Whenever we install qemu & libvirtd packages in Ubuntu 18.04 Server then it will automatically start and enable libvirtd service, In case libvirtd service is not started and enabled then run beneath commands,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo service libvirtd start
linuxtechi@kvm-ubuntu18-04:~$ sudo update-rc.d libvirtd enable

```

Now verify the status of libvirtd service using below command,
```
linuxtechi@kvm-ubuntu18-04:~$ service libvirtd status

```

Output would be something like below:

[![libvirtd-command-ubuntu18-04][1]![libvirtd-command-ubuntu18-04][2]][3]

### Step:4 Configure Network Bridge for KVM virtual Machines

Network bridge is required to access the KVM based virtual machines outside the KVM hypervisor or host. In Ubuntu 18.04, network is managed by netplan utility, whenever we freshly installed Ubuntu 18.04 server then a file with name “ **/etc/netplan/50-cloud-init.yaml** ” is created automatically, to configure static IP and bridge, netplan utility will refer this file.

As of now I have already configured the static IP via this file and content of this file is below:
```
network:
    ethernets:
        ens33:
            addresses: [192.168.0.51/24]
            gateway4: 192.168.0.1
            nameservers:
              addresses: [192.168.0.1]
            dhcp4: no
            optional: true
    version: 2

```

Let’s add the network bridge definition in this file,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo vi /etc/netplan/50-cloud-init.yaml

network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      dhcp6: no

  bridges:
    br0:
      interfaces: [ens33]
      dhcp4: no
      addresses: [192.168.0.51/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [192.168.0.1]

```

As you can see we have removed the IP address from interface(ens33) and add the same IP to the bridge ‘ **br0** ‘ and also added interface (ens33) to the bridge br0. Apply these changes using below netplan command,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo netplan apply
linuxtechi@kvm-ubuntu18-04:~$

```

If you want to see the debug logs then use the below command,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo netplan --debug  apply

```

Now Verify the bridge status using following methods:
```
linuxtechi@kvm-ubuntu18-04:~$ sudo networkctl status -a

```

[![networkctl-command-output-ubuntu18-04][1]![networkctl-command-output-ubuntu18-04][4]][4]
```
linuxtechi@kvm-ubuntu18-04:~$ ifconfig

```

[![ifconfig-command-output-ubuntu18-04][1]![ifconfig-command-output-ubuntu18-04][5]][5]

### Start:5 Creating Virtual machine (virt-manager or virt-install command )

There are two ways to create virtual machine:

  * virt-manager (GUI utility)
  * virt-install command (cli utility)



**Creating Virtual machine using virt-manager:**

Start the virt-manager by executing the beneath command,
```
linuxtechi@kvm-ubuntu18-04:~$ sudo virt-manager

```

[![Start-Virt-Manager-Ubuntu18-04][1]![Start-Virt-Manager-Ubuntu18-04][6]][6]

Create a new virtual machine

[![ISO-file-Virt-Manager][1]![ISO-file-Virt-Manager][7]][7]

Click on forward and select the ISO file, in my case I am using RHEL 7.3 iso file.

[![Select-ISO-file-virt-manager-Ubuntu18-04-Server][1]![Select-ISO-file-virt-manager-Ubuntu18-04-Server][8]][8]

Click on Forward

In the next couple of windows, you will be prompted to specify the RAM, CPU and disk for the VM.

Now Specify the Name of the Virtual Machine and network,

[![VM-Name-Network-Virt-Manager-Ubuntu18-04][1]![VM-Name-Network-Virt-Manager-Ubuntu18-04][9]][9]

Click on Finish

[![RHEL7-3-Installation-Virt-Manager][1]![RHEL7-3-Installation-Virt-Manager][10]][10]

Now follow the screen instruction and complete the installation,

**Creating Virtual machine from CLI using virt-install command,**

Use the below virt-install command to create a VM from terminal, it will start the installation in CLI, replace the name of the VM, description, location of ISO file and network bridge as per your setup.
```
linuxtechi@kvm-ubuntu18-04:~$ sudo virt-install  -n DB-Server  --description "Test VM for Database"  --os-type=Linux  --os-variant=rhel7  --ram=1096  --vcpus=1  --disk path=/var/lib/libvirt/images/dbserver.img,bus=virtio,size=10  --network bridge:br0 --graphics none  --location /home/linuxtechi/rhel-server-7.3-x86_64-dvd.iso --extra-args console=ttyS0

```

That’s conclude the article, I hope this article help you to install KVM on your Ubuntu 18.04 Server. Apart from this, KVM is the default hypervisor for Openstack.

Read More On : “[ **How to Create, Revert and Delete KVM Virtual machine (domain) snapshot with virsh command**][11]“

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-kvm-ubuntu-18-04-server/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/05/libvirtd-command-ubuntu18-04-1024x339.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2018/05/libvirtd-command-ubuntu18-04.jpg
[4]:https://www.linuxtechi.com/wp-content/uploads/2018/05/networkctl-command-output-ubuntu18-04.jpg
[5]:https://www.linuxtechi.com/wp-content/uploads/2018/05/ifconfig-command-output-ubuntu18-04.jpg
[6]:https://www.linuxtechi.com/wp-content/uploads/2018/05/Start-Virt-Manager-Ubuntu18-04.jpg
[7]:https://www.linuxtechi.com/wp-content/uploads/2018/05/ISO-file-Virt-Manager.jpg
[8]:https://www.linuxtechi.com/wp-content/uploads/2018/05/Select-ISO-file-virt-manager-Ubuntu18-04-Server.jpg
[9]:https://www.linuxtechi.com/wp-content/uploads/2018/05/VM-Name-Network-Virt-Manager-Ubuntu18-04.jpg
[10]:https://www.linuxtechi.com/wp-content/uploads/2018/05/RHEL7-3-Installation-Virt-Manager.jpg
[11]:https://www.linuxtechi.com/create-revert-delete-kvm-virtual-machine-snapshot-virsh-command/
