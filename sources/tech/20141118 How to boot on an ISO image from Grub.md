How to boot on an ISO image from Grub
================================================================================
If you need to use multiple Linux distributions, you do not have so many options. You can either install it, on your machine or in a virtual one, or you can boot on it from an ISO file in live mode. The second option, if less needy in hard drive space, is bothersome as you will need a USB stick or CD to hold the ISO file and boot from. However, there is a third alternative which is a bit of a compromise: have the ISO image on your hard drive, and boot into it in live mode at startup. Less needy in disk space than a full install, and fully functional, this seems to be a good alternative to a slow virtual machine. I will explain how to do this using the popular bootloader Grub.

### What do you need? ###

Obviously you will need to be using Grub, which is the case on pretty much all modern Linux distributions. You will also need to have an ISO file of the distribution of your choice, downloaded on your hard drive. Finally, you should know where your boot partition is, and how to express it in Grub language. For this, launch:

    # fdisk -l 

and the boot partition is the one with the '*'. For me it's /dev/sda1, which is written (hd0,1) in Grub language.

![](https://farm6.staticflickr.com/5606/15174383814_a92a4eda3e_z.jpg)

For reference, sda2 would be (hd0,2), sdb1 would be (hd1,1), etc. (You got the point). 

### What do we edit? ###

First, open /etc/default/grub and check that the following line:

    #GRUB_HIDDEN_TIMEOUT=0

is indeed commented with a '#' in front.

Save it and then go open /etc/grub.d/40_custom.

This file will be where you put the arguments to boot on an ISO. The structure is of the form:

    menuentry "[Entry's title in the grub screen]" { 
    set isofile="[path to ISO file]" 
    loopback loop [boot partition in Grub language]$isofile 
    [some specific] arguments
    }

For example, if you wish to boot Ubuntu from an ISO file, you want to append this to your 40_custom file:

    menuentry "Ubuntu 14.04 (LTS) Live Desktop amd64" { 
    set isofile="/boot/ubuntu-14.04-desktop-amd64.iso" 
    loopback loop (hd0,1)$isofile 
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash 
    initrd (loop)/casper/initrd.lz 
    }

![](https://farm8.staticflickr.com/7480/15608510369_ff50b28f5e_z.jpg)

If you would like to launch Gparted instead:

    menuentry "GParted Live amd64" { 
    set isofile="/boot/gparted-live-0.18.0-2-amd64.iso" 
    loopback loop (hd0,1)$isofile 
    loopback loop $isofile 
    linux (loop)/live/vmlinuz boot=live config union=aufs noswap noprompt ip=frommedia toram=filesystem.squashfs findiso=${isofile} 
    initrd (loop)/live/initrd.img 
    }

Or even Fedora:

    menuentry "Fedora 20 Live Desktop x86_64" { 
    set isofile="/boot/Fedora-Live-Desktop-x86_64-20-1.iso" 
    loopback loop (hd0,1)$isofile 
    loopback loop $isofile 
    linux (loop)/isolinux/vmlinuz0 root=live:CDLABEL=Fedora-Live-Desktop-x86_64-20-1 rootfstype=auto ro rd.live.image quiet rhgb rd.luks=0 rd.md=0 rd.dm=0 iso-scan/filename=${isofile} 
    initrd (loop)/isolinux/initrd0.img 
    }

Note that the arguments will change depending on the distribution. Hopefully, there are a few places where you can start looking. I like this one, but there are plenty of others. Also, take into consideration where you place your ISO files. If your home directory is encrypted or out of reach, you might prefer placing the files in your boot partition like in the example. But make sure that you have enough room first.

Finally, don't forget to save 40_custom and update grub with:

    # sudo update-grub 

to see your changes appear at the next boot.

![](https://farm8.staticflickr.com/7480/15795905012_47968033f7_z.jpg)

### What next? ###

Want more? Well by playing a bit with the arguments, you can boot on an ISO and have it do something instantly. For example, if you are completely paranoid and wish to have an option to erase your hard drive quickly, it is possible to set up something using [DBAN][1]. Now be really careful as this will wipe your disk without recovery option on startup:

    menuentry "Darik's Boot and Nuke" { 
    set isofile="/boot/dban.iso" 
    loopback loop (hd0,1)$isofile 
    linux (loop)/dban.bzi nuke="dwipe" silent 
    }

Alternatively,

    menuentry "Darik's Boot and Nuke" {
    set isofile="/boot/dban.iso"
    loopback loop (hd0,1)$isofile
    linux (loop)/dban.bzi
    }

will show you the DBAN's options and let you choose to wipe your drive. **Be careful as it is still very dangerous**.

To conclude, there are plenty of things to do with ISO files and Grub: whether you want a quick live session or prefer to destroy everything with the tip of your finger. The next step would be to launch some privacy focused distribution like [Tails][2] for example.

What do you think of booting on an ISO from Grub? Is it something you would consider doing? And why? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/boot-iso-image-from-grub.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://www.dban.org/
[2]:https://tails.boum.org/