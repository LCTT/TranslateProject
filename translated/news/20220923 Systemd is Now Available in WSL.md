[#]: subject: "Systemd is Now Available in WSL"
[#]: via: "https://news.itsfoss.com/systemd-wsl/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: "vvvbbbcz"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Systemd 已可用于 WSL
======
微软的 WSL 现已支持 systemd，为用户提供了更好的体验。
你可阅读此文了解更多。

![Systemd 已可用于 WSL][1]

WSL（Windows Subsystem for Linux）终于拥有了对 Systemd 的支持，这是在 systemd 的创建者加入微软的几个月后实现的。

[更多 Linux 开发者们加入微软，Systemd 的创建者也加入这一行列][2]

而这已使微软和 Cannonical 的合作成为可能。

**如果你好奇 Systemd 是什么**：

它作为一个初始化系统，启动并维持用户空间其他服务的正常运行。

让我们看看它是如何被引入 WSL 的。

### Systemd 增强 WSL 的体验

![WSL: 与 Cannonical 合作以支持 Systemd][4]

在 WSL 中引入 systemd，主要是为改善 Windows 机器上的 Linux 工作流程。

像 Debian、Ubuntu、Fedora 等，都是默认运行 systemd 的。因此，这项整合将使这些发行版的用户更方便地在 WSL 上做更多工作。

很多关键的 Linux 程序也是靠 systemd 实现的。例如 '**snap**'、'**microk8s**' 和 '**LXD**' 都依赖它。

即使我们有不含 systemd 的发行版可用，它们也并不适合所有人。因此，在 WSL 上添加对 systemd 的支持是很有意义的。

Systemd 的存在也使得在 Windows 中使用更多工具来测试和运行成为可能，从而带来更好的 WSL 体验。

#### 建议阅读 📖

[14 个无 Systemd 的 Linux 发行版][5]

### 它是如何实现的

WSL 背后的团队必须修改其架构，它们让 WSL 的初始化进程在 Linux 发行版中以 systemd 的一个子进程启动。

正如其 [官方公告][7] 所述，这样做使得 WSL 初始化程序能够为 Windows 和 Linux 子系统之间的通讯提供必要的基础。

它们还做了额外的修改，通过防止 systemd 保持 WSL 实例的活动以确保系统的干净关机。

你亦可访问他们的 [官方文档][8] 以了解更多。

### 在 WSL 上使用 Systemd

> 现有的 WSL 用户必须在他们的系统上手动启用 systemd，以防止由于 systemd 的引入而导致的启动问题。

首先，你必须确保你的系统运行的是 **0.67.6** 或更高版本的 WSL。

你可以通过以下命令检查你的 WSL 版本。

```
wsl --version
```

如果你正在运行旧版本，你可以通过<ruby>**微软应用商店**<rt>**Microsoft Store**</rt></ruby>或者以下命令更新它。

```
wsl --update
```

此外，如果你不是 <ruby>Windows 预览体验成员<rt>Windows Insider</rt></ruby>，你可以到 [WSL 发行页面][9] 下载它来体验。

为了让 systemd 在你的系统上运行，你需要修改 '[wsl.conf][10]' 这个文件以确保 systemd 在启动时运行。

在 'wsl.conf' 添加以下几行以使 WSL 在启动时运行 systemd

```
[boot]
systemd=true
```

最后，重启你的 WSL 实例以见证更改。

随着对 systemd 的支持，微软在 WSL 的发展又前进了一大步，这将使得 WSL 吸引更多用户。

*💬 对 WSL 支持 systemd 感到兴奋？或是你更喜欢无 systemd 的发行版？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/systemd-wsl/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[vvvbbbcz](https://github.com/vvvbbbcz)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/systemd-now-available-on-wsl.png
[2]: https://news.itsfoss.com/systemd-creator-microsoft/
[3]: https://news.itsfoss.com/systemd-creator-microsoft/
[4]: https://youtu.be/Ja3qikzd-as
[5]: https://itsfoss.com/systemd-free-distros/
[6]: https://itsfoss.com/systemd-free-distros/
[7]: https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
[8]: https://learn.microsoft.com/en-in/windows/wsl/
[9]: https://github.com/microsoft/WSL/releases
[10]: https://learn.microsoft.com/en-in/windows/wsl/wsl-config#wslconf
