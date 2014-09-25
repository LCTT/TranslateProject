Linux FAQs with Answers--How to change a network interface name on CentOS 7
================================================================================
> **Question**: On CentOS 7, I would like to change the assigned name of a network interface to something else. What is a proper way to rename a network interface on CentOS or RHEL 7? 

Traditionally, network interfaces in Linux are enumerated as eth[0123...], but these names do not necessarily correspond to actual hardware slots, PCI geography, USB port number, etc. This introduces a unpredictable naming problem (e.g., due to undeterministic device probing behavior) which can cause various network misconfigurations (e.g., disabled interface or firewall bypass resulting from unintentional interface renaming). MAC address based udev rules are not so much helpful in a virtualized environment where MAC addresses are as euphemeral as port numbers.

CentOS/RHEL 6 has introduced a method for [consistent and predictable network device naming][1] for network interfaces. These features uniquely determine the name of network interfaces in order to make locating and differentiating the interfaces easier and in such a way that it is persistent across later boots, time, and hardware changes. However, this naming rule is not turned on by default on CentOS/RHEL 6.

Starting with CentOS/RHEL 7, the predictable naming rule is adopted by default. Under this rule, interface names are automatically determined based on firmware, topology, and location information. Now interface names stay fixed even if NIC hardware is added or removed without re-enumeration, and broken hardware can be replaced seamlessly.

    * Two character prefixes based on the type of interface:
    *   en -- ethernet
    *   sl -- serial line IP (slip)
    *   wl -- wlan
    *   ww -- wwan
    *
    * Type of names:
    *   b<number>                             -- BCMA bus core number
    *   ccw<name>                             -- CCW bus group name
    *   o<index>                              -- on-board device index number
    *   s<slot>[f<function>][d<dev_port>]     -- hotplug slot index number
    *   x<MAC>                                -- MAC address
    *   [P<domain>]p<bus>s<slot>[f<function>][d<dev_port>]
    *                                         -- PCI geographical location
    *   [P<domain>]p<bus>s<slot>[f<function>][u<port>][..]1[i<interface>]
    *                                         -- USB port number chain

A minor disadvantage of this new naming scheme is that the interface names are somewhat harder to read than the traditional names. For example, you may find names like enp0s3. Besides, you no longer have any control over such interface names.

![](https://farm4.staticflickr.com/3854/15294996451_fa731ce12c_z.jpg)

If, for some reason, you prefer the old way, and want to be able to assign any arbitrary name of your choice to an interface on CentOS/RHEL 7, you need to override the default predictable naming rule, and define a MAC address based udev rule.

**Here is how to rename a network interface on CentOS or RHEL 7.**

First, let's disable the predictable naming rule. For that, you can pass "net.ifnames=0" kernel parameter during boot. This is achieved by editing /etc/default/grub and adding "net.ifnames=0" to GRUB_CMDLINE_LINUX variable.

![](https://farm4.staticflickr.com/3898/15315687725_c82fbef5bc_z.jpg)

Then run this command to regenerate GRUB configuration with updated kernel parameters.

    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg 

![](https://farm4.staticflickr.com/3909/15128981250_72f45633c1_z.jpg)

Next, edit (or create) a udev network naming rule file (/etc/udev/rules.d/70-persistent-net.rules), and add the following line. Replace MAC address and interface with your own.

     $ sudo vi /etc/udev/rules.d/70-persistent-net.rules 

----------

    SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:a9:7a:e1", ATTR{type}=="1", KERNEL=="eth*", NAME="sushi"

Finally, reboot the machine, and verify the new interface name.

![](https://farm4.staticflickr.com/3861/15111594847_14e0c5a00d_z.jpg)

Note that it is still your responsibility to configure the renamed interface. If the network configuration (e.g., IPv4 settings, firewall rules) is based on the old name (before change), you need to update network configuration to reflect the name change.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-network-interface-name-centos7.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/appe-Consistent_Network_Device_Naming.html