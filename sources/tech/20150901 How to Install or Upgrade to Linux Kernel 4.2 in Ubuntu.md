translation by  strugglingyouth
How to Install / Upgrade to Linux Kernel 4.2 in Ubuntu
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/12/linux-kernel-icon-tux.png)

Linux Kernel 4.2 was released yesterday, at noon. Linus Torvalds wrote on [lkml.org][1]:

> So judging by how little happened this week, it wouldn’t have been a mistake to release 4.2 last week after all, but hey, there’s certainly a few fixes here, and it’s not like delaying 4.2 for a week should have caused any problems either.
> 
> So here it is, and the merge window for 4.3 is now open. I already have a few pending early pull requests, but as usual I’ll start processing them tomorrow and give the release some time to actually sit.
> 
> The shortlog from rc8 is tiny, and appended. The patch is pretty tiny too…

### What’s New in Kernel 4.2: ###

- rewrites of Intel Assembly x86 code
- support for new ARM boards and SoCs
- F2FS per-file encryption
- The AMDGPU kernel DRM driver
- VCE1 video encode support for the Radeon DRM driver
- Initial support for Intel Broxton Atom SoCs
- Support for ARCv2 and HS38 CPU cores.
- added queue spinlocks support
- many other improvements and updated drivers.

### How to Install Kernel 4.2 in Ubuntu: ###

The binary packages of this kernel release are available for download at link below:

- [Download Kernel 4.2 (.DEB)][1]

First check out your OS type, 32-bit (i386) or 64-bit (amd64), then download and install the packages below in turn:

1. linux-headers-4.2.0-xxx_all.deb
1. linux-headers-4.2.0-xxx-generic_xxx_i386/amd64.deb
1. linux-image-4.2.0-xxx-generic_xxx_i386/amd64.deb

After installing the kernel, you may run `sudo update-grub` command in terminal (Ctrl+Alt+T) to refresh grub boot-loader.

If you need a low latency system (e.g. for recording audio) then download & install below packages instead:

1. linux-headers-4.2.0_xxx_all.deb
1. linux-headers-4.2.0-xxx-lowlatency_xxx_i386/amd64.deb
1. linux-image-4.2.0-xxx-lowlatency_xxx_i386/amd64.deb

For Ubuntu Server without a graphical UI, you may run below commands one by one to grab packages via wget and install them via dpkg:

For 64-bit system run:

    cd /tmp/
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200_4.2.0-040200.201508301530_all.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200-generic_4.2.0-040200.201508301530_amd64.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-image-4.2.0-040200-generic_4.2.0-040200.201508301530_amd64.deb
    
    sudo dpkg -i linux-headers-4.2.0-*.deb linux-image-4.2.0-*.deb

For 32-bit system, run:

    cd /tmp/
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200_4.2.0-040200.201508301530_all.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200-generic_4.2.0-040200.201508301530_i386.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-image-4.2.0-040200-generic_4.2.0-040200.201508301530_i386.deb
    
    sudo dpkg -i linux-headers-4.2.0-*.deb linux-image-4.2.0-*.deb

Finally restart your computer to take effect.

To revert back, remove old kernels, see [install kernel simply via a script][3].

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/08/upgrade-kernel-4-2-ubuntu/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://lkml.org/lkml/2015/8/30/96
[2]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/
[3]:http://ubuntuhandbook.org/index.php/2015/08/install-latest-kernel-script/
