How to use KVM cloud images on Ubuntu Linux
======

Kernel-based Virtual Machine (KVM) is a virtualization module for the Linux kernel that turns it into a hypervisor. You can create an Ubuntu cloud image with KVM from the command line using Ubuntu virtualisation front-end for libvirt and KVM.

How do I download and use a cloud image with kvm running on an Ubuntu Linux server? How do I create create a virtual machine without the need of a complete installation on an Ubuntu Linux 16.04 LTS server?Kernel-based Virtual Machine (KVM) is a virtualization module for the Linux kernel that turns it into a hypervisor. You can create an Ubuntu cloud image with KVM from the command line using Ubuntu virtualisation front-end for libvirt and KVM.

This quick tutorial shows to install and use uvtool that provides a unified and integrated VM front-end to Ubuntu cloud image downloads, libvirt, and cloud-init.

### Step 1 - Install KVM

You must have kvm installed and configured. Use the [apt command][1]/[apt-get command][2] as follows:
```
$ sudo apt install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
$ kvm-ok
## [configure bridged networking as described here][3]
$ sudo vi /etc/network/interfaces
$ sudo systemctl restart networking
$ sudo brctl show
```
See "[How to install KVM on Ubuntu 16.04 LTS Headless Server][4]" for more info.

### Step 2 - Install uvtool

Type the following [apt command][1]/[apt-get command][2]:
```
$ sudo apt install uvtool
```
Sample outputs:
```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  gksu libgksu2-0 libqt5designer5 libqt5help5 libqt5printsupport5 libqt5sql5 libqt5sql5-sqlite libqt5xml5 python3-dbus.mainloop.pyqt5 python3-notify2 python3-pyqt5 python3-sip
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  cloud-image-utils distro-info python-boto python-pyinotify python-simplestreams socat ubuntu-cloudimage-keyring uvtool-libvirt
Suggested packages:
  cloud-utils-euca shunit2 python-pyinotify-doc
The following NEW packages will be installed:
  cloud-image-utils distro-info python-boto python-pyinotify python-simplestreams socat ubuntu-cloudimage-keyring uvtool uvtool-libvirt
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,211 kB of archives.
After this operation, 6,876 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/main amd64 distro-info amd64 0.17 [20.3 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 python-boto all 2.44.0-1ubuntu2 [740 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu artful/main amd64 python-pyinotify all 0.9.6-1 [24.6 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu artful/main amd64 ubuntu-cloudimage-keyring all 2013.11.11 [4,504 B]
Get:5 http://in.archive.ubuntu.com/ubuntu artful/main amd64 cloud-image-utils all 0.30-0ubuntu2 [17.2 kB]
Get:6 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 python-simplestreams all 0.1.0~bzr450-0ubuntu1 [29.7 kB]
Get:7 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 socat amd64 1.7.3.2-1 [342 kB]
Get:8 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 uvtool all 0~git122-0ubuntu1 [6,498 B]
Get:9 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 uvtool-libvirt all 0~git122-0ubuntu1 [26.9 kB]
Fetched 1,211 kB in 3s (393 kB/s)        
Selecting previously unselected package distro-info.
(Reading database ... 199933 files and directories currently installed.)
Preparing to unpack .../0-distro-info_0.17_amd64.deb ...
Unpacking distro-info (0.17) ...
Selecting previously unselected package python-boto.
Preparing to unpack .../1-python-boto_2.44.0-1ubuntu2_all.deb ...
Unpacking python-boto (2.44.0-1ubuntu2) ...
Selecting previously unselected package python-pyinotify.
Preparing to unpack .../2-python-pyinotify_0.9.6-1_all.deb ...
Unpacking python-pyinotify (0.9.6-1) ...
Selecting previously unselected package ubuntu-cloudimage-keyring.
Preparing to unpack .../3-ubuntu-cloudimage-keyring_2013.11.11_all.deb ...
Unpacking ubuntu-cloudimage-keyring (2013.11.11) ...
Selecting previously unselected package cloud-image-utils.
Preparing to unpack .../4-cloud-image-utils_0.30-0ubuntu2_all.deb ...
Unpacking cloud-image-utils (0.30-0ubuntu2) ...
Selecting previously unselected package python-simplestreams.
Preparing to unpack .../5-python-simplestreams_0.1.0~bzr450-0ubuntu1_all.deb ...
Unpacking python-simplestreams (0.1.0~bzr450-0ubuntu1) ...
Selecting previously unselected package socat.
Preparing to unpack .../6-socat_1.7.3.2-1_amd64.deb ...
Unpacking socat (1.7.3.2-1) ...
Selecting previously unselected package uvtool.
Preparing to unpack .../7-uvtool_0~git122-0ubuntu1_all.deb ...
Unpacking uvtool (0~git122-0ubuntu1) ...
Selecting previously unselected package uvtool-libvirt.
Preparing to unpack .../8-uvtool-libvirt_0~git122-0ubuntu1_all.deb ...
Unpacking uvtool-libvirt (0~git122-0ubuntu1) ...
Setting up distro-info (0.17) ...
Setting up ubuntu-cloudimage-keyring (2013.11.11) ...
Setting up cloud-image-utils (0.30-0ubuntu2) ...
Setting up socat (1.7.3.2-1) ...
Setting up python-pyinotify (0.9.6-1) ...
Setting up python-boto (2.44.0-1ubuntu2) ...
Setting up python-simplestreams (0.1.0~bzr450-0ubuntu1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Setting up uvtool (0~git122-0ubuntu1) ...
Processing triggers for man-db (2.7.6.1-2) ...
Setting up uvtool-libvirt (0~git122-0ubuntu1) ...
```


### Step 3 - Download the Ubuntu Cloud image

You need to use the uvt-simplestreams-libvirt command. It maintains a libvirt volume storage pool as a local mirror of a subset of images available from a simplestreams source, such as Ubuntu cloud images. To update uvtool's libvirt volume storage pool with all current amd64 images, run:
`$ uvt-simplestreams-libvirt sync arch=amd64`
To just update/grab Ubuntu 16.04 LTS (xenial/amd64) image run:
`$ uvt-simplestreams-libvirt --verbose sync release=xenial arch=amd64`
Sample outputs:
```
Adding: com.ubuntu.cloud:server:16.04:amd64 20171121.1
```

Pass the query option to queries the local mirror:
`$ uvt-simplestreams-libvirt query`
Sample outputs:
```
release=xenial arch=amd64 label=release (20171121.1)
```

Now, I have an image for Ubuntu xenial and I create the VM.

### Step 4 - Create the SSH keys

You need ssh keys for login into KVM VMs. Use the ssh-keygen command to create a new one if you do not have any keys at all.
`$ ssh-keygen`
See "[How To Setup SSH Keys on a Linux / Unix System][5]" and "[Linux / UNIX: Generate SSH Keys][6]" for more info.

### Step 5 - Create the VM

It is time to create the VM named vm1 i.e. create an Ubuntu Linux 16.04 LTS VM:
`$ uvt-kvm create vm1`
By default vm1 created using the following characteristics:

  1. RAM/memory : 512M
  2. Disk size: 8GiB
  3. CPU: 1 vCPU core



To control ram, disk, cpu, and other characteristics use the following syntax:
`$ uvt-kvm create vm1 \
--memory MEMORY \
--cpu CPU \
--disk DISK \
--bridge BRIDGE \
--ssh-public-key-file /path/to/your/SSH_PUBLIC_KEY_FILE \
--packages PACKAGES1, PACKAGES2, .. \
--run-script-once RUN_SCRIPT_ONCE \
--password PASSWORD
`
Where,

  1.  **\--password PASSWORD** : Set the password for the ubuntu user and allow login using the ubuntu user (not recommended use ssh keys).
  2.  **\--run-script-once RUN_SCRIPT_ONCE** : Run RUN_SCRIPT_ONCE script as root on the VM the first time it is booted, but never again. Give full path here. This is useful to run custom task on VM such as setting up security or other stuff.
  3.  **\--packages PACKAGES1, PACKAGES2, ..** : Install the comma-separated packages on first boot.



To get help, run:
```
$ uvt-kvm -h
$ uvt-kvm create -h
```

#### How do I delete my VM?

To destroy/delete your VM named vm1, run (please use the following command with care as there would be no confirmation box):
`$ uvt-kvm destroy vm1`

#### To find out the IP address of the vm1, run:

`$ uvt-kvm ip vm1`
192.168.122.52

#### To list all VMs run

`$ uvt-kvm list`
Sample outputs:
```
vm1
freebsd11.1

```

### Step 6 - How to login to the vm named vm1

The syntax is:
`$ uvt-kvm ssh vm1`
Sample outputs:
```
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-101-generic x86_64)

 comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated 选题模板.txt 中文排版指北.md Documentation: https://help.ubuntu.com
 comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated 选题模板.txt 中文排版指北.md Management: https://landscape.canonical.com
 comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated 选题模板.txt 中文排版指北.md Support: https://ubuntu.com/advantage

 Get cloud support with Ubuntu Advantage Cloud Guest:
 http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Thu Dec 7 09:55:06 2017 from 192.168.122.1

```

Another option is to use the regular ssh command from macOS/Linux/Unix/Windows client:
`$ ssh [[email protected]][7]
$ ssh -i ~/.ssh/id_rsa [[email protected]][7]`
Sample outputs:
[![Connect to the running VM using ssh][8]][8]
Once vim created you can use the virsh command as usual:
`$ virsh list`


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-use-kvm-cloud-images-on-ubuntu-linux/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[2]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[3]:https://www.cyberciti.biz/faq/how-to-create-bridge-interface-ubuntu-linux/
[4]:https://www.cyberciti.biz/faq/installing-kvm-on-ubuntu-16-04-lts-server/
[5]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[6]:https://www.cyberciti.biz/faq/linux-unix-generating-ssh-keys/
[7]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[8]:https://www.cyberciti.biz/media/new/faq/2017/12/connect-to-the-running-VM-using-ssh.jpg
