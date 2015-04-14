How to run Ubuntu Snappy Core on Raspberry Pi 2
================================================================================
The Internet of Things (IoT) is upon us. In a couple of years some of us might ask ourselves how we ever survived without it, just like we question our past without cellphones today. Canonical is a contender in this fast growing, but still wide open market. The company wants to claim their stakes in IoT just as they already did for the cloud. At the end of January, the company launched a small operating system that goes by the name of [Ubuntu Snappy Core][1] which is based on Ubuntu Core.

Snappy, the new component in the mix, represents a package format that is derived from DEB, is a frontend to update the system that lends its idea from atomic upgrades used in CoreOS, Red Hat's Atomic and elsewhere. As soon as the Raspberry Pi 2 was marketed, Canonical released Snappy Core for that plattform. The first edition of the Raspberry Pi was not able to run Ubuntu because Ubuntu's ARM images use the ARMv7 architecture, while the first Raspberry Pis were based on ARMv6. That has changed now, and Canonical, by releasing a RPI2-Image of Snappy Core, took the opportunity to make clear that Snappy was meant for the cloud and especially for IoT.

Snappy also runs on other platforms like Amazon EC2, Microsofts Azure, and Google's Compute Engine, and can also be virtualized with KVM, Virtualbox, or Vagrant. Canonical has embraced big players like Microsoft, Google, Docker or OpenStack and, at the same time, also included small projects from the maker scene as partners. Besides startups like Ninja Sphere and Erle Robotics, there are board manufacturers like Odroid, Banana Pro, Udoo, PCDuino and Parallella as well as Allwinner. Snappy Core will also run in routers soon to help with the poor upgrade policy that vendors perform.

In this post, let's see how we can test Ubuntu Snappy Core on Raspberry Pi 2.

The image for Snappy Core for the RPI2 can be downloaded from the [Raspberry Pi website][2]. Unpacked from the archive, the resulting image should be [written to an SD card][3] of at least 8 GB. Even though the OS is small, atomic upgrades and the rollback function eat up quite a bit of space. After booting up your Raspberry Pi 2 with Snappy Core, you can log into the system with the default username and password being 'ubuntu'.

![](https://farm8.staticflickr.com/7639/16428527263_f7bdd56a0d_c.jpg)

sudo is already configured and ready for use. For security reasons you should change the username with:

    $ sudo usermod -l <new name> <old name> 

Alternatively, you can add a new user with the command `adduser`.

Due to the lack of a hardware clock on the RPI, that the Snappy Core image does not take account of, the image has a small bug that will throw a lot of errors when processing commands. It is easy to fix.

To find out if the bug affects you, use the command:

    $ date 

If the output is "Thu Jan  1 01:56:44 UTC 1970", you can fix it with:

    $ sudo date --set="Sun Apr 04 17:43:26 UTC 2015" 

adapted to your actual time.

![](https://farm9.staticflickr.com/8735/16426231744_c54d9b8877_b.jpg)

Now you might want to check if there are any updates available. Note that the usual commands:

    $ sudo apt-get update && sudo apt-get distupgrade 

will not get you very far though, as Snappy uses its own simplified package management system which is based on dpkg. This makes sense, as Snappy will run on a lot of embedded appliances, and you want things to be as simple as possible.

Let's dive into the engine room for a minute to understand how things work with Snappy. The SD card you run Snappy on has three partitions besides the boot partition. Two of those house a duplicated file system. Both of those parallel file systems are permanently mounted as "read only", and only one is active at any given time. The third partition holds a partial writable file system and the users persistent data. With a fresh system, the partition labeled 'system-a' holds one complete file system, called a core, leaving the parallel partition still empty.

![](https://farm9.staticflickr.com/8758/16841251947_21f42609ce_b.jpg)

If we run the following command now:

    $ sudo snappy update

the system will install the update as a complete core, similar to an image, on 'system-b'. You will be asked to reboot your device afterwards to activate the new core.

After the reboot, run the following command to check if your system is up to date and which core is active.

    $ sudo snappy versions -a 

After rolling out the update and rebooting, you should see that the core that is now active has changed. 

As we have not installed any apps yet, the following command:

    $ sudo snappy update ubuntu-core

would have been sufficient, and is the way if you want to upgrade just the underlying OS. Should something go wrong, you can rollback by:

    $ sudo snappy rollback ubuntu-core

which will take you back to the system's state before the update.

![](https://farm8.staticflickr.com/7666/17022676786_5fe6804ed8_c.jpg)

Speaking of apps, they are what makes Snappy useful. There are not that many at this point, but the IRC channel #snappy on Freenode is humming along nicely and with a lot of people involved, the Snappy App Store gets new apps added on a regular basis. You can visit the shop by pointing your browser to http://<ip-address>:4200, and you can install apps right from the shop and then launch them with http://webdm.local in your browser. Building apps yourself for Snappy is not all that hard, and [well documented][4]. You can also port DEB packages into the snappy format quite easily.

![](https://farm8.staticflickr.com/7656/17022676836_968a2a7254_c.jpg)

Ubuntu Snappy Core, due to the limited number of available apps, is not overly useful in a productive way at this point in time, although it invites us to dive into the new Snappy package format and play with atomic upgrades the Canonical way. Since it is easy to set up, this seems like a good opportunity to learn something new.

--------------------------------------------------------------------------------

via: http://xmodulo.com/ubuntu-snappy-core-raspberry-pi-2.html

作者：[Ferdinand Thommes][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/ferdinand
[1]:http://www.ubuntu.com/things
[2]:http://www.raspberrypi.org/downloads/
[3]:http://xmodulo.com/write-raspberry-pi-image-sd-card.html
[4]:https://developer.ubuntu.com/en/snappy/