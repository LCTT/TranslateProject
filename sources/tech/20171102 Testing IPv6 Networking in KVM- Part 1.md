Translating by qhwdw
Testing IPv6 Networking in KVM: Part 1
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ipv6-networking.png?itok=swQPV8Ey)

Nothing beats hands-on playing with IPv6 addresses to get the hang of how they work, and setting up a little test lab in KVM is as easy as falling over — and more fun. In this two-part series, we will learn about IPv6 private addressing and configuring test networks in KVM.

### QEMU/KVM/Virtual Machine Manager

Let's start with understanding what KVM is. Here I use KVM as a convenient shorthand for the combination of QEMU, KVM, and the Virtual Machine Manager that is typically bundled together in Linux distributions. The simplified explanation is that QEMU emulates hardware, and KVM is a kernel module that creates the guest state on your CPU and manages access to memory and the CPU. Virtual Machine Manager is a lovely graphical overlay to all of this virtualization and hypervisor goodness.

But you're not stuck with pointy-clicky, no, for there are also fab command-line tools to use — such as virsh and virt-install.

If you're not experienced with KVM, you might want to start with [Creating Virtual Machines in KVM: Part 1][1] and [Creating Virtual Machines in KVM: Part 2 - Networking][2].

### IPv6 Unique Local Addresses

Configuring IPv6 networking in KVM is just like configuring IPv4 networks. The main difference is those weird long addresses. [Last time][3], we talked about the different types of IPv6 addresses. There is one more IPv6 unicast address class, and that is unique local addresses, fc00::/7 (see [RFC 4193][4]). This is analogous to the private address classes in IPv4, 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16.

This diagram illustrates the structure of the unique local address space. 48 bits define the prefix and global ID, 16 bits are for subnets, and the remaining 64 bits are the interface ID:
```
| 7 bits |1| 40 bits | 16 bits | 64 bits |
+--------|-+------------|-----------|----------------------------+
| Prefix |L| Global ID | Subnet ID | Interface ID |
+--------|-+------------|-----------|----------------------------+

```

Here is another way to look at it, which is might be more helpful for understanding how to manipulate these addresses:
```
| Prefix | Global ID | Subnet ID | Interface ID |
+--------|--------------|-------------|----------------------+
| fd | 00:0000:0000 | 0000 | 0000:0000:0000:0000 |
+--------|--------------|-------------|----------------------+

```

fc00::/7 is divided into two /8 blocks, fc00::/8 and fd00::/8. fc00::/8 is reserved for future use. So, unique local addresses always start with fd, and the rest is up to you. The L bit, which is the eighth bit, is always set to 1, which makes fd00::/8. Setting it to zero makes fc00::/8. You can see this with subnetcalc:
```
$ subnetcalc fd00::/8 -n
Address = fd00::
 fd00 = 11111101 00000000

$ subnetcalc fc00::/8 -n
Address = fc00::
 fc00 = 11111100 00000000

```

RFC 4193 requires that addresses be randomly generated. You can invent addresses any way you choose, as long as they start with fd, because the IPv6 cops aren't going to invade your home and give you a hard time. Still, it is a best practice to follow what RFCs say. The addresses must not be assigned sequentially or with well-known numbers. RFC 4193 includes an algorithm for building a pseudo-random address generator, or you can find any number of generators online.

Unique local addresses are not centrally managed like global unicast addresses (assigned to you by your Internet service provider), but even so the probability of address collisions is very low. This is a nice benefit when you need to merge some local networks or want to route between discrete private networks.

You can mix unique local addresses and global unicast addresses on the same subnets. Unique local addresses are routable and require no extra router tweaks. However, you should configure your border routers and firewalls to not allow them to leave your network except between private networks at different locations.

RFC 4193 advises against mingling AAAA and PTR records with your global unicast address records, because there is no guarantee that they will be unique, even though the odds of duplicates are low. Just like we do with IPv4 addresses, keep your private local name services and public name services separate. The tried-and-true combination of Dnsmasq for local name services and BIND for public name services works just as well for IPv6 as it does for IPv4.

### Pseudo-Random Address Generator

One example of an online address generator is [Local IPv6 Address Generator][5]. You can find many cool online tools like this. You can use it to create a new address for you, or use it with your existing global ID and play with creating subnets.

Come back next week to learn how to plug all of this IPv6 goodness into KVM and do live testing.

Learn more about Linux through the free ["Introduction to Linux" ][6]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-1

作者：[Carla Schroder][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-1
[2]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-2-networking
[3]:https://www.linux.com/learn/intro-to-linux/2017/10/calculating-ipv6-subnets-linux
[4]:https://tools.ietf.org/html/rfc4193
[5]:https://www.ultratools.com/tools/rangeGenerator
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
