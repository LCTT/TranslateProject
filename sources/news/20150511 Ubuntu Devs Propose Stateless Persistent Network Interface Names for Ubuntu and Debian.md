Ubuntu Devs Propose Stateless Persistent Network Interface Names for Ubuntu and Debian
======================================================================================
*Networks are detected in an unpredictable and unstable order*

**Martin Pitt, a renown Ubuntu and Debian developer, came with the proposal of enabling stateless persistent network interface names in the upcoming versions of the Ubuntu Linux and Debian GNU/Linux operating systems.**

According to Mr. Pitt, it appears that the problem lies in the automatic detection of network interfaces within the Linux kernel. As such, network interfaces are detected in an unstable and unpredictable order. However, it order to connect to a certain network interface in ifupdown or networkd users will need to identify it first using a stable name.

"The general schema for this is to have an udev rule which does some matches to identify a particular interface, and assings a NAME="foo" to it," says Martin Pitt in an email to the Ubuntu mailinglist. "Interfaces with an explicit NAME= get called just like this, and others just get a kernel driver default, usually ethN, wlanN, or sometimes others (some wifi drivers have their own naming schemas)."

**Sever solutions appeared over the years: mac, biosdevname, and ifnames**

Apparently, several solutions are available for this problem, including an installation of an udev rule in /lib/udev/rules.d/75-persistent-net-generator.rules that creates a MAC address at first boot and writes it to /etc/udev/rules.d/70-persistent-net.rules, which is currently used by default in Ubuntu and applies to most hardware components.

Other solutions include biosdevname, a package that reads port or index numbers, and slot names from the BIOS and writes them to /lib/udev/rules.d/71-biosdevname.rules, and ifnames, a persistent name generator that automatically checks the BIOS and/or firmware for index numbers or slot names, similar to biosdevname.

However, the difference between ifnames and biosdevname is that the latter falls back to slot names, such as PCI numbers, and then to the MAC address and writes to /lib/udev/rules.d/80-net-setup-link.rules. All of these solutions can be combined, and Martin Pitt proposes to replace the first solution that is now used by default with the ifnames one.

If a new solution is implemented, a lot of networking issues will be resolved in Ubuntu, especially the cloud version. In addition, it will provide for stable network interface names for all new Ubuntu installations, and resolve many other problems related to system-image, etc.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Ubuntu-Devs-Propose-Stateless-Persistent-Network-Interface-Names-for-Ubuntu-and-Debian-480730.shtml

作者：[Marius Nestor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
