Linux 系统调用的初学者指南
============================================================

![A beginner's guide to Linux syscalls](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003499_01_linux11x_cc.png?itok=ZivAkk-L "A beginner's guide to Linux syscalls")

>图片提供： opensource.com

在过去的几年中，我一直在做大量容器相关的工作。先前，我看到 [Julien Friedman][7] 的一个很棒的演讲，它用几行 Go 语言写了一个容器框架。这让我突然了解到容器只是一个受限的 Linux 进程中的机器。

构建这个受限视图涉及到 [Golang 系统调用包][8]中的很多调用。最初，我只是用到了表面的那些，但过了一段时间，我想剥下洋葱的下一层，看看这些系统调用是什么，以及它们的工作原理。我将在 OSCON 的演讲中分享我所学到的东西。

顾名思义，[syscalls][9] 即系统调用，它们是你从用户空间请求进入 Linux 内核的方式。内核为你做一些工作，例如创建一个进程，然后再回到用户空间。

有一个常见的机制使所有的系统调用转换到内核，这是由 **libc** 库处理的。 用户空间代码设置一些寄存器，包括其想要的系统调用的 ID 以及需要传递给系统调用的所有参数。它触发一个 “陷阱” 将控制转换到内核。

这就是用户空间代码如何向内核请求的，而 Linux 也有一个伪文件系统，它允许内核将信息传递给用户空间，其内容看起来像普通的目录和文件。

`/proc` 目录是一个很好的例子。看看里面，你会发现有关机器上运行的进程的各种有趣的信息。在某些情况，像 **cgroups**（控制组）那样，用户空间可以通过写入这些伪文件系统下的文件来配置参数。

当你在使用容器时，特别有趣的是，主机的 `/proc` 包含了所有有关容器化的进程的信息。这包括环境变量，它们也保存在 `/proc` 伪文件系统中，这意味着你的主机可以访问所有正在运行的容器的环境。如果你通过环境变量将诸如凭证或数据库密码这类秘密传递到容器中，则可能会产生安全性后果。

许多编写常规程序的程序员可能不觉得他们经常使用系统调用。但实际上他们会经常调用，因为每天的活动比如制作文件或者更改目录都涉及 Linux 的系统调用。

你不必是一位系统程序员才能享受系统调用的乐趣！


_如果你想要了解更多_，Liz 会在 Austin，Texas 举办的 OSCON 2017 上演讲 [_Linux 系统调用的初学者指南_][10]。如果你对参加会议感兴趣，_[当你在注册时][11]_，使用这个折扣码：_**PCOS**_。

--------------------------------------------------------------------------------

作者简介：

Liz Rice - Liz Rice 是一位技术传播者，也是 Aqua Security 的容器安全专家。此前，她共同创立了 Microscaling Systems，并开发了其实时伸缩引擎，以及流行的图像元数据网站 MicroBadger.com。她拥有丰富的从网络协议和分布式系统，以及数字技术领域，如 VOD，音乐和 VoIP 软件的开发、团队和产品管理经验。

----------


via: https://opensource.com/article/17/5/beginners-guide-syscalls

作者：[Liz Rice][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lizrice
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/5/beginners-guide-syscalls?rate=BT-vq0qMILAvJVxPFqug17N1RfhoAb_vkwNqRZFAqLQ
[7]:https://twitter.com/doctor_julz
[8]:https://golang.org/pkg/syscall/
[9]:http://man7.org/linux/man-pages/man2/syscalls.2.html
[10]:https://conferences.oreilly.com/oscon/oscon-tx/public/schedule/detail/56840
[11]:http://www.oreilly.com/pub/cpc/44407?sc_cid=701600000012BzSAAU%20target=%22_blank%22
[12]:https://opensource.com/user/129431/feed
[13]:https://opensource.com/users/lizrice
