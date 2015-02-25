Linux FAQs with Answers--How to install full kernel source on Debian or Ubuntu
================================================================================
> **Question**: I need to download and install a full kernel source tree to compile a custom kernel for my Debian or Ubuntu system. What is a proper way to download full kernel source on Debian or Ubuntu? 

Before installing full kernel source on your Linux system, ask yourself whether you really need the full kernel source. If you are trying to compile a kernel module or a custom driver for your kernel, you do not need the full kernel source. You only need to install [matching kernel header files][1], and that's it.

You need the full kernel source tree only if you want to build a custom kernel after modifying the kernel code in any way and/or tweaking default kernel options.

Here is how to **download and install full kernel source tree from Debian or Ubuntu repositories**. While you can download the official kernel source code from [https://www.kernel.org/pub/linux/kernel/][2], using distro's repositories allows you to download a kernel source with the maintainer's patches applied to it.

### Install Full Kernel Source on Debian ###

Before downloading kernel source, install dpkg-dev, which contains a suite of development tools needed to build Debian source packages. Among other things, dpkg-dev contains dpgk-source tool which can extract a Debian source package and automatically apply patches.

    $ sudo apt-get install dpkg-dev 

Next, run the following command to download full kernel source.

    $ apt-get source linux-image-$(uname -r) 

Along with the full kernel source (linux_X.X.XX.orig.tar.xz), any available kernel patches (linux_X.X.X+XXX.debian.tar.xz) and source control file (linux_XXXX.dsc) will also be downloaded and stored in the current directory. The .dsc file instructs how the patches are applied to the kernel sources.

Upon the completion of download, the above command will automatically invoke dpkg-source tool, which will unpack the downloaded kernel source in the current directory, and apply downloaded patches according to .dsc file.

The final full kernel source tree will be available in the current directory as "linux-X.X.XX".

![](https://farm9.staticflickr.com/8676/16341110300_b4f059eeb0_b.jpg)

### Install Full Kernel Source on Ubuntu ###

If you want to install full kernel source, the Debian way described above should work on Ubuntu as well.

There is another way to download full kernel source on Ubuntu. You can actually check out the kernel source tree maintained by Canonical for different Ubuntu releases.

$ sudo apt-get install git
$ git clone git://kernel.ubuntu.com/ubuntu/ubuntu-$(lsb_release --codename | cut -f2).git

For example, if you are using Ubuntu 14.04, the above command will check out code from "ubuntu-trusty" Git repository.

![](https://farm9.staticflickr.com/8642/16526856391_de636ff9b8_c.jpg)

Once you check out the Git repository, use the following command to install necessary development packages to meet the build dependencies for the kernel source tree.

    $ sudo apt-get build-dep linux-image-$(uname -r) 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-full-kernel-source-debian-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/install-kernel-headers-linux.html
[2]:https://www.kernel.org/pub/linux/kernel/