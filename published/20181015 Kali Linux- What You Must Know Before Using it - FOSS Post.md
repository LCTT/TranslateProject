在你开始使用 Kali Linux 之前必须知道的事情
======

![](https://i1.wp.com/fosspost.org/wp-content/uploads/2018/10/kali-linux.png?fit=1237%2C527&ssl=1)

Kali Linux 在渗透测试和白帽子方面是业界领先的 Linux 发行版。默认情况下，该发行版附带了大量入侵和渗透的工具和软件，并且在全世界都得到了广泛认可。即使在那些甚至可能不知道 Linux 是什么的 Windows 用户中也是如此。

由于后者的原因（LCTT 译注：Windows 用户），许多人都试图单独使用 Kali Linux，尽管他们甚至不了解 Linux 系统的基础知识。原因可能各不相同，有的为了玩乐，有的是为了取悦女友而伪装成黑客，有的仅仅是试图破解邻居的 WiFi 网络以免费上网。如果你打算使用 Kali Linux，记住，所有的这些都是不好的事情。

在计划使用 Kali Linux 之前，你应该了解一些提示。

### Kali Linux 不适合初学者

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-000.png?resize=850%2C478&ssl=1)

*Kali Linux 默认 GNOME 桌面*

如果你是几个月前刚开始使用 Linux 的人，或者你认为自己的知识水平低于平均水平，那么 Kali Linux 就不适合你。如果你打算问“如何在 Kali 上安装 Steam？如何让我的打印机在 Kali 上工作？如何解决 Kali 上的 APT 源错误？”这些东西，那么 Kali Linux 并不适合你。

Kali Linux 主要面向想要运行渗透测试套件的专家或想要学习成为白帽子和数字取证的人。但即使你属于后者，普通的 Kali Linux 用户在日常使用时也会遇到很多麻烦。他还被要求以非常谨慎的方式使用工具和软件，而不仅仅是“让我们安装并运行一切”。每一个工具必须小心使用，你安装的每一个软件都必须仔细检查。

**建议阅读：** [Linux 系统的组件有什么?][1]

普通 Linux 用户都无法自如地使用它。一个更好的方法是花几周时间学习 Linux 及其守护进程、服务、软件、发行版及其工作方式，然后观看几十个关于白帽子攻击的视频和课程，然后再尝试使用 Kali 来应用你学习到的东西。

### 它会让你被黑客攻击

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-001.png?resize=850%2C478&ssl=1)

*Kali Linux 入侵和测试工具*

在普通的 Linux 系统中，普通用户有一个账户，而 root 用户也有一个单独的账号。但在 Kali Linux 中并非如此。Kali Linux 默认使用 root 账户，不提供普通用户账户。这是因为 Kali 中几乎所有可用的安全工具都需要 root 权限，并且为了避免每分钟要求你输入 root 密码，所以这样设计。

当然，你可以简单地创建一个普通用户账户并开始使用它。但是，这种方式仍然不推荐，因为这不是 Kali Linux 系统设计的工作方式。使用普通用户在使用程序，打开端口，调试软件时，你会遇到很多问题，你会发现为什么这个东西不起作用，最终却发现它是一个奇怪的权限错误。另外每次在系统上做任何事情时，你会被每次运行工具都要求输入密码而烦恼。

现在，由于你被迫以 root 用户身份使用它，因此你在系统上运行的所有软件也将以 root 权限运行。如果你不知道自己在做什么，那么这很糟糕，因为如果 Firefox 中存在漏洞，并且你访问了一个受感染的网站，那么黑客能够在你的 PC 上获得全部 root 权限并入侵你。如果你使用的是普通用户账户，则会受到限制。此外，你安装和使用的某些工具可能会在你不知情的情况下打开端口并泄露信息，因此如果你不是非常小心，人们可能会以你尝试入侵他们的方式入侵你。

如果你曾经访问过与 Kali Linux 相关的 Facebook 群组，你会发现这些群组中几乎有四分之一的帖子是人们在寻求帮助，因为有人入侵了他们。

### 它可以让你入狱

Kali Linux 只是提供了软件。那么，如何使用它们完全是你自己的责任。

在世界上大多数发达国家，使用针对公共 WiFi 网络或其他设备的渗透测试工具很容易让你入狱。现在不要以为你使用了 Kali 就无法被跟踪，许多系统都配置了复杂的日志记录设备来简单地跟踪试图监听或入侵其网络的人，你可能无意间成为其中的一个，那么它会毁掉你的生活。

永远不要对不属于你的设备或网络使用 Kali Linux 系统，也不要明确允许对它们进行入侵。如果你说你不知道你在做什么，在法庭上它不会被当作借口来接受。

### 修改了的内核和软件

Kali [基于][2] Debian（“测试”分支，这意味着 Kali Linux 使用滚动发布模型），因此它使用了 Debian 的大部分软件体系结构，你会发现 Kali Linux 中的大部分软件跟 Debian 中的没什么区别。

但是，Kali 修改了一些包来加强安全性并修复了一些可能的漏洞。例如，Kali 使用的 Linux 内核被打了补丁，允许在各种设备上进行无线注入。这些补丁通常在普通内核中不可用。此外，Kali Linux 不依赖于 Debian 服务器和镜像，而是通过自己的服务器构建软件包。以下是最新版本中的默认软件源：

```
deb http://http.kali.org/kali kali-rolling main contrib non-free
deb-src http://http.kali.org/kali kali-rolling main contrib non-free
```

这就是为什么，对于某些特定的软件，当你在 Kali Linux 和 Fedora 中使用相同的程序时，你会发现不同的行为。你可以从 [git.kali.org][3] 中查看 Kali Linux 软件的完整列表。你还可以在 Kali Linux（GNOME）上找到我们[自己生成的已安装包列表][4]。

更重要的是，Kali Linux 官方文档极力建议不要添加任何其他第三方软件仓库，因为 Kali Linux 是一个滚动发行版，并且依赖于 Debian 测试分支，由于依赖关系冲突和包钩子，所以你很可能只是添加一个新的仓库源就会破坏系统。

### 不要安装 Kali Linux

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-002.png?resize=750%2C504&ssl=1)

*使用 Kali Linux 在 fosspost.org 上运行 wpscan*

我在极少数情况下使用 Kali Linux 来测试我部署的软件和服务器。但是，我永远不敢安装它并将其用作主系统。

如果你要将其用作主系统，那么你必须保留自己的个人文件、密码、数据以及系统上的所有内容。你还需要安装大量日常使用的软件，以解放你的生活。但正如我们上面提到的，使用 Kali Linux 是非常危险的，应该非常小心地进行，如果你被入侵了，你将丢失所有数据，并且可能会暴露给更多的人。如果你在做一些不合法的事情，你的个人信息也可用于跟踪你。如果你不小心使用这些工具，那么你甚至可能会毁掉自己的数据。

即使是专业的白帽子也不建议将其作为主系统安装，而是通过 USB 使用它来进行渗透测试工作，然后再回到普通的 Linux 发行版。

### 底线

正如你现在所看到的，使用 Kali 并不是一个轻松的决定。如果你打算成为一个白帽子，你需要使用 Kali 来学习，那么在学习了基础知识并花了几个月的时间使用普通 Linux 系统之后再来学习 Kali。但是小心你正在做的事情，以避免遇到麻烦。

如果你打算使用 Kali，或者你需要任何帮助，我很乐意在评论中听到你的想法。


--------------------------------------------------------------------------------

via: https://fosspost.org/articles/must-know-before-using-kali-linux

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: https://fosspost.org/articles/what-are-the-components-of-a-linux-distribution
[2]: https://www.kali.org/news/kali-linux-rolling-edition-2016-1/
[3]: http://git.kali.org
[4]: https://paste.ubuntu.com/p/bctSVWwpVw/
