[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Bio-Linux: A stable, portable scientific research Linux distribution)
[#]: via: (https://opensource.com/article/18/11/bio-linux)
[#]: author: (Matt Calverley https://opensource.com/users/mattcalverley)
[#]: url: ( )

Bio-Linux: A stable, portable scientific research Linux distribution
======
Linux distro's integrated software approach offers powerful bioinformatic data analysis with a familiar look and feel.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_science.png?itok=WDKARWGV)

Bio-Linux was introduced and detailed in a [Nature Biotechnology paper in July 2006][1]. The distribution was a group effort by the Natural Environment Research Council in the UK. As the creators and authors point out, the analysis demands of high-throughput “-omic” (genomic, proteomic, metabolomic) science has necessitated the development of integrated computing solutions to analyze the resultant mountains of experimental data.

From this need, Bio-Linux was born. The distribution, [according to its creators][2], serves as a “free bioinformatics workstation platform that can be installed on anything from a laptop to a large server.” The current distro version, Bio-Linux 8, is built on an Ubuntu 14.04 LTS base. Thus, the general look and feel of Bio-Linux is similar to that of Ubuntu.

In my own work as a research immunologist, I can attest to both the need for and success of the integrated software approach in Bio-Linux's design and development. Bio-Linux functions as a true turnkey solution to data pipeline requirements of modern science. As the website mentions, Bio-Linux includes [more than 250 pre-installed software packages][3], many of which are specific to the requirements of bioinformatic data analysis.

The power of this approach becomes immediately evident when you try to duplicate the software installation process under another operating system. Integrating all software components and installing all required dependencies is immensely time-consuming, and in some instances is not even possible outside of the Linux operating system. The Bio-Linux distro provides a portable, stable, integrated environment with pre-installed software sufficient to begin a vast array of bioinformatic analysis tasks.

By now you’re probably saying, “I’m sold—how do I get this amazing distro?”

I’m glad you asked. I'll start by saying that there is excellent documentation on the Bio-Linux website. This [documentation][4] covers both installation instructions and a very thorough overview of using the distro.

The distro can be installed and run locally, run off a CD/DVD or USB, installed on a server, or run out of a virtual machine environment. To begin the installation process for local installation, [download the disk image or ISO][5] for the Bio-Linux distro. The disk image is a 3.3GB file, and depending on your internet download speed, this may be a good time to get a cup of coffee or take a nice nap.

Once the ISO has been downloaded, the Bio-Linux developers recommend using [UNetBootin][6], a freely available cross-platform software package used to make bootable USBs. There is a link provided for UNetBootin on the Bio-Linux website. I can attest to the effectiveness of UNetBootin in both Mac and Linux operating systems.

On Unix family operating systems (Mac OS and Linux), it is also possible to make a bootable USB from the command line using the `dd `command:

```
sudo umount “USB location”

sudo dd bs=4M if=”ISO location” of =”USB location” conv=fdatasync
```
Regardless of the method you use, this might be another good time for a coffee break.

At this point in my installation, UNetBootin appeared to freeze at the `squashfs` file transfer during bootable USB creation. However, a quick check of the Ubuntu disks application confirmed that the file was still being written to the USB. In other words, be patient—it takes quite some time to make the bootable USB.

Once you’ve had your coffee and you have a finished USB in hand, you are ready to use Bio-Linux. As the Bio-Linux website points out, if you are trying to use a bootable USB with a Mac computer (particularly newer hardware versions), you may not be able to boot from the USB. There are workarounds, but they involve configuring the system for dual boot. Likewise, on Windows-based machines, it may be necessary to make changes to the boot order and possibly the secure boot settings for the machine from within BIOS.

From this point, how you use the distro is up to you. You can run the distro from the USB to test it. You can install the distro to your computer. You can even follow the instructions on the Bio-Linux website to make a VM instance of the distro or run it on a server. Regardless of how you use it, you have a high-powered bioinformatic data analysis workstation at your disposal.

Maybe you have a professional need for such a workstation, but even if you never use Bio-Linux as a professional researcher, it could provide a great resource for biology teaching professionals at all levels to introduce students to modern bioinformatics principles. For the price of a laptop and a USB, every school can have an in silico teaching resource to complement classroom lessons in the “-omics” age. Your only limitations are your creativity and the performance of your hardware.

### More on Linux

As an open source operating system with strong community support, the Linux kernel shares many of the strengths common to other successful open source software endeavors. Linux tends to be both stable and amenable to customization. It is also fairly hardware-agnostic, capable of running alongside other operating systems on a wide array of hardware configurations. In fact, installing Linux is a common method of regaining usability from dated hardware that is incapable of running other modern operating systems. Linux is also highly portable and can be run from any bootable external storage device, such as a USB drive, without the need to permanently install the operating system.

It is this combination of stability, customizability, and portability that initially drew me to Linux. Each Linux operating system variant is referred to as a distribution (or distro), and it seems as though there is a Linux distribution for every imaginable computing scenario or desire. The options can actually be rather intimidating, and I suspect they may often discourage people from trying Linux.

“How many different distributions can there possibly be?” you might wonder. If you have a few minutes, or even a few hours, have a look at [DistroWatch.com][7]. As its name implies, this site is devoted to the cataloging of all things Linux distribution-related. For visual learners, there is an amazing [Linux family tree][8] that really puts it into perspective.

While [entire books][9] are devoted to the topic of Linux distributions, the differences often depend on what software is included in the base installation, how the software is managed, and graphical differences affecting the “look and feel” of the distribution. Certainly, there are also subtleties of hardware compatibility, speed, and stability.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/bio-linux

作者：[Matt Calverley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mattcalverley
[b]: https://github.com/lujun9972
[1]: https://www.nature.com/articles/nbt0706-801
[2]: http://environmentalomics.org/bio-linux/
[3]: http://environmentalomics.org/bio-linux-software-list/
[4]: http://nebc.nerc.ac.uk/downloads/courses/Bio-Linux/bl8_latest.pdf
[5]: http://environmentalomics.org/bio-linux-download/
[6]: https://unetbootin.github.io/
[7]: https://distrowatch.com/
[8]: https://distrowatch.com/images/other/distro-family-tree.png
[9]: https://www.amazon.com/Introducing-Linux-Distros-Dieguez-Castro/dp/1484213939
