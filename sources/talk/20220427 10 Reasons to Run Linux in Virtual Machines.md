[#]: subject: "10 Reasons to Run Linux in Virtual Machines"
[#]: via: "https://itsfoss.com/why-linux-virtual-machine/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Reasons to Run Linux in Virtual Machines
======
You can run any operating system as a virtual machine to test things out or for a particular use case.

When it comes to Linux, it is usually a better performer as a virtual machine when compared to other operating systems. Even if you hesitate to install Linux on bare metal, you can try setting up a virtual machine that could run as you would expect on a physical machine.

Of course, we don’t rule out the possibility of running Linux distros in VM even when using Linux as your host OS.

Moreover, you get numerous benefits when trying to run Linux on virtual machines. Here, I shall mention all about that.

### Things to Keep in Mind Before Running Linux as a Virtual Machine

It is worth noting that running Linux on a virtual machine may not be a daunting task, but there are a few pointers that you should keep in mind.

Some of them include:

* The virtual machine performance will depend on your host system. If you do not have enough system resources to allocate, the virtual machine experience will not be pleasant.
* Certain features only work well with bare metal (hardware acceleration, graphics drivers, etc.)
* You should not expect intensive disk I/O tasks to work well, like testing games.
* The user experience with Linux virtual machines varies with the program you use. For instance, you can try VMware, VirtualBox, GNOME Boxes, and Hyper-V.

In addition to all these tips, you should also make a list of your requirements before choosing a virtual machine program to run Linux.

### Here Are 10 Benefits of Running Linux on Virtual Machines

While there are perks to using a Linux VM, you should consider the current opportunities available on your host OS. For instance, you may want to [install Linux using WSL on Windows][1] if you do not require a GUI desktop.

Once you are sure that you need a VM, here’s why you should proceed with it:

#### 1. Easy Setup 

![easy setup linux vm][2]

Compared to the traditional installation process on bare metal, setting up a virtual machine is often easier.

For Ubuntu-based distros, programs like VMware offer an **Easy Install** option where you have to type in the required fields for username and password; the rest will proceed without needing additional inputs. You do not need to select a partition, bootloader, or advanced configurations.

In some cases, you can also use prebuilt images offered by Linux distributions for a specific virtual program, where you need to open it to access the system. Think of it as a portable VM image ready to launch wherever you need it.

For example, you can check out how you can use [VirtualBox to install Arch Linux][3].

You may still need to configure things when installing other distros, but there are options where you need minimal effort.

#### 2. Does Not Affect the Host OS

![isolated linux vm][4]

With a virtual machine, you get the freedom to do anything you want, and it is because you get an isolated system.

Usually, if you do not know what you’re doing with a Linux system, you could easily end up with a messed-up configuration.

So, if you set up a VM, you can quickly try whatever you want without worrying about affecting the host OS. In other words, your system will not be impacted by any changes to the VM because it’s entirely isolated.

Hence, a VM is the best way to test any of your ambitious or destructive changes that you may want to perform on bare metal.

#### 3. Resource Sharing

![sharing resources linux vm][5]

If you have ample free system resources, you can utilize the rest using a Virtual Machine for any other tasks. For instance, if you want a private browsing experience without leaving any traces on your host, a VM can help.

It can be a far-fetched example, but it is just one of the ideas. In that way, you get to use the resources fully without much hassle.

Also, as opposed to a dual-boot scenario, where you need to [install Linux alongside Windows][6] on separate disks or [install Windows after Linux][7], you need dedicated resources locked on to your tasks.

However, with a VM, you can always use Linux without locking up your resources, rather than temporarily sharing them to get your tasks done, which can be more convenient.

#### 4. Multi-Tasking 

![multitasking linux vm][8]

With the help of resource-sharing, you can easily multi-task.

For instance, you need to switch back and forth between a dual-boot setup to access Windows and Linux.

But, with a virtual machine, you can almost eliminate the need for [dual-booting Linux][9] and multi-task with two operating systems seamlessly.

Of course, you need to ensure that you have the required amount of system resources and external hardware (like dual monitors) to effectively use it. Nevertheless, the potential to multi-task increases with a Linux VM in place.

#### 5. Facilitates Software Testing

With virtualization, you get the freedom to test software on Linux distros by instantly creating various situations.

For instance, you can test different software versions simultaneously on multiple Linux VMs. There can be more use-cases, such as testing a software development build, early build of a Linux distro, etc.

#### 6. Great for Development

![development linux vm][10]

When you want to learn to code or just get involved in developing something, you want an environment free from any conflicts and errors.

So, a Linux VM is the perfect place to install new packages from scratch without worrying about conflicts with existing ones. For instance, you can [install and set up Flutter][11] to test things on Ubuntu.

If you mess up the system, you can quickly delete the VM and spin up a new one to learn from your mistakes.

You get a perfect isolated environment for development work and testing with a Linux VM.

#### 7. Learning or Research

Linux is something to explore. While you could use it for basic computing tasks, there’s so much more that you can do with it.

You can learn how to customize the user interface, try some [popular desktop environments][12], install [various essential apps][13], and take control of your system without worrying about it.

If anything goes wrong, you create a new Linux VM. Of course, it is not just for general-purpose usage, but aspiring system administrators can also take this opportunity to test what they learn.

#### 8. Easy to Clone or Migrate

Virtual machines, in general, are easy to clone and migrate. With a Linux VM, as long as the virtual program is supported on another system or host OS, you can easily migrate it without any special requirements.

If you need to clone an existing virtual machine for any reason, that is pretty easy too, and it should take a couple of clicks to get it done.

#### 9. Try Variety of Distros

![distros linux vm][14]

Of course, with hundreds of Linux distros available, you can try all kinds of distros by creating a Linux virtual machine.

You may consider this a part of learning/research, but I believe trying out different distros is a massive task if you want to test things out before installing them on your system.

#### 10. Debugging

Whether it is for fun or serious research, debugging is relatively more straightforward in an isolated environment provided by the Linux VM.

You get the freedom to try various troubleshooting methods without thinking about the outcome. Also, you do not need root access to your host OS (if it’s Linux) to access the system configuration/files in the VM.

### Wrapping Up

If you are not an experienced user or depend on a different host OS, you can benefit from installing Linux using a virtual machine.

A Linux VM should be beneficial for development, learning, experimenting, or any other special use cases.

Have you used Linux on a virtual machine? What do you use it for? Let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-linux-virtual-machine/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/easy-setup-linux-vm.jpg
[3]: https://itsfoss.com/install-arch-linux-virtualbox/
[4]: https://itsfoss.com/wp-content/uploads/2022/04/isolated-linux-vm.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/04/sharing-resources-linux-vm.jpg
[6]: https://itsfoss.com/dual-boot-hdd-ssd/
[7]: https://itsfoss.com/install-windows-after-ubuntu-dual-boot/
[8]: https://itsfoss.com/wp-content/uploads/2022/04/multitasking-linux-vm.jpg
[9]: https://itsfoss.com/dual-boot-fedora-windows/
[10]: https://itsfoss.com/wp-content/uploads/2022/04/development-linux-vm.jpg
[11]: https://itsfoss.com/install-flutter-linux/
[12]: https://itsfoss.com/best-linux-desktop-environments/
[13]: https://itsfoss.com/essential-linux-applications/
[14]: https://itsfoss.com/wp-content/uploads/2022/04/distros-linux-vm.jpg
