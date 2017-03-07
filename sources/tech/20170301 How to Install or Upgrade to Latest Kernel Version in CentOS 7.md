How to Install or Upgrade to Latest Kernel Version in CentOS 7
============================================================

by [Gabriel Cánepa][14] | Published: March 1, 2017 | Last Updated: March 6, 2017

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][15] | [4 Free Shell Scripting eBooks][16]

Although some people use the word Linux to represent the operating system as a whole, it is important to note that, strictly speaking, Linux is only the kernel. On the other hand, a distribution is a fully-functional system built on top of the kernel with a wide variety of application tools and libraries.

During normal operations, the kernel is responsible for performing two important tasks:

1.  Acting as an interface between the hardware and the software running on the system.
2.  Managing system resources as efficiently as possible.

To do this, the kernel communicates with the hardware through the drivers that are built into it or those that can be later installed as a module.

For example, when an application running on your machine wants to connect to a wireless network, it submits that request to the kernel, which in turns uses the right driver to connect to the network.

**Suggested Read:** [How to Upgrade Kernel in Ubuntu][1]

With new devices and technology coming out periodically, it is important to keep our kernel up to date if we want to make the most of out them. Additionally, updating our kernel will help us to leverage new kernel functions and to protect ourselves from vulnerabilities that have been discovered in previous versions.

Ready to update your kernel on CentOS 7 or one of their derivatives such as RHEL 7 and Fedora? If so, keep reading!

### Step 1: Checking Installed Kernel Version

When we install a distribution it includes a certain version of the Linux kernel. To show the current version installed on our system we can do:

```
# uname -sr
```

The following image shows the output of the above command in a CentOS 7 server:

[
 ![Check Kernel Version in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-CentOS-7.png) 
][2]

Check Kernel Version in CentOS 7

If we now go to [https://www.kernel.org/][3], we will see that the latest kernel version is 4.10.1 at the time of this writing (other versions are available from the same site).

One important thing to consider is the life cycle of a kernel version – if the version you are currently using is approaching its end of life, no more bug fixes will be provided after that date. For more info, refer to the [kernel Releases][4] page.

### Step 2: Upgrading Kernel in CentOS 7

Most modern distributions provide a way to upgrade the kernel using a [package management system such as yum][5] and an officially-supported repository.

However, this will only perform the upgrade to the most recent version available from the distribution’s repositories – not the latest one available in the [https://www.kernel.org/][6]. Unfortunately, Red Hat only allows to upgrade the kernel using the former option.

As opposed to Red Hat, CentOS allows the use of ELRepo, a third-party repository that makes the upgrade to a recent version a kernel.

To enable the ELRepo repository on CentOS 7, do:

```
# rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
# rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
```
[
 ![Enable ELRepo in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/03/Enable-ELRepo-in-CentOS-7.png) 
][7]

Enable ELRepo in CentOS 7

Once the repository has been enabled, you can use the following command to list the available kernel.related packages:

```
# yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
```
[
 ![Yum - Find Available Kernel Versions](http://www.tecmint.com/wp-content/uploads/2017/03/Yum-Find-Available-Kernel-Versions.png) 
][8]

Yum – Find Available Kernel Versions

Next, install the latest mainline stable kernel:

```
# yum --enablerepo=elrepo-kernel install kernel-ml
```
[
 ![Install Latest Kernel Version in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/03/Install-Latest-Kernel-Version-in-CentOS-7.png) 
][9]

Install Latest Kernel Version in CentOS 7

Finally, reboot your machine to apply the latest kernel, and then run following command to check the kernel version:

```
uname -sr
```
[
 ![Verify Kernel Version](http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Kernel-Version.png) 
][10]

Verify Kernel Version

### Step 3: Set Default Kernel Version in GRUB

To make the newly-installed version the default boot option, you will have to modify the GRUB configuration as follows:

Open and edit the file /etc/default/grub and set `GRUB_DEFAULT=0`. This means that the first kernel in the GRUB initial screen will be used as default.

```
GRUB_TIMEOUT=5
GRUB_DEFAULT=0
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="rd.lvm.lv=centos/root rd.lvm.lv=centos/swap crashkernel=auto rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
```

Next, run the following command to recreate the kernel configuration.

```
# grub2-mkconfig -o /boot/grub2/grub.cfg
```
[
 ![Set Kernel in GRUB](http://www.tecmint.com/wp-content/uploads/2017/03/Set-Kernel-in-GRUB.png) 
][11]

Set Kernel in GRUB

Reboot and verify that the latest kernel is now being used by default.

[
 ![Booting Default Kernel Version in CentOS 7](http://www.tecmint.com/wp-content/uploads/2017/03/Booting-Default-Kernel-Version.png) 
][12]

Booting Default Kernel Version in CentOS 7

Congratulations! You have upgraded your kernel in CentOS 7!

##### Summary

In this article we have explained how to easily upgrade the Linux kernel on your system. There is yet another method which we haven’t covered as it involves compiling the kernel from source, which would deserve an entire book and is not recommended on production systems.

Although it represents one of the best learning experiences and allows for a fine-grained configuration of the kernel, you may render your system unusable and may have to reinstall it from scratch.

If you are still interested in building the kernel as a learning experience, you will find instructions on how to do it at the [Kernel Newbies][13] page.

As always, feel free to use the form below if you have any questions or comments about this article.

--------------------------------------------------------------------------------

作者简介：

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-upgrade-kernel-version-in-centos-7/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/

[1]:http://www.tecmint.com/upgrade-kernel-in-ubuntu/
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-CentOS-7.png
[3]:https://www.kernel.org/
[4]:https://www.kernel.org/category/releases.html
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:https://www.kernel.org/
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Enable-ELRepo-in-CentOS-7.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Yum-Find-Available-Kernel-Versions.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Install-Latest-Kernel-Version-in-CentOS-7.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Kernel-Version.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Set-Kernel-in-GRUB.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Booting-Default-Kernel-Version.png
[13]:https://kernelnewbies.org/KernelBuild
[14]:http://www.tecmint.com/author/gacanepa/
[15]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[16]:http://www.tecmint.com/free-linux-shell-scripting-books/
