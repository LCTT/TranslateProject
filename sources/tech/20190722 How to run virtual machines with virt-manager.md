[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to run virtual machines with virt-manager)
[#]: via: (https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/)
[#]: author: (Marco Sarti https://fedoramagazine.org/author/msarti/)

How to run virtual machines with virt-manager
======

![][1]

In the beginning there was dual boot, it was the only way to have more than one operating system on the same laptop. At the time, it was difficult for these operating systems to be run simultaneously or interact with each other. Many years passed before it was possible, on common PCs, to run an operating system inside another through virtualization.

Recent PCs or laptops, including moderately-priced ones, have the hardware features to run virtual machines with performance close to the physical host machine.

Virtualization has therefore become normal, to test operating systems, as a playground for learning new techniques, to create your own home cloud, to create your own test environment and much more. This article walks you through using Virt Manager on Fedora to setup virtual machines.

### Introducing QEMU/KVM and Libvirt

Fedora, like all other Linux systems, comes with native support for virtualization extensions. This support is given by KVM (Kernel based Virtual Machine) currently available as a kernel module.

QEMU is a complete system emulator that works together with KVM and allows you to create virtual machines with hardware and peripherals.

Finally [libvirt][2] is the API layer that allows you to administer the infrastructure, ie create and run virtual machines.

The set of these three technologies, all open source, is what we’re going to install on our Fedora Workstation.

### Installation

#### Step 1: install packages

Installation is a fairly simple operation. The Fedora repository provides the “virtualization” package group that contains everything you need.
```

```

sudo dnf install @virtualization
```

```

#### Step 2: edit the libvirtd configuration

By default the system administration is limited to the root user, if you want to enable a regular user you have to proceed as follows.

Open the /etc/libvirt/libvirtd.conf file for editing
```

```

sudo vi /etc/libvirt/libvirtd.conf
```

```

Set the domain socket group ownership to libvirt
```

```

unix_sock_group = "libvirt"
```

```

Adjust the UNIX socket permissions for the R/W socket
```

```

unix_sock_rw_perms = "0770"
```

```

#### Step 3: start and enable the libvirtd service
```

```

sudo systemctl start libvirtd
sudo systemctl enable libvirtd
```

```

#### Step 4: add user to group

In order to administer libvirt with the regular user you must add the user to the libvirt group, otherwise every time you start virtual-manager you will be asked for the password for sudo.
```

```

sudo usermod -a -G libvirt $(whoami)
```

```

This adds the current user to the group. You must log out and log in to apply the changes.

### Getting started with virt-manager

The libvirt system can be managed either from the command line (virsh) or via the virt-manager graphical interface. The command line can be very useful if you want to do automated provisioning of virtual machines, for example with [Ansible][3], but in this article we will concentrate on the user-friendly graphical interface.

The virt-manager interface is simple. The main form shows the list of connections including the local system connection.

The connection settings include virtual networks and storage definition. it is possible to define multiple virtual networks and these networks can be used to communicate between guest systems and between the guest systems and the host.

### Creating your first virtual machine

To start creating a new virtual machine, press the button at the top left of the main form:

![][4]

The first step of the wizard requires the installation mode. You can choose between a local installation media, network boot / installation or an existing virtual disk import:

![][5]

Choosing the local installation media the next step will require the ISO image path:

![ ][6]

The subsequent two steps will allow you to size the CPU, memory and disk of the new virtual machine. The last step will ask you to choose network preferences: choose the default network if you want the virtual machine to be separated from the outside world by a NAT, or bridged if you want it to be reachable from the outside. Note that if you choose bridged the virtual machine cannot communicate with the host machine.

Check “Customize configuration before install” if you want to review or change the configuration before starting the setup:

![][7]

The virtual machine configuration form allows you to review and modify the hardware configuration. You can add disks, network interfaces, change boot options and so on. Press “Begin installation” when satisfied:

![][8]

At this point you will be redirected to the console where to proceed with the installation of the operating system. Once the operation is complete, you will have the working virtual machine that you can access from the console:

![][9]

The virtual machine just created will appear in the list of the main form, where you will also have a graph of the CPU and memory occupation:

![][10]

libvirt and virt-manager is a powerful tool that allows great customization to your virtual machines with enterprise level management. If something even simpler is desired, note that Fedora Workstation comes with [GNOME Boxes pre-installed and can be sufficient for basic virtualization needs][11].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/

作者：[Marco Sarti][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/msarti/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/virt-manager-816x346.jpg
[2]: https://libvirt.org/
[3]: https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-09-41-45.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-09-30-53.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-42-39.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-43-21.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-44-58.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-10-55-35.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/07/Screenshot-from-2019-07-14-11-09-22.png
[11]: https://fedoramagazine.org/getting-started-with-virtualization-in-gnome-boxes/
