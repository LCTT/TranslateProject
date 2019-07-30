[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Is This the End of Floppy Disk in Linux? Linus Torvalds Marks Floppy Disks ‘Orphaned’)
[#]: via: (https://itsfoss.com/end-of-floppy-disk-in-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Is This the End of Floppy Disk in Linux? Linus Torvalds Marks Floppy Disks ‘Orphaned’
======

_**In a recent commit to the Linux Kernel, Linus Torvalds marked the floppy disk drivers as orphaned. Could this be the beginning of the end of floppy disks in Linux?**_

Chances are that you haven’t seen a real floppy disk in years. And if you are looking for a computer with floppy drive, you may have to visit a museum.

More than two decades ago, floppy disks were the popular medium for storing data and running operating systems on it. The [early Linux distributions][1] were ‘distributed’ using floppy disks. Floppy disks were also used extensively for saving and transferring data.

Have you ever wondered why the save icons in many applications look like a floppy? Because it IS floppy disk. Floppy disks were popular for saving data and hence many applications used it as save icons and the tradition continues till date.

![][2]

Why am I talking about floppy disks today? Because Linus Torvalds has marked floppy drivers ‘orphaned’ in a commit to the Linux kernel code.

### Floppy disk drivers marked ‘orphaned’ in Linux kernel

As you can read in the [commit on the GitHub mirror][3], the developer Jiri doesn’t have a working computer with floppy drive anymore. Without the correct hardware, continuing the development won’t be possible for Jiri. And that’s why Torvalds marked it orphan

> Actual working physical floppy hardware is getting hard to find, and while Willy was able to test this, I think the driver can be considered pretty much dead from an actual hardware standpoint. The hardware that is still sold seems to be mainly USB-based, which doesn’t use this legacy driver at all.

![][4]

### What does ‘orphan’ mean in Linux kernel?

Orphan means that there are no developers able to or willing to support that part of code.

An orphaned module will probably get deprecated and removed eventually if no one else comes forward to continue maintaining and developing it.

[][5]

Suggested read  Valve Annouces Linux Based Gaming Operating System: SteamOS

### It’s not being removed immediately

Torvalds notes that floppy drives are still used by various virtual environment emulators. So the floppy drivers won’t be discarded straightway.

> The old floppy disk controller is still emulated in various VM environments, so the driver isn’t going away, but let’s see if anybody is interested to step up to maintain it.

Why not just keep the floppy drive support in the kernel forever? It’s because this will pose a security threat. Even if there is no real computer using floppy drivers, the VMs still have it and this will leave the VMs vulnerable.

### End of an era?

Will this be the end of an era or will someone else come up and take the responsibility of keeping floppy support alive in Linux? Only time will tell.

I don’t think there is any love lost here with floppy drives being orphaned in Linux kernel.

I haven’t used a floppy disks in last fifteen years and I doubt many people either. What about you? Have you ever used a floppy disk? If yes, when was the last time you used it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/end-of-floppy-disk-in-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/earliest-linux-distros/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/floppy-disk-icon-of-saving.png?resize=800%2C300&ssl=1
[3]: https://github.com/torvalds/linux/commit/47d6a7607443ea43dbc4d0f371bf773540a8f8f4
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/End-of-Floppy-in-Linux.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/valve-annouces-linux-based-gaming-operating-system-steamos/
