How to Upgrade Kernel to Latest Version in Ubuntu
============================================================


Periodically new devices and technology coming out and it’s important to keep our Linux system kernel up-to-date if we want to get the most of out it. Moreover, updating system kernel will ease us to take advantage of new kernel fuctions and also it helps us to protect ourselves from vulnerabilities that have been found in earlier versions.

**Suggested Read:** [How to Upgrade Kernel in CentOS 7][1]

Ready to update your kernel on Ubuntu 16.04 or one of their derivatives such as Debian and Linux Mint? If so, keep reading!

### Step 1: Check Installed Kernel Version

To find the current version of installed kernel on our system we can do:

```
$ uname -sr
```

The following image shows the output of the above command in a Ubuntu 16.04 server:

[
 ![Check Kernel Version in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-Ubuntu.png) 
][2]

Check Kernel Version in Ubuntu

### Step 2: Upgrading Kernel in Ubuntu 16.04

To upgrade the kernel in Ubuntu 16.04, go to [http://kernel.ubuntu.com/~kernel-ppa/mainline/][3] and choose the desired version from the list by clicking on it.

Next, download the `.deb` files for your system architecture (see highlighted in yellow below for a 32-bit system):

```
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.13/linux-headers-4.9.13-040913_4.9.13-040913.201702260631_all.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.13/linux-headers-4.9.13-040913-generic_4.9.13-040913.201702260631_i386.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.13/linux-image-4.9.13-040913-generic_4.9.13-040913.201702260631_i386.deb 
```

Once you’ve downloaded all the above kernel files, now install them as follows:

```
$ sudo dpkg -i *.deb
```

Once the installation is complete, reboot your machine and verify that the new kernel version is being used:

```
$ uname -sr
```

And that’s it. You are now using a much more recent kernel version than the one installed by default with Ubuntu 16.04.

##### Summary

In this article we’ve shown how to easily upgrade the Linux kernel on Ubuntu system. There is yet another procedure which we haven’t showed here as it requires compiling the kernel from source, which is not recommended on production Linux systems.

If you’re still interested in compiling the kernel as a learning experience, you will get the instructions on how to do it at the [Kernel Newbies][4] page.

As always, feel free to use the form below if you have any questions or comments about this article.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------
作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/upgrade-kernel-in-ubuntu/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-upgrade-kernel-version-in-centos-7/
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-Ubuntu.png
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
[4]:https://kernelnewbies.org/KernelBuild
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
