How to Run ISO Files Directly From the HDD with GRUB2
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-featured.png)

Most Linux distros offer a live environment, which you can boot up from a USB drive, for you to test the system without installing. You can either use it to evaluate the distro or as a disposable OS. While it is easy to copy these onto a USB disk, in certain cases one might want to run the same ISO image often or run different ones regularly. GRUB 2 can be configured so that you do not need to burn the ISOs to disk or use a USB drive, but need to run a live environment directly form the boot menu.

### Obtaining and checking bootable ISO images ###

To obtain an ISO image, you should usually visit the website of the desired distribution and download any image that is compatible with your setup. If the image can be started from a USB, it should be able to start from the GRUB menu as well.

Once the image has finished downloading, you should check its integrity by running a simple md5 check on it. This will output a long combination of numbers and alphanumeric characters

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-md5.png)

which you can compare against the MD5 checksum provided on the download page. The two should be identical.

### Setting up GRUB 2 ###

ISO images contain full systems. All you need to do is direct GRUB2 to the appropriate file, and tell it where it can find the kernel and the initramdisk or initram filesystem (depending on which one your distribution uses).

In this example, a Kubuntu 15.04 live environment will be set up to run on an Ubuntu 14.04 box as a Grub menu item. It should work for most newer Ubuntu-based systems and derivatives. If you have a different system or want to achieve something else, you can get some ideas on how to do this from one of [these files][1], although it will require a little experience with GRUB.

In this example the file `kubuntu-15.04-desktop-amd64.iso`

lives in `/home/maketecheasier/TempISOs/` on `/dev/sda1`.

To make GRUB2 look for it in the right place, you need to edit the

    /etc/grub.d40-custom

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-40-custom-empty.png)

To start Kubuntu from the above location, add the following code (after adjusting it to your needs) below the commented section, without modifying the original content.

    menuentry "Kubuntu 15.04 ISO" {
    set isofile="/home/maketecheasier/TempISOs/kubuntu-15.04-desktop-amd64.iso"
    loopback loop (hd0,1)$isofile
    echo "Starting $isofile..."
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-40-custom-new.png)

### Breaking down the above code ###

First set up a variable named `$menuentry`. This is where the ISO file is located. If you want to change to a different ISO, you need to change the bit where it says set `isofile="/path/to/file/name-of-iso-file-.iso"`.

The next line is where you specify the loopback device; you also need to give it the right partition number. This is the bit where it says

    loopback loop (hd0,1)$isofile

Note the hd0,1 bit; it is important. This means first HDD, first partition (`/dev/sda1`).

GRUB’s naming here is slightly confusing. For HDDs, it starts counting from “0”, making the first HDD #0, the second one #1, the third one #2, etc. However, for partitions, it will start counting from 1. First partition is #1, second is #2, etc. There might be a good reason for this but not necessarily a sane one (UX-wise it is a disaster, to be sure)..

This makes fist disk, first partition, which in Linux would usually look something like `/dev/sda1` become `hd0,1` in GRUB2. The second disk, third partition would be `hd1,3`, and so on.

The next important line is

    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash

It will load the kernel image. On newer Ubuntu Live CDs, this would be in the `/casper` directory and called `vmlinuz.efi`. If you use a different system, your kernel might be missing the `.efi` extension or be located somewhere else entirely (You can easily check this by opening the ISO file with an archive manager and looking inside `/casper.`). The last options, `quiet splash`, would be your regular GRUB options, if you care to change them.

Finally

    initrd (loop)/casper/initrd.lz

will load `initrd`, which is responsible to load a RAMDisk into memory for bootup.

### Booting into your live system ###

To make it all work, you will only need to update GRUB2

    sudo update-grub

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-updare-grub.png)

When you reboot your system, you should be presented with a new GRUB entry which will allow you to load into the ISO image you’ve just set up.

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-grub-menu.png)

Selecting the new entry should boot you into the live environment, just like booting from a DVD or USB would.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/run-iso-files-hdd-grub2/

作者：[Attila Orosz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:http://git.marmotte.net/git/glim/tree/grub2