[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install VirtualBox 6.0 on CentOS 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-virtualbox-6-centos-8-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Install VirtualBox 6.0 on CentOS 8 / RHEL 8
======

**VirtualBox** is a free and open source **virtualization tool** which allows techies to run multiple virtual machines of different flavor at the same time. It is generally used at desktop level (Linux and Windows), it becomes very handy when someone try to explore the features of new Linux distribution or want to install software like **OpenStack**, **Ansible** and **Puppet** in one VM, so in such scenarios one can launch a VM using VirtualBox.

VirtualBox is categorized as **type 2 hypervisor** which means it requires an existing operating system, on top of which VirtualBox software will be installed. VirtualBox provides features to create our own custom host only network and NAT network. In this article we will demonstrate how to install latest version of VirtualBox 6.0 on CentOS 8 and RHEL 8 System and will also demonstrate on how to install VirtualBox Extensions.

### Installation steps of VirtualBox 6.0 on CentOS 8 / RHEL 8

#### Step:1) Enable VirtualBox and EPEL Repository

Login to your CentOS 8 or RHEL 8 system and open terminal and execute the following commands to enable VirtualBox and EPEL package repository.

```
[root@linuxtechi ~]# dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
```

Use below rpm command to import Oracle VirtualBox Public Key

```
[root@linuxtechi ~]# rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
```

Enable EPEL repo using following dnf command,

```
[root@linuxtechi ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

#### Step:2) Install VirtualBox Build tools and dependencies

Run the following command to install all VirtualBox build tools and dependencies,

```
[root@linuxtechi ~]# dnf install binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms -y
```

Once above dependencies and build tools are installed successfully then proceed with VirtualBox installation using dnf command,

#### Step:3) Install VirtualBox 6.0 on CentOS 8 / RHEL 8

If wish to list available versions of VirtualBox before installing it , then execute the following [dnf command][1],

```
[root@linuxtechi ~]# dnf search virtualbox
Last metadata expiration check: 0:14:36 ago on Sun 17 Nov 2019 04:13:16 AM GMT.
=============== Summary & Name Matched: virtualbox =====================
VirtualBox-5.2.x86_64 : Oracle VM VirtualBox
VirtualBox-6.0.x86_64 : Oracle VM VirtualBox
[root@linuxtechi ~]#
```

Let’s install latest version of VirtualBox 6.0 using following dnf command,

```
[root@linuxtechi ~]# dnf install VirtualBox-6.0 -y
```

If any local user want to attach usb device to VirtualBox VMs then he/she should be part “**vboxuser**s ” group, use the beneath usermod command to add local user to “vboxusers” group.

```
[root@linuxtechi ~]# usermod -aG vboxusers pkumar
```

#### Step:4) Access VirtualBox on CentOS 8 / RHEL 8

There are two ways to access VirtualBox, from the command line type “**virtualbox**” then hit enter

```
[root@linuxtechi ~]# virtualbox
```

From Desktop environment, Search “VirtualBox” from Search Dash.

[![Access-VirtualBox-CentOS8][2]][3]

Click on VirtualBox icon,

[![VirtualBox-CentOS8][2]][4]

This confirms that VirtualBox 6.0 has been installed successfully, let’s install its extension pack.

#### Step:5) Install VirtualBox 6.0 Extension Pack

As the name suggests, VirtualBox extension pack is used to extend the functionality of VirtualBox. It adds the following features:

  * USB 2.0 &amp; USB 3.0 support
  * Virtual RDP (VRDP)
  * Disk Image Encryption
  * Intel PXE Boot
  * Host WebCam



Use below wget command to download virtualbox extension pack under download folder,

```
[root@linuxtechi ~]$ cd Downloads/
[root@linuxtechi Downloads]$ wget https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
```

Once it is downloaded, access VirtualBox and navigate **File** –&gt;**Preferences** –&gt; **Extension** then click on + icon to add downloaded extension pack,

[![Install-VirtualBox-Extension-Pack-CentOS8][2]][5]

Click on “Install” to start the installation of extension pack.

[![Accept-VirtualBox-Extension-Pack-License-CentOS8][2]][6]

Click on “I Agree” to accept VirtualBox Extension Pack License.

After successful installation of VirtualBox extension pack, we will get following screen, Click on Ok and start using VirtualBox.

[![VirtualBox-Extension-Pack-Install-Message-CentOS8][2]][7]

That’s all from this article, I hope these steps help you install VirtualBox 6.0 on your CentOS 8 and RHEL 8 system. Please do share your valuable feedback and comments.

**Also Read**: **[How to Manage Oracle VirtualBox Virtual Machines from Command Line][8]**

  * [Facebook][9]
  * [Twitter][10]
  * [LinkedIn][11]
  * [Reddit][12]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-virtualbox-6-centos-8-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/dnf-command-examples-rpm-management-fedora-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Access-VirtualBox-CentOS8.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/VirtualBox-CentOS8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Install-VirtualBox-Extension-Pack-CentOS8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Accept-VirtualBox-Extension-Pack-License-CentOS8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/11/VirtualBox-Extension-Pack-Install-Message-CentOS8.jpg
[8]: https://www.linuxtechi.com/manage-virtualbox-virtual-machines-command-line/
[9]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&t=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
[10]: http://twitter.com/share?text=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&via=Linuxtechi
[11]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&title=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
[12]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-virtualbox-6-centos-8-rhel-8%2F&title=How%20to%20Install%20VirtualBox%206.0%20on%20CentOS%208%20%2F%20RHEL%208
