[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Different Ways To Update Linux Kernel For Ubuntu)
[#]: via: (https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

Different Ways To Update Linux Kernel For Ubuntu
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/ubuntu-linux-kernel-720x340.png)

In this guide, we have given 7 different ways to update Linux kernel for Ubuntu. Among the 7 methods, five methods requires system reboot to apply the new Kernel and two methods don’t. Before updating Linux Kernel, it is **highly recommended to backup your important data!** All methods mentioned here are tested on Ubuntu OS only. We are not sure if they will work on other Ubuntu flavors (Eg. Xubuntu) and Ubuntu derivatives (Eg. Linux Mint).

### Part A – Kernel Updates with reboot

The following methods requires you to reboot your system to apply the new Linux Kernel. All of the following methods are recommended for personal or testing systems. Again, please backup your important data, configuration files and any other important stuff from your Ubuntu system.

#### Method 1 – Update the Linux Kernel with dpkg (The manual way)

This method helps you to manually download and install the latest available Linux kernel from **[kernel.ubuntu.com][1]** website. If you want to install most recent version (either stable or release candidate), this method will help. Download the Linux kernel version from the above link. As of writing this guide, the latest available version was **5.0-rc1** and latest stable version was **v4.20**.

![][3]

Click on the Linux Kernel version link of your choice and find the section for your architecture (‘Build for XXX’). In that section, download the two files with these patterns (where X.Y.Z is the highest version):

  1. linux-image-*X.Y.Z*-generic-*.deb
  2. linux-modules-X.Y.Z*-generic-*.deb



In a terminal, change directory to where the files are and run this command to manually install the kernel:

```
$ sudo dpkg --install *.deb
```

Reboot to use the new kernel:

```
$ sudo reboot
```

Check the kernel is as expected:

```
$ uname -r
```

For step by step instructions, please check the section titled under “Install Linux Kernel 4.15 LTS On DEB based systems” in the following guide.

+ [Install Linux Kernel 4.15 In RPM And DEB Based Systems](https://www.ostechnix.com/install-linux-kernel-4-15-rpm-deb-based-systems/)

The above guide is specifically written for 4.15 version. However, all the steps are same for installing latest versions too.

**Pros:** No internet needed (You can download the Linux Kernel from any system).

**Cons:** Manual update. Reboot necessary.

#### Method 2 – Update the Linux Kernel with apt-get (The recommended method)

This is the recommended way to install latest Linux kernel on Ubuntu-like systems. Unlike the previous method, this method will download and install latest Kernel version from Ubuntu official repositories instead of **kernel.ubuntu.com** website..

To update the whole system including the Kernel, just do:

```
$ sudo apt-get update

$ sudo apt-get upgrade
```

If you want to update the Kernel only, run:

```
$ sudo apt-get upgrade linux-image-generic
```

**Pros:** Simple. Recommended method.

**Cons:** Internet necessary. Reboot necessary.

Updating Kernel from official repositories will mostly work out of the box without any problems. If it is the production system, this is the recommended way to update the Kernel.

Method 1 and 2 requires user intervention to update Linux Kernels. The following methods (3, 4 & 5) are mostly automated.

#### Method 3 – Update the Linux Kernel with Ukuu

**Ukuu** is a Gtk GUI and command line tool that downloads the latest main line Linux kernel from **kernel.ubuntu.com** , and install it automatically in your Ubuntu desktop and server editions. Ukku is not only simplifies the process of manually downloading and installing new Kernels, but also helps you to safely remove the old and unnecessary Kernels. For more details, refer the following guide.

+ [Ukuu – An Easy Way To Install And Upgrade Linux Kernel In Ubuntu-based Systems](https://www.ostechnix.com/ukuu-an-easy-way-to-install-and-upgrade-linux-kernel-in-ubuntu-based-systems/)

**Pros:** Easy to install and use. Automatically installs main line Kernel.

**Cons:** Internet necessary. Reboot necessary.

#### Method 4 – Update the Linux Kernel with UKTools

Just like Ukuu, the **UKTools** also fetches the latest stable Kernel from from **kernel.ubuntu.com** site and installs it automatically on Ubuntu and its derivatives like Linux Mint. More details about UKTools can be found in the link given below.

+ [UKTools – Upgrade Latest Linux Kernel In Ubuntu And Derivatives](https://www.ostechnix.com/uktools-upgrade-latest-linux-kernel-in-ubuntu-and-derivatives/)

**Pros:** Simple. Automated.

**Cons:** Internet necessary. Reboot necessary.

#### Method 5 – Update the Linux Kernel with Linux Kernel Utilities

**Linux Kernel Utilities** is yet another program that makes the process of updating Linux kernel easy in Ubuntu-like systems. It is actually a set of BASH shell scripts used to compile and/or update latest Linux kernels for Debian and derivatives. It consists of three utilities, one for manually compiling and installing Kernel from source from [**http://www.kernel.org**][4] website, another for downloading and installing pre-compiled Kernels from from **<https://kernel.ubuntu.com>** website. and third script is for removing the old kernels. For more details, please have a look at the following link.

+ [Linux Kernel Utilities – Scripts To Compile And Update Latest Linux Kernel For Debian And Derivatives](https://www.ostechnix.com/linux-kernel-utilities-scripts-compile-update-latest-linux-kernel-debian-derivatives/)

**Pros:** Simple. Automated.

**Cons:** Internet necessary. Reboot necessary.


### Part B – Kernel Updates without reboot

As I already said, all of above methods need you to reboot the server before the new kernel is active. If they are personal systems or testing machines, you could simply reboot and start using the new Kernel. But, what if they are production systems that requires zero downtime? No problem. This is where **Livepatching** comes in handy!

The **livepatching** (or hot patching) allows you to install Linux updates or patches without rebooting, keeping your server at the latest security level, without any downtime. This is attractive for ‘always-on’ servers, such as web hosts, gaming servers, in fact, any situation where the server needs to stay on all the time. Linux vendors maintain patches only for security fixes, so this approach is best when security is your main concern.

The following two methods doesn’t require system reboot and useful for updating Linux Kernel on production and mission-critical Ubuntu servers.

#### Method 6 – Update the Linux Kernel Canonical Livepatch Service

![][5]

[**Canonical Livepatch Service**][6] applies Kernel updates, patches and security hotfixes automatically without rebooting the Ubuntu systems. It reduces the Ubuntu systems downtime and keep them secure. Canonical Livepatch Service can be set up either during or after installation. If you are using desktop Ubuntu, the Software Updater will automatically check for kernel patches and notify you. In a console-based system, it is up to you to run apt-get update regularly. It will install kernel security patches only when you run the command “apt-get upgrade”, hence is semi-automatic.

Livepatch is free for three systems. If you have more than three, you need to upgrade to enterprise support solution named **Ubuntu Advantage** suite. This suite includes **Kernel Livepatching** and other services such as,

  * Extended Security Maintenance – critical security updates after Ubuntu end-of-life.
  * Landscape – the systems management tool for using Ubuntu at scale.
  * Knowledge Base – A private collection of articles and tutorials written by Ubuntu experts.
  * Phone and web-based support.



**Cost**

Ubuntu Advantage includes three paid plans namely, Essential, Standard and Advanced. The basic plan (Essential plan) starts from **225 USD per year for one physical node** and **75 USD per year for one VPS**. It seems there is no monthly subscription for Ubuntu servers and desktops. You can view detailed information on all plans [**here**][7].

**Pros:** Simple. Semi-automatic. No reboot necessary. Free for 3 systems.

**Cons:** Expensive for 4 or more hosts. No patch rollback.

**Enable Canonical Livepatch Service**

If you want to setup Livepatch service after installation, just do the following steps.

Get a key at [**https://auth.livepatch.canonical.com/**][8].

```
$ sudo snap install canonical-livepatch

$ sudo canonical-livepatch enable your-key
```

#### Method 7 – Update the Linux Kernel with KernelCare

![][9]

[**KernelCare**][10] is the newest of all the live patching solutions. It is the product of [CloudLinux][11]. KernelCare runs on Ubuntu and other flavors of Linux. It checks for patch releases every 4 hours and will install them without confirmation. Patches can be rolled back if there are problems.

**Cost**

Fees, per server: **4 USD per month** , **45 USD per year**.

Compared to Ubuntu Livepatch, kernelCare seems very cheap and affordable. Good thing is **monthly subscriptions are also available**. Another notable feature is it supports other Linux distributions, such as Red Hat, CentOS, Debian, Oracle Linux, Amazon Linux and virtualization platforms like OpenVZ, Proxmox etc.

You can read all the features and benefits of KernelCare [**here**][12] and check all available plan details [**here**][13].

**Pros:** Simple. Fully automated. Wide OS coverage. Patch rollback. No reboot necessary. Free license for non-profit organizations. Low cost.

**Cons:** Not free (except for 30 day trial).

**Enable KernelCare Service**

Get a 30-day trial key at [**https://cloudlinux.com/kernelcare-free-trial5**][14].

Run the following commands to enable KernelCare and register the key.

```
$ sudo wget -qq -O - https://repo.cloudlinux.com/kernelcare/kernelcare_install.sh | bash

$ sudo /usr/bin/kcarectl --register KEY
```

If you’re looking for an affordable and reliable commercial service to keep the Linux Kernel updated on your Linux servers, KernelCare is good to go.

*with inputs from **Paul A. Jacobs** , a Technical Evangelist and Content Writer from Cloud Linux.*

**Suggested read:**

And, that’s all for now. Hope this was useful. If you believe any other tools/methods should include in this list, feel free to let us know in the comment section below. I will check and update this guide accordingly.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/different-ways-to-update-linux-kernel-for-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: http://kernel.ubuntu.com/~kernel-ppa/mainline/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/Ubuntu-mainline-kernel.png
[4]: http://www.kernel.org
[5]: http://www.ostechnix.com/wp-content/uploads/2019/01/Livepatch.png
[6]: https://www.ubuntu.com/livepatch
[7]: https://www.ubuntu.com/support/plans-and-pricing
[8]: https://auth.livepatch.canonical.com/
[9]: http://www.ostechnix.com/wp-content/uploads/2019/01/KernelCare.png
[10]: https://www.kernelcare.com/
[11]: https://www.cloudlinux.com/
[12]: https://www.kernelcare.com/update-kernel-linux/
[13]: https://www.kernelcare.com/pricing/
[14]: https://cloudlinux.com/kernelcare-free-trial5
