[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12865-1.html)
[#]: subject: (5 new sudo features you need to know in 2020)
[#]: via: (https://opensource.com/article/20/10/sudo-19)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

2020 年 5 个新 sudo 功能
======

> 从集中会话记录、chroot 支持到 Python API，sudo 1.9 提供了许多新功能。

![](https://img.linux.net.cn/data/attachment/album/202011/28/143544x5cdcxzf9dcujdng.jpg)

当你想在 [POSIX 系统][2]上执行一个操作时，最安全的方法之一就是使用 `sudo` 命令。与以 root 用户身份登录并执行命令可能是个危险的操作不同，`sudo` 授予任何被系统管理员[指定为 “sudoer”][3]的用户临时权限，来执行通常受限制的活动。

几十年来，这个系统帮助 Linux、Unix 和 macOS 系统免受愚蠢的错误和恶意攻击，它是当今所有主要 Linux 发行版的默认管理机制。

当在 2020 年 5 月发布 sudo 1.9 时，它带来了许多新功能，包括集中收集会话记录，支持 `sudo` 内的 chroot，以及 Python API。如果你对其中的任何一项感到惊讶，请阅读我的文章，了解一些 [sudo 鲜为人知的功能][4]。

`sudo` 不仅仅是一个管理命令的前缀。你可以微调权限，记录终端上发生的事情，使用插件扩展`sudo`，在 LDAP 中存储配置，进行广泛的日志记录，以及更多。

1.9.0 版本和后续的小版本增加了各种新功能（我将在下面介绍），包括：

  * 一个集中收集 `sudo` 会话记录的记录服务
  * 审计插件 API
  * 审批插件 API
  * Python 对插件的支持
  * `sudo` 内置 chroot 和 CWD 支持（从 1.9.3 开始）

### 哪里可以得到 sudo 1.9？

大多数的 Linux 发行版仍然封装了上一代的 `sudo`（1.8 版本），并且在长期支持（LTS）的发行版中会保持这个版本数年。据我所知，提供了最完整的 sudo 1.9 包的 Linux 发行版是 openSUSE[Tumbleweed][5]，它是一个滚动发行版，而且该 `sudo` 包的子包中有 Python 支持。最近的  [Fedora][6] 版本包含了 sudo 1.9，但没有 Python 支持。[FreeBSD Ports][7] 有最新的 `sudo` 版本，如果你自己编译 `sudo` 而不是使用软件包，你可以启用 Python 支持。

如果你喜欢的 Linux 发行版还没有包含 sudo 1.9，请查看 [sudo 二进制页面][8]来查看是否有现成的包可以用于你的系统。这个页面还提供了一些商用 Unix 变种的软件包。

像往常一样，在你开始试验 `sudo` 设置之前，*确保你知道 root 密码*。是的，即使在 Ubuntu 上也是如此。有一个临时的“后门”是很重要的；如果没有这个后门，如果出了问题，你就必须得黑掉自己的系统。记住：语法正确的配置并不意味着每个人都可以在该系统上通过 `sudo` 做任何事情！

### 记录服务

记录服务可以集中收集会话记录。与本地会话记录存储相比，这有很多优势：

  * 更方便地在一个地方进行搜索，而不是访问各个机器来寻找记录
  * 即使在发送机器停机的情况下也可以进行记录
  * 本地用户若想掩盖其轨迹，不能删除记录

为了快速测试，你可以通过非加密连接向记录服务发送会话。我的博客中包含了[说明][9]，可以在几分钟内完成设置。对于生产环境，我建议使用加密连接。有很多可能性，所以请阅读最适合你的环境的[文档][10]。

### 审计插件 API

新的审计插件 API 不是一个用户可见的功能。换句话说，你不能从 `sudoers` 文件中配置它。它是一个 API，意味着你可以从插件中访问审计信息，包括用 Python 编写的插件。你可以用很多不同的方式来使用它，比如当一些有趣的事情发生时，从 `sudo` 直接发送事件到 Elasticsearch 或日志即服务（LaaS）上。你也可以用它来进行调试，并以任何你喜欢的格式将其他难以访问的信息打印到屏幕上。

根据你使用它的方式，你可以在 `sudo` 插件手册页（针对 C 语言）和 `sudo` Python 插件手册中找到它的文档。在 `sudo` 源代码中可以找到 [Python 代码示例][11]，在我的博客上也有一个[简化的例子][12]。

### 审批插件 API

审批插件 API 可以在命令执行之前加入额外的限制。这些限制只有在策略插件成功后才会运行，因此你可以有效地添加额外的策略层，而无需更换策略插件，进而无需更换 `sudoers`。可以定义多个审批插件，而且所有插件都必须成功，命令才能执行。

与审计插件 API 一样，你可以从 C 和 Python 中使用它。我博客上记录的[示例 Python 代码][13]是对该 API 的一个很好的介绍。一旦你理解了它是如何工作的，你就可以扩展它来将 `sudo` 连接到工单系统，并且只批准有相关开放工单的会话。你也可以连接到人力资源数据库，这样只有当班的工程师才能获得管理权限。

### Python 对插件的支持

尽管我不是程序员，但我最喜欢的 sudo 1.9 新特性是 Python 对插件的支持。你可以用 Python 也能使用 C 语言调用大部分 API。幸运的是，`sudo` 对性能不敏感，所以运行速度相对较慢的 Python 代码对 `sudo` 来说不是问题。使用 Python 来扩展 `sudo` 有很多优势：

  * 更简单、更快速的开发
  * 不需要编译；甚至可以通过配置管理分发代码
  * 许多 API 没有现成的 C 客户端，但有 Python 代码

除了审计和审批插件 API 之外，还有一些其他的 API，你可以用它们做一些非常有趣的事情。

通过使用策略插件 API，你可以取代 `sudo` 策略引擎。请注意，你将失去大部分的 `sudo` 功能，而且没有基于 `sudoers` 的配置。这在小众情况下还是很有用的，但大多数时候，最好还是继续使用 `sudoers`，并使用审批插件 API 创建额外的策略。如果你想尝试一下，我的 [Python 插件介绍][14]提供了一个非常简单的策略：只允许使用 `id` 命令。再次确认你知道 root 密码，因为一旦启用这个策略，它就会阻止任何实际使用 `sudo` 的行为。

使用 I/O 日志 API，你可以访问用户会话的输入和输出。这意味着你可以分析会话中发生了什么，甚至在发现可疑情况时终止会话。这个 API 有很多可能的用途，比如防止数据泄露。你可以监控屏幕上的关键字，如果数据流中出现任何关键字，你可以在关键字出现在用户的屏幕上之前中断连接。另一种可能是检查用户正在输入的内容，并使用这些数据来重建用户正在输入的命令行。例如，如果用户输入 `rm -fr /`，你可以在按下回车键之前就断开用户的连接。

组插件 API 允许非 Unix 组的查找。在某种程度上，这与审批插件 API 类似，因为它也扩展了策略插件。你可以检查一个用户是否属于一个给定的组，并在后面的配置部分基于此采取行动。

### chroot 和 CWD 支持

`sudo` 的最新功能是支持 chroot 和改变工作目录（CWD），这两个选项都不是默认启用的，你需要在 `sudoers` 文件中明确启用它们。当它们被启用时，你可以调整目标目录或允许用户指定使用哪个目录。日志反映了这些设置何时被使用。

在大多数系统中，chroot 只对 root 用户开放。如果你的某个用户需要 chroot，你需要给他们 root 权限，这比仅仅给他们 chroot 权限要大得多。另外，你可以通过 `sudo` 允许访问 chroot 命令，但它仍然允许漏洞，他们可以获得完全的权限。当你使用 `sudo` 内置的 chroot 支持时，你可以轻松地限制对单个目录的访问。你也可以让用户灵活地指定根目录。当然，这可能会导致灾难（例如，`sudo --chroot / -s`），但至少事件会被记录下来。

当你通过 `sudo` 运行一个命令时，它会将工作目录设置为当前目录。这是预期的行为，但可能有一些情况下，命令需要在不同的目录下运行。例如，我记得使用过一个应用程序，它通过检查我的工作目录是否是 `/root` 来检查我的权限。

### 尝试新功能

希望这篇文章能启发你仔细研究一下 sudo 1.9。集中会话记录比在本地存储会话日志更加方便和安全。chroot 和 CWD 支持为你提供了额外的安全性和灵活性。而使用 Python 来扩展 `sudo`，可以很容易地根据你的环境来定制 `sudo`。你可以通过使用最新的 Linux 发行版或 `sudo` 网站上的即用型软件包来尝试这些新功能。

如果你想了解更多关于 sudo 的信息，这里有一些资源：

  * [Sudo 官网][15]
  * [Sudo 博客][16]
  * [Sudo on Twitter][17]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/sudo-19

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/17/12/using-sudo-delegate
[4]: https://opensource.com/article/19/10/know-about-sudo
[5]: https://software.opensuse.org/distributions/tumbleweed
[6]: https://getfedora.org/
[7]: https://www.freebsd.org/ports/
[8]: https://www.sudo.ws/download.html#binary
[9]: https://blog.sudo.ws/posts/2020/03/whats-new-in-sudo-1.9-recording-service/
[10]: https://www.sudo.ws/man/sudo_logsrvd.man.html#EXAMPLES
[11]: https://github.com/sudo-project/sudo/blob/master/plugins/python/example_audit_plugin.py
[12]: https://blog.sudo.ws/posts/2020/06/sudo-1.9-using-the-new-audit-api-from-python/
[13]: https://blog.sudo.ws/posts/2020/08/sudo-1.9-using-the-new-approval-api-from-python/
[14]: https://blog.sudo.ws/posts/2020/01/whats-new-in-sudo-1.9-python/
[15]: https://www.sudo.ws/
[16]: https://blog.sudo.ws/
[17]: https://twitter.com/sudoproject
