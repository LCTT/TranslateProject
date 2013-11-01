                        翻译中 Luox

Upgrade To Linux Kernel 3.11.6 In Ubuntu
================================================================================
Ubuntu 13.10 may have been released yesterday but chances are you’re still running Linux Kernel 3.11.0. Sticking with the current kernel in Ubuntu 13.10 isn’t a bad thing. In fact, it’s not always recommended to upgrade Linux Kernel outside of your Linux distribution’s official repositories tested for a particular version.

On the other hand, you should upgrade to the latest Linux Kernel in Ubuntu if it becomes available and if you’re not afraid breaking breaking something in Ubuntu. You see, the latest kernel always comes with enhancements, bug fixes and some additional features.

So, if something isn’t working quite right on your computer, upgrading the Linux Kernel might just fix it. But keep in mind that you may also break something when you upgrade.

If you’re not afraid and want to jump right in with me, let’s get started with upgrading to Linux Kernel 3.11.6 in Ubuntu.

First, before you start upgrading, backup your machine because you may never recover if something goes wrong. Better safe than sorry.

Fore more about this kernel version, [read this changelog][1].

When you’re ready, run the commands below to upgrade your machine and remove  any obsolete packages, including older kernels

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

ext, change into the /tmp directory.

    cd /tmp

Then copy and paste the line below and press enter to download the 32-bit version of the Linux Kernel.

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb 

To download the 64-bit version of the Linux Kernel, copy and paste the line below.

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb

After downloading the correct version, run the commands below to begin installing it.

    sudo dpkg -i *.deb

Finally, run the commands below to upgrade Grub.

    sudo update-grub2

That’s it! Restart your computer and your machine should have the latest version.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/upgrade-linux-kernel-3-11-6-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.11.6
