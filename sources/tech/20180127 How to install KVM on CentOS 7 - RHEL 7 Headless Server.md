How to install KVM on CentOS 7 / RHEL 7 Headless Server
======


How do I install and configure KVM (Kernel-based Virtual Machine) on a CentOS 7 or RHEL (Red Hat Enterprise Linux) 7 server? How can I setup KMV on a CentOS 7 and use cloud images/cloud-init for installing guest VM?


Kernel-based Virtual Machine (KVM) is virtualization software for CentOS or RHEL 7. KVM turn your server into a hypervisor. This page shows how to setup and manage a virtualized environment with KVM in CentOS 7 or RHEL 7. It also described how to install and administer Virtual Machines (VMs) on a physical server using the CLI. Make sure that **Virtualization Technology (VT)** is enabled in your server 's BIOS. You can also run the following command [to test if CPU Support Intel VT and AMD-V Virtualization tech][1]
```
$ lscpu | grep Virtualization
Virtualization: VT-x
```



### Follow installation steps of KVM on CentOS 7/RHEL 7 headless sever

#### Step 1: Install kvm

Type the following [yum command][2]:
`# yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install`
[![How to install KVM on CentOS 7 RHEL 7 Headless Server][3]][3]
Start the libvirtd service:
```
# systemctl enable libvirtd
# systemctl start libvirtd
```

#### Step 2: Verify kvm installation

Make sure KVM module loaded using lsmod command and [grep command][4]:
`# lsmod | grep -i kvm`

#### Step 3: Configure bridged networking

By default dhcpd based network bridge configured by libvirtd. You can verify that with the following commands:
```
# brctl show
# virsh net-list
```
[![KVM default networking][5]][5]
All VMs (guest machine) only have network access to other VMs on the same server. A private network 192.168.122.0/24 created for you. Verify it:
`# virsh net-dumpxml default`
If you want your VMs avilable to other servers on your LAN, setup a a network bridge on the server that connected to the your LAN. Update your nic config file such as ifcfg-enp3s0 or em1:
`# vi /etc/sysconfig/network-scripts/enp3s0 `
Add line:
```
BRIDGE=br0
```

[Save and close the file in vi][6]. Edit /etc/sysconfig/network-scripts/ifcfg-br0 and add:
`# vi /etc/sysconfig/network-scripts/ifcfg-br0`
Append the following:
```
DEVICE="br0"
# I am getting ip from DHCP server #
BOOTPROTO="dhcp"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
ONBOOT="yes"
TYPE="Bridge"
DELAY="0"
```

Restart the networking service (warning ssh command will disconnect, it is better to reboot the box):
`# systemctl restart NetworkManager`
Verify it with brctl command:
`# brctl show`

#### Step 4: Create your first virtual machine

I am going to create a CentOS 7.x VM. First, grab CentOS 7.x latest ISO image using the wget command:
```
# cd /var/lib/libvirt/boot/
# wget https://mirrors.kernel.org/centos/7.4.1708/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso
```
Verify ISO images:
```
# wget https://mirrors.kernel.org/centos/7.4.1708/isos/x86_64/sha256sum.txt
# sha256sum -c sha256sum.txt
```

##### Create CentOS 7.x VM

In this example, I'm creating CentOS 7.x VM with 2GB RAM, 2 CPU core, 1 nics and 40GB disk space, enter:
```
# virt-install \
--virt-type=kvm \
--name centos7 \
--ram 2048 \
--vcpus=1 \
--os-variant=centos7.0 \
--cdrom=/var/lib/libvirt/boot/CentOS-7-x86_64-Minimal-1708.iso \
--network=bridge=br0,model=virtio \
--graphics vnc \
--disk path=/var/lib/libvirt/images/centos7.qcow2,size=40,bus=virtio,format=qcow2
```
To configure vnc login from another terminal over ssh and type:
```
# virsh dumpxml centos7 | grep vnc
<graphics type='vnc' port='5901' autoport='yes' listen='127.0.0.1'>
```
Please note down the port value (i.e. 5901). You need to use an SSH client to setup tunnel and a VNC client to access the remote vnc server. Type the following SSH port forwarding command from your client/desktop/macbook pro system:
`$ ssh vivek@server1.cyberciti.biz -L 5901:127.0.0.1:5901`
Once you have ssh tunnel established, you can point your VNC client at your own 127.0.0.1 (localhost) address and port 5901 as follows:
[![][7]][7]
You should see CentOS Linux 7 guest installation screen as follows:
[![][8]][8]
Now just follow on screen instructions and install CentOS 7. Once installed, go ahead and click the reboot button. The remote server closed the connection to our VNC client. You can reconnect via KVM client to configure the rest of the server including SSH based session or firewall.

#### Step 5: Using cloud images

The above installation method is okay for learning purpose or a single VM. Do you need to deploy lots of VMs? Try cloud images. You can modify pre built cloud images as per your needs. For example, add users, ssh keys, setup time zone, and more using [Cloud-init][9] which is the defacto multi-distribution package that handles early initialization of a cloud instance. Let us see how to create CentOS 7 vm with 1024MB ram, 20GB disk space, and 1 vCPU.

##### Grab CentOS 7 cloud image

```
# cd /var/lib/libvirt/boot
# wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
```

##### Create required directories

```
# D=/var/lib/libvirt/images
# VM=centos7-vm1 ## vm name ##
# mkdir -vp $D/$VM
mkdir: created directory '/var/lib/libvirt/images/centos7-vm1'
```

##### Create meta-data file

```
# cd $D/$VM
# vi meta-data
```
Append the following:
```
instance-id: centos7-vm1
local-hostname: centos7-vm1
```

##### Crete user-data file

I am going to login into VM using ssh keys. So make sure you have ssh-keys in place:
`# ssh-keygen -t ed25519 -C "VM Login ssh key"`
[![ssh-keygen command][10]][11]
See "[How To Setup SSH Keys on a Linux / Unix System][12]" for more info. Edit user-data as follows:
```
# cd $D/$VM
# vi user-data
```
Add as follows (replace hostname, users, ssh-authorized-keys as per your setup):
```
#cloud-config
 
# Hostname management
preserve_hostname: False
hostname: centos7-vm1
fqdn: centos7-vm1.nixcraft.com
 
# Users
users:
    - default
    - name: vivek
      groups: ['wheel']
      shell: /bin/bash
      sudo: ALL=(ALL) NOPASSWD:ALL
      ssh-authorized-keys:
        - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMP3MOF2ot8MOdNXCpHem0e2Wemg4nNmL2Tio4Ik1JY VM Login ssh key
 
# Configure where output will go
output:
  all: ">> /var/log/cloud-init.log"
 
# configure interaction with ssh server
ssh_genkeytypes: ['ed25519', 'rsa']
 
# Install my public ssh key to the first user-defined user configured
# in cloud.cfg in the template (which is centos for CentOS cloud images)
ssh_authorized_keys:
  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMP3MOF2ot8MOdNXCpHem0e2Wemg4nNmL2Tio4Ik1JY VM Login ssh key
 
# set timezone for VM
timezone: Asia/Kolkata
 
# Remove cloud-init 
runcmd:
  - systemctl stop network && systemctl start network
  - yum -y remove cloud-init
```

##### Copy cloud image

```
# cd $D/$VM
# cp /var/lib/libvirt/boot/CentOS-7-x86_64-GenericCloud.qcow2 $VM.qcow2
```

##### Create 20GB disk image

```
# cd $D/$VM
# export LIBGUESTFS_BACKEND=direct
# qemu-img create -f qcow2 -o preallocation=metadata $VM.new.image 20G
# virt-resize --quiet --expand /dev/sda1 $VM.qcow2 $VM.new.image
```
[![Set VM image disk size][13]][13]
Overwrite it resized image:
```
# cd $D/$VM
# mv $VM.new.image $VM.qcow2
```

##### Creating a cloud-init ISO

`# mkisofs -o $VM-cidata.iso -V cidata -J -r user-data meta-data`
[![Creating a cloud-init ISO][14]][14]

##### Creating a pool

```
# virsh pool-create-as --name $VM --type dir --target $D/$VM
Pool centos7-vm1 created
```

##### Installing a CentOS 7 VM

```
# cd $D/$VM
# virt-install --import --name $VM \
--memory 1024 --vcpus 1 --cpu host \
--disk $VM.qcow2,format=qcow2,bus=virtio \
--disk $VM-cidata.iso,device=cdrom \
--network bridge=virbr0,model=virtio \
--os-type=linux \
--os-variant=centos7.0 \
--graphics spice \
--noautoconsole
```
Delete unwanted files:
```
# cd $D/$VM
# virsh change-media $VM hda --eject --config
# rm meta-data user-data centos7-vm1-cidata.iso
```

##### Find out IP address of VM

`# virsh net-dhcp-leases default`
[![CentOS7-VM1- Created][15]][15]

##### Log in to your VM

Use ssh command:
`# ssh vivek@192.168.122.85`
[![Sample VM session][16]][16]

### Useful commands

Let us see some useful commands for managing VMs.

#### List all VMs

`# virsh list --all`

#### Get VM info

```
# virsh dominfo vmName
# virsh dominfo centos7-vm1
```

#### Stop/shutdown a VM

`# virsh shutdown centos7-vm1`

#### Start VM

`# virsh start centos7-vm1`

#### Mark VM for autostart at boot time

`# virsh autostart centos7-vm1`

#### Reboot (soft & safe reboot) VM

`# virsh reboot centos7-vm1`
Reset (hard reset/not safe) VM
`# virsh reset centos7-vm1`

#### Delete VM

```
# virsh shutdown centos7-vm1
# virsh undefine centos7-vm1
# virsh pool-destroy centos7-vm1
# D=/var/lib/libvirt/images
# VM=centos7-vm1
# rm -ri $D/$VM
```
To see a complete list of virsh command type
```
# virsh help | less
# virsh help | grep reboot
```


### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][17], [Facebook][18], [Google+][19].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-install-kvm-on-centos-7-rhel-7-headless-server/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/
[2]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[3]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-KVM-on-CentOS-7-RHEL-7-Headless-Server.jpg
[4]:https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/ (See Linux/Unix grep command examples for more info)
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/KVM-default-networking.jpg
[6]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[7]:https://www.cyberciti.biz/media/new/faq/2016/01/vnc-client.jpg
[8]:https://www.cyberciti.biz/media/new/faq/2016/01/centos7-guest-vnc.jpg
[9]:https://cloudinit.readthedocs.io/en/latest/index.html
[10]:https://www.cyberciti.biz/media/new/faq/2018/01/ssh-keygen-pub-key.jpg
[11]:https://www.cyberciti.biz/faq/linux-unix-generating-ssh-keys/
[12]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[13]:https://www.cyberciti.biz/media/new/faq/2018/01/Set-VM-image-disk-size.jpg
[14]:https://www.cyberciti.biz/media/new/faq/2018/01/Creating-a-cloud-init-ISO.jpg
[15]:https://www.cyberciti.biz/media/new/faq/2018/01/CentOS7-VM1-Created.jpg
[16]:https://www.cyberciti.biz/media/new/faq/2018/01/Sample-VM-session.jpg
[17]:https://twitter.com/nixcraft
[18]:https://facebook.com/nixcraft
[19]:https://plus.google.com/+CybercitiBiz
