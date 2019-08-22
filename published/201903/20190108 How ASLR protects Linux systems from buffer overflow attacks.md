[#]: collector: (lujun9972)
[#]: translator: (leommxj)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10592-1.html)
[#]: subject: (How ASLR protects Linux systems from buffer overflow attacks)
[#]: via: (https://www.networkworld.com/article/3331199/linux/what-does-aslr-do-for-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

ASLR 是如何保护 Linux 系统免受缓冲区溢出攻击的
======

> 地址空间随机化（ASLR）是一种内存攻击缓解技术，可以用于 Linux 和 Windows 系统。了解一下如何运行它、启用/禁用它，以及它是如何工作的。

![](https://images.idgesg.net/images/article/2019/01/shuffling-cards-100784640-large.jpg)

<ruby>地址空间随机化<rt>Address Space Layout Randomization</rt></ruby>（ASLR）是一种操作系统用来抵御缓冲区溢出攻击的内存保护机制。这种技术使得系统上运行的进程的内存地址无法被预测，使得与这些进程有关的漏洞变得更加难以利用。

ASLR 目前在 Linux、Windows 以及 MacOS 系统上都有使用。其最早出现在 2005 的 Linux 系统上。2007 年，这项技术被 Windows 和 MacOS 部署使用。尽管 ASLR 在各个系统上都提供相同的功能，却有着不同的实现。 

ASLR 的有效性依赖于整个地址空间布局是否对于攻击者保持未知。此外，只有编译时作为<ruby>位置无关可执行文件<rt>Position Independent Executable</rt></ruby>（PIE）的可执行程序才能得到 ASLR 技术的最大保护，因为只有这样，可执行文件的所有代码节区才会被加载在随机地址。PIE 机器码不管绝对地址是多少都可以正确执行。

### ASLR 的局限性

尽管 ASLR 使得对系统漏洞的利用更加困难了，但其保护系统的能力是有限的。理解关于 ASLR 的以下几点是很重要的：

  * 它不能*解决*漏洞，而是增加利用漏洞的难度
  * 并不追踪或报告漏洞
  * 不能对编译时没有开启 ASLR 支持的二进制文件提供保护
  * 不能避免被绕过

### ASLR 是如何工作的

通过对攻击者在进行缓冲区溢出攻击时所要用到的内存布局中的偏移做了随机化，ASLR 加大了攻击成功的难度，从而增强了系统的控制流完整性。

通常认为 ASLR 在 64 位系统上效果更好，因为 64 位系统提供了更大的熵（可随机的地址范围）。

### ASLR 是否正在你的 Linux 系统上运行？

下面展示的两条命令都可以告诉你的系统是否启用了 ASLR 功能：

```
$ cat /proc/sys/kernel/randomize_va_space
2
$ sysctl -a --pattern randomize
kernel.randomize_va_space = 2
```

上方指令结果中的数值（`2`）表示 ASLR 工作在全随机化模式。其可能为下面的几个数值之一：

```
0 = Disabled
1 = Conservative Randomization
2 = Full Randomization
```

如果你关闭了 ASLR 并且执行下面的指令，你将会注意到前后两条 `ldd` 的输出是完全一样的。`ldd` 命令会加载共享对象并显示它们在内存中的地址。

```
$ sudo sysctl -w kernel.randomize_va_space=0	<== disable
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

如果将其重新设置为 `2` 来启用 ASLR，你将会看到每次运行 `ldd`，得到的内存地址都不相同。

```
$ sudo sysctl -w kernel.randomize_va_space=2	<== enable
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

### 尝试绕过 ASLR

尽管这项技术有很多优点，但绕过 ASLR 的攻击并不罕见，主要有以下几类：

  * 利用地址泄露
  * 访问与特定地址关联的数据
  * 针对 ASLR 实现的缺陷来猜测地址，常见于系统熵过低或 ASLR 实现不完善。
  * 利用侧信道攻击

### 总结

ASLR 有很大的价值，尤其是在 64 位系统上运行并被正确实现时。虽然不能避免被绕过，但这项技术的确使得利用系统漏洞变得更加困难了。这份参考资料可以提供 [在 64 位 Linux 系统上的完全 ASLR 的有效性][2] 的更多有关细节，这篇论文介绍了一种利用分支预测 [绕过 ASLR][3] 的技术。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3331199/linux/what-does-aslr-do-for-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[leommxj](https://github.com/leommxj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://cybersecurity.upv.es/attacks/offset2lib/offset2lib-paper.pdf
[3]: http://www.cs.ucr.edu/~nael/pubs/micro16.pdf
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
