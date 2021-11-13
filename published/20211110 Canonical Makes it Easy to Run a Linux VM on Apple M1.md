[#]: subject: "Canonical Makes it Easy to Run a Linux VM on Apple M1"
[#]: via: "https://news.itsfoss.com/canonical-multipass-linux-m1/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13978-1.html"

在苹果 M1 上运行 Linux 虚拟机变得容易了
======

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/linux-apple-m1-vm.png?w=1200&ssl=1)

> Canonical 使用户可以借助 Multipass（一个免费的虚拟机程序）在苹果 M1 上运行 Linux 虚拟机。

自从苹果推出 M1 芯片以来，人们为在其上运行 Linux 做出了许多努力。

尽管这项工作仍在进行中，但 Canonical 似乎已经实现了在苹果 M1 上以虚拟机（VM）形式运行 Linux（Ubuntu）。

### 苹果 M1 上的 Linux 虚拟机

对大多数开发者来说，启动一个 Linux 虚拟机实例，并继续在他们的系统上工作是很方便的，这样不会中断任何工作。

不幸的是，在 M1 设备上启动和运行 Linux 实例不是一项轻松的任务。

虽然你可以用像 VMware 和 VirtualBox 这样的工具来创建虚拟机，但它们并不能在基于 ARM 的苹果 M1 芯片上工作。

截至目前，VMware 正在慢慢增加对其产品的支持，使其能够在苹果 M1 上工作。然而，这仍处于封闭测试阶段，对用户来说并不可行。

而 VirtualBox 还不支持 ARM 平台，也没有这方面的计划。

因此，你运行虚拟机的最佳选择是在 macOS 上使用 parallels 或 [UTM][1]（免费）。因此，跨平台支持的选择相当有限。

此外，要使用 parallels 你需要购买许可证，这可能很昂贵。

### Canonical 的 Multipass 1.8 是一个支持 M1 的免费虚拟机程序

[Multipass][2] 是一个免费的虚拟机软件，旨在帮助你在苹果 M1 上创建 Linux 实例，而没有任何麻烦。

Canonical [宣布][3] 发布了他们最新的 Multipass 1.8，终于增加了对苹果 M1 的支持，使其成为唯一可行的选择。它作为一个跨平台的虚拟机软件，可以帮助你运行 Ubuntu Linux。

在公告中，Canonical 产品经理 Nathan Hart 提到。

> “Canonical 希望比市场上的其他选择更快地让开发者运行起来 Linux，而 Multipass 团队帮助实现了这一点。”

在增加支持的同时，Multipass 1.8 还带来了一些有用的功能，包括。

  * 别名，可以将虚拟机上的命令与主机操作系统关联起来。换句话说，你可以在虚拟机中无缝地直接从主机操作系统中运行一个软件。
  * 统一的跨平台体验，支持 Windows、Linux、Mac OS（Intel/AMD 和 ARM 平台）。

Multipass 应该可以处理好配置问题，让你轻松地在苹果 M1 上创建/维护虚拟机。因此，你不需要任何人工干预，就可以让 Linux 在搭载 M1 的 macOS 机器内工作。

你可以在他们的 [官方网站][2] 上了解到更多信息。

### 总结

既然现在你可以使用 Canonical 的 Multipass 在苹果 M1 上启动一个 Linux 实例，你会考虑买一台苹果 M1 系统用于你的开发工作吗？

或者，还是你更喜欢使用 parallels 来在 M1 上运行 Linux？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/canonical-multipass-linux-m1/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://github.com/utmapp/UTM
[2]: https://multipass.run/
[3]: https://ubuntu.com/blog/canonical-transforms-linux-on-mac
