[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Three SSH GUI Tools for Linux)
[#]: via: (https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: (https://linux.cn/article-13010-1.html)

三种 Linux 下的 SSH 图形界面工具
======

![](https://lcom.static.linuxfound.org/sites/lcom/files/ssh.jpg)

在你作为 Linux 系统管理员的职业生涯中，你可以使用 Secure Shell（SSH）远程访问 Linux 服务器或桌面系统。很有可能，你已经使用过了。在某些情况下，你会通过 SSH 一次性登录多个 Linux 服务器。实际上，SSH 很可能是 Linux 工具箱中最常用的工具之一。因此，你会希望操作尽可能高效。对于许多系统管理员来说，没有什么比命令行更有效的了。但是，有些用户确实更喜欢 GUI 工具，尤其是从一台桌面台式机远程连接到服务器上工作时。

如果你碰巧喜欢 GUI 工具，那么你肯定想了解一下 Linux 上的一些出色的 SSH 图形界面工具。将其与独特的终端窗口相结合，可以从同一窗口远程访问多台计算机，你便拥有了高效工作所需的一切。让我们看以下这三个工具，找出其中一个（或多个）是否完全适合你的需求。

我将在 [Elementary OS][1] 上演示这些工具，但是大多数流行的发行版都可以使用它们。

### PuTTY

只要是久经沙场的人都知道 [PuTTY][2]。 实际上，PuTTY 是从 Windows 环境通过 SSH 连接到 Linux 服务器的事实标准工具。但是 PuTTY 不仅适用于 Windows。实际上，从其标准存储库中，PuTTY 也可以安装到 Linux 上。 PuTTY 的功能列表包括：

  * 保存会话
  * 通过 IP 地址或主机名链接
  * 定义备用 SSH 端口
  * 链接类型定义
  * 日志记录
  * 键盘、响铃、外观、连接等选项
  * 本地和远程隧道配置
  * 支持代理
  * 支持X11 隧道

PuTTY GUI 主要是一种保存 SSH 会话的方式，因此，你可以更轻松地管理那些你需要不断远程登录、登出的各种 Linux 服务器和桌面台式机。从 PuTTY 连接到 Linux 服务器后，你将拥有一个可以运行的终端窗口。此时，你可能会问自己，为什么不只在终端窗口中工作？对于某些人来说，保存会话的便捷性确实使 PuTTY 值得使用。

在 Linux 上安装 PuTTY 很简单。例如，你可以在基于 Debian 的发行版上执行命令：

```
sudo apt-get install -y putty
```

安装后，你可以从桌面菜单运行 PuTTY GUI 或执行命令 `putty`。在“<ruby>PuTTY 配置<rt>PuTTY Configuration</rt></ruby>” 窗口（图 1）中，在 “<ruby>主机名（或 IP 地址）<rt>HostName (or IP address)</rt></ruby>”位置键入主机名或 IP 地址，配置<ruby>端口<rt>Port</rt></ruby>”（如果不是默认值 22），从“<ruby>连接类型<rt>Connection type</rt></ruby>”中选择 “SSH” ，然后单击“<ruby>打开<rt>Open</rt></ruby>”。

![PuTTY Connection][4]

*图 1：PuTTY 连接配置窗口。*

建立连接后，系统将提示你输入远程服务器上的用户凭据（图 2）。

![log in][7]

*图 2：使用 PuTTY 登录到远程服务器。*

要保存会话（以便不必总是键入远程服务器信息），填写 IP 地址（或主机名），配置端口和连接类型，然后（在单击 “<ruby>打开<rt>Open</rt></ruby>” 之前），在 “<ruby>保存会话<rt>Saved Sessions</rt></ruby>” 顶部文本区域中键入链接的名称，然后单击 “<ruby>保存<rt>Save</rt></ruby>”。 这样将保存此会话的配置。若要连接到已保存的会话，请从 “<ruby>已保存的会话<rt>Saved Sessions</rt></ruby>” 窗口中选择它，单击 “<ruby>加载<rt>Load</rt></ruby>”，然后单击 “<ruby>打开<rt>Open</rt></ruby>”。 然后，系统将提示你输入远程服务器上的远程凭据登录远程服务器。

### EasySSH

尽管 [EasySSH][8] 没有提供 PuTTY 中提供的大量配置选项，但是（顾名思义）它非常易于使用。 EasySSH 的最佳功能之一是提供标签式界面，因此你可以打开多个 SSH 连接并在它们之间快速切换。 EasySSH 的功能包括：

  * 分组（你可以将选项卡分组以获得更高效的体验）。
  * 保存用户名/密码。
  * 外观选项。
  * 支持本地和远程隧道。

在 Linux 桌面上安装 EasySSH 很简单，因为可以通过 flatpak 安装该应用程序（这意味着你必须在系统上安装 Flatpak ）。 安装 flatpak 后，使用以下命令添加 EasySSH ：

```
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.github.muriloventuroso.easyssh
```

使用以下命令运行 EasySSH ：

```
flatpak run com.github.muriloventuroso.easyssh
```

你可以在其中单击左上角的 “+” 按钮打开 EasySSH 应用程序。 在出现的窗口（图 3）中，根据需要配置 SSH 连接。

![Adding a connection][10]

*图 3：在 EasySSH 中添加连接很简单。*

添加连接后，它将显示在主窗口的左侧导航中（图 4）。

![EasySSH][12]

*图 4：EasySSH 主窗口。*

要在 EasySSH 中连接到远程服务器，请从左侧导航中选择它，然后单击 “<ruby>连接<rt>Connect</rt></ruby>” 按钮（图 5）。

![Connecting][14]

*图 5：使用 EasySSH 连接到远程服务器。*

EasySSH 的一个注意事项是你必须在连接配置中保存用户名和密码（否则连接将失败）。这意味着有权访问运行 EasySSH 的桌面的任何人都可以在不知道密码的情况下远程访问你的服务器。因此，你必须始终记得在外出时锁定桌面屏幕（并确保使用强密码）。你最不希望的就是避免服务器受到不必要的登录攻击。

### Terminator

Terminator 实际上不是 SSH GUI。相反，Terminator 的功能是作为一个单一窗口，使你可以一次运行多个终端（甚至一组终端）。实际上，你可以打开 Terminator，将窗口垂直和水平拆分（直到拥有所需的所有终端），然后通过标准 SSH 命令连接到所有远程 Linux 服务器（图 6）。

![Terminator][16]

*图 6：Terminator 分为三个不同的窗口，每个窗口都连接到不同的 Linux 服务器。*

要安装 Terminator，请执行以下命令：

```
sudo apt-get install -y terminator
```

安装后，从桌面菜单或用命令 `terminator` 打开该工具。打开窗口后，你可以在 Terminator 内部右键单击，然后选择 “<ruby>水平分割<rt>Split Horizontally</rt></ruby>” 或 “<ruby>垂直分割<rt>Split Vertically</rt></ruby>”。继续拆分终端，直到你打开所需的终端为止，然后开始远程管理这些服务器。使用 Terminator 的注意事项是它不是标准的 SSH GUI 工具，因为它不会保存你的会话或使你可以快速访问这些服务器。换句话说，你将始终必须手动登录到远程 Linux 服务器。但是，能够并行查看远程 Secure Shell 会话确实使管理多个远程计算机变得容易得多。

### 少而精的选择

Linux 没有多少可用的 SSH GUI 工具。为什么呢？因为大多数管理员更喜欢简单地打开终端窗口，并使用标准命令行工具来远程访问服务器。但是，如果需要 GUI 工具，则有两个可靠的选择，和一个使登录多台计算机稍微容易一些的终端。尽管对于那些寻找 SSH GUI 工具的人来说只有少数选择，但是可用的那些肯定值得你花时间，根据需要尝试其中之一。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://elementary.io/
[2]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
[3]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_1.jpg
[4]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_1.jpg (PuTTY Connection)
[5]: https://www.linux.com/licenses/category/used-permission
[6]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_2.jpg
[7]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_2.jpg (log in)
[8]: https://github.com/muriloventuroso/easyssh
[9]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_3.jpg
[10]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_3.jpg (Adding a connection)
[11]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_4.jpg
[12]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_4.jpg (EasySSH)
[13]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_5.jpg
[14]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_5.jpg (Connecting)
[15]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_6.jpg
[16]: https://lcom.static.linuxfound.org/sites/lcom/files/ssh_guis_6.jpg (Terminator)
