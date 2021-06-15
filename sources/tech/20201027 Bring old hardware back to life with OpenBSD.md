[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bring old hardware back to life with OpenBSD)
[#]: via: (https://opensource.com/article/20/10/old-hardware-openbsd)
[#]: author: (Jonathan Garrido https://opensource.com/users/jgarrido)

Bring old hardware back to life with OpenBSD
======
Install OpenBSD and the Xfce desktop to give a new spin to an old
machine—for free.
![Old UNIX computer][1]

Almost everyone has (or knows someone who has) old hardware sitting around gathering dust because they believe that no modern operating system (OS) supports such a relic. I know this is wrong because I am one of those geeks who likes to use every piece of equipment as long as it is possibly functional.

Although most modern OSes do run better on modern hardware, it is also true that there are alternatives for up-to-date 32-bit OSes to run all types of machines, including very old ones. Thanks to a bunch of people with enough determination and skills, there are different types of Linux and BSD distros that you can use, free of charge, to give a new spin to an old machine.

## What can you do with a new OS on old hardware?

Besides the obvious benefit of bringing back a piece of equipment that has been idle for a price that is equal to nothing, using an open source 32-bit distro to revive "antique" hardware has several benefits and purposes, including:

  * **Create single-purpose equipment:** Today's networks are complex, and there are a lot of services that interact with one another. After bringing an old machine back to life, you can set it up to fulfill one of those unique services within your infrastructure, such as DHCP, DNS, or SFTP.
  * **Learn how the OS works:** I always want to know how things work under the hood. Tinkering with old hardware and tiny OSes gives you the chance to understand the interactions between hardware and software, learn how to tune the installation's default settings to make the most of a system, and much, much more.
  * **Teach others about open source:** Finally, 32-bit OSes and old hardware can teach the next generation about OSes and the open source world. One of the main features of these types of OSes is their simplicity of use with fewer options to overwhelm the user. This makes them an excellent tool to teach and explore the essential components of any operating system.



## Distributions to try

To encourage you, here is a list of distros that I have tried on old hardware with very good results. These are not the only options available, but these are the ones I have used the most:

  * [Linux Lite][2]
  * [FreeBSD][3]
  * [OpenBSD][4]
  * [Lubuntu][5]
  * [Debian][6]
  * [Tiny Core Linux][7]
  * [Slax Linux][8]



## Give it a try with OpenBSD

OpenBSD is one of the main [BSD][9] distros. It is well-known because it is made with security in mind, with almost no security bugs in the default installation and a lot of cryptography tools available to users. Another cool feature, at least for me, is the fact that you can run it on a huge variety of hardware, from new computers to very old machines.

For this installation, my hardware was a 2005 MacBook with the following specs:

  * A 32-bit, dual-core processor
  * 2GB of RAM (with no possibility of expansion)
  * A 32GB hard drive
  * Two network cards
  * A CD-ROM (reads only CDs)
  * A few USB ports



### Install OpenBSD

The installation was very straightforward. I [downloaded][10] the most recent version of OpenBSD and created a boot CD (because there is no other way to boot my old laptop besides the internal drive). The installation went flawlessly. It recognized my hardware, network (including my access point), and time zone; let me choose the layout of my hard drive and manage my users; and asked some questions about the system's security setup. Also, even though the installation has a very small footprint, OpenBSD let me choose what to install and from where.

I ended up with a brand-new, up-to-date operating system and a screen like this.

![OpenBSD][11]

(Jonathan Garrido, [CC BY-SA 4.0][12])

### Add a graphical desktop

If you want your desktop to use graphical applications, a black terminal with white letters is not enough. So follow these steps to install the [Xfce desktop][13]:

  1. As root, run: [code]`pkg_add xcfe xfce-extras slim slim-themes consolekit2 polkit`[/code] to install the Xfce environment and the login greeter. In the above, `pkg_add` is the utility to use when you want to d