How to Update Linux Kernel for Improved System Performance
================================================================================
![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/update-linux-kernel-644x373.jpg?2c3c1f)

The rate of development for [the Linux kernel][1] is unprecedented, with a new major release approximately every two to three months. Each release offers several new features and improvements that a lot of people could take advantage of to make their computing experience faster, more efficient, or better in other ways.

The problem, however, is that you usually can’t take advantage of these new kernel releases as soon as they come out — you have to wait until your distribution comes out with a new release that packs a newer kernel with it. We’ve previously laid out [the benefits for regularly updating your kernel][2], and you don’t have to wait to get your hands on them. We’ll show you how.

> Disclaimer: As some of our literature may have mentioned before, updating your kernel does carry a (small) risk of breaking your system. If this is the case, it’s usually easy to pick an older kernel at boot time that works, but something may always go wrong. Therefore, we’re not responsible for any damage to your system — use at your own risk!

### Prep Work ###

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/linux_kernel_arch.jpg?2c3c1f)

To update your kernel, you’ll first need to determine whether you’re using a 32-bit or 64-bit system. Open up a terminal window and run

    uname -a

Then check to see if the output says x86_64 or i686. If it’s x86_64, then you’re running the 64-bit version; otherwise, you’re running the 32-bit version. Remember this, because it will be important.

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/kernel_latest_version.jpg?2c3c1f)

Next, visit the [official Linux kernel website][3]. This will tell you what the current stable version of the kernel is. You can try out release candidates if you’d like, but they are a lot less tested than the stable releases. Stick with the stable kernel unless you are certain you need a release candidate version.

### Ubuntu Instructions ###

It’s quite easy for Ubuntu and Ubuntu-derivative users to update their kernel, thanks to the Ubuntu Mainline Kernel PPA. Although it’s officially called a PPA, you cannot use it like other PPAs by adding them to your software sources list and expecting it to automatically update the kernel for you. Instead, it’s simply a webpage you navigate through to download the kernel you want.

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_new_kernels.jpg?2c3c1f)

Now, visit the [kernel PPA webpage][4] and scroll all the way to the bottom. The absolute bottom of the list will probably contain some release candidate versions (which you can see by the “rc” in the name), but just above them should be the latest stable kernel (to make this easier to explain, at the time of writing the stable version was 4.1.2). Click on that, and you’ll be presented with several options. You’ll need to grab three files and save them in their own folder (within the Downloads folder if you’d like) so that they’re isolated from all other files:

- The “generic” header file for your architecture (in my case, 64-bit or “amd64″)
- The header file in the middle that has “all” towards the end of the filename
- The “generic” kernel file for your architecture (again, I would pick “amd64″ but if you use 32-bit you’ll need “i686″)

You’ll notice that there are also “lowlatency” files available to download, but it’s fine to ignore this. These files are relatively unstable and are only made available for people who need their low-latency benefits if the general files don’t suffice for tasks such as audio recording. Again, the recommendation is to always use generic first and only try lowlatency if your performance isn’t good enough for certain tasks. No, gaming or Internet browsing aren’t excuses to try lowlatency.

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_install_kernel.jpg?2c3c1f)

You put these files into their own folder, right? Now open up the Terminal, use the

    cd

command to go to your newly-created folder, such as

    cd /home/user/Downloads/Kernel

and then run:

    sudo dpkg -i *.deb

This command marks all .deb files within the folder as “to be installed” and then performs the installation. This is the recommended way to install these files because otherwise it’s easy to pick one file to install and it’ll complain about dependency issues. This approach avoids that problem. If you’re not sure what cd or sudo are, get a quick crash course on [essential Linux commands][5].

Once the installation is complete, **Restart** your system and you should be running the just-installed kernel! You can check this by running uname -a in the Terminal and checking the output.

### Fedora Instructions ###

If you use Fedora or one of its derivatives, the process is very similar to Ubuntu. There’s just a different location to grab different files, and a different command to install them.

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/fedora_new_kernels.jpg?2c3c1f)

VIew the list of the most [recent kernel builds for Fedora][6]. Pick the latest stable version out of the list, and then scroll down to either the i686 or x86_64 section, depending on your system’s architecture. In this section, you’ll need to grab the following files and save them in their own folder (such as “Kernel” within your Downloads folder, as an example):

- kernel
- kernel-core
- kernel-headers
- kernel-modules
- kernel-modules-extra
- kernel-tools
- perf and python-perf (optional)

If your system is i686 (32-bit) and you have 4GB of RAM or more, you’ll need to grab the PAE version of all of these files where available. PAE is an address extension technique used for 32-bit system to allow them to use more than 3GB of RAM.

Now, use the

    cd

command to go to that folder, such as

    cd /home/user/Downloads/Kernel

and then run the following command to install all the files:

    yum --nogpgcheck localinstall *.rpm

Finally **Restart** your computer and you should be running a new kernel!

### Using Rawhide ###

Alternatively, Fedora users can also simply [switch to Rawhide][7] and it’ll automatically update every package to the latest version, including the kernel. However, Rawhide is known to break quite often (especially early on in the development cycle) and should **not** be used on a system that you need to rely on.

### Arch Instructions ###

[Arch users][8] should always have the latest and greatest stable kernel available (or one pretty close to it). If you want to get even closer to the latest-released stable kernel, you can enable the testing repo which will give you access to major new releases roughly two to four weeks early.

To do this, open the file located at

    /etc/pacman.conf

with sudo permissions in [your favorite terminal text editor][9], and then uncomment (delete the pound symbols from the front of each line) the three lines associated with testing. If you have the multilib repository enabled, then do the same for the multilib-testing repository. See [this Arch Linux wiki page][10] if you need more information.

Upgrading your kernel isn’t easy (done so intentionally), but it can give you a lot of benefits. So long as your new kernel didn’t break anything, you can now enjoy improved performance, better efficiency, support for more hardware, and potential new features. Especially if you’re running relatively new hardware, upgrading the kernel can really help out.

**How has upgraded the kernel helped you? Do you think your favorite distribution’s policy on kernel releases is what it should be?** Let us know in the comments!

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/update-linux-kernel-improved-system-performance/

作者：[Danny Stieben][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.makeuseof.com/tag/author/danny/
[1]:http://www.makeuseof.com/tag/linux-kernel-explanation-laymans-terms/
[2]:http://www.makeuseof.com/tag/5-reasons-update-kernel-linux/
[3]:http://www.kernel.org/
[4]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
[5]:http://www.makeuseof.com/tag/an-a-z-of-linux-40-essential-commands-you-should-know/
[6]:http://koji.fedoraproject.org/koji/packageinfo?packageID=8
[7]:http://www.makeuseof.com/tag/bleeding-edge-linux-fedora-rawhide/
[8]:http://www.makeuseof.com/tag/arch-linux-letting-you-build-your-linux-system-from-scratch/
[9]:http://www.makeuseof.com/tag/nano-vs-vim-terminal-text-editors-compared/
[10]:https://wiki.archlinux.org/index.php/Pacman#Repositories