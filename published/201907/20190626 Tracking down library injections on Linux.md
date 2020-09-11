[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11079-1.html)
[#]: subject: (Tracking down library injections on Linux)
[#]: via: (https://www.networkworld.com/article/3404621/tracking-down-library-injections-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

追溯 Linux 上的库注入
======
> <ruby>库注入<rt>Library injections</rt></ruby>在 Linux 上不如 Windows 上常见，但它仍然是一个问题。下来看看它们如何工作的，以及如何鉴别它们。

![](https://img.linux.net.cn/data/attachment/album/201907/09/223222gje7l6a2hjhk364a.jpg)

尽管在 Linux 系统上几乎见不到，但库（Linux 上的共享目标文件）注入仍是一个严峻的威胁。在采访了来自 AT&T 公司 Alien 实验室的 Jaime Blasco 后，我更加意识到了其中一些攻击是多么的易实施。

在这篇文章中，我会介绍一种攻击方法和它的几种检测手段。我也会提供一些展示攻击细节的链接和一些检测工具。首先，引入一个小小的背景信息。

### 共享库漏洞

DLL 和 .so 文件都是允许代码（有时候是数据）被不同的进程共享的共享库文件。公用的代码可以放进一个文件中使得每个需要它的进程可以重新使用而不是多次被重写。这也促进了对公用代码的管理。

Linux 进程经常使用这些共享库。（显示共享对象依赖的）`ldd` 命令可以对任何程序文件显示其共享库。这里有一些例子：

```
$ ldd /bin/date
        linux-vdso.so.1 (0x00007ffc5f179000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f02bea15000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f02bec3a000)
$ ldd /bin/netstat
        linux-vdso.so.1 (0x00007ffcb67cd000)
        libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007f45e5d7b000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f45e5b90000)
        libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f45e5b1c000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f45e5b16000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f45e5dec000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f45e5af5000)
```

`linux-vdso.so.1` （在一些系统上也许会有不同的名字）是内核自动映射到每个进程地址空间的文件。它的工作是找到并定位进程所需的其他共享库。

对库加载机制加以利用的一种方法是通过使用 `LD_PRELOAD` 环境变量。正如 Jaime Blasco 在他的研究中所解释的那样，“`LD_PRELOAD` 是在进程启动时加载共享库的最简单且最受欢迎的方法。可以将此环境变量配置到共享库的路径，以便在加载其他共享对象之前加载该共享库。”

为了展示有多简单，我创建了一个极其简单的共享库并且赋值给我的（之前不存在） `LD_PRELOAD` 环境变量。之后我使用 `ldd` 命令查看它对于常用 Linux 命令的影响。

```
$ export LD_PRELOAD=/home/shs/shownum.so
$ ldd /bin/date
        linux-vdso.so.1 (0x00007ffe005ce000)
        /home/shs/shownum.so (0x00007f1e6b65f000)     <== 它在这里
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1e6b458000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f1e6b682000)
```

注意，仅仅将新的库赋给 `LD_PRELOAD` 就影响到了运行的任何程序。

通过设置 `LD_PRELOAD` 指定的共享库首先被加载（紧随 linux-vdso.so.1），这些库可以极大程度上改变一个进程。例如，它们可以重定向系统调用到它们自己的资源，或对程序运行的行为方式进行意想不到的更改。

### osquery 工具可以检测库注入

`osquery` 工具（可以在 [osquery.io][4]下载）提供了一个非常独特的查看 Linux 系统的方式。它基本上将操作系统视作一个高性能的关系数据库。然后，也许你会猜到，这就意味着它可以用来查询并且生成 SQL 表，该表提供了诸如以下的详细信息：

  * 运行中的进程
  * 加载的内核模块
  * 打开的网络链接

一个提供了进程信息的内核表叫做 `process_envs`。它提供了各种进程使用环境变量的详细信息。Jaime Blasco 提供了一个相当复杂的查询，可以使用 `osquery` 识别出使用 `LD_PRELOAD` 的进程。

注意，这个查询是从 `process_envs` 表中获取数据。攻击 ID（T1055）参考 [Mitre 对攻击方法的解释][5]。

```
SELECT process_envs.pid as source_process_id, process_envs.key as environment_variable_key, process_envs.value as environment_variable_value, processes.name as source_process, processes.path as file_path, processes.cmdline as source_process_commandline, processes.cwd as current_working_directory, 'T1055' as event_attack_id, 'Process Injection' as event_attack_technique, 'Defense Evasion, Privilege Escalation' as event_attack_tactic FROM process_envs join processes USING (pid) WHERE key = 'LD_PRELOAD';
```

注意 `LD_PRELOAD` 环境变量有时是合法使用的。例如，各种安全监控工具可能会使用到它，因为开发人员需要进行故障排除、调试或性能分析。然而，它的使用仍然很少见，应当加以防范。

同样值得注意的是 `osquery` 可以交互使用或是作为定期查询的守护进程去运行。了解更多请查阅文章末尾给出的参考。

你也能够通过查看用户的环境设置来定位 `LD_PRELOAD` 的使用。如果在用户账户中使用了 `LD_PRELOAD`，你可以使用这样的命令来查看（假定以个人身份登录后）：

```
$ env | grep PRELOAD
LD_PRELOAD=/home/username/userlib.so
```

如果你之前没有听说过 `osquery`，也别太在意。它正在成为一个更受欢迎的工具。事实上就在上周，Linux 基金会宣布打造了新的 [osquery 基金会][6]以支持 osquery 社区。

#### 总结

尽管库注入是一个严重的威胁，但了解一些优秀的工具来帮助你检测它是否存在是很有帮助的。

#### 扩展阅读

重要的参考和工具的链接：

  * [用 osquery 追寻 Linux 库注入][7]，AT&T Cybersecurity
  * [Linux：我的内存怎么了？][8]，TrustedSec
  * [下载 osquery][4]
  * [osquery 模式][9]
  * [osqueryd（osquery 守护进程）][10]
  * [Mitre 的攻击框架][11]
  * [新的 osquery 基金会成立][6]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3404621/tracking-down-library-injections-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/dll-injection-100800196-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[4]: https://osquery.io/
[5]: https://attack.mitre.org/techniques/T1055/
[6]: https://www.linuxfoundation.org/press-release/2019/06/the-linux-foundation-announces-intent-to-form-new-foundation-to-support-osquery-community/
[7]: https://www.alienvault.com/blogs/labs-research/hunting-for-linux-library-injection-with-osquery
[8]: https://www.trustedsec.com/2018/09/linux-hows-my-memory/
[9]: https://osquery.io/schema/3.3.2
[10]: https://osquery.readthedocs.io/en/stable/deployment/configuration/#schedule
[11]: https://attack.mitre.org/
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
