[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding systemd at startup on Linux)
[#]: via: (https://opensource.com/article/20/5/systemd-startup)
[#]: author: (David Both https://opensource.com/users/dboth)

Understanding systemd at startup on Linux
======
systemd's startup provides important clues to help you solve problems
when they occur.
![People at the start line of a race][1]

In [_Learning to love systemd_][2], the first article in this series, I looked at systemd's functions and architecture and the controversy around its role as a replacement for the old SystemV init program and startup scripts. In this second article, I'll start exploring the files and tools that manage the Linux startup sequence. I'll explain the systemd startup sequence, how to change the default startup target (runlevel in SystemV terms), and how to manually switch to a different target without going through a reboot.

I'll also look at two important systemd tools. The first is the **systemctl** command, which is the primary means of interacting with and sending commands to systemd. The second is **journalctl**, which provides access to the systemd journals that contain huge amounts of system history data such as kernel and service messages (both informational and error messages).

Be sure to use a non-production system for testing and experimentation in this and future articles. Your test system needs to have a GUI desktop (such as Xfce, LXDE, Gnome, KDE, or another) installed.

I wrote in my previous article that I planned to look at creating a systemd unit and adding it to the startup sequence in this article. Because this article became longer than I anticipated, I will hold that for the next article in this series.

### Exploring Linux startup with systemd

Before you can observe the startup sequence, you need to do a couple of things to make the boot and startup sequences open and visible. Normally, most distributions use a startup animation or splash screen to hide the detailed messages that would otherwise be displayed during a Linux host's startup and shutdown. This is called the Plymouth boot screen on Red Hat-based distros. Those hidden messages can provide a great deal of information about startup and shutdown to a sysadmin looking for information to troubleshoot a bug or to just learn about the startup sequence. You can change this using the GRUB (Grand Unified Boot Loader) configuration.

The main GRUB configuration file is **/boot/grub2/grub.cfg**, but, because this file can be overwritten when the kernel version is updated, you do not want to change it. Instead, modify the **/etc/default/grub** file, which is used to modify the default settings of **grub.cfg**.

Start by looking at the current, unmodified version of the **/etc/default/grub** file:


```
[root@testvm1 ~]# cd /etc/default ; cat grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=/dev/mapper/fedora_testvm1-swap rd.lvm.
lv=fedora_testvm1/root rd.lvm.lv=fedora_testvm1/swap rd.lvm.lv=fedora_
testvm1/usr rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
[root@testvm1 default]#
```

Chapter 6 of the [GRUB documentation][3] contains a list of all the possible entries in the **/etc/default/grub** file, but I focus on the following:

  * I change **GRUB_TIMEOUT**, the number of seconds for the GRUB menu countdown, from five to 10 to give a bit more time to respond to the GRUB menu before the countdown hits zero.
  * I delete the last two parameters on **GRUB_CMDLINE_LINUX**, which lists the command-line parameters that are passed to the kernel at boot time. One of these parameters, **rhgb** stands for Red Hat Graphical Boot, and it displays the little Fedora icon animation during the kernel initialization instead of showing boot-time messages. The other, the **quiet** parameter, prevents displaying the startup messages that document the progress of the startup and any errors that occur. I delete both **rhgb** and **quiet** because sysadmins need to see these messages. If something goes wrong during boot, the messages displayed on the screen can point to the cause of the problem.



After you make these changes, your GRUB file will look like:


```
[root@testvm1 default]# cat grub
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=/dev/mapper/fedora_testvm1-swap rd.lvm.
lv=fedora_testvm1/root rd.lvm.lv=fedora_testvm1/swap rd.lvm.lv=fedora_
testvm1/usr"
GRUB_DISABLE_RECOVERY="false"
[root@testvm1 default]#
```

The **grub2-mkconfig** program generates the **grub.cfg** configuration file using the contents of the **/etc/default/grub** file to modify some of the default GRUB settings. The **grub2-mkconfig** program sends its output to **STDOUT**. It has a **-o** option that allows you to specify a file to send the datastream to, but it is just as easy to use redirection. Run the following command to update the **/boot/grub2/grub.cfg** configuration file:


```
[root@testvm1 grub2]# grub2-mkconfig &gt; /boot/grub2/grub.cfg
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.18.9-200.fc28.x86_64
Found initrd image: /boot/initramfs-4.18.9-200.fc28.x86_64.img
Found linux image: /boot/vmlinuz-4.17.14-202.fc28.x86_64
Found initrd image: /boot/initramfs-4.17.14-202.fc28.x86_64.img
Found linux image: /boot/vmlinuz-4.16.3-301.fc28.x86_64
Found initrd image: /boot/initramfs-4.16.3-301.fc28.x86_64.img
Found linux image: /boot/vmlinuz-0-rescue-7f12524278bd40e9b10a085bc82dc504
Found initrd image: /boot/initramfs-0-rescue-7f12524278bd40e9b10a085bc82dc504.img
done
[root@testvm1 grub2]#
```

Reboot your test system to view the startup messages that would otherwise be hidden behind the Plymouth boot animation. But what if you need to view the startup messages and have not disabled the Plymouth boot animation? Or you have, but the messages stream by too fast to read? (Which they do.)

There are a couple of options, and both involve log files and systemd journals—which are your friends. You can use the **less** command to view the contents of the **/var/log/messages** file. This file contains boot and startup messages as well as messages generated by the operating system during normal operation. You can also use the **journalctl** command without any options to view the systemd journal, which contains essentially the same information:


```
[root@testvm1 grub2]# journalctl
\-- Logs begin at Sat 2020-01-11 21:48:08 EST, end at Fri 2020-04-03 08:54:30 EDT. --
Jan 11 21:48:08 f31vm.both.org kernel: Linux version 5.3.7-301.fc31.x86_64 ([mockbuild@bkernel03.phx2.fedoraproject.org][4]) (gcc version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) #1 SMP Mon Oct &gt;
Jan 11 21:48:08 f31vm.both.org kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.3.7-301.fc31.x86_64 root=/dev/mapper/VG01-root ro resume=/dev/mapper/VG01-swap rd.lvm.lv=VG01/root rd&gt;
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-provided physical RAM map:
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000000100000-0x00000000dffeffff] usable
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000dfff0000-0x00000000dfffffff] ACPI data
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000100000000-0x000000041fffffff] usable
Jan 11 21:48:08 f31vm.both.org kernel: NX (Execute Disable) protection: active
Jan 11 21:48:08 f31vm.both.org kernel: SMBIOS 2.5 present.
Jan 11 21:48:08 f31vm.both.org kernel: DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Jan 11 21:48:08 f31vm.both.org kernel: Hypervisor detected: KVM
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: Using msrs 4b564d01 and 4b564d00
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: cpu 0, msr 30ae01001, primary cpu clock
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: using sched offset of 8250734066 cycles
Jan 11 21:48:08 f31vm.both.org kernel: clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Jan 11 21:48:08 f31vm.both.org kernel: tsc: Detected 2807.992 MHz processor
Jan 11 21:48:08 f31vm.both.org kernel: e820: update [mem 0x00000000-0x00000fff] usable ==&gt; reserved
Jan 11 21:48:08 f31vm.both.org kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
&lt;snip&gt;
```

I truncated this datastream because it can be hundreds of thousands or even millions of lines long. (The journal listing on my primary workstation is 1,188,482 lines long.) Be sure to try this on your test system. If it has been running for some time—even if it has been rebooted many times—huge amounts of data will be displayed. Explore this journal data because it contains a lot of information that can be very useful when doing problem determination. Knowing what this data looks like for a normal boot and startup can help you locate problems when they occur.

I will discuss systemd journals, the **journalctl** command, and how to sort through all of that data to find what you want in more detail in a future article in this series.

After GRUB loads the kernel into memory, it must first extract itself from the compressed version of the file before it can perform any useful work. After the kernel has extracted itself and started running, it loads systemd and turns control over to it.

This is the end of the boot process. At this point, the Linux kernel and systemd are running but unable to perform any productive tasks for the end user because nothing else is running, there's no shell to provide a command line, no background processes to manage the network or other communication links, and nothing that enables the computer to perform any productive function.

Systemd can now load the functional units required to bring the system up to a selected target run state.

### Targets

A systemd target represents a Linux system's current or desired run state. Much like SystemV start scripts, targets define the services that must be present for the system to run and be active in that state. Figure 1 shows the possible run-state targets of a Linux system using systemd. As seen in the first article of this series and in the systemd bootup man page (man bootup), there are other intermediate targets that are required to enable various necessary services. These can include **swap.target**, **timers.target**, **local-fs.target**, and more. Some targets (like **basic.target**) are used as checkpoints to ensure that all the required services are up and running before moving on to the next-higher level target.

Unless otherwise changed at boot time in the GRUB menu, systemd always starts the **default.target**. The **default.target** file is a symbolic link to the true target file. For a desktop workstation, this is typically going to be the **graphical.target**, which is equivalent to runlevel 5 in SystemV. For a server, the default is more likely to be the **multi-user.target**, which is like runlevel 3 in SystemV. The **emergency.target** file is similar to single-user mode. Targets and services are systemd units.

The following table, which I included in the previous article in this series, compares the systemd targets with the old SystemV startup runlevels. The systemd target aliases are provided by systemd for backward compatibility. The target aliases allow scripts—and sysadmins—to use SystemV commands like **init 3** to change runlevels. Of course, the SystemV commands are forwarded to systemd for interpretation and execution.

**systemd targets** | **SystemV runlevel** | **target aliases** | **Description**
---|---|---|---
default.target |  |  | This target is always aliased with a symbolic link to either **multi-user.target** or **graphical.target**. systemd always uses the **default.target** to start the system. The **default.target** should never be aliased to **halt.target**, **poweroff.target**, or **reboot.target**.
graphical.target | 5 | runlevel5.target | **Multi-user.target** with a GUI
| 4 | runlevel4.target | Unused. Runlevel 4 was identical to runlevel 3 in the SystemV world. This target could be created and customized to start local services without changing the default **multi-user.target**.
multi-user.target | 3 | runlevel3.target | All services running, but command-line interface (CLI) only
| 2 | runlevel2.target | Multi-user, without NFS, but all other non-GUI services running
rescue.target | 1 | runlevel1.target | A basic system, including mounting the filesystems with only the most basic services running and a rescue shell on the main console
emergency.target | S |  | Single-user mode—no services are running; filesystems are not mounted. This is the most basic level of operation with only an emergency shell running on the main console for the user to interact with the system.
halt.target |  |  | Halts the system without powering it down
reboot.target | 6 | runlevel6.target | Reboot
poweroff.target | 0 | runlevel0.target | Halts the system and turns the power off

Each target has a set of dependencies described in its configuration file. systemd starts the required dependencies, which are the services required to run the Linux host at a specific level of functionality. When all of the dependencies listed in the target configuration files are loaded and running, the system is running at that target level. If you want, you can review the systemd startup sequence and runtime targets in the first article in this series, [_Learning to love systemd_][2].

### Exploring the current target

Many Linux distributions default to installing a GUI desktop interface so that the installed systems can be used as workstations. I always install from a Fedora Live boot USB drive with an Xfce or LXDE desktop. Even when I'm installing a server or other infrastructure type of host (such as the ones I use for routers and firewalls), I use one of these installations that installs a GUI desktop.

I could install a server without a desktop (and that would be typical for data centers), but that does not meet my needs. It is not that I need the GUI desktop itself, but the LXDE installation includes many of the other tools I use that are not in a default server installation. This means less work for me after the initial installation.

But just because I have a GUI desktop does not mean it makes sense to use it. I have a 16-port KVM that I can use to access the KVM interfaces of most of my Linux systems, but the vast majority of my interaction with them is via a remote SSH connection from my primary workstation. This way is more secure and uses fewer system resources to run **multi-user.target** compared to **graphical.target.**

To begin, check the default target to verify that it is the **graphical.target**:


```
[root@testvm1 ~]# systemctl get-default
graphical.target
[root@testvm1 ~]#
```

Now verify the currently running target. It should be the same as the default target. You can still use the old method, which displays the old SystemV runlevels. Note that the previous runlevel is on the left; it is **N** (which means None), indicating that the runlevel has not changed since the host was booted. The number 5 indicates the current target, as defined in the old SystemV terminology:


```
[root@testvm1 ~]# runlevel
N 5
[root@testvm1 ~]#
```

Note that the runlevel man page indicates that runlevels are obsolete and provides a conversion table.

You can also use the systemd method. There is no one-line answer here, but it does provide the answer in systemd terms:


```
[root@testvm1 ~]# systemctl list-units --type target
UNIT                   LOAD   ACTIVE SUB    DESCRIPTION                
basic.target           loaded active active Basic System              
cryptsetup.target      loaded active active Local Encrypted Volumes    
getty.target           loaded active active Login Prompts              
graphical.target       loaded active active Graphical Interface        
local-fs-pre.target    loaded active active Local File Systems (Pre)  
local-fs.target        loaded active active Local File Systems        
multi-user.target      loaded active active Multi-User System          
network-online.target  loaded active active Network is Online          
network.target         loaded active active Network                    
nfs-client.target      loaded active active NFS client services        
nss-user-lookup.target loaded active active User and Group Name Lookups
paths.target           loaded active active Paths                      
remote-fs-pre.target   loaded active active Remote File Systems (Pre)  
remote-fs.target       loaded active active Remote File Systems        
rpc_pipefs.target      loaded active active rpc_pipefs.target          
slices.target          loaded active active Slices                    
sockets.target         loaded active active Sockets                    
sshd-keygen.target     loaded active active sshd-keygen.target        
swap.target            loaded active active Swap                      
sysinit.target         loaded active active System Initialization      
timers.target          loaded active active Timers                    

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

21 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
```

This shows all of the currently loaded and active targets. You can also see the **graphical.target** and the **multi-user.target**. The **multi-user.target** is required before the **graphical.target** can be loaded. In this example, the **graphical.target** is active.

### Switching to a different target

Making the switch to the **multi-user.target** is easy:


```
`[root@testvm1 ~]# systemctl isolate multi-user.target`
```

The display should now change from the GUI desktop or login screen to a virtual console. Log in and list the currently active systemd units to verify that **graphical.target** is no longer running:


```
`[root@testvm1 ~]# systemctl list-units --type target`
```

Be sure to use the **runlevel** command to verify that it shows both previous and current "runlevels":


```
[root@testvm1 ~]# runlevel
5 3
```

### Changing the default target

Now, change the default target to the **multi-user.target** so that it will always boot into the **multi-user.target** for a console command-line interface rather than a GUI desktop interface. As the root user on your test host, change to the directory where the systemd configuration is maintained and do a quick listing:


```
[root@testvm1 ~]# cd /etc/systemd/system/ ; ll
drwxr-xr-x. 2 root root 4096 Apr 25  2018  basic.target.wants
&lt;snip&gt;
lrwxrwxrwx. 1 root root   36 Aug 13 16:23  default.target -&gt; /lib/systemd/system/graphical.target
lrwxrwxrwx. 1 root root   39 Apr 25  2018  display-manager.service -&gt; /usr/lib/systemd/system/lightdm.service
drwxr-xr-x. 2 root root 4096 Apr 25  2018  getty.target.wants
drwxr-xr-x. 2 root root 4096 Aug 18 10:16  graphical.target.wants
drwxr-xr-x. 2 root root 4096 Apr 25  2018  local-fs.target.wants
drwxr-xr-x. 2 root root 4096 Oct 30 16:54  multi-user.target.wants
&lt;snip&gt;
[root@testvm1 system]#
```

I shortened this listing to highlight a few important things that will help explain how systemd manages the boot process. You should be able to see the entire list of directories and links on your virtual machine.

The **default.target** entry is a symbolic link (symlink, soft link) to the directory **/lib/systemd/system/graphical.target**. List that directory to see what else is there:


```
`[root@testvm1 system]# ll /lib/systemd/system/ | less`
```

You should see files, directories, and more links in this listing, but look specifically for **multi-user.target** and **graphical.target**. Now display the contents of **default.target**, which is a link to **/lib/systemd/system/graphical.target**:


```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
[root@testvm1 system]#
```

This link to the **graphical.target** file describes all of the prerequisites and requirements that the graphical user interface requires. I will explore at least some of these options in the next article in this series.

To enable the host to boot to multi-user mode, you need to delete the existing link and create a new one that points to the correct target. Make the [PWD][5] **/etc/systemd/system**, if it is not already:


```
[root@testvm1 system]# rm -f default.target
[root@testvm1 system]# ln -s /lib/systemd/system/multi-user.target default.target
```

List the **default.target** link to verify that it links to the correct file:


```
[root@testvm1 system]# ll default.target
lrwxrwxrwx 1 root root 37 Nov 28 16:08 default.target -&gt; /lib/systemd/system/multi-user.target
[root@testvm1 system]#
```

If your link does not look exactly like this, delete it and try again. List the content of the **default.target** link:


```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Multi-User System
Documentation=man:systemd.special(7)
Requires=basic.target
Conflicts=rescue.service rescue.target
After=basic.target rescue.service rescue.target
AllowIsolate=yes
[root@testvm1 system]#
```

The **default.target**—which is really a link to the **multi-user.target** at this point—now has different requirements in the **[Unit]** section. It does not require the graphical display manager.

Reboot. Your virtual machine should boot to the console login for virtual console 1, which is identified on the display as tty1. Now that you know how to change the default target, change it back to the **graphical.target** using a command designed for the purpose.

First, check the current default target:


```
[root@testvm1 ~]# systemctl get-default
multi-user.target
[root@testvm1 ~]# systemctl set-default graphical.target
Removed /etc/systemd/system/default.target.
Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/graphical.target.
[root@testvm1 ~]#
```

Enter the following command to go directly to the **graphical.target** and the display manager login page without having to reboot:


```
`[root@testvm1 system]# systemctl isolate default.target`
```

I do not know why the term "isolate" was chosen for this sub-command by systemd's developers. My research indicates that it may refer to running the specified target but "isolating" and terminating all other targets that are not required to support the target. However, the effect is to switch targets from one run target to another—in this case, from the multi-user target to the graphical target. The command above is equivalent to the old init 5 command in SystemV start scripts and the init program.

Log into the GUI desktop, and verify that it is working as it should.

### Summing up

This article explored the Linux systemd startup sequence and started to explore two important systemd tools, **systemctl** and **journalctl**. It also explained how to switch from one target to another and to change the default target.

The next article in this series will create a new systemd unit and configure it to run during startup. It will also look at some of the configuration options that help determine where in the sequence a particular unit will start, for example, after networking is up and running.

### Resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup.

  * The Fedora Project has a good, practical [guide][6] [to systemd][6]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][7] that cross-references the old SystemV commands to comparable systemd ones.
  * For detailed technical information about systemd and the reasons for creating it, check out [Freedesktop.org][8]'s [description of systemd][9].
  * [Linux.com][10]'s "More systemd fun" offers more advanced systemd [information and tips][11].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

  * [Rethinking PID 1][12]
  * [systemd for Administrators, Part I][13]
  * [systemd for Administrators, Part II][14]
  * [systemd for Administrators, Part III][15]
  * [systemd for Administrators, Part IV][16]
  * [systemd for Administrators, Part V][17]
  * [systemd for Administrators, Part VI][18]
  * [systemd for Administrators, Part VII][19]
  * [systemd for Administrators, Part VIII][20]
  * [systemd for Administrators, Part IX][21]
  * [systemd for Administrators, Part X][22]
  * [systemd for Administrators, Part XI][23]



Alison Chiaken, a Linux kernel and systems programmer at Mentor Graphics, offers a preview of her...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/systemd-startup

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/start_line.jpg?itok=9reaaW6m (People at the start line of a race)
[2]: https://opensource.com/article/20/4/systemd
[3]: http://www.gnu.org/software/grub/manual/grub
[4]: mailto:mockbuild@bkernel03.phx2.fedoraproject.org
[5]: https://en.wikipedia.org/wiki/Pwd
[6]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[7]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[8]: http://Freedesktop.org
[9]: http://www.freedesktop.org/wiki/Software/systemd
[10]: http://Linux.com
[11]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[12]: http://0pointer.de/blog/projects/systemd.html
[13]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[17]: http://0pointer.de/blog/projects/three-levels-of-off.html
[18]: http://0pointer.de/blog/projects/changing-roots
[19]: http://0pointer.de/blog/projects/blame-game.html
[20]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[21]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[22]: http://0pointer.de/blog/projects/instances.html
[23]: http://0pointer.de/blog/projects/inetd.html
