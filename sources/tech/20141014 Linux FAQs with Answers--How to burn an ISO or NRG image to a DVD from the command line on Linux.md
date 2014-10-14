Linux FAQs with Answers--How to burn an ISO or NRG image to a DVD from the command line on Linux
================================================================================
> **Question**: I need to burn an image file (.iso or .nrg) to a DVD using a DVD writer on my Linux box. Is there a quick and easy way, preferably using a command-line utility, to burn an .iso or .nrg image to a DVD? 

The two most popular formats for image files are ISO (.iso file extension) and NRG (.nrg file extension). The ISO format is a global standard created by ISO (International Organization for Standardization), and therefore is supported natively by most operating systems, allowing a high level of portability. On the other hand, the NRG format is a proprietary format developed by Nero AG, a very popular disc imaging and burning software firm.

Here is how to burn an .iso or .nrg image to a DVD from the command line on Linux.

### Convert an NRG Image to ISO Format ###

Due to ISO's widespread adoption, burning an .iso image to CD/DVD is straightforward. However, burning an .nrg image requires converting the image to .iso format first.

To convert an .nrg image file to .iso format, you can use nrg2iso, an open source program that converts images created by Nero Burning Rom to standard .iso (ISO9660) files.

To install **nrg2iso** on Debian and derivatives:

    # aptitude install nrg2iso

To install **nrg2iso** on Red Hat-based distros:

    # yum install nrg2iso 

On CentOS/RHEL, you need to enable [Repoforge repository][1] before running **yum**.

Once the nrg2iso package has been installed, use the following command to convert an .nrg image file to .iso format:

    # nrg2iso filename.nrg filename.iso 

![](https://farm3.staticflickr.com/2945/15507409981_99eddd2577_z.jpg)

When conversion is complete, an .iso file will appear inside the current working directory:

![](https://farm4.staticflickr.com/3945/15323823510_c933d7710f_z.jpg)

### Burn an .ISO Image File to a DVD ###

In order to burn an .iso image file to a DVD, we will use a tool called **growisofs**:

     # growisofs -dvd-compat -speed=4 -Z /dev/dvd1=WindowsXPProfessionalSP3Original.iso 

In the above command-line, the "-dvd-compat" option provides maximum media compatibility with DVD-ROM/-Video. In write-once DVD+R or DVD-R context, this results in unappendable recording (closed disk).

The "-Z /dev/dvd1=filename.iso" option indicates that we burn the .iso file to the media found in the selected device (/dev/dvd1).

The "-speed=N" parameter specifies a burning speed of a DVD burner, which is directly related to the capability of the drive itself. "-speed=8" will burn at 8x, "-speed=16" at 16x, and so on. Without this parameter, growisofs by default assumes the lowest speed available, which in this case happens to be 4x. You should choose the burning speed from the available speeds in your drive and the type of disks that you have.

You can find the device name of your DVD burner and its supported writing speed using [this tutorial][2]注：此文在另一篇原文中（20141014 Linux FAQs with Answers--How to detect DVD writer' s device name and its writing speed from the command line on Linux.md），如果也翻译发布了，可修改此链接.

![](https://farm3.staticflickr.com/2947/15510172352_5c09c2f495_z.jpg)

When the burning process has been completed, the disk should be automatically ejected from the tray.

### Check the Integrity of a Burned Media ###

At this point, you can check the integrity of the burned media by comparing the md5 checksum of the original .iso file with the same checksum of the burned DVD. If both are identical, you can rest assured that the burning was successful.

However, in case you have converted an .nrg image to .iso using nrg2iso, you need to be aware that nrg2iso creates an .iso file whose size is not a multiple of 2048 (as ordinary .iso files are). Thus, an ordinary comparison between the checksum of this .iso file and the contents of the burned media will differ.

On the other hand, if you have burned an .iso image that does not come from an .nrg file, you can use the following command to check the integrity of the data recorded in a DVD. Replace "/dev/dvd1" with your own device name.

    # md5sum filename.iso; dd if=/dev/dvd1 bs=2048 count=$(($(stat -c "%s" filename.iso) / 2048)) | md5sum 

The first part of the command (up to the semicolon) calculates the md5 checksum of the .iso file, while the second part reads the contents of the disk present in /dev/dvd1, and pipes them into the md5sum tool. "bs=2048" indicates that dd will use a block sector of 2048 bytes as many times as the size of the original iso file divided by 2048.

![](https://farm3.staticflickr.com/2949/15487396726_bcf47d536f_z.jpg)

If the two md5 checksum values are identical, it means that the burned media is valid.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/burn-iso-nrg-image-dvd-command-line.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[2]:http://ask.xmodulo.com/detect-dvd-writer-device-name-writing-speed-command-line-linux.html