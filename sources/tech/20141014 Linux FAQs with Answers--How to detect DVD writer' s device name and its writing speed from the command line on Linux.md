Translating------geekpi

Linux FAQs with Answers--How to detect DVD writer’s device name and its writing speed from the command line on Linux
================================================================================
> **Question**: I want to know the device name assigned to my DVD writer, and also find out how fast I can burn a DVD using the DVD writer. What is a Linux command-line tool to detect the device name of a DVD writer and its writing speed? 

Most consumer PCs and laptops nowadays come with a DVD writer. In Linux, optical drives such as CD/DVD drives are assigned device names by the kernel based on udev rules at the time of booting. There are several ways to detect the writer's device name and its writing speed.

### Method One ###

The simplest way to find out the device name associated with a DVD writer is to use dmesg command-line tool, which prints out the message buffer of the kernel. In dmesg output, look for a potential DVD writer:
$ dmesg | egrep -i --color 'dvd|cd/rw|writer' 

![](https://farm6.staticflickr.com/5603/15505432622_0bfec51a8f_z.jpg)

The output of the above command will tell you whether a DVD writer is detected on your Linux system, and what the device name assigned to the writer is. In this example, the device name of a DVD writer is "/dev/sr0". This method does not tell you about writing speed, though.

### Method Two ###

The second method to get information about your DVD writer is to use lsscsi command, which simply lists all available SCSI devices.

To install **lsscsi** on Debian-based Linux:

    $ sudo apt-get install lsscsi

To install lsscsi on Red Hat-based Linux:

    $ sudo yum install lsscsi

The output of lsscsi command will tell you the name of a DVD writer if successfully detected:

    $ lsscsi 

![](https://farm4.staticflickr.com/3937/15319078780_e650d751d6.jpg)

This again does not tell you more details about the writer, such as writing speed.

### Method Three ###

The third method to obtain information about your DVD writer is to refer to /proc/sys/dev/cdrom/info.

    $ cat /proc/sys/dev/cdrom/info 

----------

    CD-ROM information, Id: cdrom.c 3.20 2003/12/17
    
    drive name:		sr0
    drive speed:		24
    drive # of slots:	1
    Can close tray:		1
    Can open tray:		1
    Can lock tray:		1
    Can change speed:	1
    Can select disk:	0
    Can read multisession:	1
    Can read MCN:		1
    Reports media changed:	1
    Can play audio:		1
    Can write CD-R:		1
    Can write CD-RW:	1
    Can read DVD:		1
    Can write DVD-R:	1
    Can write DVD-RAM:	1
    Can read MRW:		1
    Can write MRW:		1
    Can write RAM:		1

In this example, the output tells you that the DVD writer (/dev/sr0) is compatible with x24 CD writing speed (i.e., 24x153.6 KBps), which is equivalent to x3 DVD writing speed (i.e., 3x1385 KBps). The writing speed here is maximum possible speed, and actual writing speed of course depends on the type of media being used (e.g., DVD-RW, DVD+RW, DVD-RAM, etc).

### Method Four ###

Another way is to use a command-line utility called wodim. On most Linux distros, this tool, as well as its symbolic link cdrecord, is pre-installed by default.

    # wodim -prcap
    (or cdrecord -prcap) 

![](https://farm6.staticflickr.com/5614/15505433532_4d7e47fc51_o.png)

When invoked without any argument, the wodim command automatically detects a DVD writer, and shows detailed capabilities and maximum read/write speed of the writer. For example, you can find out what media (e.g., CD-R, CD-RW, DVD-RW, DVD-ROM, DVD-R, DVD-RAM, audio CD) are supported by the writer, and what read/write speeds are available. The example output above shows that the DVD writer has maximum x24 writing speed for CDs and maximum x3 writing speed for DVDs.

Note that the writing speed reported by wodim command will automatically change depending on which CD/DVD media you insert to a DVD burner, reflecting the media specification.

### Method Five ###

A yet another way to check DVD burner's writing speed is a tool called dvd+rw-mediainfo, which is part of dvd+rw-tools package (toolchain for DVD+-RW/R media).

To install **dvd+rw-tools** on Debian-based distros:

    $ sudo apt-get install dvd+rw-tools

To install dvd+rw-tools on Red Hat-based distros:

    $ sudo yum install dvd+rw-tools 

Unlike other tools, dvd+rw-mediainfo command will not produce any output unless you insert a DVD media to the burner. So after you insert a DVD media, run the following command. Replace "/dev/sr0" with your own device name.

    $ sudo dvd+rw-mediainfo /dev/sr0 

![](https://farm6.staticflickr.com/5597/15324137650_91dbf458ef_z.jpg)

The **dvd+rw-mediainfo** tool probes the inserted media ("DVD-R" in this example) to find out actual writing speed against the media.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/detect-dvd-writer-device-name-writing-speed-command-line-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出