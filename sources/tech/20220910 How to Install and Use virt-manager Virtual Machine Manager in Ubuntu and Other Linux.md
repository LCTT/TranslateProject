[#]: subject: "How to Install and Use virt-manager Virtual Machine Manager in Ubuntu and Other Linux"
[#]: via: "https://www.debugpoint.com/virt-manager/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install and Use virt-manager Virtual Machine Manager in Ubuntu and Other Linux
======
virt-install

A comprehensive guide on how to install and use virt-manager virtual machine emulator in Ubuntu and other Linux systems.

The virt-manager application or package uses the [libvirt][1] library to provide virtual machine management services. It has a desktop interface that helps to create, delete, and manage multiple virtual machines.

It is primarily used for KVM VMs but can support other hypervisors as well, such as Xen, and LXC.

The user interface provides a summary view of all VMs their status, CPU usages, LIVE performance graph of running VMs, and resource utilization statistics.

There are other popular Virtual machine managers available such as [GNOME Boxes][2] and Oracle Virtual box. GNOME Boxes is easy, but it’s buggy and depends heavily on GTK and GNOME-related packages. Oracle Virtual Box is good, but I feel it is unnecessary and complex and has a complicated UI.

But the [virt-manager][3] is super easy and can be used on any Linux distribution.

When you install the virt-manager package, it comes with five components.

**virt-install**: Command-line utility to provision OS**virt-viewer**: The UI interface with graphical features**virt-clone**: Command-line tool to close existing inactive hosts**virt-xml**: Command-line tool for easily editing libvirt domain XML using virt-install’s command-line options.**virt-bootstrap**: Command tool providing an easy way to set up the root file system for libvirt-based containers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/virt-manager/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://libvirt.org/manpages/libvirtd.html
[2]: https://www.debugpoint.com/install-use-gnome-boxes/
[3]: https://virt-manager.org/
