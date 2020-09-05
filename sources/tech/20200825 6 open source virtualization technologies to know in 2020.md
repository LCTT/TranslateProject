[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 open source virtualization technologies to know in 2020)
[#]: via: (https://opensource.com/article/20/8/virt-tools)
[#]: author: (Bryant Son https://opensource.com/users/brson)

6 open source virtualization technologies to know in 2020
======
Run, customize, and manage your VMs with open source Virt Tools. Plus
get a glossary of key virtualization terms.
![What is virtualization][1]

Virtualization Tools, better known as [Virt Tools][2], is a collection of six open source virtualization tools created by various contributors to make the virtualization world a better place.

![Virt Tools website][3]

(Bryant Son, [CC BY-SA 4.0][4])

Some of the tools, like KVM and QEMU, might be familiar to Linux enthusiasts, but tools like libvirt and libguestfs are probably less so.

In case you prefer to learn through watching videos than reading, I created a [video version][5] of this article, which you can access on YouTube.

Before walking through the tools, it's a good idea to know some essential [virtualization][6] terminology. I derived many of these definitions from Wikipedia, with pages linked in the table.

Term | Definition
---|---
[Virtualization][7] | In computing, virtualization refers to the act of creating a virtual (rather than physical) version of something, including virtual computer hardware platforms, storage devices, and computer network resources.
[Emulator][8] | An emulator is a hardware or software that enables one computer system (called the host) to behave like another computer system (called the guest).
[Virtual machine (VM)][9] | Also known as a "guest machine," these are emulations of real, physical hardware computers.
Hosts | In [hardware virtualization][10], a computer on which a hypervisor runs one or more VMs.
[Hypervisor][11] | This is computer software, firmware, or hardware that creates and runs a VMs.
[Kernel][12] | This is a computer program at the core of a computer's operating system with complete control over everything in the system.
[Daemon][13] | This is a computer program that runs as a background process, rather than under the direct control of an interactive user.

This table summarizes each Virt Tool, including license information and links to each tool's website and source code. Much of this information comes from the Virt Tools website and each tool's site.

Name | What It Is | License | Source Code
---|---|---|---
[Kernel-based Virtual Machine (KVM)][14] | A virtualization module in the Linux kernel that allows the kernel to function as a hypervisor | GNU GPL or LGPL | [Source code][15]
[Quick Emulator (QEMU)][16] | A generic and open source machine emulator and virtualizer | GPLv2 | [Source code][17]
[Libvirt][18] | A library and daemon providing a stable, open source API for managing virtualization hosts | GNU | [Source code][19]
[Libguestfs][20] | A set of tools for accessing and modifying VM disk images | LGPL, GPL | [Source code][21]
[Virt-manager][22] | A desktop user interface for managing VMs through libvirt | GPLv2+ | [Source code][23]
[Libosinfo][24] | Provides a database of information about operating system releases to assist in optimally configuring hardware when deploying VMs | LGPLv2+ | [Source code][25]

### Kernel-based Virtual Manager (KVM)

![KVM website][26]

(Bryant Son, [CC BY-SA 4.0][4])

KVM is a full virtualization solution for Linux on hardware containing virtualization extensions. KVM provides the hardware virtualization for a wide variety of guest operating systems, including Linux, Windows, macOS, ReactOS, and Haiku. Using KVM, you can run multiple VMs on unmodified Linux or Windows images. Each VM has private virtualized hardware: a network card, disk, graphics adapter, etc.

Most of the time, you won't directly interact with KVM. Instead, you must use QEMU, virt-manager, or another virtualization management tool to leverage KVM.

You can find full [documentation][27] on the KVM website, as well as access its [source code][15].

### Quick Emulator (QEMU)

![QEMU website][28]

(Bryant Son, [CC BY-SA 4.0][4])

QEMU is a generic, open source machine emulator and virtualizer. When used as an emulator, QEMU can run operating systems and programs made for one machine (e.g., an ARM board) on a different machine (e.g., your own x86_64 PC). When used as a virtualizer, QEMU achieves near-native performance by executing the guest code directly on the host CPU using KVM.

QEMU is supported on multiple operating systems, and its installation process is as easy as running a few simple commands; here, you can see how to install QEMU on macOS with [Homebrew][29].

![QEMU macOS installation info][30]

(Bryant Son, [CC BY-SA 4.0][4])

After installing, learn how to use it by reading through its [documentation][31], and you can also access its [source code][17].

### Libvirt

![Libvirt website][32]

(Bryant Son, [CC BY-SA 4.0][4])

Libvirt is a library and daemon that provides a stable open source API for managing virtualization hosts. It targets multiple hypervisors, including QEMU, KVM, LXC, Xen, OpenVZ, VMWare ESX, VirtualBox, and more.

Another interesting thing about libvirt is that [KubeVirt][33], an open source project for creating and managing VMs inside the Kubernetes platform, largely utilizes Libvirt. (I'll cover KubeVirt in a future article.) Libvirt is an interesting project to explore, and you can find a plethora of information on its official [website][18] as well as download its [source code][21].

### Libguestfs

![Libguestfs website][34]

(Bryant Son, [CC BY-SA 4.0][4])

Libguestfs is a set of tools for accessing and modifying VM disk images. You can use it for viewing and editing files inside guests; scripting changes to VMs; monitoring disk used/free statistics; creating guests, physical to virtual (P2V), or virtual to virtual (V2V) machines; performing backups; cloning VMs; building VMs; formatting disks; resizing disks; and much more. I have been using it recently while working on a KubeVirt-based project called [OpenShift Virtualization][35], which you can learn more about in my [video tutorial][36].

Libguestfs' official [website][20] contains extensive documentation on how to use each command, and you can also download its [source code][21] on GitHub.

### Virt-manager

![Virt-manager website][37]

(Bryant Son, [CC BY-SA 4.0][4])

Virt-manager is a desktop user interface for managing VMs through libvirt. It primarily targets KVM VMs but also manages Xen and LXC. It also includes the command line provisioning tool virt-install. Think of virt-manager as an easy-to-use management tool for your VMs. For example, you can use virt-manager to run a Microsoft Windows environment on a Linux workstation or vice versa.

Virt-manager's [source code][23] is available on GitHub and [documentation][38] is on its website. At this time, virt-manager is only available for Linux platforms.

### Libosinfo

![Libosinfo website][39]

(Bryant Son, [CC BY-SA 4.0][4])

Libosinfo provides a database of information about operating system releases to assist in configuring hardware when deploying VMs. It includes a C library for querying information in the database, which is also accessible from any language supported by GObject introspection. As you may guess, libosinfo is more of a building block to enable an operating system's functionality—but quite an important one.

Libosinfo's [source code][25] is available on GitLab, and its [documentation][40] can be found on at its website.

### Conclusion

Virt-tools is a set of six powerful tools that make virtualization easier and enable important virtualization functions. All of them are open source projects, so I encourage you to explore further and maybe even contribute to them.

What do you think? Feel free to leave a comment to share your thoughts or ask questions.

Learn how Vagrant and Ansible can be used to provision virtual machines for web development.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/virt-tools

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/what_is_virtualization.png?itok=e4WCa7N_ (What is virtualization)
[2]: https://www.virt-tools.org/
[3]: https://opensource.com/sites/default/files/uploads/1_virttools.jpg (Virt Tools website)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://youtu.be/E6TBDh2RLY8
[6]: https://www.redhat.com/en/topics/virtualization/what-is-virtualization
[7]: https://en.wikipedia.org/wiki/Virtualization
[8]: https://en.wikipedia.org/wiki/Emulator
[9]: https://en.wikipedia.org/wiki/Virtual_machine
[10]: https://en.wikipedia.org/wiki/Hardware_virtualization
[11]: https://en.wikipedia.org/wiki/Hypervisor
[12]: https://en.wikipedia.org/wiki/Kernel_%28operating_system%29
[13]: https://en.wikipedia.org/wiki/Daemon_%28computing%29
[14]: https://www.linux-kvm.org/page/Main_Page
[15]: https://git.kernel.org/pub/scm/virt/kvm/kvm.git
[16]: https://www.qemu.org
[17]: https://git.qemu.org/git/qemu.git
[18]: https://libvirt.org
[19]: https://libvirt.org/git/?p=libvirt.git
[20]: http://libguestfs.org/
[21]: https://github.com/libguestfs/libguestfs
[22]: https://virt-manager.org
[23]: https://github.com/virt-manager/virt-manager
[24]: https://libosinfo.org/download/
[25]: https://gitlab.com/libosinfo/libosinfo
[26]: https://opensource.com/sites/default/files/uploads/2_kvm.jpg (KVM website)
[27]: https://www.linux-kvm.org/page/Documents
[28]: https://opensource.com/sites/default/files/uploads/3_qemu.jpg (QEMU website)
[29]: https://opensource.com/article/20/6/homebrew-mac
[30]: https://opensource.com/sites/default/files/uploads/3_1_qemuinstall.jpg (QEMU macOS installation info)
[31]: https://www.qemu.org/documentation/
[32]: https://opensource.com/sites/default/files/uploads/4_libvirt.jpg (Libvirt website)
[33]: https://kubevirt.io/
[34]: https://opensource.com/sites/default/files/uploads/5_libguestfs.jpg (Libguestfs website)
[35]: https://www.openshift.com/blog/blog-openshift-virtualization-whats-new-with-virtualization-from-red-hat
[36]: https://www.youtube.com/watch?v=tWPC-YER1I0
[37]: https://opensource.com/sites/default/files/uploads/6_virtualmanager.jpg (Virt-manager website)
[38]: https://virt-manager.org/documentation/
[39]: https://opensource.com/sites/default/files/uploads/7_libosinfo.jpg (Libosinfo website)
[40]: https://libosinfo.org/documentation/
