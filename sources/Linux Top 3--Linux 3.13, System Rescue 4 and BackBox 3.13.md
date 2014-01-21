[bazz2 到此一游]
Linux Top 3: Linux 3.13, System Rescue 4 and BackBox 3.13
================================================================================
### 1) Linux 3.13 ###

Linus Torvalds released the first new Linux kernel of 2014 this week with the debut of Linux 3.13. As always with any given kernel release there are a lot of driver updates included in the new kernel.

The Linux 3.13 kernel also includes nftables which is a successor to the widely used iptables packet filtering technology that has long been the standard on Linux system. According to the code commit that nftables reuses the existing netfilter hooks, the connection tracking system, the NAT subsystem, the transparent proxying engine, the logging infrastructure and the userspace packet queueing facilities.

> "In a nutshell, nftables provides a pseudo-state machine with 4 general purpose registers of 128 bits and 1 specific purpose register to store verdicts," the commit states. "nftables also inherits the table, chain and rule objects from iptables, but in a more configurable way, and it also includes the original datatype-agnostic set infrastructure with mapping support."
> 
> Also noteworthy is the inclusion of NFC (Near Field Communication) payment support.
> 
> "Implementation of the NFC_CMD_SE_IO command for sending ISO7816 APDUs to NFC embedded secure elements," Intel developers Samuel Ortiz, wrote in his commit [message][1]. "The reply is forwarded to user space through NFC_CMD_SE_IO as well."

### 2) System Rescue CD 4.0.0 ###

While many people use Linux for server and desktop deployments, there is also a strong use-case for standalone Linux for use as a rescue for non *nix systems as well.

One of the most popular Linux distribution of system and data rescue is the SystemRescueCd which las week advanced to version 4.0.0.

Among the [changes][2] in the new release:

- Standard kernels: Long-Term-Supported linux-3.10.25 (rescue32 + rescue64) 
- Alternative kernels: latest stable linux-3.12.7 (altker32 + altker64) 
- Updated XOrg graphical environment and drivers to xorg-server-1.14.3 
- Updated GParted to 0.17.0 (Add support for online resize) 
- Updated btrfs utilities to sys-fs/btrfs-progs-3.12

### 3) BackBox 3.13 ###

Linux also has a strong use case for security professionals, which is where BackBox Linux has gained a following. The new BackBox Linux updates multiple components in the penetration testing distribution, though confusingly it does now use a Linux 3.13 kernel, it uses a Linux 3.11 kernel.

BackBox Linux now includes a new anonymous mode in addition to updating security tools.

--------------------------------------------------------------------------------

via: http://www.linuxplanet.com/news/linux-top-3-linux-3.13-system-rescue-4-and-backbox-3.13.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5ce3f32b5264b337bfd13a780452a17705307725
[2]:http://www.sysresccd.org/Changes-x86
