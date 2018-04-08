什么是 Linux “oops”？
======
如果你检查你的 Linux 系统上运行的进程，你可能会对一个叫做 “kerneloops” 的进程感到好奇。以防万一你没有正确认识，它是 “kernel oops”，而不是 “kerne loops”。

坦率地说，“oops” 是 Linux 内核的一部分出现了偏差。你有做错了什么么？可能没有。但发生了一些事情。而那个错误的进程可能已经被 CPU 结束。最糟糕的是，内核可能会报错并突然关闭系统。

对于记录，“oops” 不是首字母缩略词。它不代表像“面向对象的编程和系统” （object-oriented programming and systems） 或“超出程序规范” （out of procedural specs） 之类的东西。它实际上就是“哎呀” （oops），就像你刚掉下一杯酒或踩在你的猫上。哎呀！ “oops” 的复数是 “oopses”。

oops 意味着系统上运行的某些东西违反了内核有关正确行为的规则。也许代码尝试采取不允许的代码路径或使用无效指针。不管它是什么，内核 - 总是在寻找进程的错误行为 - 很可能会阻止特定进程，并将它做了什么的消息写入控制台、 /var/log/dmesg 或 /var/log/kern.log 中。

oops 可能是由内核本身引起的，也可能是某些进程试图让内核违反在系统上能做的事以及它们被允许做的事。

oops 将生成一个崩溃签名，这可以帮助内核开发人员找出错误并提高代码质量。

系统上运行的 kerneloops 进程可能如下所示：
```
kernoops 881 1 0 Feb11 ? 00:00:01 /usr/sbin/kerneloops

```

你可能会注意到该进程不是由 root 运行的，而是由名为 “kernoops” 的用户运行的，并且它的运行时间极少。实际上，分配给这个特定用户的唯一任务是运行 kerneloops。
```
$ sudo grep kernoops /etc/passwd
kernoops:x:113:65534:Kernel Oops Tracking Daemon,,,:/:/bin/false

```

如果你的 Linux 系统不带有 kerneloops（比如 Debian），你可以考虑添加它。查看这个[ Debian 页面][1]了解更多信息。

### 什么时候应该关注 oops？

除非是预期的，oops 没什么大不了的。它在一定程度上取决于特定进程所扮演的角色。它也取决于 oops 的类别。

有些 oops 很严重，会导致系统恐慌。从技术上讲，系统恐慌是 oops 的一个子集（即更严重的 oops）。当内核检测到的问题足够严重以至于内核认为它（内核）必须立即停止运行以防止数据丢失或对系统造成其他损害时会出现。因此，系统需要暂停并重新启动，以防止不一致导致不可用或不可靠。所以系统恐慌实际上是为了保护自己免受不可挽回的损害。

总之，所有的内核恐慌都是 oops，但并不是所有的 oops 都是内核恐慌。

/var/log/kern.log 和相关的轮转日志（/var/log/kern.log.1、/var/log/kern.log.2 等）包含由内核生成并由 syslog 处理的日志。

kerneloops 程序收集并默认将错误信息提交到<http://oops.kernel.org/>，在那里它会被分析并呈现给内核开发者。此进程的配置详细信息在 /etc/kerneloops.conf 文件中指定。你可以使用下面的命令轻松查看设置：
```
$ sudo cat /etc/kerneloops.conf | grep -v ^# | grep -v ^$
[sudo] password for shs:
allow-submit = ask
allow-pass-on = yes
submit-url = http://oops.kernel.org/submitoops.php
log-file = /var/log/kern.log
submit-pipe = /usr/share/apport/kernel_oops

```

在上面的（默认）设置中，内核问题可以被提交，但要求用户获得许可。如果设置为 allow-submit = always，则不会询问用户。

调试内核问题是使用 Linux 系统的更高级技巧之一。幸运的是，大多数 Linux 用户很少或从没有经历过 oops 或内核恐慌。不过，知道 kerneloops 这样的进程在系统中执行什么操作，了解可能会报告什么以及系统何时遇到严重的内核冲突也是很好的。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3254778/linux/what-is-a-linux-oops.html

作者：[Sandra Henry-Stocker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://packages.debian.org/stretch/kerneloops
