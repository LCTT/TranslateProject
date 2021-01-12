[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Three SSH GUI Tools for Linux)
[#]: via: (https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: ( )

Linux 系统的三种 SSH 图形用户工具

======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh.jpg?itok=3UcXhJt7)

在您作为 Linux 系统管理员的职业生涯中，您已经有机会使用 Secure Shell（SSH）远程访问 Linux 服务器或桌面系统。 在某些情况下，您会通过 SSH 一次性登录多个 Linux 服务器。 实际上，Secure Shell 很可能是 Linux 工具箱中最常用的工具之一。 因此，您将希望操作尽可能高效。 对于许多系统管理员来说，没有什么比命令行更有效的了。 但是，有些用户确实更喜欢 GUI 工具，尤其是从一台桌面台式机远程连接到服务器上工作时。

如果您碰巧喜欢好的 GUI 工具，那么您会很想知道 Linux 上有一些出色的 SSH 图形工具。 将其与独特的终端窗口相结合，可以从同一窗口远程访问多台计算机，您便拥有了高效工作所需的一切。 让我们看以下这三个工具，找出其中一个（或多个）是否满足您的需求。

我将在 [Elementary OS][1] 上演示这些工具，但是大多数流行的发行版都可以使用它们。
### PuTTY

很长时间以来我们都了解 [PuTTY] [2]。 实际上，PuTTY 是事实上的标准工具，用于通过 SSH 从 Windows 环境连接到 Linux 服务器。 但是 PuTTY 不仅适用于 Windows 。 实际上，从标准存储库开始，PuTTY 也可以安装到 Linux 上。 PuTTY 的功能列表包括：

  * 保存会话

  * 通过 IP 地址或主机名链接

  * 定义备用 SSH 端口

  * 链接类型定义

  * 日志记录

  * 键盘，响铃（命令），外观，链接等选项

  * 本地和远程隧道配置

  * 代理支持

  * X11 隧道支持

PuTTY GUI 主要是保存 SSH 会话的一种方式，因此，您可以更轻松地管理需要不断远程登录登出的各种 Linux 服务器和桌面台式机。 从 PuTTY 连接到 Linux 服务器后，您将拥有一个可以运行的终端窗口。 此时，您可能会问自己，为什么不只在终端窗口中工作？ 对于某些人来说，保存会话的便捷性确实使 PuTTY 值得使用。

在Linux上安装PuTTY很简单。 例如，您可以在基于Debian的发行版上执行命令：

```
sudo apt-get install -y putty
```

安装后，您可以从桌面菜单运行 PuTTY GUI 或执行命令 `putty` 。 在 “ PuTTY 配置 ” 窗口（图1）中，在 “主机名” （或IP地址）位置键入主机名或 IP 地址，配置端口（如果不是默认值22），从连接类型中选择 SSH ，然后单击“打开”。

![PuTTY Connection][4]

图1：PuTTY连接配置窗口。

[Used with permission][5]

建立连接后，系统将提示您输入远程服务器上的用户凭据（图2）。

![log in][7]

图2：使用PuTTY登录到远程服务器。

[Used with permission][5]

要保存会话（不必总是键入远程服务器信息），填写 IP 地址（或主机名），配置端口和连接类型，然后（在单击 Open（打开）之前），在 Saved Sessions（保存会话）顶部文本区域中键入链接的名称，然后单击 Save（保存）。 这样将保存此会话的配置。 若要连接到已保存的会话，请从 “已保存的会话” 窗口中选择它，单击 Load（加载），然后单击 Open（打开）。 然后，系统将提示您输入远程服务器上的远程凭据登录远程服务器。

### EasySSH

尽管 [EasySSH][8] 没有提供 PuTTY 中提供的大量配置选项，但是（顾名思义）它非常易于使用。 EasySSH 的最佳功能之一是提供选项卡式界面，因此您可以打开多个 SSH 连接并在它们之间快速切换。 EasySSH的功能包括：

  * 组（您可以将选项卡分组以获得更有效的体验）。

  * 用户名/密码保存。

  * 外观选项。

  * 本地和远程隧道支持。

在 Linux 桌面上安装 EasySSH 很简单，因为可以通过 flatpak 安装该应用程序（这意味着您必须在系统上安装 Flatpak ）。 安装 flatpak 后，使用以下命令添加 EasySSH ：

```
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.github.muriloventuroso.easyssh
```

使用以下命令运行 EasySSH ：

```
flatpak run com.github.muriloventuroso.easyssh
```

您可以在其中单击左上角的+按钮打开 EasySSH 应用程序。 在出现的窗口（图3）中，根据需要配置 SSH 连接。

![Adding a connection][10]

图3：在 EasySSH 中添加连接很简单。

[Used with permission][5]

添加连接后，它将显示在主窗口的左侧导航中（图4）。

![EasySSH][12]

图4：EasySSH 主窗口。

[Used with permission][5]

要在 EasySSH 中连接到远程服务器，请从左侧导航中选择它，然后单击 Connect（连接）按钮（图5）。

![Connecting][14]

图5：使用 EasySSH 连接到远程服务器。

[Used with permission][5]

EasySSH 的一个警告是您必须在连接配置中保存用户名和密码（否则连接将失败）。 这意味着有权访问运行 EasySSH 的桌面的任何人都可以在不知道密码的情况下远程访问您的服务器。 因此，您必须始终记得在外出时锁定桌面屏幕（并确保使用强密码）。 最后一点就是避免服务器受到不必要的登录攻击。

### Terminator

Terminator 实际上不是 SSH GUI。 取而代之的是，Terminator 充当单个窗口，使您可以一次运行多个终端（甚至终端组）。 实际上，您可以打开Terminator，垂直和水平拆分窗口（直到拥有所需的所有终端），然后通过标准 SSH 命令连接到所有远程 Linux 服务器（图6）。

![Terminator][16]

图6：Terminator 分为三个不同的窗口，每个窗口都连接到不同的 Linux 服务器。

[Used with permission][5]

要安装 Terminator，请执行以下命令：

### sudo apt-get install -y terminator

安装后，从桌面菜单或 `terminator` 命令打开该工具。 打开窗口后，您可以在 Terminator 内部右键单击，然后选择 “水平分割”或“垂直分割”。继续拆分终端，直到您打开所需的终端为止，然后开始远程管理这些服务器。使用 Terminator 的警告是它不是标准的 SSH GUI 工具，因为它不会保存您的会话或使您可以快速访问这些服务器。 换句话说，您将始终必须手动登录到远程 Linux 服务器。 但是，能够并行查看远程 Secure Shell 会话确实使管理多个远程计算机变得容易得多。

少而精的选项

Linux 没有多少可用的 SSH GUI 工具。 为什么呢？ 因为大多数管理员更喜欢简单地打开终端窗口并使用标准命令行工具来远程访问服务器。 但是，如果需要 GUI 工具，则有两个固定选项和一个终端，使登录多台计算机稍微容易一些。 尽管对于那些寻找 SSH GUI 工具的人来说只有少数选择，但是可用的那些肯定值得您花时间根据需要尝试其中之一。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://elementary.io/
[2]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
[3]: https://www.linux.com/files/images/sshguis1jpg
[4]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_1.jpg?itok=DiNTz_wO (PuTTY Connection)
[5]: https://www.linux.com/licenses/category/used-permission
[6]: https://www.linux.com/files/images/sshguis2jpg
[7]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_2.jpg?itok=4ORsJlz3 (log in)
[8]: https://github.com/muriloventuroso/easyssh
[9]: https://www.linux.com/files/images/sshguis3jpg
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_3.jpg?itok=bHC2zlda (Adding a connection)
[11]: https://www.linux.com/files/images/sshguis4jpg
[12]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_4.jpg?itok=hhJzhRIg (EasySSH)
[13]: https://www.linux.com/files/images/sshguis5jpg
[14]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_5.jpg?itok=piFEFYTQ (Connecting)
[15]: https://www.linux.com/files/images/sshguis6jpg
[16]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_6.jpg?itok=-kYl6iSE (Terminator)
