[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create virtual machines with Cockpit in Fedora)
[#]: via: (https://fedoramagazine.org/create-virtual-machines-with-cockpit-in-fedora/)
[#]: author: (Karlis KavacisPaul W. Frields https://fedoramagazine.org/author/karlisk/https://fedoramagazine.org/author/pfrields/)

Create virtual machines with Cockpit in Fedora
======

![][1]

This article shows you how to install the software you need to use Cockpit to create and manage virtual machines on Fedora 31. Cockpit is [an interactive admin interface][2] that lets you access and manage systems from any supported web browser. With [virt-manager being deprecated][3] users are encouraged to use Cockpit instead, which is meant to replace it.

Cockpit is an actively developed project, with many plugins available that extend how it works. For example, one such plugin is “Machines,” which interacts with libvirtd and lets users create and manage virtual machines.

### Installing software

The required software prerequisites are _libvirt_, _cockpit_ and _cockpit-machines_. To install them on Fedora 31, run the following command from a terminal [using sudo][4]:

```
$ sudo dnf install libvirt cockpit cockpit-machines
```

Cockpit is also included as part of the “Headless Management” package group. This group is useful for a Fedora based server that you only access through a network. In that case, to install it, use this command:

```
$ sudo dnf groupinstall "Headless Management"
```

### Setting up Cockpit services

After installing the necessary packages it’s time to enable the services. The _libvirtd_ service runs the virtual machines, while Cockpit has a socket activated service to let you access the Web GUI:

```
$ sudo systemctl enable libvirtd --now
$ sudo systemctl enable cockpit.socket --now
```

This should be enough to run virtual machines and manage them through Cockpit. Optionally, if you want to access and manage your machine from another device on your network, you need to expose the service to the network. To do this, add a new rule in your firewall configuration:

```
$ sudo firewall-cmd --zone=public --add-service=cockpit --permanent
$ sudo firewall-cmd --reload
```

To confirm the services are running and no issues occurred, check the status of the services:

```
$ sudo systemctl status libvirtd
$ sudo systemctl status cockpit.socket
```

At this point everything should be working. The Cockpit web GUI should be available at <https://localhost:9090> or <https://127.0.0.1:9090>. Or, enter the local network IP in a web browser on any other device connected to the same network. (Without SSL certificates setup, you may need to allow a connection from your browser.)

### Creating and installing a machine

Log into the interface using the user name and password for that system. You can also choose whether to allow your password to be used for administrative tasks in this session.

Select _Virtual Machines_ and then select _Create VM_ to build a new box. The console gives you several options:

  * Download an OS using Cockpit’s built in library
  * Use install media already downloaded on the system you’re managing
  * Point to a URL for an OS installation tree
  * Boot media over the network via the [PXE][5] protocol



Enter all the necessary parameters. Then select _Create_ to power up the new virtual machine.

At this point, a graphical console appears. Most modern web browsers let you use your keyboard and mouse to interact with the VM console. Now you can complete your installation and use your new VM, just as you would [via virt-manager in the past][6].

* * *

_Photo by [Miguel Teixeira][7] on [Flickr][8] (CC BY-SA 2.0)._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/create-virtual-machines-with-cockpit-in-fedora/

作者：[Karlis KavacisPaul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/karlisk/https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/create-vm-cockpit-816x345.jpg
[2]: https://cockpit-project.org/
[3]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/8.0_release_notes/rhel-8_0_0_release#virtualization_4
[4]: https://fedoramagazine.org/howto-use-sudo/
[5]: https://en.wikipedia.org/wiki/Preboot_Execution_Environment
[6]: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/
[7]: https://flickr.com/photos/miguelteixeira/
[8]: https://flickr.com/photos/miguelteixeira/2964851828/
