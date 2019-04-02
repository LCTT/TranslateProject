[#]: collector: (lujun9972)
[#]: translator: (Lintaov587)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Three SSH GUI Tools for Linux)
[#]: via: (https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: ( )

Linux 的三个 SSH GUI 工具
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh.jpg?itok=3UcXhJt7)

在 Linux 管理员的职业生涯中的某个阶段，您将使用 SecureShell(ssh) 远程访问 Linux 服务器或桌面。现在你已经有机会了。在某些情况下，您将同时进入多个 Linux 服务器。实际上，SecureShell 很可能是 Linux 工具箱中最常用的工具之一。因此，您将希望尽可能提高体验的效率。对于许多管理员来说，没有什么比命令行更有效了。但是，有一些用户更喜欢使用 GUI 工具，特别是在从台式机到远程服务器以及在服务器上工作时。

如果您碰巧比较喜欢好的 GUI 工具，那么您会很高兴地知道 Linux 上有一些出色的 SSH 图形工具。再加上一个独特的终端窗口，允许您从同一个窗口远程进入多台机器，您就拥有了高效工作所需的一切。让我们看一下这三个工具，看看它们中是否有一个（或多个）完全适合您的需求。

我将在 [Elementary OS][1] 展示这些工具，它们都适用于大多数主流发行版。

### PuTTY

任何一个使用 Linux 足够久的人基本都知道 [PuTTY][2]。 事实上，PuTTY 是通过 SSH 从的 Windows 环境连接到 Linux 服务器的标准工具。 但 PuTTY 不仅仅是用于 Windows。 实际上，通过使用标准存储库，PuTTY 也可以安装在 Linux 上。PuTTY 的功能列表包括：

  * 保存会话。

  * 通过 IP 地址或主机名连接。

  * 定义可选的 SSH 端口。

  * 连接类型定义。

  * 登录中。

  * 键盘，铃声，外观，连接等选项。

  * 本地和远程隧道配置

  * 代理支持

  * X11 隧道支持




PuTTY GUI 主要是保存 SSH 会话的一种方法。 因此，更容易管理所有需要经常远程进出的各种 Linux 服务器和桌面。一旦连接好了，从 PuTTY 到 Linux 服务器，您将有一个终端窗口可以在其中工作。这时，你可能会问自己，为什么不从终端窗口开始工作呢？对某些人来说，保存会话的便利性确实使 PuTTY 值得使用。

在 Linux 上安装 PuTTY 很简单。例如，可以在基于 Debian 的发行版上使用命令：

```
sudo apt-get install -y putty
```

安装后，您可以从桌面菜单运行 PuTTY GUI 或使用 PuTTY 命令。 在 PuTTY 配置窗口（图 1）中，在主机名（或 IP 地址）部分中键入主机名或 IP 地址，配置端口（如果不是默认值22），从连接类型中选择 SSH ，然后单击打开。

![PuTTY Connection][4]

图 1：PuTTY 连接配置窗口。

[Used with permission][5]

一旦建立了连接，就会提示您在远程服务器上输入用户凭据（图 2）。

![log in][7]

图 2：使用 PuTTY 登录远程服务器。

[Used with permission][5]

要保存会话（这样您就不必总是键入远程服务器信息）， 填写 IP 地址（或主机名），配置端口和连接类型，然后（在单击“打开”之前），在“已保存会话”部分的顶部文本区域中键入连接的名称，然后单击“保存”。 然后，这将保存会话的配置。若要连接到保存的会话，请从“保存的会话”窗口中选择该会话，单击“加载”，然后单击“打开”。然后会提示您在远程服务器上输入远程凭据。

### EasySSH

虽然 [EasySSH][8] 没有提供 PuTTY 中大量的配置选项，但顾名思义，它非常容易使用。 EasySSH 的一个最佳特性是它提供了一个选项卡式接口，因此您可以打开多个 SSH 连接，并在它们之间快速切换。 EasySSH 的其他功能包括：

  * 分组（这样您就可以将选项卡分组以获得更高效的体验）。

  * 保存用户名/密码。

  * 外观选项。

  * 本地和远程隧道支持。




在 Linux 桌面上安装 EasySSH 很简单，因为该应用程序可以通过 Flatpak 安装（这意味着您必须在系统上安装 Flatpak）。 安装 Flatpak 后，使用以下命令添加 EasySSH：
```
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub com.github.muriloventuroso.easyssh
```

用以下命令运行 EasySSH：

```
flatpak run com.github.muriloventuroso.easyssh
```

EasySSH 应用程序将打开，您可以单击左上角的 + 按钮。 在弹出的窗口（图 3）中， 根据需要配置 SSH 连接。

![Adding a connection][10]

图 3：在 EasySSH 中添加连接很简单。

[Used with permission][5]

添加连接后，它将出现在主窗口的左侧导航栏中（图 4）。

![EasySSH][12]

图 4：EasySSH 主窗口。

[Used with permission][5]

要在 EasySSH 中连接到远程服务器，请从左侧导航中选择它，然后单击连接按钮（图 5）。

![Connecting][14]

图 5：使用 EasySSH 连接到远程服务器。

[Used with permission][5]

EasySSH 必须注意的一点，必须在连接配置中保存用户名和密码（否则连接将失败）。这意味着任何能够访问运行 EasySSH 的桌面的人都可以远程访问您的服务器，而不必知道密码。因此，您必须始终记住在外出时锁定桌面屏幕（并确保使用强密码）。 最后一件事是让服务器不容易受到登录攻击。

### Terminator

Terminator 实际上不是一个 SSH GUI 工具。 相反，Terminator 作为一个窗口工作，允许您一次运行多个终端（甚至是多组终端）。 你可以很高效的打开 Terminator，垂直和水平拆分窗口（直到您拥有所需的所有终端），然后通过标准的 SSH 命令连接到所有远程的 Linux 服务器（图 6）。

![Terminator][16]

图 6：Terminator 分为三个不同的窗口，每个窗口连接到不同的 Linux 的服务器。

[Used with permission][5]

要安装Terminator ，请使用如下命令：

### sudo apt-get install -y terminator

安装后，从桌面菜单或命令终端打开该工具。 打开窗口后，可以在“Terminator”内右键单击，然后选择“水平拆分”或“垂直拆分”。 继续拆分终端，直到您拥有所需的终端数量，然后开始远程连接到这些服务器。
使用 Terminator 的注意事项是它不是标准的 SSH GUI 工具，因为它不会保存您的会话或让您快速访问这些服务器。 换句话说，您必须始终手动登录到远程 Linux 服务器。 但是，能够并排查看远程 Secure Shell 会话确实可以使管理多个远程计算机变得更加容易。

很少（但值得）选择

为什么 Linux 没有很多可用的 SSH GUI 工具？ 因为大多数管理员更喜欢简单地打开终端窗口并使用标准命令行工具来远程访问其服务器。但是，如果您需要 GUI 工具，则有两个可靠选项和一个终端，可以更轻松地登录多台计算机。虽然对于那些寻找 SSH GUI 工具的人来说只有几个选项，但那些可用的工具当然值得您花时间。 尝试其中一个，亲眼看看。
--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/11/three-ssh-guis-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[Lintaov587](https://github.com/lintaov587)
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
[16]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ssh_guis_6.jpg?itok=-kYl6iSE (Terminator)F
