[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to compile a Linux kernel in the 21st century)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-21st-century)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/greg-p)

How to compile a Linux kernel in the 21st century
======
You don't have to compile the Linux kernel but you can with this quick
tutorial.
![and old computer and a new computer, representing migration to new software or hardware][1]

In computing, a kernel is the low-level software that handles communication with hardware and general system coordination. Aside from some initial firmware built into your computer's motherboard, when you start your computer, the kernel is what provides awareness that it has a hard drive and a screen and a keyboard and a network card. It's also the kernel's job to ensure equal time (more or less) is given to each component so that your graphics and audio and filesystem and network all run smoothly, even though they're running concurrently.

The quest for hardware support, however, is ongoing, because the more hardware that gets released, the more stuff a kernel must adopt into its code to make the hardware work as expected. It's difficult to get accurate numbers, but the Linux kernel is certainly among the top kernels for hardware compatibility. Linux operates innumerable computers and mobile phones, embedded system on a chip (SoC) boards for hobbyist and industrial uses, RAID cards, sewing machines, and much more.

Back in the 20th century (and even in the early years of the 21st), it was not unreasonable for a Linux user to expect that when they purchased a very new piece of hardware, they would need to download the very latest kernel source code, compile it, and install it so that they could get support for the device. Lately, though, you'd be hard-pressed to find a Linux user who compiles their own kernel except for fun or profit by way of highly specialized custom hardware. It generally isn't required these days to compile the Linux kernel yourself.

Here are the reasons why, plus a quick tutorial on how to compile a kernel when you need to.

### Update your existing kernel

Whether you've got a brand new laptop featuring a fancy new graphics card or WiFi chipset or you've just brought home a new printer, your operating system (called either GNU+Linux or just Linux, which is also the name of the kernel) needs a driver to open communication channels to that new component (graphics card, WiFi chip, printer, or whatever). It can be deceptive, sometimes, when you plug in a new device and your computer _appears_ to acknowledge it. But don't let that fool you. Sometimes that _is_ all you need, but other times your OS is just using generic protocols to probe a device that's attached.

For instance, your computer may be able to identify your new network printer, but sometimes that's only because the network card in the printer is programmed to identify itself to a network so it can gain a DHCP address. It doesn't necessarily mean that your computer knows what instructions to send to the printer to produce a page of printed text. In fact, you might argue that the computer doesn't even really "know" that the device is a printer; it may only display that there's a device on the network at a specific address and the device identifies itself with the series of characters _p-r-i-n-t-e-r_. The conventions of human language are meaningless to a computer; what it needs is a driver.

Kernel developers, hardware manufacturers, support technicians, and hobbyists all know that new hardware is constantly being released. Many of them contribute drivers, submitted straight to the kernel development team for inclusion in Linux. For example, Nvidia graphic card drivers are often written into the [Nouveau][2] kernel module and, because Nvidia cards are common, the code is usually included in any kernel distributed for general use (such as the kernel you get when you download [Fedora][3] or [Ubuntu][4]. Where Nvidia is less common, for instance in embedded systems, the Nouveau module is usually excluded. Similar modules exist for many other devices: printers benefit from [Foomatic][5] and [CUPS][6], wireless cards have [b43, ath9k, wl][7] modules, and so on.

Distributions tend to include as much as they reasonably can in their Linux kernel builds because they want you to be able to attach a device and start using it immediately, with no driver installation required. For the most part, that's what happens, especially now that many device vendors are now funding Linux driver development for the hardware they sell and submitting those drivers directly to the kernel team for general distribution.

Sometimes, however, you're running a kernel you installed six months ago with an exciting new device that just hit the stores a week ago. In that case, your kernel may not have a driver for that device. The good news is that very often, a driver for that device may exist in a very recent edition of the kernel, meaning that all you have to do is update what you're running.

Generally, this is done through a package manager. For instance, on RHEL, CentOS, and Fedora:


```
`$ sudo dnf update kernel`
```

On Debian and Ubuntu, first get your current kernel version:


```
$ uname -r
4.4.186
```

Search for newer versions:


```
$ sudo apt update
$ sudo apt search linux-image
```

Install the latest version you find. In this example, the latest available is 5.2.4:


```
`$ sudo apt install linux-image-5.2.4`
```

After a kernel upgrade, you must [reboot][8] (unless you're using kpatch or kgraft). Then, if the device driver you need is in the latest kernel, your hardware will work as expected.

### Install a kernel module

Sometimes a distribution doesn't expect that its users often use a device (or at least not enough that the device driver needs to be in the Linux kernel). Linux takes a modular approach to drivers, so distributions can ship separate driver packages that can be loaded by the kernel even though the driver isn't compiled into the kernel itself. This is useful, although it can get complicated when a driver isn't included in a kernel but is needed during boot, or when the kernel gets updated out from under the modular driver. The first problem is solved with an **initrd** (initial RAM disk) and is out of scope for this article, and the second is solved by a system called **kmod**.

The kmod system ensures that when a kernel is updated, all modular drivers installed alongside it are also updated. If you install a driver manually, you miss out on the automation that kmod provides, so you should opt for a kmod package whenever it is available. For instance, while Nvidia drivers are built into the kernel as the Nouveau driver, the official Nvidia drivers are distributed only by Nvidia. You can install Nvidia-branded drivers manually by going to the website, downloading the **.run** file, and running the shell script it provides, but you must repeat that same process after you install a new kernel, because nothing tells your package manager that you manually installed a kernel driver. Because Nvidia drives your graphics, updating the Nvidia driver manually usually means you have to perform the update from a terminal, because you have no graphics without a functional graphics driver.

![Nvidia configuration application][9]

However, if you install the Nvidia drivers as a kmod package, updating your kernel also updates your Nvidia driver. On Fedora and related:


```
`$ sudo dnf install kmod-nvidia`
```

On Debian and related:


```
$ sudo apt update
$ sudo apt install nvidia-kernel-common nvidia-kernel-dkms nvidia-glx nvidia-xconfig nvidia-settings nvidia-vdpau-driver vdpau-va-driver
```

This is only an example, but if you're installing Nvidia drivers in real life, you must also blacklist the Nouveau driver. See your distribution's documentation for the best steps.

### Download and install a driver

Not everything is included in the kernel, and not everything _else_ is available as a kernel module. In some cases, you have to download a special driver written and bundled by the hardware vendor, and other times, you have the driver but not the frontend to configure driver options.

Two common examples are HP printers and [Wacom][10] illustration tablets. If you get an HP printer, you probably have generic drivers that can communicate with your printer. You might even be able to print. But the generic driver may not be able to provide specialized options specific to your model, such as double-sided printing, collation, paper tray choices, and so on. [HPLIP][11] (the HP Linux Imaging and Printing system) provides options to manage jobs, adjust printing options, select paper trays where applicable, and so on.

HPLIP is usually bundled in package managers; just search for "hplip."

![HPLIP in action][12]

Similarly, drivers for Wacom tablets, the leading illustration tablet for digital artists, are usually included in your kernel, but options to fine-tune settings, such as pressure sensitivity and button functionality, are only accessible through the graphical control panel included by default with GNOME but installable as the extra package **kde-config-tablet** on KDE.

There are likely some edge cases that don't have drivers in the kernel but offer kmod versions of driver modules as an RPM or DEB file that you can download and install through your package manager.

### Patching and compiling your own kernel

Even in the futuristic utopia that is the 21st century, there are vendors that don't understand open source enough to provide installable drivers. Sometimes, such companies provide source code for a driver but expect you to download the code, patch a kernel, compile, and install manually.

This kind of distribution model has the same disadvantages as installing packaged drivers outside of the kmod system: an update to your kernel breaks the driver because it must be re-integrated into your kernel manually each time the kernel is swapped out for a new one.

This has become rare, happily, because the Linux kernel team has done an excellent job of pleading loudly for companies to communicate with them, and because companies are finally accepting that open source isn't going away any time soon. But there are still novelty or hyper-specialized devices out there that provide only kernel patches.

Officially, there are distribution-specific preferences for how you should compile a kernel to keep your package manager involved in upgrading such a vital part of your system. There are too many package managers to cover each; as an example, here is what happens behind the scenes when you use tools like **rpmdev** on Fedora or **build-essential** and **devscripts** on Debian.

First, as usual, find out which kernel version you're running:


```
`$ uname -r`
```

In most cases, it's safe to upgrade your kernel if you haven't already. After all, it's possible that your problem will be solved in the latest release. If you tried that and it didn't work, then you should download the source code of the kernel you are running. Most distributions provide a special command for that, but to do it manually, you can find the source code on [kernel.org][13].

You also must download whatever patch you need for your kernel. Sometimes, these patches are specific to the kernel release, so choose carefully.

It's traditional, or at least it was back when people regularly compiled their own kernels, to place the source code and patches in **/usr/src/linux**.

Unarchive the kernel source and the patch files as needed:


```
$ cd /usr/src/linux
$ bzip2 --decompress linux-5.2.4.tar.bz2
$ cd  linux-5.2.4
$ bzip2 -d ../patch*bz2
```

The patch file may have instructions on how to do the patch, but often they're designed to be executed from the top level of your tree:


```
`$ patch -p1 < patch*example.patch`
```

Once the kernel code is patched, you can use your old configuration to prepare the patched kernel config:


```
`$ make oldconfig`
```

The **make oldconfig** command serves two purposes: it inherits your current kernel's configuration, and it allows you to configure new options introduced by the patch.

You may need to run the **make menuconfig** command, which launches an ncurses-based, menu-driven list of possible options for your new kernel. The menu can be overwhelming, but since it starts with your old config as a foundation, you can look through the menu and disable modules for hardware that you know you do not have and do not anticipate needing. Alternately, if you know that you have some piece of hardware and see it is not included in your current configuration, you may choose to build it, either as a module or directly into the kernel. In theory, this isn't necessary because presumably, your current kernel was treating you well but for the missing patch, and probably the patch you applied has activated all the necessary options required by whatever device prompted you to patch your kernel in the first place.

Next, compile the kernel and its modules:


```
$ make bzImage
$ make modules
```

This leaves you with a file named **vmlinuz**, which is a compressed version of your bootable kernel. Save your old version and place the new one in your **/boot** directory:


```
$ sudo mv /boot/vmlinuz /boot/vmlinuz.nopatch
$ sudo cat arch/x86_64/boot/bzImage &gt; /boot/vmlinuz
$ sudo mv /boot/System.map /boot/System.map.stock
$ sudo cp System.map /boot/System.map
```

So far, you've patched and built a kernel and its modules, you've installed the kernel, but you haven't installed any modules. That's the final build step:


```
`$ sudo make modules_install`
```

The new kernel is in place, and its modules are installed.

The final step is to update your bootloader so that the part of your computer that loads before the kernel knows where to find Linux. The GRUB bootloader makes this process relatively simple:


```
`$ sudo grub2-mkconfig`
```

### Real-world compiling

Of course, nobody runs those manual commands now. Instead, refer to your distribution for instructions on modifying a kernel using the developer toolset that your distribution's maintainers use. This toolset will probably create a new installable package with all the patches incorporated, alert the package manager of the upgrade, and update your bootloader for you.

### Kernels

Operating systems and kernels are mysterious things, but it doesn't take much to understand what components they're built upon. The next time you get a piece of tech that appears to not work on Linux, take a deep breath, investigate driver availability, and go with the path of least resistance. Linux is easier than ever—and that includes the kernel.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-21st-century

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: https://nouveau.freedesktop.org/wiki/
[3]: http://fedoraproject.org
[4]: http://ubuntu.com
[5]: https://wiki.linuxfoundation.org/openprinting/database/foomatic
[6]: https://www.cups.org/
[7]: https://wireless.wiki.kernel.org/en/users/drivers
[8]: https://opensource.com/article/19/7/reboot-linux
[9]: https://opensource.com/sites/default/files/uploads/nvidia.jpg (Nvidia configuration application)
[10]: https://linuxwacom.github.io
[11]: https://developers.hp.com/hp-linux-imaging-and-printing
[12]: https://opensource.com/sites/default/files/uploads/hplip.jpg (HPLIP in action)
[13]: https://www.kernel.org/
