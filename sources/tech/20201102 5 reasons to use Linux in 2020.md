[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons to use Linux in 2020)
[#]: via: (https://opensource.com/article/20/11/linux-2020)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 reasons to use Linux in 2020
======
Here's a look back at the year so far and a review of what you need to
know about Linux in 2020.
![Penguin driving a car with a yellow background][1]

Some of the best technology is a moving target. When technology stagnates, society tends to outpace and outgrow it. [Linux][2], the widely used open source operating system (OS), is a foundational technology and the basis for some of the most progressive modern computing ideas. So, while it's startlingly unchanged after three decades of development, it also allows adaptation. As a result, Linux is in a unique position of being both a sound investment in skills because it doesn't change and a seemingly eternal driving force for new skills to learn.

The year 2020 has been a strange one—by any measure—but for Linux, it's been a typical development cycle. Here's a look back at the year so far and a review of what you need to know about Linux in 2020.

### ZFS on Linux

The ZFS filesystem offers integrity checking for data and metadata, redundancy with mirroring, support for up to _256 trillion yobibytes_ of storage, hardware-accelerated native encryption, and efficient replication. ZFS is a Sun Microsystems innovation that, unfortunately, has a license that prohibits it from being bundled with Linux by default. However, the [OpenZFS][3] group has ported the project to BSD and Linux so that you can run ZFS on anything from your laptop to your data center.

Getting started with ZFS is surprisingly simple on Fedora Linux, as Sheng Mao demonstrates in his article on [setting up ZFS on Linux][4].

### Linux interrupts

No matter how familiar you are with Linux, there's always an opportunity to dive deeper and discover how it achieves what it does so well. Computers running stock markets, digital film studios, audio workstations, and other performance-intensive tasks need real-time processing, while other computers can afford to be a little lazy when processing requests, and it's no small task to manage the myriad loops happening on a computer at any given millisecond. Understanding how and why the Linux kernel manages interrupt requests (IRQs) may not be vital to the everyday user, but it's a fascinating study no matter what you do on computers. Read Stephan Avenwedde's article "[How the Linux kernel handles interrupts][5]" to learn more.

### Linux in your pocket

Since Google's Android OS runs on a Linux kernel, many of us technically have Linux in our pockets. As comforting as that might be, Android's smooth Java frontend doesn't always provide the Linux _feeling_ many Linux users long for. And some users don't have an Android phone at all.

The good news is that you can use Linux on your Android or iOS device, complete with a terminal, Bash, Python, a package manager, and all the other things you love about your favorite open source desktop OS.

If you're on Android, read my article about [Termux][6]. And if you're on iOS, read Lee Tusman's excellent article about [running a Linux command line on your iOS device][7].

### New commands on Linux

Time marches on, and sometimes the old, quaint commands of yesteryear are insufficient for modern systems. Although your muscle memory may cling to commands like `crontab` and `ifconfig` (and `iwconfig` and `wpa_supplicant`), there are perfectly good replacements for these and more. If you can't bring yourself to abandon your old commands, get familiar with [Bash aliases][8] because these new commands are worth learning.

  * Drop `ifconfig` for `nmcli`. Look, at some point, you have to admit that the unholy combination of `ifconfig` plus `iwconfig` and a foray into `wpa_supplicant` (which you secretly dropped long ago in favor of `wicd` anyway) just isn't efficient. Linux uses `nmcli` now, and it's become a highly usable, sometimes even intuitive way to interface with your network. Read Dave McKay's excellent [nmcli tutorial][9].
  * Cronjobs, `at`, and `batch` are uniquely timeless commands that probably ought never be replaced. They're great for quick and simple scheduling, but for complex jobs, you might find some features you like in a supplement to them: systemd timers. David Both provides an extensive [systemd timers tutorial][10] that demonstrates how to write and monitor your important custom system tasks.
  * `gcore` and `gdb` are important debuggers that developers may be familiar with. A new take on `gcore` functionality is Microsoft's ProcDump, which obtains a core dump of a process ID (PID) so that you can analyze it with `gdb`. It's more an alternative than a replacement, but it's worth trying if you're curious about different tools. Read Guarav Kamathe's [ProcDump tutorial][11] for more information.



### The cloud runs on Linux

As "the cloud" continues full steam ahead, Linux remains its main driving force. The cloud is a collection of computers (nodes) with a massively distributed filesystem (such as [Ceph][12]), and it's commonly managed with Kubernetes ("_KOO-burr-net-eez"_] or [OpenShift][13].

Regardless of how well you know Linux on your laptop or desktop or even in your private data center, there's a whole new world of Linux experimentation available in containers running on the cloud. It can take some adjustment to learn how to get comfortable in an ephemeral container, but with some practice and a little context, you can build some interesting systems and then orchestrate them (that is, cause them to update, scale, and perform as needed) with Kubernetes.

Jiaqi Liu wrote one of the best overviews of the cloud workflow in "[A beginner's guide to Kubernetes container orchestration][14]." Read it, and then download Chris Collins' [Kubernetes eBook][15] to build your own cloud at home on a Raspberry Pi cluster.

### Open source growth

Linux users relish the consistency and stability of Linux, and it's a testament to the original Unix system design that the OS can stay the same while also pushing its boundaries into exciting new forms of technology. Part of the fun of Linux and open source is the sense of discovery you get when you start learning a new command and the sense of accomplishment when it works to make your life easier. Take a look at the latest Linux developments, and get started with something new today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/linux-2020

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://opensource.com/resources/linux
[3]: https://openzfs.org/wiki/Main_Page
[4]: https://opensource.com/article/20/10/zfs-dnf
[5]: https://opensource.com/article/20/10/linux-kernel-interrupts
[6]: https://opensource.com/article/20/8/termux
[7]: https://opensource.com/article/20/9/run-linux-ios
[8]: https://opensource.com/article/19/7/bash-aliases
[9]: https://opensource.com/article/20/7/nmcli
[10]: https://opensource.com/article/20/7/systemd-timers
[11]: https://opensource.com/article/20/7/procdump-linux
[12]: https://opensource.com/business/15/1/introduction-ceph-storage-openstack
[13]: https://www.redhat.com/en/technologies/cloud-computing/openshift
[14]: https://opensource.com/article/20/6/container-orchestration
[15]: https://opensource.com/downloads/kubernetes-raspberry-pi
