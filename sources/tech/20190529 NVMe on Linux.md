[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NVMe on Linux)
[#]: via: (https://www.networkworld.com/article/3397006/nvme-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

NVMe on Linux
======
In case you haven't yet noticed, some incredibly fast solid-state disk technology is as available for Linux as it is for other operating systems.
![Sandra Henry-Stocker][1]

NVMe stands for “non-volatile memory express” and is a host controller interface and storage protocol that was created to accelerate the transfer of data between enterprise and client systems and solid-state drives (SSD). It works over a computer's high-speed Peripheral Component Interconnect Express (PCIe) bus. What I see when I look at this string of letters, however, is “envy me.” And the reason for the envy is significant.

Using NVMe, data transfer happens _much_ faster than it does with rotating drives. In fact, NVMe drives can move data seven times faster than SATA SSDs. That’s seven times faster than the SSDs that many of us are using today. This means that your systems could boot blindingly fast when an NVMe drive is serving as its boot drive. In fact, these days anyone buying a new system should probably not consider one that doesn’t come with NVMe built-in — whether a server or a PC.

### Does NVMe work with Linux?

Yes! NVMe has been supported in the Linux kernel since 3.3. Upgrading a system, however, generally requires that both an NVMe controller and an NVMe disk be available. Some external drives are available but need more than the typical USB port for attaching to the system.

[MORE ON NETWORK WORLD: Linux: Best desktop distros for newbies][2]

To check your kernel release, use a command like this:

```
$ uname -r
5.0.0-15-generic
```

If your system is NVMe-ready, you should see a device (e.g., /dev/nvme0), but only if you have an NVMe controller installed. If you don’t have an NVMe controller, you can still get some information on your NVMe-readiness using this command:

```
$ modinfo nvme | head -6
filename:       /lib/modules/5.0.0-15-generic/kernel/drivers/nvme/host/nvme.ko
version:        1.0
license:        GPL
author:         Matthew Wilcox <willy@linux.intel.com>
srcversion:     AA383008D5D5895C2E60523
alias:          pci:v0000106Bd00002003sv*sd*bc*sc*i*
```

### Learn more

More details on what you need to know about the insanely fast NVMe storage option are available on _[PCWorld][3]._

Specs, white papers and other resources are available at [NVMexpress.org][4].

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397006/nvme-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/nvme-100797708-large.jpg
[2]: https://www.networkworld.com/slideshow/153439/linux-best-desktop-distros-for-newbies.html#tk.nww-infsb
[3]: https://www.pcworld.com/article/2899351/everything-you-need-to-know-about-nvme.html
[4]: https://nvmexpress.org/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
