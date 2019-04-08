[#]: collector: (oska874)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with PiFlash: Booting your Raspberry Pi on Linux)
[#]: via: (https://opensource.com/article/19/3/piflash?utm_campaign=intrel)
[#]: author: (Ian Kluft  https://opensource.com/users/ikluft)


Getting started with PiFlash: Booting your Raspberry Pi on Linux
============================================================

### Linux users can say goodbye to manually creating bootable SD cards for Raspberry Pi with PiFlash.

![Vector, generic Raspberry Pi board](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_board_vector_red.png?itok=yaqYjYqI "Vector, generic Raspberry Pi board")

Most people install some form of Linux when they set up a Raspberry Pi computer. Until recently, the installation tools for creating a bootable SD card were only available for Windows and MacOS desktops. If you were running Linux on your desktop, you got a page of instructions on doing it manually from the command line.

That works. But if you experiment with multiple Raspberry Pi boards, over time this gets tedious. As an engineer and a coder, I started thinking about automating it to make it easier and, in the usual way open source projects get started, I came away with [PiFlash][10].

I wrote PiFlash just for myself in 2016\. By February 2017, it had evolved far enough that I introduced it in a presentation at SVPerl (Silicon Valley Perl) about using Perl on the Raspberry Pi, then was invited to write two articles for Opensource.com:  _[Getting Started with Perl on the Raspberry Pi][7]_  and  _[How to Secure Your Raspberry Pi][8]._ 

### PiFlash features

PiFlash has features that appeal to beginners and experts.

Like most other open source software tools, you don't need to see the language it's written in, if you're not into that. But the source code is available for power users and participants.

For expert users, PiFlash simplifies the process of writing an SD card. When you download a bootable OS "image" file, it's usually in a ZIP archive or compressed. All the distributions package them a little differently. With PiFlash, you don't have to unpack or decompress the image. Just specify the downloaded file as the input and PiFlash will do the tedious part of extracting it.

For beginners, there's an important safety feature: PiFlash will write  _only_  to an SD card and refuse to write to any other type of device. Since you have to use root permissions to write the card, the system will do anything you tell it to. Therefore, it's possible to accidentally erase the wrong device, maybe a hard drive you want to keep, when trying to flash an SD card manually for a new Raspberry Pi.

This is where PiFlash protects you from danger. Internally, it finds device attributes with the **lsblk** command from the **util-linux** package, which is part of all Linux distributions. It can recognize SD cards using various drivers. It will refuse to write to a block device if it isn't an SD card.

Fortunately, the Etcher GUI tool that Raspberry Pi Foundation uses in its instructions for Windows and MacOS users has been expanded to Linux, so there is now a GUI option on Linux for those who prefer one. But if you want to automate the process, or if you want power-user levels of customization, only a command-line tool will do the job.

The latest version of PiFlash adds plugin modules that can modify the SD card's filesystem after installing the OS image, so you can start to explore new options for automation.

### Installing PiFlash

[PiFlash is available][11] from [CPAN][12], the Comprehensive Perl Archive Network—but before you proceed, make sure you have all the dependency packages installed. To install the dependencies:

On RPM-based Linux systems (Red Hat Enterprise, Fedora, CentOS, etc.):

```
sudo dnf install coreutils util-linux perl file-libs perl-File-LibMagic perl-IO perl-Exception-Class perl-Try-Tiny perl-Module-Pluggable perl-File-Path perl-YAML-LibYAML gzip unzip xz e2fsprogs dosfstools
```

On Debian-based Linux systems (Debian, Ubuntu, Raspbian, etc.):

```
sudo apt-get install coreutils util-linux klibc-utils perl-base libmagic1 libfile-libmagic-perl libio-all-perl libexception-class-perl libtry-tiny-perl libmodule-pluggable-perl libyaml-libyaml-perl gzip xz-utils e2fsprogs dosfstools
```

For source-based distributions or other packaging systems, see the CPAN documentation for the dependency list.

Next, install PiFlash using the CPAN tool:

```
cpan PiFlash
```

I have the [Dist:][13][:Zilla][14]-based build set up to make DEB and RPM packages, but it isn't in any of the major package archives yet. That's possible in the future.

### Running PiFlash

If you just run the **piflash** command without any arguments, it will print usage information.

```
usage: piflash [--verbose] [--resize] [--config conf-file] input-file output-device
       piflash [--verbose] [--config conf-file] --SDsearch
       piflash --version
```

Scan the system for SD cards to get the exact device name, which you'll need for the Pi-Flash output-device parameter below.

```
piflash --sdsearch
```

If no SD cards are found, it says it can't find anything.

```
no SD cards found on system
```
More on Raspberry Pi

*   [What is Raspberry Pi?][1]

*   [Getting started with Raspberry Pi][2]

*   [Getting started with Raspberry Pi cheat sheet][3]

*   [Our latest on Raspberry Pi][4]

*   [Send us your Raspberry Pi projects and tutorials][5]

By the way, if you have an SD card writer that PiFlash doesn't know about, please let me know by filing a report on GitHub. For problem reports and troubleshooting, please collect the program's internal information by using the **--verbose** option so I can see what driver your system has that PiFlash didn't recognize.

Your exact device name may vary by drivers and the names used by other devices on your system. If you have a USB-based SD reader/writer, it may say something like this:

```
SD cards found: /dev/sdb
```

Or if you have a built-in SD card slot, it may use a different driver and have a name that indicates it’s an SD card using the MMC (MultiMediaCard) driver:

```
SD cards found: /dev/mmcblk0
```

Next, download a system image to install. The Raspberry Pi Foundation has an old [list of possibilities][15] that is no longer updated. Since Raspbian is the official Linux distribution for the Raspberry Pi, driver support goes there first. But others work: Ubuntu is on the list, but Fedora isn't because ARM and Raspberry Pi support came after the list was made, however, you can [download it][16].

The command to flash the SD card is **piflash <input-file> <output-device **. Here are some examples of commands to flash it, depending upon the system you downloaded and which block device has your SD card:

```
piflash 2018-11-13-raspbian-stretch-full.zip /dev/mmcblk0
piflash Fedora-LXDE-armhfp-29-1.2-sda.raw.xz /dev/sdb
```

PiFlash now has a **--resize** option, which will resize the root partition on the SD card to fill the rest of the device. It only works if the root is a Linux ext2/3/4 filesystem. Most distributions make that available as an option you can do manually after installation, but this automates it to one step.

### Plugins, automation, and future development

PiFlash 0.3.1 is current at the time of this writing.

PiFlash 0.1.0 introduced plugin modules, which means Perl modules named like **PiFlash::Plugin::Something** will be available to the program. As a security precaution, because PiFlash can run commands as **sudo-root**, plugins are not automatically loaded. Instead, they have to be enabled via **--plugin** on the command line or in a configuration file. The name of the plugin is the Perl module name without the **PiFlash::Plugin:: prefix**. For more than one plugin, it's a comma-delimited list of names. Enabled plugins can use a hook that is called when the boot and root filesystems are mounted after writing the SD card. More on plugins can be found at the [**PiFlash::Plugin**][17] module documentation.

Here are some ideas on my own to-do list for upcoming plugin modules...

*   Change the password of the user and root accounts on the SD card before it boots

*   Set the network parameters and hostname

*   Modify system configuration parameters that would usually require manually running **raspi-config** or editing **config.txt**

*   Set up a custom Linux environment around ARM kernels you build

My ideas are, of course, influenced by what I want to do. You may want to go in other directions, so please consider contributing patches and plugins.

The source code repository for PiFlash is [on GitHub][18]. Please file problem reports and code/documentation contributions there, also.

### About the author

Ian Kluft - Ian has had parallel interests since grade school in computing and flight. He was coding on Unix before there was Linux, and started on Linux 6 months after the kernel was posted. He has a masters degree in Computer Science and is a CSSLP (Certified Secure Software Lifecycle Professional). On the side he's a pilot and a certified flight instructor. As a licensed Ham Radio operator for over 25 years, experimentation with electronics has evolved in recent years to include the Raspberry Pi and...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/piflash?utm_campaign=intrel

作者：[ Ian Kluft ][a]
选题：[ezio][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ikluft
[b]:https://github.com/oska874
[1]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu1&intcmp=701f2000000h4RcAAI
[2]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu2&intcmp=701f2000000h4RcAAI
[3]:https://opensource.com/downloads/getting-started-raspberry-pi-cheat-sheet?src=raspberry_pi_resource_menu3&intcmp=701f2000000h4RcAAI
[4]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu4&intcmp=701f2000000h4RcAAI
[5]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu5&intcmp=701f2000000h4RcAAI
[6]:https://opensource.com/article/19/3/piflash?rate=uzXbDSgdiRC1mnuHSCo-WHnHP7-lSyoYkTjdfMcFcUI
[7]:https://opensource.com/article/17/3/perl-raspberry-pi
[8]:https://opensource.com/article/17/3/iot-security-raspberry-pi
[9]:https://opensource.com/user/120171/feed
[10]:https://github.com/ikluft/piflash
[11]:https://metacpan.org/release/PiFlash
[12]:http://www.cpan.org/
[13]:https://metacpan.org/pod/Dist::Zilla
[14]:https://metacpan.org/pod/Dist::Zilla
[15]:https://www.raspberrypi.org/downloads/
[16]:https://arm.fedoraproject.org/
[17]:https://metacpan.org/pod/PiFlash::Plugin
[18]:https://github.com/ikluft/piflash
[19]:https://opensource.com/users/ikluft
[20]:https://opensource.com/users/ikluft
[21]:https://opensource.com/tags/raspberry-pi
[22]:https://opensource.com/tags/linux
