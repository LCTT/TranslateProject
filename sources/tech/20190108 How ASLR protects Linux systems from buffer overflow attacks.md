[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How ASLR protects Linux systems from buffer overflow attacks)
[#]: via: (https://www.networkworld.com/article/3331199/linux/what-does-aslr-do-for-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How ASLR protects Linux systems from buffer overflow attacks
======

![](https://images.idgesg.net/images/article/2019/01/shuffling-cards-100784640-large.jpg)

Address Space Layout Randomization (ASLR) is a memory-protection process for operating systems that guards against buffer-overflow attacks. It helps to ensure that the memory addresses associated with running processes on systems are not predictable, thus flaws or vulnerabilities associated with these processes will be more difficult to exploit.

ASLR is used today on Linux, Windows, and MacOS systems. It was first implemented on Linux in 2005. In 2007, the technique was deployed on Microsoft Windows and MacOS. While ASLR provides the same function on each of these operating systems, it is implemented differently on each one.

The effectiveness of ASLR is dependent on the entirety of the address space layout remaining unknown to the attacker. In addition, only executables that are compiled as Position Independent Executable (PIE) programs will be able to claim the maximum protection from ASLR technique because all sections of the code will be loaded at random locations. PIE machine code will execute properly regardless of its absolute address.

**[ Also see:[Invaluable tips and tricks for troubleshooting Linux][1] ]**

### ASLR limitations

In spite of ASLR making exploitation of system vulnerabilities more difficult, its role in protecting systems is limited. It's important to understand that ASLR:

  * Doesn't _resolve_ vulnerabilities, but makes exploiting them more of a challenge
  * Doesn't track or report vulnerabilities
  * Doesn't offer any protection for binaries that are not built with ASLR support
  * Isn't immune to circumvention



### How ASLR works

ASLR increases the control-flow integrity of a system by making it more difficult for an attacker to execute a successful buffer-overflow attack by randomizing the offsets it uses in memory layouts.

ASLR works considerably better on 64-bit systems, as these systems provide much greater entropy (randomization potential).

### Is ASLR working on your Linux system?

Either of the two commands shown below will tell you whether ASLR is enabled on your system.

```
$ cat /proc/sys/kernel/randomize_va_space
2
$ sysctl -a --pattern randomize
kernel.randomize_va_space = 2
```

The value (2) shown in the commands above indicates that ASLR is working in full randomization mode. The value shown will be one of the following:

```
0 = Disabled
1 = Conservative Randomization
2 = Full Randomization
```

If you disable ASLR and run the commands below, you should notice that the addresses shown in the **ldd** output below are all the same in the successive **ldd** commands. The **ldd** command works by loading the shared objects and showing where they end up in memory.

```
$ sudo sysctl -w kernel.randomize_va_space=0   <== disable
[sudo] password for shs:
kernel.randomize_va_space = 0
$ ldd /bin/bash
 linux-vdso.so.1 (0x00007ffff7fd1000) <== same addresses
 libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007ffff7c69000)
 libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007ffff7c63000)
 libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ffff7a79000)
 /lib64/ld-linux-x86-64.so.2 (0x00007ffff7fd3000)
$ ldd /bin/bash
 linux-vdso.so.1 (0x00007ffff7fd1000) <== same addresses
 libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007ffff7c69000)
 libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007ffff7c63000)
 libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ffff7a79000)
 /lib64/ld-linux-x86-64.so.2 (0x00007ffff7fd3000)
```

If the value is set back to **2** to enable ASLR, you will see that the addresses will change each time you run the command.

```
$ sudo sysctl -w kernel.randomize_va_space=2 <== enable
[sudo] password for shs:
kernel.randomize_va_space = 2
$ ldd /bin/bash
 linux-vdso.so.1 (0x00007fff47d0e000) <== first set of addresses
 libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007f1cb7ce0000)
 libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f1cb7cda000)
 libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1cb7af0000)
 /lib64/ld-linux-x86-64.so.2 (0x00007f1cb8045000)
$ ldd /bin/bash
 linux-vdso.so.1 (0x00007ffe1cbd7000) <== second set of addresses
 libtinfo.so.6 => /lib/x86_64-linux-gnu/libtinfo.so.6 (0x00007fed59742000)
 libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fed5973c000)
 libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fed59552000)
 /lib64/ld-linux-x86-64.so.2 (0x00007fed59aa7000)
```

### Attempting to bypass ASLR

In spite of its advantages, attempts to bypass ASLR are not uncommon and seem to fall into several categories:

  * Using address leaks
  * Gaining access to data relative to particular addresses
  * Exploiting implementation weaknesses that allow attackers to guess addresses when entropy is low or when the ASLR implementation is faulty
  * Using side channels of hardware operation



### Wrap-up

ASLR is of great value, especially when run on 64 bit systems and implemented properly. While not immune from circumvention attempts, it does make exploitation of system vulnerabilities considerably more difficult. Here is a reference that can provide a lot more detail [on the Effectiveness of Full-ASLR on 64-bit Linux][2], and here is a paper on one circumvention effort to [bypass ASLR][3] using branch predictors.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3331199/linux/what-does-aslr-do-for-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://cybersecurity.upv.es/attacks/offset2lib/offset2lib-paper.pdf
[3]: http://www.cs.ucr.edu/~nael/pubs/micro16.pdf
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
