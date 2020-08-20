[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using systemd journals to troubleshoot transient problems)
[#]: via: (https://opensource.com/article/20/8/journals-systemd)
[#]: author: (David Both https://opensource.com/users/dboth)

Using systemd journals to troubleshoot transient problems
======
Find the root cause of hard-to-repeat errors by diving into your system
journals.
![Wratchet set tools][1]

Problem determination can be as much an art as a science, and sometimes, it seems even a little magic can be useful. Everyone has encountered situations where a reported failure could not be reproduced, which is always frustrating for both the user and the system administrator. Even home appliances and automobiles can be obstinate and refuse to fail when the service person shows up.

Anthropomorphism aside, sysadmins have some tools that can show what has been happening in their Linux computers with varying degrees of granularity. There are tools, like top, htop, glances, sar, iotop, tcpdump, traceroute, mtr, iptraf-ng, df, du, and many more, all of which can display a host's current state, and several of which can produce logs of various levels of detail.

While these tools can be used to find ongoing problems, they are not particularly helpful for transient problems or those with no directly observable symptoms—not observable, at least, until some major and possibly catastrophic problem occurs.

An important tool I use for problem determination is the system logs—and with systemd, the system journals. The systemd journal is always one of the first tools I turn to when solving a problem, especially the problems that don't seem to happen when I am watching. It took me a long time at the beginning of my sysadmin career to realize the wealth of information in the log files, and this discovery greatly improved my speed in resolving problems.

You have already seen some uses of the `journalctl` command in many of the previous articles in [this series][2]. In this article, I will explore some details about the systemd journal, how it works, and ways to use `journalctl` to locate and identify problems.

## About journals

The purpose of any log or journal is to maintain a time-sequenced history of the normal activities of the services and programs that run on a host and to record any errors or warning messages that occur. The log messages used to be maintained in separate files in `/var/log`, usually one file for the kernel and separate ones for most of the services running on the host. Unfortunately, the large number of log files could spread out necessary information and delay the discovery of a problem's root cause. This could be especially time-consuming when you're trying to determine what was happening in a system when an error occurred.

The old `/var/log/dmesg` file was usually used for the kernel, but that file was discontinued several years ago in favor of using the `dmesg` command to display the same information and integrating those messages (and more) into the `/var/log/messages` file. This merger of other logs into the `messages` file helped speed problem determination by keeping much of the data in one file, but there were still many services whose logs were not integrated into the more central `messages` file.

The systemd journal is designed to collect all messages into a single, unified structure that can show a complete picture of everything that happened in a system at and around a specific time or event. Because the events, regardless of the source, are in one place and in time sequence, it is possible to see at a glance everything happening at a specific point or range of times. In my opinion, this is one of the main benefits of systemd journaling.

## About the systemd journal

The systemd journaling service is implemented by the `systemd-journald` daemon. According to the [`systemd-journald` man page][3]:

> _`systemd-journald` is a system service that collects and stores logging data. It creates and maintains structured, indexed journals based on logging information that is received from a variety of sources:_
>
>   * _Kernel log messages, via `kmsg`_
>   * _Simple system log messages, via the `libc syslog(3)` call_
>   * _Structured system log messages via the native Journal API, see `sd_journal_print(3)`_
>   * _Standard output and standard error of service units. For further details see below._
>   * _Audit records, originating from the kernel audit subsystem_
>

>
> _The daemon will implicitly collect numerous metadata fields for each log messages in a secure and unfakeable way. See `systemd.journal-fields(7)` for more information about the collected metadata._
>
> _Log data collected by the journal is primarily text-based but can also include binary data where necessary. Individual fields making up a log record stored in the journal may be up to 2^64-1 bytes in size._

## Configuration changes

The systemd journal daemon can be configured using the `/etc/systemd/journald.conf` file. For many hosts, this file does not need any changes because the defaults are quite reasonable. Look at your `journald.conf` file now, if you have not already.

The most common configuration changes you might consider would specify the maximum journal file size, the number of older journal files, and the maximum file-retention times. The primary reason to make those changes would be to reduce the storage space used by the journal if you have a small storage device. In a mission-critical environment, you may also want to reduce the amount of time between syncing journal data stored in RAM memory to the storage device.

The [`journald.conf` man page][4] has more details.

## Controversies about the data format

One of the controversies surrounding systemd is the binary format in which the journal contents are stored. Some arguments against systemd are based on the systemd journal being stored in a binary format. This would seem to be contrary to the Unix/Linux philosophy to use ASCII text for data, which is one argument people use to justify their dislike of systemd. For example, [Doug McIlroy][5], the inventor of the pipes, said:

> "This is the Unix Philosophy: Write programs that do one thing well. Write programs to work together. Write programs to handle text steams, because that is a universal interface." —Doug McIlroy, quoted in Eric S. Raymond's book [_The Art of Unix Programming_][6]

However, these arguments seem to be based on at least a partial misconception because the man page clearly states that the data "is primarily text-based," although it allows for binary data forms. Linux kernel creator Linus Torvalds, who is always clear about his feelings, said:

> "I don't actually have any particularly strong opinions on systemd itself. I've had issues with some of the core developers that I think are much too cavalier about bugs and compatibility, and I think some of the design details are insane (I dislike the binary logs, for example), but those are details, not big issues." —Linus Torvalds, quoted in ZDNet's "[Linus Torvalds and others on Linux's systemd][7]" in 2014

The systemd journal files are stored in one or more subdirectories of `/var/log/journal`. Log into a test system where you have root access, and make `/var/log/journal` the present working directory (PWD). List the subdirectories there, choose one, and make it the PWD. You can look at these files in a number of ways. I started with the `stat` command (note that the journal file names on your host will be different from mine):


```
[root@testvm1 3bccd1140fca488187f8a1439c832f07]# stat [system@7ed846aadf1743139083681ec4042037-0000000000000001-0005a99c0280fd5f.journal][8]
  File: [system@7ed846aadf1743139083681ec4042037-0000000000000001-0005a99c0280fd5f.journal][8]
  Size: 8388608         Blocks: 16392      IO Block: 4096   regular file
Device: fd04h/64772d    Inode: 524384      Links: 1
Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: (  190/systemd-journal)
Access: 2020-07-13 08:30:05.764291231 -0400
Modify: 2020-07-04 07:33:52.916001110 -0400
Change: 2020-07-04 07:33:52.916001110 -0400
 Birth: -
[root@testvm1 3bccd1140fca488187f8a1439c832f07]#
```

The journal file is identified as a "regular" file, which is not especially helpful. The `file` command identifies it as a "journal" file, but you already know that. Look inside the file with the `dd` command. The following command sends the output data stream to STDOUT; you may want to pipe it through the `less` pager:


```
[root@testvm1 3bccd1140fca488187f8a1439c832f07]# dd if=[system@7ed846aadf1743139083681ec4042037-0000000000000001-0005a99c0280fd5f.journal][8] | less
&lt;SNIP&gt;
9�P1�8��9_SOURCE_MONOTONIC_TIMESTAMP=191726���/��P����9MESSAGE=Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)�hx
9�P1�p�9��/��P�b������9��9_SOURCE_MONOTONIC_TIMESTAMP=191825�pdXY�7p�9��9MESSAGE=mem auto-init: stack:off, heap alloc:off, heap free:off�i��
��(n�O���@Y�    �����Zս���82���7X�8�������8��ǱR�����8&lt;~B�4�&lt;� �8tM˞8$����8��Ж��h9�&amp;������9�����`@�9�pdXY�7b�ͺ��WV��9��9_SOURCE_MONOTONIC_TIM
ESTAMP=234745����4�h@�9��9MESSAGE=Memory: 12598028K/12963384K available (14339K kernel code, 2406K rwdata, 8164K rodata, 2468K init, 5072K b
ss, 365356K reserved, 0K cma-reserved)�j����(n�O���@Y�  ����]��m�82���7X�8�������8��ǱR�����8&lt;~B�4�&lt;� �8tM˞8$����8��Ж��h9�&amp;�����9�ͺ��WV��9���
4�hbB���a��^��9��9_SOURCE_MONOTONIC_TIMESTAMP=234758��3�����9��9MESSAGE=random: get_random_u64 called from __kmem_cache_create+0x3e/0x610 wi
th crng_init=0�k���(n�O���@Y�   ����j������82���7X��8C�X�Y"��8�������8��ǱR�����8&lt;~B�4�&lt;� �8tM˞8$����8��Ж�à�9B���a���9�3���b�8�ȭ�����9h�9_SO�9h�9MESSAGE=SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1�l����(n�O���@Y�  ������z��X�82���7X�8�������8��ǱR�����8&lt;~B�4�&lt;� �8tM˞
b�(+I)�x�9�9_SOURCE_MONOTONIC_TIMESTAMP=235444r�%/p��9�9MESSAGE=Kernel/User page tables isolation: enabled�m����(n�O���@Y�     ����k��B0��8
2���7X�8�������8��ǱR�����8&lt;~B�4�&lt;� �8tM˞8$����8��Ж��h9�&amp;����8�9�(+I)Ҡ�9�%/pb8O{ W���8�9��9_SOURCE_MONOTONIC_TIMESTAMP=235464u�N`�FP    M��9
��9MESSAGE=ftrace: allocating 41361 entries in 162 pages�n����(n�O���@Y�
&lt;SNIP&gt;
```

Even this small portion of the data stream from the `dd` command shows an interesting mixture of ASCII text and binary data. Another useful tool is the `strings` command, which simply displays all the ASCII text strings contained in a file and ignores the binary data:


```
[root@testvm1 3bccd1140fca488187f8a1439c832f07]# strings [system@7ed846aadf1743139083681ec4042037-0000000000000001-0005a99c0280fd5f.journal][8]
&lt;SNIP&gt;
MESSAGE=Linux version 5.7.6-201.fc32.x86_64 ([mockbuild@bkernel01.iad2.fedoraproject.org][9]) (gcc version 10.1.1 20200507 (Red Hat 10.1.1-1) (GC
C), GNU ld version 2.34-3.fc32) #1 SMP Mon Jun 29 15:15:52 UTC 2020
MESSAGE
_BOOT_ID=6e944f99ebd9405984090f829a927fa4
_BOOT_ID
_MACHINE_ID=3bccd1140fca488187f8a1439c832f07
_MACHINE_ID
_HOSTNAME=testvm1.both.org
_HOSTNAME
PRIORITY=6
MESSAGE=Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.7.6-201.fc32.x86_64 root=/dev/mapper/VG01-root ro resume=/dev/mapper/VG01-swap rd.lv
m.lv=VG01/root rd.lvm.lv=VG01/swap rd.lvm.lv=VG01/usr selinux=0
MESSAGE=x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
MESSAGE=x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
MESSAGE=x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Z_g3;
MESSAGE=x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Z_g3;
MESSAGE=x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
MESSAGE=BIOS-provided physical RAM map:
`k2X
MESSAGE=BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
MESSAGE=BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
MESSAGE=BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
PyLM
MESSAGE=BIOS-e820: [mem 0x0000000000100000-0x00000000dffeffff] usable
MESSAGE=BIOS-e820: [mem 0x00000000dfff0000-0x00000000dfffffff] ACPI data
MESSAGE=BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
MESSAGE=BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
MESSAGE=BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
MESSAGE=BIOS-e820: [mem 0x0000000100000000-0x00000003373fffff] usable
&lt;SNIP&gt;
```

This data can be interpreted by humans, and this particular segment looks very similar to the output data stream from the `dmesg` command. I'll leave you to explore further on your own, but my conclusion is that the journal files are clearly a mixture of binary and ASCII text. That mix makes it cumbersome to use traditional text-based Linux tools to extract usable data. But there is a better way that provides many possibilities for extracting and viewing journal data.

## About journalctl

The `journalctl` command is designed to extract usable information from the systemd journals using powerful and flexible criteria for identifying the desired data. Previous articles in this series have described `journalctl`, and there is more to know.

I'll review a bit first and start with some basics in case you have not read the previous articles or just need a refresher.

You can use the `journalctl` command without any options or arguments to view the systemd journal that contains all journal and log information:


```
[root@testvm1 ~]# journalctl
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Thu 2020-07-16 10:30:43 EDT. --
Jun 08 07:47:20 testvm1.both.org kernel: Linux version 5.6.6-300.fc32.x86_64 ([mockbuild@bkernel03.phx2.fedoraproject.org][10]) (gcc version 10.0&gt;
Jun 08 07:47:20 testvm1.both.org kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.6.6-300.fc32.x86_64 root=/dev/mapper/VG01-root ro &gt;
Jun 08 07:47:20 testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jun 08 07:47:20 testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jun 08 07:47:20 testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jun 08 07:47:20 testvm1.both.org kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jun 08 07:47:20 testvm1.both.org kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Jun 08 07:47:20 testvm1.both.org kernel: BIOS-provided physical RAM map:
Jun 08 07:47:20 testvm1.both.org kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
&lt;SNIP&gt;
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1765] dhcp4 (enp0s3): option requested_routers    =&gt; '1'
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1765] dhcp4 (enp0s3): option requested_static_routes =&gt; '1'
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1765] dhcp4 (enp0s3): option requested_subnet_mask =&gt; '1'
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1765] dhcp4 (enp0s3): option requested_time_offset =&gt; '1'
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1766] dhcp4 (enp0s3): option requested_wpad       =&gt; '1'
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1766] dhcp4 (enp0s3): option routers              =&gt; '192.168.0.2&gt;
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1766] dhcp4 (enp0s3): option subnet_mask          =&gt; '255.255.255&gt;
Jul 16 09:51:00 testvm1.both.org NetworkManager[760]: &lt;info&gt;  [1594907460.1766] dhcp4 (enp0s3): state changed extended -&gt; extended
Jul 16 09:51:00 testvm1.both.org systemd[1]: Starting Network Manager Script Dispatcher Service...
Jul 16 09:51:00 testvm1.both.org systemd[1]: Started Network Manager Script Dispatcher Service.
Jul 16 09:51:00 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher com&gt;
Jul 16 09:51:10 testvm1.both.org systemd[1]: NetworkManager-dispatcher.service: Succeeded.
Jul 16 09:51:10 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=NetworkManager-dispatcher comm&gt;
Jul 16 09:59:13 testvm1.both.org systemd[1]: Starting dnf makecache...
Jul 16 09:59:13 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dnf-makecache comm="systemd" &gt;
Jul 16 09:59:13 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dnf-makecache comm="systemd" e&gt;
Jul 16 09:59:13 testvm1.both.org systemd[1]: dnf-makecache.service: Succeeded.
Jul 16 09:59:13 testvm1.both.org systemd[1]: Finished dnf makecache.
Jul 16 09:59:14 testvm1.both.org dnf[378549]: Metadata cache refreshed recently.
Jul 16 10:00:42 testvm1.both.org systemd[1]: Starting system activity accounting tool...
Jul 16 10:00:42 testvm1.both.org systemd[1]: sysstat-collect.service: Succeeded.
Jul 16 10:00:42 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=sysstat-collect comm="systemd&gt;
Jul 16 10:00:42 testvm1.both.org systemd[1]: Finished system activity accounting tool.
Jul 16 10:00:42 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=sysstat-collect comm="systemd"&gt;
Jul 16 10:01:01 testvm1.both.org CROND[378562]: (root) CMD (run-parts /etc/cron.hourly)
Jul 16 10:01:01 testvm1.both.org run-parts[378565]: (/etc/cron.hourly) starting 0anacron
Jul 16 10:01:01 testvm1.both.org run-parts[378571]: (/etc/cron.hourly) finished 0anacron
```

You can also explicitly show the same data the `dmesg` command presents. Open two terminal sessions next to each other and issue the `dmesg` command in one and the following command in the other:


```
`[root@testvm1 ~]# journalctl --dmesg`
```

The only difference you should see is the time format. The `dmesg` command is in a monotonic format that shows the number of seconds since the system boot. The `journalctl` output is in a date and time format. The short-monotonic option displays the time since boot:


```
[root@testvm1 ~]# journalctl --dmesg -o short-monotonic
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Mon 2020-07-20 13:01:01 EDT. --
[    0.000000] testvm1.both.org kernel: Linux version 5.7.6-201.fc32.x86_64 ([mockbuild@bkernel01.iad2.fedoraproject.org][9]) (gcc version 10.1.&gt;
[    0.000000] testvm1.both.org kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.7.6-201.fc32.x86_64 root=/dev/mapper/VG01-root ro r&gt;
[    0.000000] testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] testvm1.both.org kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] testvm1.both.org kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
&lt;snip&gt;
[    0.000002] testvm1.both.org kernel: clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 8815905914&gt;
[    0.000005] testvm1.both.org kernel: tsc: Detected 2807.988 MHz processor
[    0.001157] testvm1.both.org kernel: e820: update [mem 0x00000000-0x00000fff] usable ==&gt; reserved
[    0.001159] testvm1.both.org kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001162] testvm1.both.org kernel: last_pfn = 0x24ec00 max_arch_pfn = 0x400000000
[    0.001172] testvm1.both.org kernel: MTRR default type: uncachable
[    0.001173] testvm1.both.org kernel: MTRR variable ranges disabled:
[    0.001173] testvm1.both.org kernel: Disabled
[    0.001174] testvm1.both.org kernel: x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.001176] testvm1.both.org kernel: CPU MTRRs all blank - virtualized system.
[    0.001179] testvm1.both.org kernel: x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC  
[    0.001182] testvm1.both.org kernel: last_pfn = 0xdfff0 max_arch_pfn = 0x400000000
[    0.001238] testvm1.both.org kernel: found SMP MP-table at [mem 0x0009fff0-0x0009ffff]
[    0.081068] testvm1.both.org kernel: RAMDISK: [mem 0x34194000-0x360c1fff]
[    0.081088] testvm1.both.org kernel: ACPI: Early table checksum verification disabled
&lt;snip&gt;
[   34.037575] testvm1.both.org kernel: 16:43:32.734466 main     6.1.10_Fedora r138449 started. Verbose level = 0
[   34.042209] testvm1.both.org kernel: 16:43:32.739032 main     vbglR3GuestCtrlDetectPeekGetCancelSupport: Supported (#1)
[   55.746944] testvm1.both.org kernel: e1000: enp0s3 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX
[   55.747738] testvm1.both.org kernel: IPv6: ADDRCONF(NETDEV_CHANGE): enp0s3: link becomes ready
&lt;snip&gt;
lines 624-681/681 (END)
```

The `journalctl` command has many options, including the `-o` (output) option with several suboptions that allow you to select a time and date format that meets different sets of requirements. I have listed most of them below, along with a short description that I expanded or modified from the `journalctl` man page. Note that the primary difference between most of these is the format of the date and time, and the other information remains the same.

### journalctl time and date formats

  * **short:** This is the default format and generates an output that is most closely like the formatting of classic syslog files, showing one line per journal entry. This option shows journal metadata including the monotonic time since boot, the fully qualified hostname, and the unit name such as the kernel, DHCP, etc. [code]`Jul 20 08:43:01 testvm1.both.org kernel: Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)`
```
* **short-full: **This format is very similar to the default but shows timestamps in the format the `--since=` and `--until=` options accept. Unlike the timestamp information shown in short output mode, this mode includes weekday, year, and timezone information in the output and is locale-independent. [code]`Mon 2020-06-08 07:47:20 EDT testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'`
```
  * **short-iso:** The short-iso format is very similar to the default, but shows ISO 8601 wallclock timestamps. [code]`2020-06-08T07:47:20-0400 testvm1.both.org kernel: kvm-clock: Using msrs 4b564d01 and 4b564d00`
```
* **short-iso-precise:**` `This format is the same as short-iso but includes full microsecond precision. [code]`2020-06-08T07:47:20.223738-0400 testvm1.both.org kernel: Booting paravirtualized kernel on KVM`
```
  * **short-monotonic:**` `Very similar to the default but shows monotonic timestamps instead of wallclock timestamps. [code]`[    2.091107] testvm1.both.org kernel: ata1.00: ATA-6: VBOX HARDDISK, 1.0, max UDMA/133`
```
* **short-precise: **This format is also similar to the default but shows classic syslog timestamps with full microsecond precision. [code]`Jun 08 07:47:20.223052 testvm1.both.org kernel: BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved`
```
  * **short-unix: **Like the default, but shows seconds passed since January 1, 1970, UTC instead of wallclock timestamps ("Unix time"). The time is shown with microsecond accuracy. [code]`1591616840.232165 testvm1.both.org kernel: tcp_listen_portaddr_hash hash table entries: 8192`
```
* **cat:** Generates a very terse output only showing the message of each journal entry with no metadata, not even a timestamp. [code]`ohci-pci 0000:00:06.0: irq 22, io mem 0xf0804000`
```
  * **verbose:** This format shows the full data structure for all the entry items with all fields. This is the format option that is most different from all the others. [code] Mon 2020-06-08 07:47:20.222969 EDT [s=d52ddc9f3e8f434b9b9411be2ea50b1e;i=1;b=dcb6dcc0658e4a8d8c781c21a2c6360d;m=242d7f;t=5a7912c6148f9;x=8f&gt;
    _SOURCE_MONOTONIC_TIMESTAMP=0
    _TRANSPORT=kernel
    PRIORITY=5
    SYSLOG_FACILITY=0
    SYSLOG_IDENTIFIER=kernel
    MESSAGE=Linux version 5.6.6-300.fc32.x86_64 ([mockbuild@bkernel03.phx2.fedoraproject.org][10]) (gcc version 10.0.1 20200328 (Red Hat 10.0.1-0&gt;
    _BOOT_ID=dcb6dcc0658e4a8d8c781c21a2c6360d
    _MACHINE_ID=3bccd1140fca488187f8a1439c832f07
    _HOSTNAME=testvm1.both.org 
```
Other choices, available with the `-o` option, allow exporting the data in various formats such as binary or JSON. I also find the `-x` option illuminating because it can show additional explanatory messages for some journal entries. If you try this option, be aware that it can greatly increase the output data stream. For example, the additional information for an entry like:
```


[    4.503737] testvm1.both.org systemd[1]: Starting File System Check on /dev/mapper/VG01-root...
[    4.691555] testvm1.both.org systemd-fsck[548]: root: clean, 1813/327680 files, 48555/1310720 blocks
[    4.933065] testvm1.both.org systemd[1]: Finished File System Check on /dev/mapper/VG01-root.

```
expands to this:
```


[    4.503737] testvm1.both.org systemd[1]: Starting File System Check on /dev/mapper/VG01-root...
\-- Subject: A start job for unit systemd-fsck-root.service has begun execution
\-- Defined-By: systemd
\-- Support: <https://lists.freedesktop.org/mailman/listinfo/systemd-devel>
\--
\-- A start job for unit systemd-fsck-root.service has begun execution.
\--
\-- The job identifier is 36.
[    4.691555] testvm1.both.org systemd-fsck[548]: root: clean, 1813/327680 files, 48555/1310720 blocks
[    4.933065] testvm1.both.org systemd[1]: Finished File System Check on /dev/mapper/VG01-root.
\-- Subject: A start job for unit systemd-fsck-root.service has finished successfully
\-- Defined-By: systemd
\-- Support: <https://lists.freedesktop.org/mailman/listinfo/systemd-devel>
\--
\-- A start job for unit systemd-fsck-root.service has finished successfully.
\--
\-- The job identifier is 36

```
There is some new information here, but I think the main benefit is that the information is contextualized to clarify the original terse messages to some degree.

## Narrowing the search

Most of the time, it is not necessary or even desirable to list all the journal entries and manually search through them. Sometimes I look for entries related to a specific service, and other times I look for entries that happened at specific times. The `journalctl` command provides powerful options that allow you to see only the data you are interested in finding.

Start with the `--list-boots` option, which lists all the boots during the time period when journal entries exist. Note that the `journalctl.conf` file may specify that journal entries are discarded after they reach a certain age or after the storage device (HDD/SSD) space taken by the journals reaches a specified maximum amount:
```


[root@testvm1 ~]# journalctl --list-boots
-10 dcb6dcc0658e4a8d8c781c21a2c6360d Mon 2020-06-08 07:47:20 EDT—Mon 2020-06-08 07:53:05 EDT
 -9 7d61951a85f445c5946774aaae8bc2a4 Fri 2020-07-03 15:50:06 EDT—Fri 2020-07-03 18:21:23 EDT
 -8 1b3a847577e544b4a2679fe576b62206 Fri 2020-07-03 18:21:58 EDT—Fri 2020-07-03 22:10:54 EDT
 -7 5fef01a3568743af99118107ca6f61ae Fri 2020-07-03 22:18:41 EDT—Sat 2020-07-04 06:50:19 EDT
 -6 6e944f99ebd9405984090f829a927fa4 Sat 2020-07-04 07:33:25 EDT—Sat 2020-07-04 07:58:59 EDT
 -5 ec8b0c81ca4744b1bad071bdef432959 Sat 2020-07-04 08:12:06 EDT—Sat 2020-07-04 09:12:47 EDT
 -4 cb173ec716824e21b87ccf6cb43a9a99 Sat 2020-07-04 10:19:53 EDT—Sat 2020-07-04 11:31:03 EDT
 -3 4fe354a893194409843aa9623a36dbb0 Sat 2020-07-04 07:59:58 EDT—Sun 2020-07-05 09:39:30 EDT
 -2 06fb81f1b29e4f68af9860844668446c Mon 2020-07-06 06:27:05 EDT—Mon 2020-07-13 08:50:06 EDT
 -1 33dbf8e6b9de4113a591c4f487d0ac37 Mon 2020-07-13 04:50:33 EDT—Thu 2020-07-16 13:49:32 EDT
  0 75c9b70913934748b5396b3b172bee50 Mon 2020-07-20 08:43:01 EDT—Fri 2020-07-24 12:44:06 EDT

```
The most recent boot ID appears at the bottom; it is the long, random hex number. You can use this data to view the journals for a specific boot. This can be specified using the boot offset number in the left-most column or the UUID in the second column. This command displays the journal for the boot instance with the offset of `-2`—the second previous boot from the current one:
```


[root@testvm1 ~]# journalctl -b -2
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Fri 2020-07-24 12:44:06 EDT. --
Jul 06 06:27:05 testvm1.both.org kernel: Linux version 5.7.6-201.fc32.x86_64 ([mockbuild@bkernel01.iad2.fedoraproject.org][9]) (gcc version 10.1&gt;
Jul 06 06:27:05 testvm1.both.org kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.7.6-201.fc32.x86_64 root=/dev/mapper/VG01-root ro &gt;
Jul 06 06:27:05 testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jul 06 06:27:05 testvm1.both.org kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
&lt;SNIP&gt;

```
Or you could use the UUID for the desired boot. The offset numbers change after each boot, but the UUID does not:
```
`[root@testvm1 ~]# journalctl -b 06fb81f1b29e4f68af9860844668446c`
```
The `-u` option allows you to select specific units to examine. You can use a unit name or a pattern for matching, and you can use this option multiple times to match multiple units or patterns. In this example, I used it in combination with `-b` to show chronyd journal entries for the current boot:
```


[root@testvm1 ~]# journalctl -u chronyd -b
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Sun 2020-07-26 09:10:47 EDT. --
Jul 20 12:43:31 testvm1.both.org systemd[1]: Starting NTP client/server...
Jul 20 12:43:31 testvm1.both.org chronyd[811]: chronyd version 3.5 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SIGND +ASYNCD&gt;
Jul 20 12:43:31 testvm1.both.org chronyd[811]: Frequency -0.021 +/- 0.560 ppm read from /var/lib/chrony/drift
Jul 20 12:43:31 testvm1.both.org chronyd[811]: Using right/UTC timezone to obtain leap second data
Jul 20 12:43:31 testvm1.both.org systemd[1]: Started NTP client/server.
Jul 20 12:44:00 testvm1.both.org chronyd[811]: Selected source 192.168.0.52
Jul 20 12:44:00 testvm1.both.org chronyd[811]: System clock TAI offset set to 37 seconds
Jul 20 12:44:00 testvm1.both.org chronyd[811]: System clock wrong by 1.412227 seconds, adjustment started
Jul 20 12:44:01 testvm1.both.org chronyd[811]: System clock was stepped by 1.412227 seconds
[root@testvm1 ~]#

```
Suppose you want to look at events that were recorded between two arbitrary times. You can also use `-S` (`--since`) and `-U` (`--until`) to specify the beginning and ending times. The following command displays journal entries starting at 15:36:00 on July 24, 2020, through the current time:
```
`[root@testvm1 ~]# journalctl -S "2020-07-24 15:36:00"`
```
And this command displays all journal entries starting at 15:36:00 on July 24, 2020, until 16:00:00 on July 25:
```
`[root@testvm1 ~]# journalctl -S "2020-07-24 15:36:00" -U "2020-07-25 16:00:00"`
```
This command combines `-S`, `-U`, and `-u` to give journal entries for the NetworkManager service unit starting at 15:36:00 on July 24, 2020, until 16:00:00 on July 25:
```
`[root@testvm1 ~]# journalctl -S "2020-07-24 15:36:00" -U "2020-07-25 16:00:00" -u NetworkManager`
```
Some syslog facilities, such as cron, auth, mail, daemon, user, and more, can be viewed with the `--facility` option. You can use `--facility=help` to list the available facilities. In this example, the mail facility is not the Sendmail service that would be used for an email service, but the local client used by Linux to send email to root as event notifications. Sendmail actually has two parts, the server, which (for Fedora and related distributions) is not installed by default, and the client, which is always installed so that it can be used to deliver system emails to local recipients, especially root:
```
`[root@testvm1 ~]# journalctl --facility=mail`
```
The `journalctl` man page lists all the options that can be used to narrow searches. The table below summarizes some of the options I use most frequently. Most of these options can be used in various combinations to further narrow a search. Refer to my previous article [_Analyzing systemd calendar and timespans_][11] for details on creating and testing timestamps, as well as important tips like using quotes around timestamps.

### Options to narrow searches of the journal

Option | Description
---|---
`--list-boots` | This displays a list of boots. The information can be used to show journal entries only for a particular boot.
`-b [offset|boot ID]` | This specifies which boot to display information for. It includes all journal entries from that boot through shutdown or reboot.
`--facility=[facility name]` | This specifies the facility names as they're known to syslog. Use `--facility=help` to list the valid facility names.
`-k`, `--dmesg` | These display only kernel messages and are equivalent to using the `dmesg` command.
`-S`, `--since [timestamp]` | These show all journal entries since (after) the specified time. They can be used with `--until` to display an arbitrary range of time. Fuzzy times such as "yesterday" and "2 hours ago"—with quotes—are also allowed.
`-u [unit name]` | The `-u` option allows you to select specific units to examine. You can use a unit name or a pattern for matching. This option can be used multiple times to match multiple units or patterns.
`-U`, `--until [timestamp]` | These show all journal entries until (prior to) the specified time. They can be used with `--since` to display an arbitrary range of time. Fuzzy times such as "yesterday" and "2 hours ago"—with quotes—are also allowed.

## Other interesting options

The `journalctl` program offers some other interesting options, as well. These are useful for refining the data search, specifying how the journal data is displayed, and managing the journal files.

### Additional interesting journalctl options

**Option** | **Description**
---|---
`-f`, `--follow` | This `journalctl` option is similar to using the `tail -f` command. It shows the most recent entries in the journal that match whatever other options have been specified and also displays new entries as they occur. This can be useful when watching for events and when testing changes.
`-e`, `--pager-end` | The `-e` option displays the end of the data stream instead of the beginning. This does not reverse the order of the data stream, rather it causes the pager to jump to the end.
`--file [journal filename]` | This names a specific journal file in `/var/log/journal/<journal subdirectory>`.
`-r`, `--reverse` | This option reverses the order of the journal entries in the pager so that the newest are at the top rather than the bottom.
`-n`, `--lines=[X]` | This shows the most recent `X` number of lines from the journal.
`--utc` | This displays times in UTC rather than local time.
`-g`, `--grep=[REGEX]` | I like the `-g` option because it enables me to search for specific patterns in the journal data stream. This is just like piping a text data stream through the `grep` command. This option uses Perl-compatible regular expressions.
`--disk-usage` | This option displays the amount of disk storage used by the current and archived journals. It might not be as much as you think.
`--flush` | Journal data stored in the virtual filesystem `/run/log/journal/`, which is volatile storage, is written to `/var/log/journal/` which is persistent storage. This option ensures that all data is flushed to `/run/log/journal/` at the time it returns.
`--sync` | This writes all unwritten journal entries (still in RAM but not in `/run/log/journal`) to the persistent filesystem. All journal entries known to the journaling system at the time the command is entered are moved to persistent storage.
`--vacuum-size=` `--vacuum-time=` `--vacuum-files=` | These can be used singly or in combination to remove the oldest archived journal files until the specified condition is met. These options only consider archived files, and not active files, so the result might not be exactly what was specified.

I'll explore some of these entries below. More options can be found in the `journalctl` man page.

## Journal files

If you have not already, be sure to list the files in the journal directory on your host. Remember that the name of the directory containing the journal files is a long, random number. This directory contains multiple active and archived journal files, including some for users:
```


[root@david ~]# cd /var/log/journal/ad8f29ed15044f8ba0458c846300c2a4/
[root@david ad8f29ed15044f8ba0458c846300c2a4]# ll
total 352308
-rw-r-----+ 1 root systemd-journal  33554432 May 28 13:07 [system@0c91aaef57c441859ea5e421edff6528-0000000000000001-0005a6703120d448.journal][12]
-rw-r-----+ 1 root systemd-journal 109051904 Jun 23 21:24 [system@0c91aaef57c441859ea5e421edff6528-0000000000008238-0005a6b85e4e03c6.journal][13]
-rw-r-----+ 1 root systemd-journal 100663296 Jul 21 18:39 [system@0c91aaef57c441859ea5e421edff6528-0000000000021f3e-0005a8ca55efa66a.journal][14]
-rw-r-----+ 1 root systemd-journal  41943040 Jul 30 09:34 system.journal
-rw-r-----+ 1 root systemd-journal   8388608 May 28 13:07 [user-1000@037bcc7935234a5ea243b3af304fd08a-0000000000000c45-0005a6705ac48a3c.journal][15]
-rw-r-----+ 1 root systemd-journal  16777216 Jun 23 21:24 [user-1000@bc90cea5294447fba2c867dfe40530db-0000000000008266-0005a6b85e910761.journal][16]
-rw-r-----+ 1 root systemd-journal  41943040 Jul 21 16:08 [user-1000@bc90cea5294447fba2c867dfe40530db-0000000000021f4b-0005a8ca68c83ab7.journal][17]
-rw-r-----+ 1 root systemd-journal   8388608 Jul 30 09:34 user-1000.journal
[root@david ad8f29ed15044f8ba0458c846300c2a4]#

```
You can see the user files in this listing for the user ID (UID) 1000, which is my Linux account. The `--files` option allows me to see the content of specified files, including the user files:
```


[root@david ad8f29ed15044f8ba0458c846300c2a4]# journalctl --file user-1000.journal
&lt;SNIP&gt;
Jul 29 14:13:32 david.both.org tumblerd[145509]: Registered thumbnailer /usr/bin/gdk-pixbuf-thumbnailer -s %s %u %o
Jul 29 14:13:32 david.both.org Thunar[2788]: ThunarThumbnailer: got 0 handle (Queue)
Jul 29 14:13:32 david.both.org Thunar[2788]: ThunarThumbnailer: got 0 handle (Error or Ready)
Jul 29 14:13:32 david.both.org Thunar[2788]: ThunarThumbnailer: got 0 handle (Finished)
Jul 29 14:15:33 david.both.org tumblerd[145552]: error: Broken zip file structure
Jul 29 14:20:34 david.both.org systemd[2466]: dbus-:[1.2-org.freedesktop.thumbnails.Thumbnailer1@11.service][18]: Succeeded.
Jul 29 14:34:17 david.both.org systemd[2466]: Starting Cleanup of User's Temporary Files and Directories...
Jul 29 14:34:17 david.both.org systemd[2466]: systemd-tmpfiles-clean.service: Succeeded.
Jul 29 14:34:17 david.both.org systemd[2466]: Finished Cleanup of User's Temporary Files and Directories.
Jul 29 14:48:26 david.both.org systemd[2466]: Started dbus-:[1.2-org.freedesktop.thumbnails.Thumbnailer1@12.service][19].
Jul 29 14:48:26 david.both.org tumblerd[145875]: Registered thumbnailer gsf-office-thumbnailer -i %i -o %o -s %s
&lt;SNIP&gt;

```
This output shows, among other things, temporary file cleanup for the UID1000 user. Data relating to individual users may be helpful in locating the root cause of problems originating in user space. I found a number of interesting entries in this output. Try it on your host and see what you find.

## Adding journal entries

It can be useful to add your own entries to the journal. This is accomplished with the `systemd-cat` program that allows piping the STDOUT of a command or program to the journal. This command can be used as part of a pipeline on the command line or in a script:
```


[root@testvm1 ~]# echo "Hello world" | systemd-cat -p info -t myprog
[root@testvm1 ~]# journalctl -n 10
Jul 27 09:01:01 testvm1.both.org CROND[976442]: (root) CMD (run-parts /etc/cron.hourly)
Jul 27 09:01:01 testvm1.both.org run-parts[976445]: (/etc/cron.hourly) starting 0anacron
Jul 27 09:01:01 testvm1.both.org run-parts[976451]: (/etc/cron.hourly) finished 0anacron
Jul 27 09:07:53 testvm1.both.org unknown[976501]: Hello world
Jul 27 09:10:47 testvm1.both.org systemd[1]: Starting system activity accounting tool...
Jul 27 09:10:47 testvm1.both.org systemd[1]: sysstat-collect.service: Succeeded.
Jul 27 09:10:47 testvm1.both.org systemd[1]: Finished system activity accounting tool.
Jul 27 09:10:47 testvm1.both.org audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=sysstat-collect comm="systemd" exe="/usr/lib/syst&gt;
Jul 27 09:10:47 testvm1.both.org audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=sysstat-collect comm="systemd" exe="/usr/lib/syste&gt;
Jul 27 09:17:10 testvm1.both.org myprog[976516]: Hello world
[root@testvm1 ~]#

```
The `-p` option specifies a priority, emerg, alert, crit, err, warning, notice, info, debug, or a value between 0 and 7 that represents each of those named levels. These priority values are the same as those defined by `syslog(3)`. The default is info. The `-t` option is an identifier, which can be any arbitrary short string, such as a program or script name. This string can be used for searches by the `journalctl` command:
```


[root@testvm1 ~]# journalctl -t myprog
\-- Logs begin at Mon 2020-06-08 07:47:20 EDT, end at Mon 2020-07-27 09:21:57 EDT. --
Jul 27 09:17:10 testvm1.both.org myprog[976516]: Hello world
[root@testvm1 ~]#

```
## Journal management

I use the `--disk-usage` option to check on journal sizes, along with other commands relating to disk usage, to ensure that my `/var` filesystem is not filling up:
```


[root@testvm1 ~]# journalctl --disk-usage
Archived and active journals take up 136.0M in the file system.
[root@testvm1 ~]#

```
The disk usage for the journals on the testvm1 host is about 136MB. The result on my primary workstation is 328MB, and the host I use for my firewall and router uses 2.8GB for the journals. Journal sizes depend greatly on the host's use and daily run time. My physical hosts all run 24x7.

The `/etc/systemd/journald.conf` file can be used to configure the journal file sizes, rotation, and retention times to meet any needs not met by the default settings. You can also configure the journal storage location—you can specify a directory on the storage device or whether to store everything in RAM, which is volatile storage. If the journals are stored in RAM, they will not be persistent between boots.

The default time unit in the `journald.conf` file is seconds, but it can be overridden using the suffixes `year`, `month`, `week`, `day`, `h`, or `m`.

Suppose you want to limit the total amount of storage space allocated to journal files to 1GB, store all journal entries in persistent storage, keep a maximum of 10 files, and delete any journal archive files that are more than a month old. You can configure this in `/etc/systemd/journald.conf` using:
```


SystemMaxUse=1G
Storage=persistent
SystemMaxFiles=10
MaxRetentionSec=1month

```
By default, the `SystemMaxUse` is 10% of available disk space. The default settings have been fine for the systems I work with, and I have not needed to change any of them. The `journald.conf` man page states that the time-based settings for specifying how long to store journal entries in a single file or to retain older files are normally not necessary. This is because file number and size configurations usually force rotation and deletion of old files before any time settings might be needed.

The `SystemKeepFree` option ensures a specific amount of space is kept free for other data. Many databases and application programs use the `/var` filesystem to store data, so ensuring enough available storage space may be critical in systems with smaller hard drives and minimum space allocated to `/var`.

If you make changes to this configuration, be sure to monitor the results carefully for an appropriate period of time to ensure they are performing as expected.

### Journal file rotation

The journal files are typically rotated automatically based upon the configuration in the `/etc/systemd/journald.conf` file. Files are rotated whenever one of the specified conditions is met. So if, for example, the space alloc