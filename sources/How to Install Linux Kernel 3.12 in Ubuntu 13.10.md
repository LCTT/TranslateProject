How to Install Linux Kernel 3.12 in Ubuntu 13.10
================================================================================
Ubuntu 13.10 users don't have to look with envy at the new Linux kernels that are released, and they can update their systems with relative ease.

Canonical is usually sticking with one Linux kernel for an entire development cycle. For example, Ubuntu 13.10 is based on Linux kernel 3.11, but now a new stable Linux kernel, 3.12, has been launched.

Ubuntu users will have to wait until the release of the 14.04 LTS to get a newer Linux kernel, but they can also install, until then, new versions.

We have to warn you from the get-go. Canonical does not recommend updating your Linux kernel to other versions than the ones provided on official channels. This is not a totally safe procedure and you might have problems afterwards, even system failures. On the other hand, you might get better performance from your system.

The kernel you are about to download is from Canonical, which means that it is already in a .deb format. You won't have to compile it yourself. Open a terminal, navigate to the Downloads folder, and enter the following commands:

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

You can also download the 32-bit version, if you have a 32-bit operating system. Just replace the 64-bit links with the ones for 32-bit, which can be found [here][1].

Now you will have to run those .deb, just like any other program. In the same terminal that you used to download the packages, write the following commands (you will need root access to make this work):

    sudo dpkg -i linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb
    sudo dpkg -i linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

After the process is finished, you will have to restart the system and voila, the new Linux kernels are in place. The good news is that the old ones are still there and, if you need to delete 3.12, all you have to do is use a very well-known command.

    sudo apt-get purge linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb
    sudo apt-get linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

One thing you have to remember. The names of the files shown above will change pretty soon. If the downloads are not working, you will have to update the new links. Enjoy Linux kernel 3.12!

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-Linux-Kerrnel-3-12-in-Ubuntu-13-10-397013.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/